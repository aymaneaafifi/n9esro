import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["signUpArea", "signInArea", "signUpImage", "signInImage"];

  connect() {
    console.log("Hello, Stimulus!");
  }
  toggleSignup(event) {
    event.preventDefault();
    this.signUpAreaTarget.classList.toggle("d-none");
    this.signUpImageTarget.classList.toggle("d-none");
    this.signInAreaTarget.classList.toggle("d-none");
    this.signInImageTarget.classList.toggle("d-none");
  }
}
