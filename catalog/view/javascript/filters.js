$(".custom-control label").click(function () {
  var checkbox = $(this).siblings("input[type='checkbox']");
  checkbox.prop("checked", !checkbox.prop("checked"));
  checkbox.trigger("change");
});

function shuffleArray(array) {
  for (let i = array.length - 1; i > 0; i--) {
    // Generate random index
    const j = Math.floor(Math.random() * (i + 1));
    // Swap elements at indices i and j
    [array[i], array[j]] = [array[j], array[i]];
  }
  return array;
}

function generatePage(filteredData) {
  console.log(filteredData);
  $("#pagination-container").pagination({
    dataSource: filteredData,
    pageSize: 16,
    callback: function (data, pagination) {
      // Generate HTML for the page
      var html = data
        .map(function (item) {
          // Dynamically generate color options
          var colorOptions = "";

          if (item.option && item.option.length > 0) {
            var colorOptions = item.option
              .filter(function (option) {
                return option.name === "Metal Color";
              })
              .flatMap(function (colorOption) {
                return colorOption.product_option_value.map(function (value) {
                  return `<img style="width: 20px; height:20px" class="color-option" src="${value.image}" alt="${value.name}"
  title="${value.name}">`;
                });
              })
              .join(" ");
          }
          var ringSizeValue = "";

          if (item.option && item.option.length > 0) {
            // Find the different size options
            var ringSizeOption = item.option.find(function (option) {
              return option.name === "RING SIZE";
            });
            var ringSizeOption1 = item.option.find(function (option) {
              return option.name === "Bangle Size";
            });
            var ringSizeOption2 = item.option.find(function (option) {
              return option.name === "Bracelet Size";
            });
            var ringSizeOption3 = item.option.find(function (option) {
              return option.name === "Necklace Size";
            });

            // Extract the product_option_value.name for the first found option
            if (
              ringSizeOption &&
              ringSizeOption.product_option_value.length > 0
            ) {
              ringSizeValue = ringSizeOption.product_option_value[0].name;
            } else if (
              ringSizeOption1 &&
              ringSizeOption1.product_option_value.length > 0
            ) {
              ringSizeValue = ringSizeOption1.product_option_value[0].name;
            } else if (
              ringSizeOption2 &&
              ringSizeOption2.product_option_value.length > 0
            ) {
              ringSizeValue = ringSizeOption2.product_option_value[0].name;
            } else if (
              ringSizeOption3 &&
              ringSizeOption3.product_option_value.length > 0
            ) {
              ringSizeValue = ringSizeOption3.product_option_value[0].name;
            } else {
              ringSizeValue = "-";
            }
          } else {
            ringSizeValue = "-";
          }




          return `<div class="col-md-4 col-sm-6 col-6 p_box">
  <div class="product-item">
    <figure class="product-thumb" style="    position: relative;">
      <a href="${item.href}">
        <img class="pri-img" src="${item.thumb}" alt="product">
        <img class="sec-img" src="${item.thumb}" alt="product">
      </a>
${item.in_wishlist
              ? `
                                    <a style="position: absolute;right: 5px; padding: 12px; top: 5px;" class="btn btn-find-store"><i class="fa fa-heart"></i> </a>
                                    `
              : `
                                  <a style="position: absolute;right: 5px; padding: 12px; top: 5px;" class="btn btn-find-store wishlist_link1"
                                        btnid="${item.product_id}" btnname="${item.name}" btnimg="${item.thumb}" btnhref="${item.href}" 
                                        btnprice="${item.wish_price}"  btnsiz="${ringSizeValue}"  btnsize="${item.metal_purity}" btndesign="${item.design_no}" btnstyle="${item.style_no}" btnsprice="${item.wish_special}" btnwet="${item.wet}">
                                        <i class="fa fa-heart-o"></i>
                                    </a>
                                    `
            }
    </figure>
    <div class="product-caption 1">
      <h6 class="product-name">
        <a href="${item.href}">
          ${item.name}
        </a>
      </h6>
      <span style="display: inline-block; font-size:11px; color:#333; width:100%">
        Available In : ${colorOptions}
      </span>
      <br>
      ${item.special
              ? `<span class="price-regular">
       Price: $${parseFloat(item.special.replace(/[,\$]/g, ""))
                .toFixed(0)
                .replace(/\B(?=(\d{3})+(?!\d))/g, ",")}
      </span>`
              : ""
            }
      ${item.price
              ? `<span class="price-old" style="    text-decoration: line-through;">
        $${parseFloat(item.price.replace(/[,\$]/g, ""))
                .toFixed(0)
                .replace(/\B(?=(\d{3})+(?!\d))/g, ",")}
      </span>`
              : ""
            }
      
     
    </div>
  </div>
</div>
</div>`;
        })
        .join("");

      $("#data-container").html(html);
    },
  });
}

function getSelectedFilters() {
  var filters = {
    FilterByType: [],
    FilterByMetalColor: [],
    FilterByGemstone: [],
  };

  $('ul[data-filter-group="FilterbyType"] .custom-control-input:checked').each(
    function () {
      filters["FilterByType"].push($(this).val());
    }
  );

  $(
    'ul[data-filter-group="FilterByMetalColor"] .custom-control-input:checked'
  ).each(function () {
    filters["FilterByMetalColor"].push($(this).val());
  });

  $(
    'ul[data-filter-group="FilterByGemstone"] .custom-control-input:checked'
  ).each(function () {
    filters["FilterByGemstone"].push($(this).val());
  });

  return filters;
}

// Debounce function
function debounce(func, delay) {
  let timeout;
  return function (...args) {
    clearTimeout(timeout);
    timeout = setTimeout(() => func.apply(this, args), delay);
  };
}

// Debounced function to log selected filters
const debouncedGetFilters = debounce(function (callback) {
  var selectedFilters = getSelectedFilters();
  callback(selectedFilters);
}, 300);

function filterDataByModel(data, modelSubstring) {
  return data.filter((item) =>
    modelSubstring.some((substring) => item.model.includes(substring))
  );
}

function FilterByType(data, array) {
  return data.filter((item) => item.filter_id.some((id) => array.includes(id)));
}

//sorting functions

function sortByNameA(data) {
  return data.sort((a, b) => {
    const nameA = a.name.trim().toUpperCase();
    const nameB = b.name.trim().toUpperCase();
    if (nameA < nameB) {
      return -1; // `nameA` comes before `nameB`
    }
    if (nameA > nameB) {
      return 1; // `nameA` comes after `nameB`
    }
    return 0; // `nameA` is equal to `nameB`
  });
}

function sortByNameD(data) {
  return data.sort((a, b) => {
    const nameA = a.name.trim().toUpperCase();
    const nameB = b.name.trim().toUpperCase();

    if (nameA > nameB) {
      return -1;
    }
    if (nameA < nameB) {
      return 1;
    }
    return 0; // `nameA` is equal to `nameB`
  });
}

function sortByPriceA(data) {
  return data.sort((a, b) => {
    const priceA = parseFloat(a.wish_price.replace(/[^0-9.-]+/g, "")); // Convert price to a float number
    const priceB = parseFloat(b.wish_price.replace(/[^0-9.-]+/g, "")); // Convert price to a float number

    return priceA - priceB; // Ascending order
  });
}
$(document).on("click", ".wishlist_link1", function (e) {
  e.preventDefault();

  let wishzayn = JSON.parse(localStorage.getItem("wishzayn")) || [];

  // Function to update the wishlist count
  const updateWishlistCount = () => {
    const wishlistCount = wishzayn.length;
    document.getElementById("wish_count").textContent = wishlistCount;
  };

  // Update the wishlist count on page load
  updateWishlistCount();

  // Get product details from the button
  const productId = $(this).attr("btnid");
  const productname = $(this).attr("btnname");
  const productimg = $(this).attr("btnimg");
  const producturl = $(this).attr("btnhref");
  const productprice = $(this).attr("btnprice");
  const productsprice = $(this).attr("btnsprice");
  const productstyle = $(this).attr("btnstyle");
  const productdesign = $(this).attr("btndesign");
  const productsize = $(this).attr("btnsize");
  const productsize1 = $(this).attr("btnsiz");
  const productwet = $(this).attr("btnwet");

  if (
    productId &&
    productname &&
    productimg &&
    producturl &&
    productprice &&
    productsprice
  ) {
    const product = {
      productid: productId,
      productname: productname,
      producturl: producturl,
      productimg: productimg,
      productprice: productprice,
      productsprice: productsprice,
      productstyle: productstyle,
      productdesign: productdesign,
      productsize: productsize,
      productsize1: productsize1,
      productwet: productwet,
    };

    const isProductInWishlist = wishzayn.some(
      (item) => item.productid === productId
    );

    if (!isProductInWishlist) {
      wishzayn.push(product);
      localStorage.setItem("wishzayn", JSON.stringify(wishzayn));
      alert("Item added to your wishlist successfully");
      updateWishlistCount();
    } else {
      alert("Item is already in your wishlist");
    }
  }
});
