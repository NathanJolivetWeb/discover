import { fetchWithToken } from "../utils/fetch_with_token";

const createPartner = () => {
  const roadtripPartner = document.querySelector('.partners-roadtrip');

  if(roadtripPartner) {
    const newPartners = document.querySelectorAll(".avatar-bordered");
    const roadtripId = document.querySelector('.partners-roadtrip').dataset.roadtripId
    newPartners.forEach((partner) => {
      partner.addEventListener("click", (event) => {
        const userId = event.currentTarget.dataset.userId
        const target = event.currentTarget
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
          });
      });
    });
  };
}

export { createPartner };
