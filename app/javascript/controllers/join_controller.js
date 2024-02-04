import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="join"
export default class extends Controller {
  connect() {
    console.log("Hello, Stimulus!")
  }
  join(event) {
    event.preventDefault();
    let currentUserName = "<%= current_user.name %>";
    let playerAvatar = event.target.parentElement.querySelector("img").getAttribute("src");

    this.element.querySelector(".selected-player").textContent = playerName;
    this.element.querySelector(".selected-avatar").setAttribute("src", playerAvatar);

    event.target.textContent = "Cancel";
    this.hideOtherJoinButtons(event.target.parentElement);
  }

  hideOtherJoinButtons(currentButtonParent) {
    let otherJoinButtons = Array.from(this.element.querySelectorAll("[data-action='click->join#join']"));
    otherJoinButtons.forEach(button => {
      if (button.parentElement !== currentButtonParent) {
        button.style.display = "none";
      }
    });
  }
}
