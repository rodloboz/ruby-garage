import { Controller } from 'stimulus'

import { get } from '../services/api.service';

export default class extends Controller {
  static targets = [ 'container' ]

  async suggest(event) {
    const results = await get(`${this.url}?query=${event.target.value}`)
    const html = results.data
    this.containerTarget.innerHTML = html
  }

  get url() {
    return this.data.get('url');
  }
}
