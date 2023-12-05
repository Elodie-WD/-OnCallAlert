import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="notification-subscription"
export default class extends Controller {
  // static values = { notificationId: Number }
  // static targets = ["modifications"]
  connect() {
    // this.channel = createConsumer().subscriptions.create(
    //   { channel: "NotificationChannel", id: this.notificationIdValue },
    //   { received: data => console.log(data) }
    // )
    // console.log(`Subscribed to the notification with the id ${this.notificationIdValue}.`)
  }
}
