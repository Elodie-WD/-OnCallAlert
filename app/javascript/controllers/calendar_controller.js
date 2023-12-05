import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="calendar"
export default class extends Controller {
  static targets = ["day", "astreinteLastName", "astreinteJobTitle", "degardeLastName", "degardeJobTitle"]

  getUsers(event) {
     const dateselection = event.currentTarget.innerText
     const url = `/get_doctors/${dateselection}`
     fetch(url, {headers: {"Accept": "application/json"}})
      .then(response => response.json())
      .then((data) => {
        this.astreinteLastNameTarget.innerText = data[0].last_name
        this.degardeLastNameTarget.innerText = data[1].last_name
    })
  };

    // On récupère la date sur laquelle on a cliqué
    // On utilise cette date pour interroger la base de donnée afin de retrouver le booking lié à cette date
    // Grâce à ce booking je récupère les deux users liés (true et false)
    // Je renvoie le prénom et le nom de ces deux users
    // J'insère dans le HTML ces 4 informations
}
