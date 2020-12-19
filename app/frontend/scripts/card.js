document.addEventListener('turbolinks:load', () => {
  const btn = document.querySelector('.like_btn')
  if (btn) {
    btn.addEventListener("click", (e) => {
      e.preventDefault()
      const token = document.querySelector('meta[name=csrf-token]').content
      const cardId = e.currentTarget.dataset.cardId
      const icon = e.target

      const ax = require('axios');
      ax.defaults.headers.common['X-CSRF-TOKEN'] = token;

      ax.post(`/cards/${cardId}/like`)
        .then(function(resp) {
          if (resp.data.status == "0") {
            // 白
            icon.classList.remove('far')
            icon.classList.add('fas')
          } else {
            // 黑
            icon.classList.remove('fas')
            icon.classList.add('far')
          }
        })
        .catch(function(err) {
          console.log(err);
        })
    })
  }
})