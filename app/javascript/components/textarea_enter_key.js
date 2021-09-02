function submitOnEnter(event){
  if(event.key === "Enter"){
      event.preventDefault(); // Prevents the addition of a new line in the text field (not needed in a lot of cases)
      event.target.form.submit();
  }
}

const textareaEnterKey = () => {

  if (document.getElementById("message_content") !== null ) {
    document.getElementById("message_content").addEventListener("keypress", submitOnEnter);
  }

};

export { textareaEnterKey };