function tax (){
  let itemPrice  = document.getElementById("item-price");
  itemPrice.addEventListener("keyup", () => {
    let fee = Math.ceil(itemPrice.value * 0.1) ;
    let addTaxPrice = document.getElementById("add-tax-price");
    addTaxPrice.innerHTML = `${fee}`;
    let SalesProfit = Math.floor(itemPrice.value - fee) ;
    let profit = document.getElementById("profit");
    profit.innerHTML = `${SalesProfit}`;
  });
}

window.addEventListener('load', tax);