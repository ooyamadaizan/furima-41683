const price = () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");
    addTaxDom.innerHTML = Math.floor(inputValue * 1.1);
    profit.innerHTML = Math.ceil(inputValue * 0.9);
});
};

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);