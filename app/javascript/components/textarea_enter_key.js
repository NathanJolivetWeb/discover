const textareaEnterKey = () => {

  if (document.getElementById("message_content") !== null ) {
    function submitOnEnter(event){
      if(event.key === "Enter"){
          event.preventDefault(); // Prevents the addition of a new line in the text field (not needed in a lot of cases)
          console.log(event.target.form.dispatchEvent(new Event("submit", {cancelable: true})));
      }
    }

    document.getElementById("message_content").addEventListener("keypress", submitOnEnter);
  }

};

export { textareaEnterKey };