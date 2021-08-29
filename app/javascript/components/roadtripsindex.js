const filterStatus = () => {
  const map = document.getElementById('card-roadtrip')
  if (map){
    const btnPending = document.querySelector('.btn-pending');
    const btnDone = document.querySelector('.btn-done');
    const btnAll = document.querySelector('.btn-all');
    const pending = document.querySelector('.pending');
    const done = document.querySelector('.finished');
    const card = document.querySelector('.card-product');

    btnPending.addEventListener('click', () => {
     card.style.display = 'none';
     pending.style.display = 'flex';
    });

    btnDone.addEventListener('click', () => {
     card.style.display = 'flex';
     pending.style.display = 'none';
    });

    btnAll.addEventListener('click', () => {
     card.style.display = 'flex';
    });
   };
  }

export { filterStatus }
