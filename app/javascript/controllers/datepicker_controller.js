import Flatpickr from 'stimulus-flatpickr';

// create a new Stimulus controller by extending stimulus-flatpickr wrapper controller
export default class extends Flatpickr {
  static targets = ['append']

  connect() {
    // define locale and global flatpickr settings for all datepickers
    this.config = {
      altInput: true,
      altFormat: 'd-m-Y',
      showMonths: 2
    };

    // if (this.hasAppendTarget) {
    //   this.config.appendTo = this.appendTarget
    // }

    super.connect();
  }
}
