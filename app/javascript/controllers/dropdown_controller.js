import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = [ 'collapsible' ]

  toggle() {
    this.collapsibleTarget.classList.toggle('d-none');
  }

  hide(event) {
    if (this.element.contains(event.target) == false) {
      this.collapsibleTarget.classList.add('d-none');
    }
  }
}
