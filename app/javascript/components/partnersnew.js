import { fetchWithToken } from "../utils/fetch_with_token";

const createPartner = () => {
  const roadtripPartner = document.querySelector('partners-roadtrip');
  if(roadtripPartner) {
    const newPartnerForm = document.getElementById("new_partner");
    const partnerUsername = document.getElementById("partner_username");

    newPartnerForm.addEventListener("submit", (event) => {
      event.preventDefault();

      fetchWithToken("/roadtrips/:id/partners/new", {
        method: "POST",
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json"
        },
        body: JSON.stringify({ partners: { username: partnerUsername.value } })
      })
        .then(response => response.json())
        .then((data) => {
          console.log(data);
        });
    });
  };
}

export { createPartner };
