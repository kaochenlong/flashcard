import { Controller } from "stimulus"
import Rails from "@rails/ujs"

export default class extends Controller {
  static targets = [ "thumb" ]

  like(e) {
    e.preventDefault()
    const cardId = this.data.get('cardId')

    Rails.ajax({
      url: `/cards/${cardId}/like`,
      type: 'post',
      success: (resp) => {
        if (resp.status == "0") {
          // 黑
          this.thumbTarget.classList.remove('fas')
          this.thumbTarget.classList.add('far')
        } else {
          // 白
          this.thumbTarget.classList.remove('far')
          this.thumbTarget.classList.add('fas')
        }
      },
      error: err => { console.log(err) }
    })
  }
}
