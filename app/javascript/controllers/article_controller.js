import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  confirmDelete(event) {
    event.preventDefault();

    const confirmed = confirm('Вы уверены, что хотите удалить эту статью?');
    if (confirmed) {
      this.element.form.requestSubmit();
    }
  }
}
