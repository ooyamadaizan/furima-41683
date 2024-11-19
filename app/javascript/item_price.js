const price = () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");
    const addTaxPrice = Math.floor(inputValue * 0.1);
    const profitPrice = Math.floor(inputValue - addTaxPrice);
    addTaxDom.innerHTML = addTaxPrice;
    profit.innerHTML = profitPrice
});
};

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);