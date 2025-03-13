import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    initialize() {
        console.log("It's initialized.")
    }
    connect() {
        console.log("It's connected.")
    }
    toggleForm(event) {
        console.log("I clicked the edit button")
        event.preventDefault();
        event.stopPropagation();

        const formID = event.params["form"];
        const commentBodyID = event.params["body"];
        const editButtonID = event.params["edit"];

        const form = document.getElementById(formID);
        const commentBody = document.getElementById(commentBodyID);
        const editButton = document.getElementById(editButtonID);

        form.classList.toggle("hidden");
        commentBody.classList.toggle("hidden");
        this.toggleEditButton(editButton);
    }

    toggleEditButton(editButton) {
        if (editButton.innerText === "Edit") {
            editButton.innerText = "Cancel";
        } else {
            editButton.innerText = "Edit";
        }
    }
}
