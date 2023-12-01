import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="activation"
export default class extends Controller {
  static targets = ["button", "card"]
  connect() {
    console.log(this.cardTarget)
  }
  validation() {
    this.buttonTarget.innerText = "Astreinte Confirmé";
    this.buttonTarget.setAttribute("disabled", "");
    this.buttonTarget.classList.add("green");
    this.cardTarget.classList.add("green");
  }
}
