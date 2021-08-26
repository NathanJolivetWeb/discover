import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';

const initMapbox = () => {
  const mapbox = document.getElementById('map')
  if (mapbox) {
    mapboxgl.accessToken = mapbox.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v11',
      center: [2.2945, 48.8582],
      zoom: 5
    });
  };
};

export { initMapbox };
