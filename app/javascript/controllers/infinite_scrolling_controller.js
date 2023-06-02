// app/javascript/controllers/load_more_controller.js
import { Controller } from "@hotwired/stimulus"
import { useIntersection } from "stimulus-use"
import { get } from "@rails/request.js"

// Connects to data-controller="load-more"
export default class extends Controller {
  static values = {
    listId: String,
    url: String
  }

  connect() {
    this.page = 1
    this.fetchingData = false
    useIntersection(this)
  }

  async appear () {
    if (this.fetchingData || this.hasNoMoreResultsItem) return
    this.fetchingData = true
    this.page = this.page + 1
    // console.log("load-more", this.page, this.listIdValue)

    await get(this.urlValue, {
      query: {
        page: this.page,
        turbo_target: this.listIdValue
      },
      responseKind: "turbo-stream"
    })

    this.fetchingData = false
  }

  get hasNoMoreResultsItem () {
    return document.getElementById(this.listIdValue).querySelector(`[data-no-more-results]`) != null
  }
}
