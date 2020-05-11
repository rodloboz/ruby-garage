import noUiSlider from 'nouislider';

import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = [ 'container', 'min', 'max' ]

  connect() {
    this.slider = noUiSlider.create(this.containerTarget, {
      start: this.startValues,
      connect: true,
      range: {
        'min': 0,
        'max': 50000
      },
      step: 500,
      format: {
        to: value => value.toString().split('.')[0],
        from: value => Number(value.replace(',-', ''))
      }
    })

    this.slider.on('slide', this.updateInputs.bind(this));
  }

  updateInputs(values) {
    const [min, max] = values
    this.minTarget.value = min
    this.maxTarget.value = max
  }

  get startValues() {
    return this.data.has('startValues')
      ? JSON.parse(this.data.get('startValues'))
      : []
  }
}