$(document).ready ->
  $('form').submit ->
    if $('form').attr('action') == '/exchange'
      exchange()
  
  $('#quantity').change -> 
    exchange()

  $('#quantity').keyup ->
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
    

###
 evento quando select e evento quando digita valor
 botão trocar moedas

 README
 como baixar o projeto instalar usar na máquina requerimentos
 o que o projeto faz, tecnologias
 print screen da página
###