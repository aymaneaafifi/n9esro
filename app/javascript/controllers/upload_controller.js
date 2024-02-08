import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="upload"
export default class extends Controller {
  static targets = ["circle"];
  connect() {
    this.circleTarget.style.backgroundImage = "";
  }

  handleFileChange(event) {
    const file = event.target.files[0];
    if (file) {
      const reader = new FileReader();
      reader.onload = (e) => {
        const imageUrl = e.target.result;
        this.circleTarget.style.backgroundImage = `url('${imageUrl}')`;
      };
      reader.readAsDataURL(file);
    }
  }
}
