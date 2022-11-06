const form= document.getElementById("form1")

form.addEventListener('submit', async (e) => {
    e.preventDefault()
  
    const email = 'robertodavid840@gmail.com'
    const URL_BASE = `https://formsubmit.co/${email}`
  
    const input = e.currentTarget.elements
    const formData = {
      name: input.name.value,
      email: input.email.value,
      message: input.message.value
    }
  
    const options = {
      method: 'POST',
      header: {
        'Content-Type': 'application/json',
        Accept: 'application/json'
      },
      body: JSON.stringify(formData)
    }
  
    /* con then y catch */
    fetch(URL_BASE, options)
      .then(response => response.json())
      .then(data => console.log(data))
      .catch(error => console.log(error))
  
    /* Con async / await */
    try {
      const res = await fetch(URL_BASE, options)
      const data = await res.json()
      console.log(data)
    } catch (error) {
      console.log(error)
    }
  })