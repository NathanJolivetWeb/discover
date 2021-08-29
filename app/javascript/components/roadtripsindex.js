const filterStatus = () => {
 var btnPending = document.querySelector('.btn-pending');
 var btnDone = document.querySelector('.btn-done');
 var btnAll = document.querySelector('.btn-all');
 var pending = document.querySelector('.pending');
 var done = document.querySelector('.finished');
 var card = document.querySelector('.card-product');

 btnPending.addEventListener('click', () => {
  card.style.display = 'none';
  pending.style.display = 'flex';
 });

 btnDone.addEventListener('click', () => {
  card.style.display = 'none';
  done.style.display = 'flex';
 });

 btnAll.addEventListener('click', () => {
  card.style.display = 'flex';
 });
}

export { filterStatus };
