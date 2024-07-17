$('.custom-control label').click(function() {
    var checkbox = $(this).siblings("input[type='checkbox']");
    checkbox.prop("checked", !checkbox.prop("checked"));
    checkbox.trigger('change');
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

  function generatePage(filteredData){
     $('#pagination-container').pagination({
          dataSource: filteredData,
          pageSize: 16,
          callback: function(data, pagination) {
              // Generate HTML for the page
              var html = data.map(function(item) {
              // Dynamically generate color options
              var colorOptions = '';
              
              if (item.option && item.option.length > 0) {
                 var colorOptions = item.option
                    .filter(function(option) {
                       return option.name === "Metal Color";
                    })
                    .flatMap(function(colorOption) {
                       return colorOption.product_option_value.map(function(value) {
                       return `<img style="width: 20px; height:20px" class="color-option" src="${value.image}" alt="${value.name}" title="${value.name}">`;
                       });
                    })
                    .join(' ');
              }
  
              return `<div class="col-md-4 col-sm-6 col-6 p_box">
                          <div class="product-item">
                             <figure class="product-thumb" style="    position: relative;">
                                <a href="${item.href}">
                                <img class="pri-img" src="${item.thumb}" alt="product">
                                <img class="sec-img" src="${item.thumb}" alt="product">
                                </a>
                               
                     <a style="position: absolute;right: 10px; padding: 12px; top: 10px;" 
   class="btn btn-find-store wishlist_link" 
   btnid="${item.product_id}"
   btnname="${item.name}" 
   btnimg="${item.thumb}"
   btnhref="${item.href}" 
   btnprice="${item.wish_price}"
   btnsprice="${item.wish_special}">
   <i class="fa fa-heart-o"></i>
</a>
                    
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
                                ${item.price ? 
                                   `<span class="price-regular">
                                   Price: $${parseFloat(item.price.replace(/[,\$]/g, "")).toFixed(0).replace(/\B(?=(\d{3})+(?!\d))/g, ",")}
                                   </span>` : ''}
                             </div>
                          </div>
                       </div>
                       </div>`;
              }).join('');
  
              $('#data-container').html(html);
          }
      });
  }

  function getSelectedFilters() {
   var filters = {
     'FilterByType': [],
     'FilterByMetalColor': [],
     'FilterByGemstone': []
   };

   $('ul[data-filter-group="FilterbyType"] .custom-control-input:checked').each(function() {
     filters['FilterByType'].push($(this).val());
   });

   $('ul[data-filter-group="FilterByMetalColor"] .custom-control-input:checked').each(function() {
     filters['FilterByMetalColor'].push($(this).val());
   });

   $('ul[data-filter-group="FilterByGemstone"] .custom-control-input:checked').each(function() {
     filters['FilterByGemstone'].push($(this).val());
   });

   return filters;
  }

  // Debounce function
 function debounce(func, delay) {
   let timeout;
   return function(...args) {
     clearTimeout(timeout);
     timeout = setTimeout(() => func.apply(this, args), delay);
   };
 }

 // Debounced function to log selected filters
 const debouncedGetFilters = debounce(function(callback) {
   var selectedFilters = getSelectedFilters();
   callback(selectedFilters);
 }, 300); 


 function filterDataByModel(data, modelSubstring) {
    return data.filter(item =>
     modelSubstring.some(substring => item.model.includes(substring))
   );
 }

 function FilterByType(data, array) {
    return data.filter(item => 
        item.filter_id.some(id => array.includes(id))
    );
}