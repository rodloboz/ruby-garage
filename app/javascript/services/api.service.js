import axios from 'axios';
import Rails from '@rails/ujs';

export const get = url =>
  axios.get(url, {
    headers: { 'X-CSRF-Token': Rails.csrfToken() },
    withCredentials: true
  });