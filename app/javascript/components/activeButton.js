const activeButton = () => {
  // Get the container element
  let buttonContainer = document.querySelector(".roadtrips-room");

  // Get all buttons with class="btn" inside the container
  let buttons = buttonContainer.querySelectorAll(".roadtrip-button");
  
  // Loop through the buttons and add the active class to the current/clicked button
  for (let i = 0; i < buttons.length; i++) {
    buttons[i].addEventListener("click", function() {
      var current = document.getElementsByClassName("active-button");

      // If there's no active class
      if (current.length > 0) {
        current[0].className = current[0].className.replace(" active-button", "");
      }

      // Add the active class to the current/clicked button
      this.className += " active-button";
    });
  } 
};

export { activeButton };