


// app/javascript/controllers/match_controller.js
import { Controller } from "@hotwired/stimulus"
export default class extends Controller {
  static targets = ["address","name"]

  connect() {
    // block all the month except the current month
    const monthSelect = this.element.querySelector("#match_date_2i");
    const daySelect = this.element.querySelector("#match_date_3i");
    console.log(new Date().getDate())
    console.log(daySelect)
    const currentDate = new Date().getDate();
    if (daySelect) {
      for (let option of daySelect.options) {
        if (parseInt(option.value) <= currentDate) {
          option.disabled = true;
        }
      }
      daySelect.addEventListener("change", () => {
        const selectedDay = parseInt(daySelect.value);
        if (selectedDay <= currentDate) {
          // Rétablir la valeur au jour suivant si un jour passé est sélectionné
          daySelect.value = (currentDate + 1).toString();
        }
      });
    }
    // for month
    if (monthSelect) {
      const currentMonth = new Date().getMonth() + 1;

      for (let option of monthSelect.options) {
        const monthValue = parseInt(option.value);
        if (monthValue === currentMonth || monthValue === currentMonth + 1) {
          option.disabled = false;
        } else {
          option.disabled = true;
        }
      }
    }
    monthSelect.addEventListener("change",()=>{
      console.log(monthSelect.value);
      let current_month = new Date().getMonth() + 1;
      console.log(current_month)
      if(monthSelect.value == current_month){
        console.log("current month")
      }
      if(monthSelect.value == current_month + 1){
        console.log("next month")
      }
    })
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
