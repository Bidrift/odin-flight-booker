import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = [ "new", "form" ]
    static values = { number: Number }

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
        this.numberValue++
        this.cloneNewTarget()
        this.element.removeChild(event.target.parentElement.parentElement)
    }

    cloneNewTarget() {
        if (this.hasNumberValue && this.numberValue < 4) {
            const newClone = this.newTarget.content.cloneNode(true)
            this.element.appendChild(newClone)
        }
    }

    cloneFormTarget() {
        const newClone = this.formTarget.content.cloneNode(true)
        this.element.appendChild(newClone)
    }
}
