import flatpickr from "flatpickr";
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

const initFlatpickr = () => {
  const roadtripForm = document.getElementById('roadtrip-form-div');
  if (roadtripForm) {
    const roadtrips = JSON.parse(roadtripForm.dataset.roadtrips);
    flatpickr("#range_start", {
      plugins: [new rangePlugin({ input: "#range_end" })],
      minDate: "today",
      inline: true,
      dateFormat: "d-m-Y"
    })
  }
};

export { initFlatpickr };
