import { fetchWithToken } from "../utils/fetch_with_token";
import { csrfToken } from "@rails/ujs";

const createPartner = () => {
  const roadtripPartner = document.querySelector('.partners-roadtrip');

  if(roadtripPartner) {
    const newPartners = document.querySelectorAll(".partner-margin");

    newPartners.forEach((partner) => {
      partner.addEventListener("click", (event) => {
        event.preventDefault();

        const target = event.currentTarget;
        const shouldDelete = target.dataset.partnerId

        if (shouldDelete) {
          deletePartner(event.currentTarget)
        }
        else {
          createNewPartner(event.currentTarget)
        }
      });
    });
  };
}

const deletePartner = (target) => {
  const partnerId = target.dataset.partnerId;
  const url = `/partners/${partnerId}`
  const tick = target.nextElementSibling;

  fetch(url, {
    headers: {
      "X-CSRF-Token": csrfToken(),
    },
    method: "DELETE"
  })
    .then(response => response.json())
    .then((data) => {
      console.log(data)
      target.classList.add("avatar-no-partner")
      target.classList.remove("avatar-parter")
      tick.classList.add("avatar-no-partner-checked")
      tick.classList.remove("avatar-partner-checked")
      target.dataset.partnerId = ""
    });
}

const createNewPartner = (target) => {
  const roadtripId = document.querySelector('.partners-roadtrip').dataset.roadtripId
  const tick = target.nextElementSibling;

  const url = `/roadtrips/${roadtripId}/partners`;

  fetch(url, {
    method: "POST",
    headers: {
      "Accept": "application/json",
      "X-CSRF-Token": csrfToken(),
      "Content-Type": "application/json"
    },
    body: JSON.stringify({ partner: { user_id: target.dataset.userId } })
  })
    .then(response => response.json())
    .then((data) => {
      target.classList.add("avatar-partner")
      target.classList.remove("avatar-no-partner")
      tick.classList.add("avatar-partner-checked")
      tick.classList.remove("avatar-no-partner-checked")
      target.dataset.partnerId = data.partner
    });
}

export { createPartner };
