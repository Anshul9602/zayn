<?php echo $header; ?>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment-timezone/0.5.32/moment-timezone-with-data.min.js"></script>
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

    .splide__arrow--prev {
        left: -3em;
    }

    .splide__arrow--next {
        right: -3em;
    }
</style>




<style>
    .date-element {

        cursor: pointer;
    }

    .date-element.selected .bg1 {
        background-color: green;
        margin-bottom: 0;
        padding-bottom: 10px;
        color: white;
    }

    .time-slot.selected {
        background-color: green;
        color: white;
    }
</style>

<section class="section-padding pb-5 pt-5" style="margin-top:60px;min-height:100vh;">
    <div style="padding:0 7%;">
        <div class="row justify-content-center">
            <h4 class="col-md-8 text-center pb-3">What day is best for you?</h4>
            <div class="col-md-8 mt-md-5 mt-3">
                <div class="splide splidecol" aria-label="Splide Basic HTML Example">
                    <div class="splide__track">
                        <ul class="splide__list broder" id="dateSlider">

                            <!-- Dynamically generate slides for the next 10 days -->
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

                                function selectDate(selectedDate) {
                                    console.log(selectedDate);

                                    // Reset styles for all date elements
                                    const dateElements = document.querySelectorAll('.date-element');
                                    dateElements.forEach((dateElement) => {
                                        dateElement.classList.remove('selected');
                                    });

                                    // Highlight the selected date
                                    const selectedDateElement = document.getElementById(`date-${selectedDate}`);
                                    if (selectedDateElement) {
                                        selectedDateElement.classList.add('selected');
                                    }

                                    // Update available time slots based on the selected date
                                    updateAvailableTimeSlots(selectedDate);
                                }

                                // Populate the current date
                                const currentDate = new Date();

                                // Generate and append slides for the next 10 days
                                const dateSlider = document.getElementById('dateSlider');
                                for (let i = 0; i <= 10; i++) {
                                    const { dayName, day, monthName } = getDateForOffset(i);

                                    const li = document.createElement('li');
                                    li.className = 'splide__slide mr-0';
                                    li.style.border = '1px solid #eae9e9';
                                    li.innerHTML = `
                                        <div id="date-${day}-${monthName}" class="date-element text-center" onclick="selectDate('${day}-${monthName}')">
                                            <p class="tops" style="background-color: #eae9e9;margin-bottom: 0px;">${dayName}</p>
                                            <p class="bg1 pt-2">${day}</p>
                                            <p class="bg1">${monthName}</p>
                                        </div>
                                    `;
                                    dateSlider.appendChild(li);
                                }
                            </script>

                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-md-8 text-center">
                <h4 class="text-center mt-md-5 mt-3 pb-2" style="font-weight: 600;">
                    What time works?
                </h4>
                <p>30-minute meeting &nbsp;&nbsp;&nbsp; <span id="current-timezone"></span> &nbsp;&nbsp;Time (<span
                        id="current-time"></span>)</p>
            </div>
        </div>

        <!-- Include Moment.js and Moment Timezone libraries -->
        <div class="row slote" id="timeSlotsContainer" style="justify-content: center;">
            <!-- Time slots will be dynamically added here -->
        </div>

        <script>
            // Function to convert time from America time zone to user's time zone
            function convertToUserTimeZone(americaTime) {
                const americaTimeZone = 'America/New_York'; // Replace with the appropriate America time zone
                const userTimeZone = moment.tz.guess();
        
                // Create a Moment object for the current date and time in America time zone
                const americaDateTime = moment.tz(`${moment().format('YYYY-MM-DD')} ${americaTime}`, americaTimeZone);
        
                // Convert to the user's time zone
                const userTimeSlot = americaDateTime.clone().tz(userTimeZone).format('hh:mm A');
        
                return { momentObject: americaDateTime, formattedTime: userTimeSlot };
            }
        
            // Function to get the current time in America time zone
            function getCurrentTimeInAmericaTimeZone() {
                const americaTimeZone = 'America/New_York'; // Replace with the appropriate America time zone
                return moment.tz(americaTimeZone);
            }
            function getAvailableTimeSlots(selectedDate) {
                // For demonstration, return a fixed set of time slots
                return ['10:30 AM', '11:00 AM', '11:30 AM', '12:00 PM', '12:30 PM', '1:00 PM', '1:30 PM', '2:00 PM', '2:30 PM', '3:00 PM', '3:30 PM'];
            }
            // Time slots in America time zone
            const americaTimeSlots = ['10:30 AM', '11:00 AM', '11:30 AM', '12:00 PM', '12:30 PM', '1:00 PM', '1:30 PM', '2:00 PM', '2:30 PM', '3:00 PM', '3:30 PM'];
        
            // Get the container to append time slots
            const timeSlotsContainer = document.getElementById('timeSlotsContainer');
        
            // Get the current time in America time zone
            const currentTimeInAmericaTimeZone = getCurrentTimeInAmericaTimeZone();
        
            // Populate time slots in user's time zone
            if (timeSlotsContainer) {
                americaTimeSlots.forEach((americaTimeSlot) => {
                    const { momentObject, formattedTime } = convertToUserTimeZone(americaTimeSlot);
        
                    // Check if the slot has passed based on the current time
                    const slotPassed = momentObject.isBefore(currentTimeInAmericaTimeZone);
        
                    const timeSlotElement = document.createElement('div');
                    timeSlotElement.className = `col-md-3 text-center ${slotPassed ? 'disabled' : 'time-slot'}`;
                    timeSlotElement.style.margin = '10px 20px';
                    timeSlotElement.style.padding = '5px 10px';
                    timeSlotElement.style.width = '100%';
                    timeSlotElement.style.border = '1px solid #eae9e9';
        
                    // Set styles for slot based on whether it's disabled or not
                    if (!slotPassed) {
                        timeSlotElement.textContent = formattedTime;
                        timeSlotElement.addEventListener('click', () => selectSlot(americaTimeSlot));
                    } else {
                        timeSlotElement.textContent = 'Slot Passed';
                        timeSlotElement.style.backgroundColor = '#ccc'; // Disabled color
                        timeSlotElement.style.pointerEvents = 'none'; // Disable click on passed slots
                    }
        
                    timeSlotsContainer.appendChild(timeSlotElement);
                });
            }
        
            // Function to handle time slot selection
            function selectSlot(selectedSlot) {
                console.log(selectedSlot);
        
                // Reset styles for all time slots
                const slotElements = document.querySelectorAll('.time-slot');
                slotElements.forEach((slotElement) => {
                    slotElement.classList.remove('selected');
                });
        
                // Highlight the selected slot
                const selectedSlotElement = document.querySelector(`.time-slot:contains("${selectedSlot}")`);
                if (selectedSlotElement) {
                    selectedSlotElement.classList.add('selected');
                }
            }
        
            // Function to update available time slots based on the selected date
            function updateAvailableTimeSlots(selectedDate) {
                // Logic to fetch available time slots for the selected date
                // For demonstration, using a fixed set of time slots
                const availableTimeSlots = getAvailableTimeSlots(selectedDate);
        
                // Update the displayed time slots
                const timeSlotsContainer = document.getElementById('timeSlotsContainer');
                if (timeSlotsContainer) {
                    // Clear existing time slots
                    timeSlotsContainer.innerHTML = '';
        
                    // Populate time slots in user's time zone
                    availableTimeSlots.forEach((americaTimeSlot) => {
                        const userTimeSlot = convertToUserTimeZone(americaTimeSlot).formattedTime;
        
                        const timeSlotElement = document.createElement('div');
                        timeSlotElement.className = 'col-md-3 text-center';
                        timeSlotElement.style.margin = '10px 20px';
                        timeSlotElement.style.padding = '5px 10px';
                        timeSlotElement.style.width = '100%';
                        timeSlotElement.style.border = '1px solid #eae9e9';
                        timeSlotElement.textContent = userTimeSlot;
        
                        // Add click event listener to each time slot
                        timeSlotElement.addEventListener('click', () => selectTime(selectedDate, americaTimeSlot));
        
                        timeSlotsContainer.appendChild(timeSlotElement);
                    });
                }
            }
        
            // Function to handle date selection
            function selectDate(selectedDate) {
                console.log(selectedDate);
        
                // Reset styles for all date elements
                const dateElements = document.querySelectorAll('.date-element');
                dateElements.forEach((dateElement) => {
                    dateElement.classList.remove('selected');
                });
        
                // Highlight the selected date
                const selectedDateElement = document.getElementById(`date-${selectedDate}`);
                if (selectedDateElement) {
                    selectedDateElement.classList.add('selected');
                }
        
                // Update available time slots based on the selected date
                updateAvailableTimeSlots(selectedDate);
            }
            function selectTime(selectedDate, selectedTime) {
                // Reset background color for all time slot elements
                const timeSlotElements = document.querySelectorAll('.col-md-3');
                timeSlotElements.forEach((timeSlotElement) => {
                    timeSlotElement.style.backgroundColor = '';
                });
        
                // Highlight the selected time slot
                const selectedTimeSlotElement = document.getElementById(`time-${selectedDate}-${selectedTime}`);
                if (selectedTimeSlotElement) {
                    selectedTimeSlotElement.style.backgroundColor = 'green';
                }
        
                // Log the selected date and time slot
                console.log(`Selected Date: ${selectedDate}, Selected Time: ${selectedTime}`);
            }
            // Rest of your existing code...
        </script>
    </div>
</section>
<script>
    var splide = new Splide('.splidecol', {

        perPage: 7,
        perMove: 3,
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