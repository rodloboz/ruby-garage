import { Controller } from 'stimulus'

import { get } from '../services/api.service';

export default class extends Controller {
  static targets = [ 'container' ]

  async suggest(event) {
    const results = await get(`${this.url}?query=${event.target.value}`)
    const html = results.data
    this.containerTarget.innerHTML = html
  }

  async fetchResults(query) {
    const results = await get(`${this.url}?=${query}`)
    console.log(results.data)
    return results.data
  }

  get url() {
    return this.data.get('url');
  }
}
