window.addEventListener("DOMContentLoaded",(e) => {
  const price = document.getElementById("item-price")
  const tax = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")

  price.addEventListener("input", ()=> {
    const inputvalue = document.getElementById("item-price").value
    tax.innerHTML = (inputvalue * 0.1).toLocaleString();
    profit.innerHTML = (inputvalue * 0.9).toLocaleString();
  
  })
})
