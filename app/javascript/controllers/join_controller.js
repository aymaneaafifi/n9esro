import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["joinLink", "button"];

  toggleJoin(event) {
    event.preventDefault();

    const joinLink = event.currentTarget;

    const position = joinLink.dataset.position;
    let teamPrefix;
    if (joinLink.dataset.team === "team1") {
      teamPrefix = "team1";
    } else if (joinLink.dataset.team === "team2") {
      teamPrefix = "team2";
    }

    const pTag = this.element.querySelector(`[data-${position.toLowerCase()}-target="${teamPrefix}-${position.toLowerCase()}"]`);
    if (joinLink.innerText === "Join") {
      joinLink.innerText = "Cancel";
      joinLink.style.color = "yellow";
      pTag.innerText = currentUserFirstName;
      this.buttonTarget.classList.remove("d-none");
    } else {
      joinLink.innerText = "Join";
      joinLink.style.color = "";
      pTag.innerText = "";
      this.buttonTarget.classList.add("d-none");
    }

    this.joinLinkTargets.forEach(link => {
      if (link !== joinLink) {
        link.hidden = !link.hidden;
      }
    });
  }

  

}
