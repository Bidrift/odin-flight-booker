import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = [ "new", "form" ]

    connect() {
        this.cloneNewTarget()
    }

    showForm(event) {
        this.cloneFormTarget()
        this.element.removeChild(event.target.parentElement)
    }

    hideForm(event) {
        this.cloneNewTarget()
        this.element.removeChild(event.target.parentElement)
    }

    submitForm(event) {
        this.cloneNewTarget()
        this.element.removeChild(event.target.parentElement.parentElement)
    }

    cloneNewTarget() {
        const newClone = this.newTarget.content.cloneNode(true)
        this.element.appendChild(newClone)
    }

    cloneFormTarget() {
        const newClone = this.formTarget.content.cloneNode(true)
        this.element.appendChild(newClone)
    }
}
