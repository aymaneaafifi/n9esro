import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="users"
export default class extends Controller {
  static targets = ["content1","content"]
  connect() {
    console.log(this.contentTarget)
    console.log(this.content1Target)
  }
  toggle() {
    this.content1Target.classList.remove("hidden");
    this.contentTarget.classList.add("hidden");
  }

  toggle1() {
    this.contentTarget.classList.remove("hidden");
    this.content1Target.classList.add("hidden");
  }
}
