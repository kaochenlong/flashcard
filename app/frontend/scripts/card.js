// document.addEventListener('turbolinks:load', () => {
//   const btn = document.querySelector('.like_btn')
//   if (btn) {
//     btn.addEventListener("click", (e) => {
//       e.preventDefault()

//       const cardId = e.currentTarget.dataset.cardId
//       const icon = e.target

//       const Rx = require("@rails/ujs")
//       Rx.ajax({
//         url: `/cards/${cardId}/like`,
//         type: 'post',
//         success: function(resp) {
//           if (resp.status == "0") {
//             // 黑
//             icon.classList.remove('fas')
//             icon.classList.add('far')
//           } else {
//             // 白
//             icon.classList.remove('far')
//             icon.classList.add('fas')
//           }
//         },
//         error: err => { console.log(err) }
//       })
//     })
//   }
// })