const modalMessagerie = () => {

  if (document.getElementById("myBtn") !== null) {
    let modal = document.getElementById("myModal");
    let btn = document.getElementById("myBtn");
    let span = document.getElementsByClassName("close")[0];
  
    btn.onclick = function () {
      modal.classList.remove("d-none");
    }

    span.onclick = function () {
      modal.classList.add("d-none");
    }

    window.onclick = function (event) {
      if (event.target == modal) {
        modal.classList.add("d-none");
      }
    };
  }
  
};

export { modalMessagerie };
