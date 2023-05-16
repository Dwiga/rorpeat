import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["message", "id", "name"];
  connect() {
    console.log("Hi, Hello");
  }

  async send_message() {
    const csrfToken = document.querySelector("[name='csrf-token']").content;
    const message = this.messageTarget.value;
    const bookId = this.idTarget.value;
    const name = this.nameTarget.value;

    if (message){
      await fetch("/comments/", {
        method: "POST",
        cache: "no-cache",
        credentials: "same-origin",
        headers: {
          "Content-Type": "application/json",
          "X-CSRF-TOKEN": csrfToken
        },
        body: JSON.stringify({
          message: message,
          reference_id: bookId,
          name: name,
          type: "Book"
        })
      })
    } else {
      console.log("Empty string!")
    }
  }
}