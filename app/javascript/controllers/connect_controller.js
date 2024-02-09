import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"


// Connects to data-controller="connect"
export default class extends Controller {
  connect() {
    const point1 = document.getElementById("point1")
    const userid = document.getElementById("userid")

    createConsumer().subscriptions.create(
      { channel: "OnlineChannel" },
      {
        received: data => {
          if (userid)
            if (JSON.parse(data).includes(+userid.innerHTML)) {
              point1.classList.remove("offline")
              point1.classList.add("online")
            } else {
              point1.classList.remove("online")
              point1.classList.add("offline")
            }
        }
      }
    )
    console.log(`Subscribed to the chatroom with the id `)

  }

}
