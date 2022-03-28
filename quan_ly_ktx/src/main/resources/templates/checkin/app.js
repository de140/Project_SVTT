var btnCheckin = document.querySelector('.popup')
var modal = document.querySelector('.modal')
var iconClose = document.querySelector('.modal_header i')
var btnClose = document.querySelector('.left-button')
var btnPurchase = document.querySelector('.right-button')

function toogleModal(e){
    modal.classList.toggle('hide')
}
modal.addEventListener('click', function (e) {
    if (e.target == e.currentTarget){
        toogleModal()
    }
})
btnCheckin.addEventListener('click', toogleModal)
btnClose.addEventListener('click', toogleModal)
iconClose.addEventListener('click', toogleModal)