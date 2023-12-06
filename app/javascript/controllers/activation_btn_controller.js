import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="activation-btn"
export default class extends Controller {
  static targets = ["link", "button"]

  update(event) {
    event.preventDefault();
    const form = event.currentTarget.closest('form')

    fetch(form.action, {
      method: "GET" // Could be dynamic with Stimulus values
    })
    .then(response => {
      event.target.classList.add("d-none");
      this.linkTarget.classList.remove("d-none");
      console.log(this.buttonTarget);
      // event.currentTarget.addAttribute("disabled");
      this.buttonTarget.innerText ="Rappel?";
      this.buttonTarget.classList.remove("big-btn-alarm");
      this.buttonTarget.classList.add("big-btn-green");

  })
  }
}
// @contact = User.find(params[:id])
// @contact.update(deplacement: params[:deplacement].to_i)
// redirect_to contact_path if @contact.called?
