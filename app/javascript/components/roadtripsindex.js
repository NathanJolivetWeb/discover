const filterStatus = () => {
  const roadtrips = document.getElementById('card-roadtrip')
  if (roadtrips){
    const btnPending = document.querySelector('.btn-pending');
    const btnDone = document.querySelector('.btn-done');
    const btnMine = document.querySelector('.btn-mine')
    const btnAll = document.querySelector('.btn-all');
    const pendings = document.querySelectorAll('.pending');
    const finished = document.querySelectorAll('.finished');
    const owners = document.querySelectorAll('.owners');
    const cards = document.querySelectorAll('.card-product');
    const cardsOwner = document.querySelectorAll('.card-product-owner');

    const resetColor = () => {
      const btnPending = document.querySelector('.btn-pending');
      const btnDone = document.querySelector('.btn-done');
      const btnMine = document.querySelector('.btn-mine')
      const btnAll = document.querySelector('.btn-all');

      btnPending.style.backgroundColor = "#D6D6D6";
      btnDone.style.backgroundColor = "#D6D6D6";
      btnMine.style.backgroundColor = "#E4B85A";
      btnMine.style.opacity = 0.6;
      btnAll.style.backgroundColor = "#D6D6D6";
    }

    btnPending.addEventListener('click', () => {
      resetColor();
      btnPending.style.backgroundColor = "#84A98C";
      cardsOwner.forEach((cardOwner) => cardOwner.style.display = 'none')
      cards.forEach((card) => card.style.display = 'none');
      pendings.forEach((pending) => pending.style.display = 'flex');

    });

    btnDone.addEventListener('click', () => {
      resetColor();
      btnDone.style.backgroundColor = "#84A98C";
      cards.forEach((card) => card.style.display = 'none');
      cardsOwner.forEach((cardOwner) => cardOwner.style.display = 'none');
      finished.forEach((finish) => finish.style.display = 'flex');
    });

    btnMine.addEventListener('click', () => {
      resetColor();
      btnMine.style.backgroundColor = "#E4B85A";
      btnMine.style.opacity = 1;
      cards.forEach((card) => card.style.display = 'none')
      cardsOwner.forEach((cardOwner) => cardOwner.style.display = 'flex')
      owners.forEach((owner) => owner.style.display = 'flex')
    });

    btnAll.addEventListener('click', () => {
      resetColor();
      btnAll.style.backgroundColor = "#84A98C";
      cards.forEach((card) => card.style.display = 'flex');
      cardsOwner.forEach((cardOwner) => cardOwner.style.display = 'flex')
    });
   };
  }

export { filterStatus }
