import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static values = { chatroomId: Number, currentUserId: Number }
  static targets = ["messages", "notif", "input", "btn"]

  resetForm(event) {
    // event.preventDefault();
    event.target.reset()
    this.btnTarget.setAttribute("disabled", "");
  }
  btnDisabled(event) {
    console.log(event.target.value);
    if (this.btnTarget.getAttribute("disabled") && event.target.value != "") {
      // console.log("yes");
      this.btnTarget.removeAttribute("disabled", "");
    } else if (!this.btnTarget.getAttribute
      ("disabled") && event.target.value === "") {
      this.btnTarget.setAttribute("disabled", "");
    } else {
      this.btnTarget.removeAttribute("disabled", "");
    }
  }

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      {
        received: (data) => {
          // console.log(data)
          this.#insertMessageAndScrollDown(data)
        }
      }
    )
    console.dir(this.channel)
    console.log(`Subscribe to the chatroom with the id ${this.chatroomIdValue}.`);
  }

  #insertMessageAndScrollDown(data) {
    const currentUserIsSender = this.currentUserIdValue === data.sender_id

    // if(!currentUserIsSender) {
    //   this.notifTarget.classList.remove("d-none")
    // }
    if ((!currentUserIsSender) && (document.location.pathname === `/chatrooms/${this.chatroomIdValue}`)) {
      fetch(`/chatrooms/${this.chatroomIdValue}`)
        .then(response => response.json())
        .then(data_fetch => { })
    } else if ((!currentUserIsSender) && !(document.location.pathname === `/chatrooms/${this.chatroomIdValue}`)) {

      this.notifTarget.classList.remove("d-none")
    }
    const messageElement = this.#buildMessageElement(currentUserIsSender, data.message_html)
    // console.log(messageElement)
    this.messagesTarget.insertAdjacentHTML("beforeend", messageElement)
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)

  }

  #buildMessageElement(currentUserIsSender, message) {
    return `
      <div class="message-row d-flex ${this.#justifyClass(currentUserIsSender)}">
        <div class="${this.#userStyleClass(currentUserIsSender)}">
          ${message}
        </div>
      </div>
    `
  }

  #justifyClass(currentUserIsSender) {
    return currentUserIsSender ? "justify-content-end" : "justify-content-start"
  }

  #userStyleClass(currentUserIsSender) {
    return currentUserIsSender ? "sender-style" : "receiver-style"
  }
}
