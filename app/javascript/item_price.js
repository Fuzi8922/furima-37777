function priceInput(){
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTax = document.getElementById("add-tax-price");
    addTax.innerHTML = Math.floor(inputValue * 0.1);
    const userProfit = document.getElementById("profit")
    userProfit.innerHTML = inputValue - addTax.innerHTML
  })
};

window.addEventListener('load',priceInput );