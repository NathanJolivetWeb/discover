const textareaEnterKey = () => {

  if (document.getElementById("message_content") !== null ) {
    function submitOnEnter(event){
      if(event.which === 13){
          event.target.form.dispatchEvent(new Event("submit", {cancelable: true}));
          event.preventDefault(); // Prevents the addition of a new line in the text field (not needed in a lot of cases)
      }
    }

    document.getElementById("message_content").addEventListener("keypress", submitOnEnter);
  }

};

export { textareaEnterKey };