import { Controller } from 'stimulus'

import { get } from '../services/api.service';

export default class extends Controller {
  static targets = [ 'select' ]

  async load(event) {
    const { data } = await get(`/manufacturers/${event.target.value}/models`)
    this.renderOptions(data.options);
  }

  renderOptions(options) {
    const html = options.map(option => `<option value="${option[0]}">${option[1]}</option>`)
    this.selectTarget.innerHTML = html
    this.selectTarget.disabled = false
  }
}
