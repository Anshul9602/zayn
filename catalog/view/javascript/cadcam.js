  // customer stones input string
   let par = $('#input-option1522').parent().parent();
   $('#input-option1420').parent().parent().append($('#input-option1522').parent());
   $('#input-option1522').parent().hide()
   par.remove();
   // choose stone setting option condiion on customer stones option
   $('input[name="option[1420]"').click(function() {
      if ($(this).val() == "2306") {
         $('#input-option1522').val('')
         $('#input-option1522').parent().show()
      } else {
         $('#input-option1522').val('default')
         $('#input-option1522').parent().hide()
      }
   })

   if ($('input[name="option[1420]"]:checked').val() == "2306") {
      $('#input-option1522').parent().show();
   }

   // tone input string
  par = $('#input-option1521').parent().parent();
   $('#input-option1423').parent().parent().append($('#input-option1521').parent());
   $('#input-option1521').parent().hide()
   par.remove();

   // choose metal color option condiion on customer color option
   $('input[name="option[1423]"').click(function() {
      if ($(this).val() == "2513" || $(this).val() == "2514") {
         $('#input-option1521').val('')
         $('#input-option1521').parent().show()
      } else {
         $('#input-option1521').val('default')
         $('#input-option1521').parent().hide()
      }
   })

   if ($('input[name="option[1423]"]:checked').val() == "2513" || $('input[name="option[1423]"]:checked').val() == "2514") {
      $('#input-option1521').parent().show();
   }

   // mention product category input string

   par = $('#input-option1523').parent().parent();
   $('#input-option1415').parent().parent().append($('#input-option1523').parent());
   $('#input-option1523').parent().hide()
   par.remove();
   // choose product category option condiion on other option
   $('input[name="option[1415]"').click(function() {
      if ($(this).val() == "2517") {
         $('#input-option1523').val('')
         $('#input-option1523').parent().show()
      } else {
         $('#input-option1523').val('default')
         $('#input-option1523').parent().hide()
      }
   })

   if ($('input[name="option[1415]"]:checked').val() == "2517") {
      $('#input-option1523').parent().show();
   }

   // platinum condition

   $('input[name="option[1422]"').click(function() {
      console.log('check');
      if ($(this).val() == "2309") {
         $('#input-option1423').parent().parent().hide();
    } else {
          $('#input-option1423').parent().parent().show();
      }
   })

   if ($('input[name="option[1422]"]:checked').val() == "2309") {
      $('#input-option1523').parent().show();
      $('#input-option1423').parent().parent().hide();
   }


    par = $('#input-option1427').parent().parent();
   $('#input-option1420').parent().parent().append($('#input-option1427').parent());
   $('#input-option1427').parent().hide()
   par.remove();
   // choose stone setting option condiion on customer stones option
   $('input[name="option[1420]"').click(function(){
      if($(this).val() == "2306")
      {
         $('#input-option1427').val('')
         $('#input-option1427').parent().show()
      }
      else
      {
         $('#input-option1427').val('default')
         $('#input-option1427').parent().hide()
      }
   })

  
   par = $('#input-option1428').parent().parent();
   $('#input-option1423').parent().parent().append($('#input-option1428').parent());
   $('#input-option1428').parent().hide()
   par.remove();

   // choose metal color option condiion on customer color option
   $('input[name="option[1423]"').click(function(){
      if($(this).val() == "2314" || $(this).val() == "2313")
      {
         $('#input-option1428').val('')
         $('#input-option1428').parent().show()
      }
      else
      {
         $('#input-option1428').val('default')
         $('#input-option1428').parent().hide()
      }
   })

    par = $('#input-option1434').parent().parent();
   $('#input-option1415').parent().parent().append($('#input-option1434').parent());
   $('#input-option1434').parent().hide()
   par.remove();
   // choose product category option condiion on other option
   $('input[name="option[1415]"').click(function(){
      if($(this).val() == "2317")
      {
         $('#input-option1434').val('')
         $('#input-option1434').parent().show()
      }
      else
      {
         $('#input-option1434').val('default')
         $('#input-option1434').parent().hide()
      }
   })

   par = $('#input-option1516').parent().parent();
   $('#input-option1418').parent().parent().append($('#input-option1516').parent());
   par.remove();

   $("#n1").click(function(e) {
      e.preventDefault();
      $("#profile-tab").click();
   })

   $("#n2").click(function(e) {
      e.preventDefault();
      $("#contact-tab").click();
   })
