import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="passenger-form"
export default class extends Controller {
  static targets = ["passenger"];
  connect() {}

  removePassenger() {
    let currentParent = this.passengerTarget.parentNode;
    if (currentParent.childElementCount > 1) {
      currentParent.removeChild(this.passengerTarget);
    }
  }

  addPassenger() {
    let currentForm = document.getElementsByClassName(
      "passenger-form-special"
    )[0];
    let clone = currentForm.cloneNode(true);
    currentForm.parentNode.appendChild(clone);
  }
}
