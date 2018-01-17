$(document).ready ->

  $('#quantity').change -> 
    exchange()

  $('#quantity').keyup ->
    exchange()
    
  $('.currency_options').change ->
    exchange()

  $('#reverse_search').click ->
    currency = $("#currency").val()
    $("#currency").val($("#currency_destination").val())
    $("#currency_destination").val(currency)
    exchange()

  exchange = () ->
    if $('#quantity').val() == "" 
      $('#result').val("")
      return 
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