import Flatpickr from 'stimulus-flatpickr';

// create a new Stimulus controller by extending stimulus-flatpickr wrapper controller
export default class extends Flatpickr {
  connect() {
    // define locale and global flatpickr settings for all datepickers
    this.config = {
      altInput: true,
      altFormat: 'd-m-Y',
      showMonths: 2
    };

    super.connect();
  }
}
