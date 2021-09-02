import consumer from "./consumer";

const initRoadtripCable = () => {
  const messagesContainer = document.getElementById('messages');
  if (messagesContainer) {
    const id = messagesContainer.dataset.chatroomId;
    const currentUserId = parseInt(document.querySelector('#myModal').dataset.currentUserId);

    consumer.subscriptions.create({ channel: "RoadtripChannel", id: id }, {
      received(data) {
        if (data.sender_id !== currentUserId) {
          messagesContainer.insertAdjacentHTML('beforeend', data.message);
        }
      }
    });
  }
}

export { initRoadtripCable };