import { fetchWithToken } from "../utils/fetch_with_token";

const createPartner = () => {
  const roadtripPartner = document.querySelector('.partners-roadtrip');

  if(roadtripPartner) {
    const newPartners = document.querySelectorAll(".partner-margin");
    const roadtripId = document.querySelector('.partners-roadtrip').dataset.roadtripId

    newPartners.forEach((partner) => {
      partner.addEventListener("click", (event) => {
        console.log(event)
        const target = event.currentTarget;
        const tick = event.currentTarget.nextElementSibling;
        event.preventDefault();

        if (target.classList.contains("avatar-partner")) {
          const partnerId = event.currentTarget.dataset.partnerId;
          console.log(event.currentTarget)
          const url = `/partners/${partnerId}`
          console.log('url', url)
          fetchWithToken(url, {
            method: "DELETE",
          })
            .then(response => response.json())
            .then((data) => {
              console.log(data)
              target.classList.add("avatar-no-partner")
              target.classList.remove("avatar-parter")
              tick.classList.add("avatar-no-partner-checked")
              tick.classList.remove("avatar-partner-checked")
            });
        }
        else {
          fetchWithToken(`/roadtrips/${roadtripId}/partners`, {
            method: "POST",
            headers: {
              "Accept": "application/json",
              "Content-Type": "application/json"
            },
            body: JSON.stringify({ partner: { user_id: event.currentTarget.dataset.userId } })
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

      });
    });
  };
}

export { createPartner };
