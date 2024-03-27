import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="planning"
export default class extends Controller {
  static targets = ["form", "btn"]
  static values = {
    textopen: String,
    textclose: String

  }
  connect() {

  }
  toggle() {
    this.formTarget.classList.toggle("d-none");
    this.btnTarget.innerText = (this.btnTarget.innerText === this.textopenValue) ? this.textcloseValue : this.textopenValue;
  }
}
