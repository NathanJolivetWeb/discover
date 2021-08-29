import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([marker.lng, marker.lat]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
};

const map = document.getElementById('map');

const initMapbox = () => {
  if (map) {

    const mapbox = document.getElementById('map')
    mapboxgl.accessToken = mapbox.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10',
      center: [2.398782, 47.081012],
      zoom: 5
    });

    const markers = JSON.parse(mapbox.dataset.markers);
    let steps = ``;
    markers.forEach((marker) => {
      const step = [marker.lng, marker.lat]
      steps += `${step};`
      new mapboxgl.Marker()
        .setLngLat([marker.lng, marker.lat])
        .addTo(map);
    });

    if (steps.length > 21) {
      async function getRoute() {
        const query = await fetch(
          `https://api.mapbox.com/directions/v5/mapbox/driving/${steps.substring(0,steps.length-1)}?steps=true&geometries=geojson&access_token=${mapboxgl.accessToken}`,
          { method: 'GET' }
        );
        const json = await query.json();
        const data = json.routes[0];
        const route = data.geometry.coordinates;
        const geojson = {
          type: 'Feature',
          properties: {},
          geometry: {
            type: 'LineString',
            coordinates: route
          }
        };
        if (map.getSource('route')) {
          map.getSource('route').setData(geojson);
        }
        else {
          map.addLayer({
            id: 'route',
            type: 'line',
            source: {
              type: 'geojson',
              data: geojson
            },
            layout: {
              'line-join': 'round',
              'line-cap': 'round'
            },
            paint: {
              'line-color': '#3887be',
              'line-width': 5,
              'line-opacity': 0.75
            }
          });
        }
      }

      map.on('load', () => {
        getRoute();
      });

      fitMapToMarkers(map, markers);
    };
  };
};

export { initMapbox };
