import { fetchWithToken } from "../utils/fetch_with_token";

const newRestaurantForm = document.querySelector("#new_restaurant");
const restaurantNameInput = document.querySelector("#restaurant_name");

newRestaurantForm.addEventListener("submit", (event) => {
  event.preventDefault();

  fetchWithToken("/restaurants", {
    method: "POST",
    headers: {
      "Accept": "application/json",
      "Content-Type": "application/json"
    },
    body: JSON.stringify({ restaurant: { name: restaurantNameInput.value } })
  })
    .then(response => response.json())
    .then((data) => {
      // handle JSON response from server
    });
});
