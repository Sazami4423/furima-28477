$(function(){
  var $price_input = $('#item-price');
  var $price_fee = $('#add-tax-price');
  var fee_rate = 0.1; 
  var maxPriceInput = 99999999; 
  var maxPriceFee = Math.floor(maxPriceInput * fee_rate); 
  var maxProfit  = Math.floor(maxPriceInput - maxPriceFee); 
  $('#price-box').attr('autocomplete', 'off');
  $('#fee-box').text('-')
  $('#profits-box').text('-')
  $price_input.on('input', function(event) {
    var input_val = $(this).val();  
    var input_val_num = Number(input_val.replace(/[^[0-9]+$/g, '')); 
    if(input_val_num == 0) {  
    } else if (input_val_num > maxPriceInput) { 
      input_val_num = maxPriceInput;
    }
    $(this).val(input_val_num);  
    if(input_val_num != 0) { 
      var total_price_fee = Math.floor(input_val_num * fee_rate); 
    }  else if (total_price_fee > maxPriceFee) {
      total_price_fee = maxPriceFee;
    }
    $price_fee.text("¥"+total_price_fee.toString().replace(/(\d)(?=(\d{3})+$)/g , '$1,')); 
    if(total_price_fee < 30){  
      $price_fee.text('-');
    }
    else if(total_price_fee  == undefined){  
      $price_fee.text('-');
    }
    var $price_profit = $('#profit');  
    if(input_val_num != 0) { 
      var total_profit = Math.floor(input_val_num - total_price_fee); 
    }  else if (total_profit > maxProfit) { 
     total_profit = maxProfit;
    }
    $price_profit.text("¥"+total_profit.toString().replace(/(\d)(?=(\d{3})+$)/g , '$1,')); 
    if(total_profit < 270){  
      $price_profit.text('-');
    }
    else if(total_profit  == undefined){ 
      $price_profit.text('-');
    }
  });
});