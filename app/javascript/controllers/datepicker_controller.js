



// app/javascript/controllers/datepicker_controller.js

import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"; // You need to import this to use new flatpickr()

export default class extends Controller {
  connect() {
    flatpickr(this.element,{
      enableTime: true,
      minuteIncrement: 60,
      minDate: "today", // Minimum date is today
      maxDate: new Date().fp_incr(60),
    })

  }
}
