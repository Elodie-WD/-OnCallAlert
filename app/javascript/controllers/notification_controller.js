import { Controller } from "@hotwired/stimulus"


// Connects to data-controller="notification"

export default class ActivationController extends Controller {
  static targets = ["card"]
  connect() {
    console.log("ok")

  }
  validation() {
    this.cardTarget.classList.add("green");
  }
}
