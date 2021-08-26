import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';
const searchMapbox = () => {

  const mapbox = document.getElementById('map')
  const token = mapbox.dataset.mapboxApiKey;

  const search = (event) => {
    const text = document.querySelector('.form-inline input').value;
    const baseUrl = `https://api.mapbox.com/geocoding/v5/mapbox.places/${text}.json?access_token=${token}`;
    event.preventDefault();
    fetch(baseUrl)
      .then(response => response.json())
      .then((data) => {
        const coordinates = data.features[0].geometry.coordinates;
        const x = coordinates[0];
        const y = coordinates[1];
        console.log(x, y);
        mapboxgl.accessToken = token;
        const map = new mapboxgl.Map({
          container: 'map',
          style: 'mapbox://styles/mapbox/streets-v11',
          center: [x, y],
          zoom: 10
        });
        new mapboxgl.Marker()
          .setLngLat([x, y])
          .addTo(map);
      });
  };

  const submit = document.querySelector('.form-inline .btn-primary');
  submit.addEventListener("click", search);
};

export { searchMapbox };
