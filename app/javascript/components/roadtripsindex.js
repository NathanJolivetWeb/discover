
const filterStatus = () => {
  const card = document.getElementById('card-roadtrip');
  if(card) {
    const btnPending = document.querySelector('.btn-pending');
    const btnDone = document.querySelector('.btn-done');
    const btnAll = document.querySelector('.btn-all');
    const pending = document.querySelector('.pending');
    const finished = document.querySelector('.finished');
    const card = document.querySelector('.card-product');

    btnDone.addEventListener('click', () => {
       card.style.display = 'flex';
       pending.style.display = 'none';
     });

    btnPending.addEventListener('click', () => {
     card.style.display = 'none';
     pending.style.display = 'flex';
    });

    btnAll.addEventListener('click', () => {
     pending.style.display = 'flex';
     finished.style.display = 'flex';
    });
  };
}

export { filterStatus }
