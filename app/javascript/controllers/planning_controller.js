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
  };
  toggle() {
    this.divformTarget.classList.toggle("d-none");
    this.btnTarget.innerText = (this.btnTarget.innerText === this.textopenValue) ? this.textcloseValue : this.textopenValue;
  };
  async send(event) {
    event.preventDefault();

    await fetch(this.formTarget.action, {
      method: "POST",
      headers: { "Accept": "application/json" },
      body: new FormData(this.formTarget)
    })
      .then(response => response.json())
      .then((data) => {
        const dateDay = data.date;
        const divBooking = data.inserted_item;

        if (divBooking) {
          this.divdayTargets.forEach((divday) => {
            if (divday.dataset.planningDayValue === dateDay) {
              divday.nextElementSibling.insertAdjacentHTML("beforeend", divBooking);
            }
          });
        }
        this.formTarget.outerHTML = data.form
      })
  }
}
