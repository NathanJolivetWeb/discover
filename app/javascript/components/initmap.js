import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';
import { fetchWithToken } from "../utils/fetch_with_token";

const initMapbox = () => {
  const map = document.getElementById('map');
  if (map) {

    const fitMapToMarkers = (map, markers) => {
      if (markers.length === 0) {
        return
      }
      const bounds = new mapboxgl.LngLatBounds();
      markers.forEach(marker => bounds.extend([marker.lng, marker.lat]));
      map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
    };

    const mapbox = document.getElementById('map')
    mapboxgl.accessToken = mapbox.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v9',
      center: [2.398782, 47.081012],
      zoom: 5
    });

    const markers = JSON.parse(mapbox.dataset.markers);
    let steps = ``;
    markers.forEach((marker) => {
      const step = [marker.lng, marker.lat]
      steps += `${step};`
      new mapboxgl.Marker({ "color": "#52796F" })
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

        const distanceDisplay = document.getElementById('distance');
        const distance = Math.round(data.distance/1000);
        distanceDisplay.innerHTML = `<strong class='strong-show'>${distance}</strong> Kms`;
        distanceDisplay.dataset.distance = distance;

        const durationDisplay = document.getElementById('duration');
        const duration = Math.round(data.duration/3600);
        durationDisplay.innerHTML = `<strong class='strong-show'>${duration}</strong> Hrs `;
        durationDisplay.dataset.duration = duration;

        const url = window.location.pathname
        fetchWithToken(url, {
          method: "PATCH",
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/json"
          },
          body: JSON.stringify({ itinerary: { distance: distance, duration: duration } })
        })

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
              'line-color': '#84A98C',
              'line-width': 5,
              'line-opacity': 1
            }
          });
        }
      }
      map.on('load', () => {
        getRoute();
        map.resize();
        fitMapToMarkers(map, markers);
      });
    }

    else {
      const url = window.location.pathname
      fetchWithToken(url, {
        method: "PATCH",
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json"
        },
        body: JSON.stringify({ itinerary: { distance: 0, duration: 0 } })
      })
      map.on('load', () => {
        map.resize();
        fitMapToMarkers(map, markers);
      });
    }

    fitMapToMarkers(map, markers);
  };
};

export { initMapbox };
