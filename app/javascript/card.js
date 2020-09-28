function payment() {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const form = document.getElementById("order-address")
    form.addEventListener('submit', (e) => {
      e.preventDefault()
      
      const formResult = document.getElementById("order-address")
      const formData = new FormData(formResult)

      const card = {
        number: formData.get("order_address[number]"),
        cvc:  formData.get("order_address[cvc]"),
        exp_month: formData.get("order_address[exp_month]"),
        exp_year: `20${formData.get("order_address[exp_year]")}`
      }

      Payjp.createToken(card, (status, response) => {
        if (status == 200 ) {
          const token = response.id
          const domForm = document.getElementById('order-address')
          const tokenObject = `<input value=${token} type="hidden" name="token" >`
          domForm.insertAdjacentHTML('beforeend', tokenObject)
        }
          document.getElementById("card-number").removeAttribute("name")
          document.getElementById("card-cvc").removeAttribute("name")
          document.getElementById("card-exp-month").removeAttribute("name")
          document.getElementById("card-exp-year").removeAttribute("name")

          document.getElementById("order-address").submit()
          document.getElementById("order-address").reset()
        
      })
    })
}
window.addEventListener('load', payment)