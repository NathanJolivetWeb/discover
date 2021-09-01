const deletepartner = () => {
  const deletepartners = document.getElementById('delete_partners')
  if (deletepartners) {
    const partners = document.querySelectorAll('.tag-trash');
    partners.addEventListener("mouseover", (event) => {
      event.target.style.display = 'flex'
    });
  };
}

export { deletepartner }
