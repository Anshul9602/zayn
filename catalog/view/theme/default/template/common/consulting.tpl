<?php echo $header; ?>

<script src="
https://cdn.jsdelivr.net/npm/@splidejs/splide@4.1.4/dist/js/splide.min.js
"></script>
<link href="
https://cdn.jsdelivr.net/npm/@splidejs/splide@4.1.4/dist/css/splide.min.css
" rel="stylesheet">
<link href="
assets/css/home.css
" rel="stylesheet">
<style>
    #New .splide__pagination {
        display: none !important;
    }
    .product-name:hover {
        color: #423c9e;
    }
    .product-name {
        font-weight: 500;
        color: #222222;
        text-transform: capitalize;
    }
</style>



<!--Most wanted designs-->
<section  class="section-padding pb-0 pt-0" style="margin-top:60px;height:100vh;">
    <div style="padding:0 7%;">
        <div class="row justify-content-center">
            <h4 class="col-md-8 text-center pb-3">What day is best for you?</h4>
            <div class="col-md-8 mt-md-5 mt-3">
                <div class="splide splidecol" aria-label="Splide Basic HTML Example">
                    <div class="splide__track">
                        <ul class="splide__list broder" style="border: 1px solid;">

                            <!-- Current date slide -->
                            <li class="splide__slide mr-0">
                                <div class="cand text-center" style="border:1px solid #eae9e9">
                                    <p class="tops" style="background-color: #eae9e9;">Today</p>
                                    <p id="currentDay"></p>
                                    <p id="currentMonth"></p>
                                </div>
                            </li>
                
                            <!-- Dynamically generate slides for the next 10 days -->
                        
                
                        </ul>
                    </div>
                </div>
            </div>
          
            <div class="col-md-8 text-center">
                <h4 class="text-center mt-md-5 mt-3 pb-2" style="font-weight: 600;">
                    What time works?
                </h4>
                <p>30-minute meeting &nbsp;&nbsp;&nbsp; <span id="current-timezone"></span> &nbsp;&nbsp;Time (<span id="current-time"></span>)</p>
            </div>
            
            
        </div>

<div class="row slote">
    <div class="col-md-3 text-center" style="margin: 10px 20px; padding:5px 10px; width:100%;border:1px solid #eae9e9;">
        10:30 AM
    </div>
    <div class="col-md-3 text-center" style="margin: 10px 20px; padding:5px 10px; width:100%;border:1px solid #eae9e9;">
        10:30 AM
    </div>
    <div class="col-md-3 text-center" style="margin: 10px 20px; padding:5px 10px; width:100%;border:1px solid #eae9e9;">
        10:30 AM
    </div>
    
    
</div>

    </div>
</section>


<script>
    // Function to get the date string for a specific day offset from today
    function getDateForOffset(offset) {
        const today = new Date();
        const futureDate = new Date(today);
        futureDate.setDate(today.getDate() + offset);

        const dayNames = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
        const monthNames = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];

        const dayName = dayNames[futureDate.getDay()];
        const day = futureDate.getDate();
        const monthName = monthNames[futureDate.getMonth()];

        return { dayName, day, monthName };
    }

    // Populate the current date
    const currentDate = new Date();
    document.getElementById('currentDay').innerText = currentDate.getDate();
    document.getElementById('currentMonth').innerText = currentDate.toLocaleString('default', { month: 'short' });

    // Generate and append slides for the next 10 days
    for (let i = 1; i <= 10; i++) {
        const { dayName, day, monthName } = getDateForOffset(i);

        document.write(`
            <li class="splide__slide mr-0">
                <div class="cand text-center" style="border:1px solid #eae9e9">
                    <p class="tops" style="background-color: #eae9e9;">${dayName}</p>
                    <p>${day}</p>
                    <p>${monthName}</p>
                </div>
            </li>
        `);
    }
</script>

<script>
    // Function to get the current time and time zone
    function getCurrentTimeAndZone() {
        const now = new Date();
        const timeOptions = { hour: 'numeric', minute: 'numeric', hour12: true };
        const time = now.toLocaleTimeString(undefined, timeOptions);
        const timeZone = Intl.DateTimeFormat().resolvedOptions().timeZone;
        return { time, timeZone };
    }

    // Populate the current time and time zone
    const currentTimeElement = document.getElementById('current-time');
    const currentTimeZoneElement = document.getElementById('current-timezone');

    if (currentTimeElement && currentTimeZoneElement) {
        const { time, timeZone } = getCurrentTimeAndZone();
        currentTimeElement.innerText = time;
        currentTimeZoneElement.innerText = timeZone;
    }
</script>
<script>
    var splide = new Splide('.splidecol', {
        type: 'loop',
        perPage: 7,
        perMove: 1,
        breakpoints: {
            640: {
                perPage: 4,

            },
            767: {
                perPage: 5,

            },
            1024: {
                perPage: 6,

            },
        },
    });

    splide.mount();
   
</script>




<?php echo $footer; ?>