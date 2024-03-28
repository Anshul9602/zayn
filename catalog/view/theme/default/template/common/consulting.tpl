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
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<style>
    .slote div {
        cursor: pointer;
    }

    .splide__arrows {
        display: none;
    }

    @media screen and (max-width:650px) {
        .splide__arrows {
            display: block;
        }
    }

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

    .slote .disabled {
        background-color: gray;
        margin-bottom: 0;
        padding-bottom: 10px;
        color: white;
    }

    .date-element.selected .bg1 {
        background-color: #423c9e;
        margin-bottom: 0;
        padding-bottom: 10px;
        color: white;
    }

    .time-slot.selected {
        background-color: #423c9e;
        color: white;
    }

    #submit.loading {
        cursor: not-allowed;
        opacity: 0.7;
        /* You can adjust the opacity to indicate loading */
        /* Add more styles if needed */
    }
</style>
<?php
echo "<script>";
echo "const co = " . json_encode($con) . ";";
echo "</script>";
?>

<section class="section-padding pb-3 pt-3" style="margin-top:30px;min-height:100vh;">
    <div style="padding:0 7%;">
        <div class="row justify-content-center">
            <h4 class="col-md-8 text-center pb-3" style="font-weight: 600;">What day is best for you?</h4>
            <div class="col-md-8  mt-3">
                <div class="splide splidecol" aria-label="Splide Basic HTML Example">
                    <div class="splide__track">
                        <ul class="splide__list broder" id="dateSlider">

                            <!-- Dynamically generate slides for the next 10 days -->
                            <script>
                                var selected_date1 = "";
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
                                    selected_date1 = selectedDate;
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
                                    return selectedDate;
                                }

                                // Populate the current date
                                const currentDate = new Date();

                                // Generate and append slides for the next 10 days
                                const dateSlider = document.getElementById('dateSlider');
                                for (let i = 0; i <= 7; i++) {
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

                                // Select the current date by default
                                const currentDay = currentDate.getDate();
                                const currentMonthName = getDateForOffset(0).monthName;
                                selectDate(`${currentDay}-${currentMonthName}`);

                            </script>

                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-md-8 text-center mt-3">
                <h4 class="text-center mt-md-5 mt-3 pb-2" style="font-weight: 600;">
                    What time works?
                </h4>
                <p>30-minute meeting &nbsp;&nbsp;&nbsp; <select id="timezone" onchange="displayCurrentTime()">

                    </select> Current time: <span id="currentTime"></span></p>

            </div>
        </div>

        <!-- Include Moment.js and Moment Timezone libraries -->
        <div class="row slote mt-4" id="timeSlotsContainer" style="justify-content: center;">
            <!-- Time slots will be dynamically added here -->
        </div>

        <div class="sub mt-3">
            <button type="button" id="submit1" class="btn btn-primary">Continue</button>
        </div>



        <div id="id02" class="w3-modal">
            <div class="w3-modal-content p-4"
                style="min-height: 300px;justify-content: center;display: flex;align-items: center;padding: 30px;top:30%;">
                <div class="w3-container">
                    <span onclick="document.getElementById('id02').style.display='none'"
                        class="w3-button w3-display-topright">&times;</span>
                    <div class="row" style="justify-content: space-around;">
                        <div class="col-md-5 mt-2">
                            <label for="name">Name</label><br>
                            <input type="text" id="name" placeholder="Enter name*" required
                                style="width: 100%;padding:5px 10px;border:1px solid #eae9e9">
                        </div>
                        <div class="col-md-5 mt-3">
                            <label for="name">Meeting title</label><br>
                            <input type="text" id="meeting" placeholder="Enter text*" required
                                style="width: 100%;padding:5px 10px;border:1px solid #eae9e9">
                        </div>
                        <div class="col-md-11 mt-3">
                            <label for="name">Email</label><br>
                            <input type="mail" id="mail" required placeholder="Enter your email*"
                                style="width: 100%;padding:5px 10px;border:1px solid #eae9e9">
                        </div>
                        <div class="col-md-11 mt-3">
                            <label for="name">Message</label><br>
                            <textarea type="text" id="message" placeholder="Enter text"
                                style="width: 100%;padding:5px 10px;border:1px solid #eae9e9"></textarea>
                        </div>
                        <div class="col-md-12">
                            <div class="sub mt-4 ">
                                <button type="button" id="submit" class="btn btn-primary">Submit</button>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <div id="id01" class="w3-modal">
            <div class="w3-modal-content p-4"
                style="min-height: 300px;justify-content: center;display: flex;align-items: center;padding: 30px;top:30%;">
                <div class="w3-container">
                    <span onclick="document.getElementById('id01').style.display='none'"
                        class="w3-button w3-display-topright">&times;</span>
                    <div class="mode">
                        <h4 class="text-center bold pb-4">Thank you for your submission!</h4>
                        <p class="date">We have received your appointment request for <span id="apdate"></span> at <span
                                id="aptime"></span>
                            .</p>
                        <button type="button" id="okButton" class="btn btn-primary mt-3">Ok</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="hh" style="height: 50px;"></div>
</section>
<script>
    // Get all time zones

    const allTimezones = [
        "US/Alaska",
        "US/Aleutian",
        "US/Arizona",
        "US/Central",
        "US/East-Indiana",
        "US/Eastern",
        "US/Hawaii",
        "US/Indiana-Starke",
        "US/Michigan",
        "US/Mountain",
        "US/Pacific",
        "US/Samoa",
        "Asia/Calcutta"
    ];

   
    // Get the select element
    const timezoneSelect = document.getElementById("timezone");

    // Function to populate the select element with time zones
    function populateTimezones() {
        // Clear existing options
        timezoneSelect.innerHTML = "";

        // Loop through all time zones and create options
        allTimezones.forEach(timezone => {
            const option = document.createElement("option");
            option.value = timezone;
            option.textContent = timezone;
            timezoneSelect.appendChild(option);
        });
    }

    // Function to display the current time based on the selected time zone
    function displayCurrentTime() {
        const selectedTimezone = timezoneSelect.value;
        const currentTime = moment().tz(selectedTimezone).format("YYYY-MM-DD HH:mm:ss");
        //console.log(`Current time in ${selectedTimezone}: ${currentTime}`);
    }

    // Populate the select element on page load
    populateTimezones();
</script>

<script>
    function displayTimeSlots(selectedTimeZone) {
        const timeSlotsContainer = document.getElementById('timeSlotsContainer');
        if (timeSlotsContainer) {

        

            timeSlotsContainer.innerHTML = '';
            americaTimeSlots.forEach((americaTimeSlot, index) => {
                const { momentObject, formattedTime } = convertToUserTimeZone(americaTimeSlot, selectedTimeZone);

                // Check if the slot has passed based on the current time
                const currentDate = new Date();
                const { dayName, day, monthName } = getDateForOffset(0);
                // Format date as "DD-Mon"
                const optionsDate = { day: '2-digit', month: 'short' };
                const formattedDate = day + "-" + monthName;


                const selectedTimezone = timezoneSelect.value;
                const currentTime = moment().tz(selectedTimezone).format("h:mm A");
                //console.log(`Current time in ${selectedTimezone}: ${currentTime}`);

                // Format time as "h:mm AM/PM"
                const optionsTime = { hour: 'numeric', minute: '2-digit', hour12: true };
                const formattedTime1 = currentTime;
               // console.log(formattedTime1, "-formated1");

                function parseTime(timeString) {
                    const [time, period] = timeString.split(' ');
                    const [hours, minutes] = time.split(':');
                    return { hours: parseInt(hours), minutes: parseInt(minutes), period };
                }

                function compareTimes(formattedTime, formattedTime1) {
                    const time1 = parseTime(formattedTime);
                    const time2 = parseTime(formattedTime1);

                    // Convert time objects to minutes since midnight
                    const time1Minutes = time1.hours * 60 + time1.minutes + (time1.period.toLowerCase() === 'pm' ? 12 * 60 : 0);
                    const time2Minutes = time2.hours * 60 + time2.minutes + (time2.period.toLowerCase() === 'pm' ? 12 * 60 : 0);


                    // Compare the two times
                    return time1Minutes < time2Minutes;
                }
                let slotPassed = false

                if (selected_date1 === formattedDate && compareTimes(formattedTime, formattedTime1)) {

                    slotPassed = true;
                }
                else {

                    slotPassed = false;
                }


                const timeSlotElement = document.createElement('div');
                const timeSlotId = `time-slot-${index}`; // Unique id for each time slot
                timeSlotElement.id = timeSlotId;
                // Check if the time slot should be disabled based on the selected date and time
                let isDisabledSlot;
                co.map((el, index) => {
                    var date_databased = el.selected_date;
                    var time_databased = el.selected_time;
                    var zone_databased = el.current_timezone;
                    console.log(date_databased, time_databased, zone_databased, "databse data ");
                    if (el.selected_date === selected_date1 && el.selected_time === formattedTime) {
                        return isDisabledSlot = el.selected_date === selected_date1 && el.selected_time === formattedTime;
                    }

                })

                timeSlotElement.className = `col-md-3 text-center ${slotPassed || isDisabledSlot ? 'disabled' : 'time-slot'}`;
                timeSlotElement.style.margin = '10px 20px';
                timeSlotElement.style.padding = '5px 10px';
                timeSlotElement.style.width = '100%';
                timeSlotElement.style.border = '1px solid #eae9e9';
                //console.log(formattedTime, "eeror--");
                // Set styles for slot based on whether it's disabled or not
                if (!slotPassed) {
                    timeSlotElement.textContent = formattedTime;

                    // Add click event listener to each time slot
                    if (!isDisabledSlot) {
                        timeSlotElement.addEventListener('click', () => selectSlot(americaTimeSlot, timeSlotId));
                    }

                } else {

                    timeSlotElement.textContent = formattedTime;
                    timeSlotElement.style.backgroundColor = '#ccc'; // Disabled color
                    // Disable click on passed slots
                }
                if (slotPassed) {
                    timeSlotElement.textContent = formattedTime;
                    timeSlotElement.addEventListener('click', () => showBookedMessage(timeSlotElement));
                    timeSlotElement.addEventListener('click', () => hideBookedMessage(timeSlotElement));
                }

                timeSlotsContainer.appendChild(timeSlotElement);
            });
        }
    }
    function showBookedMessage(element) {
        console.log("Elemt booked message ")
        const bookedMessage = document.createElement('div');
        bookedMessage.textContent = 'Booked Slot';
        bookedMessage.className = 'booked-message';
        element.appendChild(bookedMessage);
    }

    // Function to hide "Booked" message when not hovered over
    function hideBookedMessage(element) {
        console.log("Elemt booked message ")
        const bookedMessage = element.querySelector('.booked-message');
        if (bookedMessage) {
            element.removeChild(bookedMessage);
        }
    }
    // Function to convert time from America time zone to user's time zone

    function displayTimeSlots2(selectedTimeZone, availableTimeSlots, selectedDate) {
        const timeSlotsContainer = document.getElementById('timeSlotsContainer');
        if (timeSlotsContainer) {
            // Clear existing time slots
            timeSlotsContainer.innerHTML = '';

            // Populate time slots in user's time zone
            americaTimeSlots.forEach((americaTimeSlot, index) => {
                const { momentObject, formattedTime } = convertToUserTimeZone(americaTimeSlot, selectedTimeZone);

                // Check if the slot has passed based on the current time
                const currentDate = new Date();
                const { dayName, day, monthName } = getDateForOffset(0);
                // Format date as "DD-Mon"
                const optionsDate = { day: '2-digit', month: 'short' };
                const formattedDate = day + "-" + monthName;

                // Format time as "h:mm AM/PM"
                const optionsTime = { hour: 'numeric', minute: '2-digit', hour12: true };
                const formattedTime1 = currentDate.toLocaleTimeString('en-US', optionsTime);
                function parseTime(timeString) {
                    const [time, period] = timeString.split(' ');
                    const [hours, minutes] = time.split(':');
                    return { hours: parseInt(hours), minutes: parseInt(minutes), period };
                }

                function compareTimes(formattedTime, formattedTime1) {
                    const time1 = parseTime(formattedTime);
                    const time2 = parseTime(formattedTime1);

                    // Convert time objects to minutes since midnight
                    const time1Minutes = time1.hours * 60 + time1.minutes + (time1.period.toLowerCase() === 'pm' ? 12 * 60 : 0);
                    const time2Minutes = time2.hours * 60 + time2.minutes + (time2.period.toLowerCase() === 'pm' ? 12 * 60 : 0);
                    // Compare the two times
                    return time1Minutes < time2Minutes;
                }


                if (selected_date1 === formattedDate && compareTimes(formattedTime, formattedTime1)) {

                    slotPassed = true;
                }
                else {

                    slotPassed = false;
                }

                const timeSlotElement = document.createElement('div');
                const timeSlotId = `time-slot-${index}`; // Unique id for each time slot
                timeSlotElement.id = timeSlotId;
                // Check if the time slot should be disabled based on the selected date and time
                let isDisabledSlot;
                co.map((el, index) => {

                    if (el.selected_date === selectedDate && el.selected_time === formattedTime) {
                        return isDisabledSlot = el.selected_date === selectedDate && el.selected_time === formattedTime;
                    }

                })
                timeSlotElement.className = `col-md-3 text-center ${slotPassed || isDisabledSlot ? 'disabled' : 'time-slot'}`;
                timeSlotElement.style.margin = '10px 20px';
                timeSlotElement.style.padding = '5px 10px';
                timeSlotElement.style.width = '100%';
                timeSlotElement.style.border = '1px solid #eae9e9';

                // Set styles for slot based on whether it's disabled or not
                if (!slotPassed) {
                    timeSlotElement.textContent = formattedTime;

                    // Add click event listener to each time slot
                    if (!isDisabledSlot) {
                        timeSlotElement.addEventListener('click', () => selectSlot(americaTimeSlot, timeSlotId));
                    }
                } else {
                    timeSlotElement.textContent = formattedTime;
                    timeSlotElement.style.backgroundColor = '#ccc'; // Disabled color
                    timeSlotElement.style.pointerEvents = 'none'; // Disable click on passed slots
                }

                timeSlotsContainer.appendChild(timeSlotElement);
            });
        }
    }
    function convertToUserTimeZone(americaTime, selectedZone) {

        const americaTimeZone = 'America/New_York'; // Replace with the appropriate America time zone
        const userTimeZone = selectedZone;
        const americaDateTime = moment.tz(`${moment().format('YYYY-MM-DD')} ${americaTime}`, americaTimeZone);
        const userTimeSlot = americaDateTime.clone().tz(userTimeZone).format('hh:mm A');

        console.log(userTimeSlot, "slot", userTimeZone, "zone", americaDateTime, "dates");
        return { momentObject: americaDateTime, formattedTime: userTimeSlot };
    }


    // Function to get the current time in America time zone
    function getCurrentTimeInAmericaTimeZone() {
        const americaTimeZone = 'America/New_York'; // Replace with the appropriate America time zone
        return moment.tz(americaTimeZone);
    }
    function getAvailableTimeSlots(selectedDate) {
        // For demonstration, return a fixed set of time slots
        return [

            '6:00 AM',
            '6:30 AM',
            '7:00 AM',
            '7:30 AM',
            '8:00 AM',
            '8:30 AM',
            '9:00 AM',
            '9:30 AM',
            '10:00 AM',
            '10:30 AM',
            '11:00 AM', '11:30 AM', '12:00 PM', '12:30 PM', '1:00 PM', '1:30 PM', '2:00 PM', '2:30 PM',
            '3:00 PM',
            '3:30 PM',
            '4:00 PM',
            '4:30 PM',
            '5:00 PM'

        ];
    }
    // Time slots in America time zone
    const americaTimeSlots = [

        '2:00 PM',
        '2:30 PM',
        '3:00 PM',
        '3:30 PM',
        '4:00 PM',
        '4:30 PM',
        '5:00 PM',
        '5:30 PM',
        '6:00 PM',
        '6:30 PM',
        '7:00 PM',
        '7:30 PM',
        '8:00 PM',
        '8:30 PM',
        '9:00 PM',
        '9:30 PM',
        '10:00 PM',
        '10:30 PM',
        '11:00 PM',
        '11:30 PM',
        '12:00 AM',
        '12:30 AM',
        '1:00 AM'


    ];

    // Get the container to append time slots
    const timeSlotsContainer = document.getElementById('timeSlotsContainer');

    // Get the current time in America time zone
    const currentTimeInAmericaTimeZone = getCurrentTimeInAmericaTimeZone();


    // Populate time slots in user's time zone


    // Function to handle time slot selection
    function selectSlot(selectedSlot) {


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

        displayTimeSlots2(selectedTimeZone, availableTimeSlots, selectedDate)
    }

    // Function to handle time slot selection
    function selectSlot(selectedTime, timeSlotId) {
        // Reset styles for all time slots
        const timeSlotElements = document.querySelectorAll('.time-slot');
        timeSlotElements.forEach((element) => {
            element.classList.remove('selected');
        });

        // Highlight the selected time slot
        const selectedTimeSlotElement = document.getElementById(timeSlotId);
        if (selectedTimeSlotElement) {
            selectedTimeSlotElement.classList.add('selected');
        }

        // Log the selected time slot

    }
    // Rest of your existing code...
</script>

<script>
    var selectedTimeZone;
    function displayCurrentTime() {
        // Get the select element
        var selectElement = document.getElementById("timezone");

        // Get the selected value
        var selectedTimeZone1 = selectElement.value;

        if (selectedTimeZone1) {
            selectedTimeZone = selectElement.value;

        } else {
            selectedTimeZone = moment.tz.guess();

        }

        displayTimeSlots(selectedTimeZone);

        // Get the current time in the selected timezone
        var currentTime = new Date().toLocaleTimeString("en-US", {
            timeZone: selectedTimeZone,
            hour: 'numeric',
            minute: 'numeric',
            hour12: true
        });

        // Display the current time
        document.getElementById("currentTime").textContent = currentTime;
    }

    // Set the initial value of the dropdown to the user's timezone
    var userTimeZone = Intl.DateTimeFormat().resolvedOptions().timeZone;
    document.getElementById("timezone").value = userTimeZone;

    // Display the current time on page load
    displayCurrentTime();

    // Update the time initially and set interval to update every minute
    setInterval(displayCurrentTime, 300000); 
</script>

<script>
    // When the user clicks on div, open the popup
    function myFunction() {
        var popup = document.getElementById("myPopup");
        popup.classList.toggle("show");
    }
</script>

<script>
    // Add an event listener to the "Continue" button
    document.getElementById('submit1').addEventListener('click', function () {
        // Show the modal popup for id02
        document.getElementById('id02').style.display = 'block';
    });

    // Add any additional scripting you need

    // Example: Close modal when "Ok" button is clicked
    document.getElementById('okButton').addEventListener('click', function () {
        document.getElementById('id02').style.display = 'none';
    });

    // Example: Handle form submission

</script>
<script>

    document.getElementById('submit').addEventListener('click', function () {
        const submitButton = document.getElementById('submit');
        submitButton.classList.add('loading');
        submitButton.innerHTML = '<i class="fa fa-spinner fa-spin"></i>Loading';

        const selectedDateElement = document.querySelector('.date-element.selected');
        const selectedTimeElement = document.querySelector('.time-slot.selected');
        const userEmail = document.getElementById('mail').value;
        const userName = document.getElementById('name').value;
        const meetingTitle = document.getElementById('meeting').value;
        const userMessage = document.getElementById('message').value || '.';

        if (selectedDateElement && selectedTimeElement && userEmail && userName && meetingTitle) {
            const selectedDate = selectedDateElement.id.replace('date-', '');
            const selectedTime = selectedTimeElement.textContent.trim();

            const requestData = {
                selectedDate: selectedDate,
                selectedTime: selectedTime,
                userName: userName,
                meetingTitle: meetingTitle,
                userMessage: userMessage,
                userEmail: userEmail,
                currentTimezone: selectedTimeZone,
                currentTime: new Date().toLocaleTimeString()
            };

            const xhr = new XMLHttpRequest();
            xhr.open('POST', 'index.php?route=common/consulting/con_form', true);
            xhr.setRequestHeader('Content-Type', 'application/json');

            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4) {
                    if (xhr.status === 200) {
                        const data = JSON.parse(xhr.responseText);
                        document.getElementById('id02').style.display = 'none';
                        document.getElementById('apdate').textContent = data.selectedDate;
                        document.getElementById('aptime').textContent = data.selectedTime;
                        submitButton.classList.remove('loading');
                        document.getElementById('id01').style.display = 'block';
                    } else {
                        console.error('Error:', xhr.statusText);
                        submitButton.classList.remove('loading');
                    }
                }
            };

            xhr.onerror = function (error) {
                console.error('Error:', error);
                submitButton.classList.remove('loading');
            };

            xhr.send(JSON.stringify(requestData));
        } else {
            alert('Please select date, time, and enter your email before submitting.');
            submitButton.classList.remove('loading');
        }
    });

    document.getElementById('okButton').addEventListener('click', function () {
        location.reload();
    });

    var splide = new Splide('.splidecol', {
        pagination: false,
        perPage: 8,
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