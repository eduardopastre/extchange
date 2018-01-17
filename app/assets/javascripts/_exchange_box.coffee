$(document).ready ->
  last_type = Date.now()

  $('#quantity').change -> 
    last_type = Date.now()
    exchange()

  $('#quantity').keyup ->
    last_type = Date.now()
    exchange()
    
  $('.currency_options').change ->
    if $('#quantity').val() != ""
      exchange()

  $('#reverse_search').click ->
    currency = $("#currency").val()
    currency_destination = $("#currency_destination").val()
    $("#currency").val(currency_destination)
    $("#currency_destination").val(currency)
    if $('#quantity').val() != ""
      exchange()

  exchange = () ->
    setTimeout ->       
      if (Date.now() - last_type) >= 900
        console.log (Date.now() - last_type)
        $.ajax '/exchange',
          type: 'POST'
          dataType: 'json'
          data: {
                  currency: $("#currency").val(),
                  currency_destination: $("#currency_destination").val(),
                  quantity: $("#quantity").val()
                }
          error: (jqXHR, textStatus, errorThrown) ->
            alert textStatus
          success: (data, text, jqXHR) ->
            $('#result').val(data.value)
        return false;
    , 1000