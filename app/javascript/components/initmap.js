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


  // an arbitrary start will always be the same
  // only the end or destination will change
  const start = [3.0575, 50.63194];

  // create a function to make a directions request
  async function getRoute(end) {
    // make directions request using cycling profile
    const query = await fetch(
      `https://api.mapbox.com/directions/v5/mapbox/driving/${start[0]},${start[1]};${end[0]},${end[1]}?steps=true&geometries=geojson&access_token=${mapboxgl.accessToken}`,
      { method: 'GET' }
    );
    const json = await query.json();
    const data = json.routes[0];
    const route = data.geometry.coordinates;
    const geojson = {
      'type': 'Feature',
      'properties': {},
      'geometry': {
        'type': 'LineString',
        'coordinates': route
      }
    };
    // if the route already exists on the map, we'll reset it using setData
    if (map.getSource('route')) {
      map.getSource('route').setData(geojson);
    }
    // otherwise, we'll make a new request
    else {
      map.addLayer({
        'id': 'route',
        'type': 'line',
        'source': {
          'type': 'geojson',
          'data': geojson
        },
        'layout': {
          'line-join': 'round',
          'line-cap': 'round'
        },
        'paint': {
          'line-color': '#3887be',
          'line-width': 5,
          'line-opacity': 0.75
        }
      });
    }
  }

  map.on('load', () => {
    // make an initial directions request that
    // starts and ends at the same location
    getRoute(start);

    // Add destination to the map
    map.addLayer({
      'id': 'point',
      'type': 'circle',
      'source': {
        'type': 'geojson',
        'data': {
          'type': 'FeatureCollection',
          'features': [
            {
              'type': 'Feature',
              'properties': {},
              'geometry': {
                'type': 'Point',
                'coordinates': start
              }
            }
          ]
        }
      },
      'paint': {
        'circle-radius': 10,
        'circle-color': '#3887be'
      }
    });

    // allow the user to click the map to change the destination
    map.on('click', ({ lngLat }) => {
      const coords = Object.keys(lngLat).map((key) => lngLat[key]);
      const end = {
        'type': 'FeatureCollection',
        'features': [
          {
            'type': 'Feature',
            'properties': {},
            'geometry': {
              'type': 'Point',
              'coordinates': coords
            }
          }
        ]
      };
      if (map.getLayer('end')) {
        map.getSource('end').setData(end);
      } else {
        map.addLayer({
          'id': 'end',
          'type': 'circle',
          'source': {
            'type': 'geojson',
            'data': {
              'type': 'FeatureCollection',
              'features': [
                {
                  'type': 'Feature',
                  'properties': {},
                  'geometry': {
                    'type': 'Point',
                    'coordinates': coords
                  }
                }
              ]
            }
          },
          'paint': {
            'circle-radius': 10,
            'circle-color': '#f30'
          }
        });
      }
      getRoute(coords);
    });
  });

};

export { initMapbox };
