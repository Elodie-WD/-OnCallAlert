import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="planning"
export default class extends Controller {
  static targets = ["divform", "btn", "form", "items", "divday"]
  static values = {
    textopen: String,
    textclose: String,
    day: String,

  };
  connect() {
    // console.log(this.itemsTarget);
    console.log();
    // this.divdayTargets.forEach((divday) => {
    //   // Faites quelque chose avec chaque élément ciblé
    //   console.log(divday.dataset.planningDayValue);
    // });
  };
  toggle() {
    this.divformTarget.classList.toggle("d-none");
    this.btnTarget.innerText = (this.btnTarget.innerText === this.textopenValue) ? this.textcloseValue : this.textopenValue;
  };
  async send(event) {
    event.preventDefault();

    await fetch(this.formTarget.action, {
      method: "POST", // Could be dynamic with Stimulus values
      headers: { "Accept": "application/json" },
      body: new FormData(this.formTarget)
    })
      .then(response => response.json())
      .then((data) => {
        // console.log(data);
        // console.log(data.form);
        // console.log(data.inserted_item);
        // console.log(data.date);
        const dateDay = data.date;
        const divBooking = data.inserted_item;
        console.log(dateDay);
        if (divBooking) {
          // this.divdayTargets.forEach((divday) => {
          //   if (divday.dataset.planningDayValue === data.date) {
          //     this.divdayTarget.nextElementSibling.insertAdjacentHTML("beforeend", data.inserted_item)
          //   }
          // });

          this.divdayTargets.forEach((divday) => {
            if (divday.dataset.planningDayValue === data.date) {
              divday.nextElementSibling.insertAdjacentHTML("beforeend", divBooking);
            }
          });

        }
        // console.log(data.form);
        this.formTarget.outerHTML = data.form
        // console.log(this.divdayTargets);

      })
  }
}
