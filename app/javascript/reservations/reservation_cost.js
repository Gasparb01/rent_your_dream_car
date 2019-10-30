const updatePrice = () => {
  const days = document.getElementById("days")
  const totalPrice = document.getElementById("total-price")

  const startDate = document.getElementById("start_date");
  const endDate = document.getElementById("end_date");

  const calculateDays = () => {
    const startDateTemp = startDate.value.split(".")
    const startRentDate = new Date(startDateTemp[2], startDateTemp[1], startDateTemp[0])
    const endDateTemp = endDate.value.split(".")
    const endRentDate = new Date(endDateTemp[2], endDateTemp[1], endDateTemp[0])
    return ((endRentDate - startRentDate)/ (36000*2400) + 1)
  }

  const setDaysAndPrice = () => {
    const numberOfDays = calculateDays()

    if (numberOfDays > 0) {
      days.innerText = numberOfDays
      totalPrice.innerText = calculateDays() * 100
    } else {
      console.log("Negative")
    }
  }

  if (startDate) {
    startDate.addEventListener("change", (event) => {
      setDaysAndPrice()
    })
  }

  if (endDate) {
    endDate.addEventListener("change", (event) => {
      setDaysAndPrice()
    })
  }

}


export { updatePrice }
