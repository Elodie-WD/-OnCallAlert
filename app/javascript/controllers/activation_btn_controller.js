import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="activation-btn"
export default class extends Controller {
  static targets = ["link"]

  update(event) {
    event.preventDefault();
    const form = event.currentTarget.closest('form')

    fetch(form.action, {
      method: "GET" // Could be dynamic with Stimulus values
    })
    .then(response => {
      event.target.classList.add("d-none");
      this.linkTarget.classList.remove("d-none");
      // event.currentTarget.addAttribute("disabled");
    })
  }

}
// @contact = User.find(params[:id])
// @contact.update(deplacement: params[:deplacement].to_i)
// redirect_to contact_path if @contact.called?
