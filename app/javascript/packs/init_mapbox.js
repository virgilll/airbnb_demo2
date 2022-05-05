import mapboxgl from "mapbox-gl";
import "mapbox-gl/dist/mapbox-gl.css";
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder";

// extends bounds in relation to markers
const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach((marker) => bounds.extend([marker.lng, marker.lat]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
};

// adds all the markers to the map + popup when click on marker
const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {

    // pass element to mapboxgl.marker for picture
    new mapboxgl.Marker()
      .setLngLat([marker.lng, marker.lat])
      .addTo(map);
  });
};

const initMapbox = () => {
  // look for map element in html
  const mapElement = document.getElementById("map");

  // only build a map if there's a div#map to inject into
  if (mapElement) {
    //provide mapbox api key
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;

    //create map
    const map = new mapboxgl.Map({
      container: "map",
      style: "mapbox://styles/mapbox/streets-v10",
    });

    // retrieve markers
    const markers = JSON.parse(mapElement.dataset.markers);

    addMarkersToMap(map, markers);
    fitMapToMarkers(map, markers);

    window.addEventListener('load', () => {
      map.resize();
      fitMapToMarkers(map, markers);
    })


  }
};

export { initMapbox };
