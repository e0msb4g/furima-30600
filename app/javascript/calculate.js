function calculate(){
  const priceInput = document.getElementById("item-price")
  priceInput.addEventListener("input",() => {
    const inputValue = priceInput.value;
      const addTax = document.getElementById("add-tax-price")
      addTax.innerHTML = Math.floor(inputValue * 0.1)

      const addBenefit = document.getElementById("profit")
      realAddTax = addTax.innerHTML
      addBenefit.innerHTML = (inputValue - realAddTax)
  })
}

window.addEventListener('load', calculate);