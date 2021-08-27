import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';

const initMapbox = () => {
  const mapbox = document.getElementById('map')
  mapboxgl.accessToken = mapbox.dataset.mapboxApiKey;
  const map = new mapboxgl.Map({
    container: 'map', // container id
    style: 'mapbox://styles/mapbox/streets-v11', // stylesheet location
    center: [3.0575, 50.63194], // starting position
    zoom: 12
  });
};

export { initMapbox };
