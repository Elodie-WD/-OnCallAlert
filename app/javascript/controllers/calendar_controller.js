import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="calendar"
export default class extends Controller {
  static targets = ["day", "astreinteLastName", "astreinteFirstName", "degardeLastName", "degardeFirstName"]

  getUsers(event) {
     const dateselection = event.currentTarget.dataset.date
     document.querySelectorAll(".simple-calendar td").forEach((td) => {
      td.classList.remove("today")
    })
     event.currentTarget.parentElement.classList.add("today")
     const url = `/get_doctors/${dateselection}`
     fetch(url, {headers: {"Accept": "application/json"}})
      .then(response => response.json())
      .then((data) => {
        console.log(data);
        this.astreinteLastNameTarget.innerText = data[0].last_name
        this.astreinteFirstNameTarget.innerText = data[2].first_name
        this.degardeLastNameTarget.innerText = data[1].last_name
        this.degardeFirstNameTarget.innerText = data[3].first_name
    })
  };

    // On récupère la date sur laquelle on a cliqué
    // On utilise cette date pour interroger la base de donnée afin de retrouver le booking lié à cette date
    // Grâce à ce booking je récupère les deux users liés (true et false)
    // Je renvoie le prénom et le nom de ces deux users
    // J'insère dans le HTML ces 4 informations
}
