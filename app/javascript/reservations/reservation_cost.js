import { CountUp } from "countup.js";

const updatePrice = () => {

  const days = document.getElementById("days")

  if (days) {

      const daysSetter = document.getElementById("days-setter")
    const totalPrice = document.getElementById("total-price")
    const totalPriceSetter = document.getElementById("price-setter")
    const thatPriceCar = document.getElementById("that-car-price").innerText

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
        daysSetter.value = numberOfDays

        // old value
        const startPrice = parseInt(totalPriceSetter.value);

        // set the price of the booking to the input
        totalPriceSetter.value = numberOfDays * thatPriceCar

        const endPrice = parseInt(totalPriceSetter.value);

        // TODO: counter fron old price to new price
        //totalPrice.innerText = numberOfDays * thatPriceCar;

        const options = {
          duration: 1,
          startVal: startPrice,
        };
        let demo = new CountUp('total-price', endPrice, options);
        if (!demo.error) {
          demo.start();
        } else {
          console.error(demo.error);
        }


        // new value


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
}


export { updatePrice }
