import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('step_address');
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAutocomplete };
