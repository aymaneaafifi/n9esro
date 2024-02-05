import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["joinLink", "submit"]

  static values = { id: String, team1: String, team2: String};

  connect() {
  }

  toggleJoin(event) {
    event.preventDefault();

    const joinLink = event.currentTarget;

    const position = joinLink.dataset.position;
    let teamPrefix;
    if (joinLink.dataset.team === "team1") {
      teamPrefix = "team1";
      this.submitTarget.innerHTML = `<form action="/user_team" method="post"><input type="hidden" name="user_id" value="${this.idValue}" /><input type="hidden" name="position" value="${position}" /><input type="hidden" name="team_id" value="${this.team1Value}"/><input type="submit" id="submitButton" class= "green-link"/></form>`;
    } else if (joinLink.dataset.team === "team2") {
      teamPrefix = "team2";
      this.submitTarget.innerHTML = `<form action="/user_team" method="post"><input type="hidden" name="user_id" value="${this.idValue}" /><input type="hidden" name="position" value="${position}" /><input type="hidden" name="team_id" value="${this.team2Value}"/><input type="submit" id="submitButton" class= "green-link"/></form>`;
    }

    const pTag = this.element.querySelector(`[data-${position.toLowerCase()}-target="${teamPrefix}-${position.toLowerCase()}"]`);
    if (joinLink.innerText === "Join") {
      joinLink.innerText = "Cancel";
      joinLink.style.color = "yellow";
      pTag.innerText = currentUserFirstName;
    } else {
      joinLink.innerText = "Join";
      joinLink.style.color = "";
      pTag.innerText = "";
      document.getElementById("submitButton").style.display = "none";
    }

    this.joinLinkTargets.forEach(link => {
      if (link !== joinLink) {
        link.hidden = !link.hidden;
      }
    });
  }

}
