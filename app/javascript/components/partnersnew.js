import { fetchWithToken } from "../utils/fetch_with_token";

const createPartner = () => {
  const roadtripPartner = document.querySelector('.partners-roadtrip');

  if(roadtripPartner) {
    const newPartners = document.querySelectorAll(".partner-margin");
    const roadtripId = document.querySelector('.partners-roadtrip').dataset.roadtripId
    newPartners.forEach((partner) => {
      partner.addEventListener("click", (event) => {
        const userId = event.currentTarget.dataset.userId
        const target = event.currentTarget
        const tick = event.currentTarget.nextElementSibling.querySelector(".fa-check")
        event.preventDefault();
        console.log(userId);
        fetchWithToken(`/roadtrips/${roadtripId}/partners`, {
          method: "POST",
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/json"
          },
          body: JSON.stringify({ partner: {user_id: event.currentTarget.dataset.userId} })
        })
          .then(response => response.json())
          .then((data) => {
            target.classList.add("avatar-partner")
            target.classList.remove("avatar-no-partner")
            tick.classList.add("avatar-partner-checked")
            tick.classList.remove("avatar-no-partner-checked")
          });
      });
    });
  };
}

export { createPartner };
