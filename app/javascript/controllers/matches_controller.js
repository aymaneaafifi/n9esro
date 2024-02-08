


// app/javascript/controllers/match_controller.js
import { Controller } from "@hotwired/stimulus"
export default class extends Controller {

  static targets = ["address","name"]
  connect() {

  }

  loadTerrainNames() {
    const selectedAddress = this.addressTarget.value;

    fetch(`/terrains/find_terrain_by_address?address=${selectedAddress}`)
      .then(response => response.json())
      .then(data => {
        this.updateTerrainDropdown(data.terrain_names);
      })
      .catch(error => console.error("Error fetching terrain names:", error));
  }
  updateTerrainDropdown(terrainsNames) {
    this.nameTarget.innerHTML = "";
    terrainsNames.forEach(name => {
      const option = document.createElement("option");
      option.value = name;
      option.text = name;
      this.nameTarget.appendChild(option);
    });
  }


}
