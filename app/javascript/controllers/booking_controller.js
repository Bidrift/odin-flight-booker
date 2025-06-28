import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = [ "template", "addButton", "removeButton", "buttonTemplate", "removeTemplate", "number", "nameLabel", "nameInput", "emailLabel", "emailInput" ]
    static values = { number: Number }

    connect() {
        this.showAddButton()
        const copyNumberValue = this.numberValue
        this.numberValue = 0
        for (let i = 0; i < copyNumberValue; i++) {
            this.addPassenger();
        }
    }

    addPassenger() {
        this.cloneForm()

        if (this.hasNumberValue) {
            this.numberValue++
            if (this.numberValue == 2) {
                this.showRemoveButton()
            }
            if (this.numberValue == 4) {
                this.hideAddButton()
            }
        }
    }

    showAddButton() {
        const buttonClone = this.cloneTemplate(this.buttonTemplateTarget)
        this.element.appendChild(buttonClone)
    }

    hideAddButton() {
        this.element.removeChild(this.addButtonTarget)
    }

    showRemoveButton() {
        const buttonClone = this.cloneTemplate(this.removeTemplateTarget)
        this.element.appendChild(buttonClone)
    }

    hideRemoveButton() {
        this.element.removeChild(this.removeButtonTarget)
    }

    cloneForm() {
        if (this.hasTemplateTarget) {
            const formTemplate = this.cloneTemplate(this.templateTarget)
            if (this.hasAddButtonTarget) {
                this.element.insertBefore(formTemplate,this.addButtonTarget)
            }
            if (this.hasNumberValue) this.setUpFormAttributes()

        }
    }

    cloneTemplate(temp) {
        return temp.content.cloneNode(true)
    }

    setUpFormAttributes() {
        const getLast = (a) => a[a.length-1]
        if (this.hasNumberTarget) {
            getLast(this.numberTargets).innerHTML = this.numberValue + 1
        }
        console.log(this.nameLabelTarget.getAttribute("for"))
        if (this.hasNameLabelTarget) {
            getLast(this.nameLabelTargets).setAttribute("for", `booking_passengers_attributes_${this.numberValue}_name`)
        }
        if (this.hasNameInputTarget) {
            getLast(this.nameInputTargets).setAttribute("id", `booking_passengers_attributes_${this.numberValue}_name`)
            getLast(this.nameInputTargets).setAttribute("name", `booking[passengers_attributes][${this.numberValue}][name]`)
        }
        if (this.hasEmailLabelTarget) {
            getLast(this.emailLabelTargets).setAttribute("for", `booking_passengers_attributes_${this.numberValue}_email`)
        }
        if (this.hasEmailInputTarget) {
            getLast(this.emailInputTargets).setAttribute("id", `booking_passengers_attributes_${this.numberValue}_email`)
            getLast(this.emailInputTargets).setAttribute("name", `booking[passengers_attributes][${this.numberValue}][email]`)
        }
    }

    getLast(obj) {
        obj
    }
}