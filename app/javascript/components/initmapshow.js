import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';


const initMapbox2 = () => {
  const maps2 = document.querySelectorAll('.map2');
  maps2.forEach((mapElt)=> {

    const fitMapToMarkers = (map2, markers2) => {
      if (markers2.length === 0) {
        return
      }
      const bounds = new mapboxgl.LngLatBounds();
      markers2.forEach(marker => bounds.extend([marker.lng, marker.lat]));
      map2.fitBounds(bounds, { padding: 70, maxZoom: 20, duration: 0 });
    };

    const mapbox = mapElt;
    mapboxgl.accessToken = mapbox.dataset.mapboxApiKey;
    const map2 = new mapboxgl.Map({
      container: mapElt.dataset.selector,
      style: 'mapbox://styles/mapbox/streets-v9',
      center: [2.398782, 47.081012],
      zoom: 5
    });

    const markers2 = JSON.parse(mapbox.dataset.markers);
    let steps = ``;
    markers2.forEach((marker) => {
      const step = [marker.lng, marker.lat]
      steps += `${step};`
      new mapboxgl.Marker({ "color": "#52796F" })
        .setLngLat([marker.lng, marker.lat])
        .addTo(map2);
    });

    if (steps.length > 21) {
      async function getRoute() {
        const query = await fetch(
          `https://api.mapbox.com/directions/v5/mapbox/driving/${steps.substring(0, steps.length - 1)}?steps=true&geometries=geojson&access_token=${mapboxgl.accessToken}`,
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
        if (map2.getSource('route')) {
          map2.getSource('route').setData(geojson);
        }
        else {
          map2.addLayer({
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
      map2.on('load', () => {
        getRoute();
        map2.resize();
        fitMapToMarkers(map2, markers2);
      });
    }
      map2.on('load', () => {
        getRoute();
        map2.resize();
        fitMapToMarkers(map2, markers2);
      });
    }

    fitMapToMarkers(map2, markers2);
  });
};

export { initMapbox2 };
