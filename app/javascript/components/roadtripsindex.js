const filterStatus = () => {
  const roadtrips = document.getElementById('card-roadtrip')
  if (roadtrips){
    const btnPending = document.querySelector('.btn-pending');
    const btnDone = document.querySelector('.btn-done');
    const btnAll = document.querySelector('.btn-all');
    const pendings = document.querySelectorAll('.pending');
    const finisheds = document.querySelectorAll('.finished');
    const cards = document.querySelectorAll('.card-product');

    btnPending.addEventListener('click', () => {
     cards.forEach((card) => card.style.display = 'none');
     pendings.forEach((pending) => pending.style.display = 'flex');
    });

    btnDone.addEventListener('click', () => {
      cards.forEach((card) => card.style.display = 'none');
      finisheds.forEach((finished) => finished.style.display = 'flex');
    });

    btnAll.addEventListener('click', () => {
      cards.forEach((card) => card.style.display = 'flex');
    });
   };
  }

export { filterStatus }
