import { Controller } from "@hotwired/stimulus";
import mapboxgl from "mapbox-gl"; // Don't forget this!

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array,
    latitude: Number,
    longitude: Number,
    hospitalLatitude: Number,
    hospitalLongitude: Number,
    duration: Number,
  };

  static targets = ["box", "duration"];

  connect() {
    console.log(this.latitudeValue);
    mapboxgl.accessToken = this.apiKeyValue;
    const start = [this.longitudeValue, this.latitudeValue];
    const end = [this.hospitalLongitudeValue, this.hospitalLatitudeValue];

    this.map = new mapboxgl.Map({
      container: this.boxTarget,
      style: "mapbox://styles/mapbox/streets-v10",
      center: [this.longitudeValue, this.latitudeValue], // starting position
      zoom: 11.5,
    });
    fetch(
      `https://api.mapbox.com/directions/v5/mapbox/driving/${this.longitudeValue},${this.latitudeValue};${this.hospitalLongitudeValue},${this.hospitalLatitudeValue}?steps=true&geometries=geojson&access_token=${mapboxgl.accessToken}`
    )
      .then((response) => response.json())
      .then((data) => {
        console.log(data);
        const itinerary = data.routes[0];
        const duration = itinerary.duration;
        const time = Math.ceil(duration / 60);
        this.durationTarget.innerText = time;
        const route = itinerary.geometry.coordinates;
        const geojson = {
          type: "Feature",
          properties: {},
          geometry: {
            type: "LineString",
            coordinates: route,
          },
        };
        this.map.addLayer({
          id: "route",
          type: "line",
          source: {
            type: "geojson",
            data: geojson,
          },
          layout: {
            "line-join": "round",
            "line-cap": "round",
          },
          paint: {
            "line-color": "#3887be",
            "line-width": 5,
            "line-opacity": 0.75,
          },
        });

        this.map.addLayer({
          id: "point",
          type: "circle",
          source: {
            type: "geojson",
            data: {
              type: "FeatureCollection",
              features: [
                {
                  type: "Feature",
                  properties: {},
                  geometry: {
                    type: "Point",
                    coordinates: start,
                  },
                },
              ],
            },
          },
          paint: {
            "circle-radius": 10,
            "circle-color": "#eb1514",
          },
        });
      this.map.addLayer({
        id: 'point',
        type: 'circle',
        source: {
          type: 'geojson',
          data: {
            type: 'FeatureCollection',
            features: [
              {
                type: 'Feature',
                properties: {},
                geometry: {
                  type: 'Point',
                  coordinates: start
                }
              }
            ]
          }
        },
        paint: {
          'circle-radius': 10,
          'circle-color': '#F0B6FF'
        }
      });

      this.map.addLayer({
        id: 'endpoint',
        type: 'circle',
        source: {
          type: 'geojson',
          data: {
            type: 'FeatureCollection',
            features: [
              {
                type: 'Feature',
                properties: {},
                geometry: {
                  type: 'Point',
                  coordinates: end
                }
              }
            ]
          }
        },
        paint: {
          'circle-radius': 10,
          'circle-color': '#7FC8F8'
        }
      });
    })

  }
  setDuration(duration) {
    duration = Math.ceil(duration / 60);
  }
}
