# Live Location

### Track live location with Google map API

This Flutter Android app provides the following features:

## 1. Automatic Map Animation
- Displays a Google Map view that smoothly animates to the user's current location.

## 2. Real-Time Location Updates
- Fetches the user's current location every 10 seconds.
- Updates the marker's position on the map to reflect the latest location.

## 3. Polyline Tracking
- Draws a polyline on the map connecting the previous and current locations.
- Keeps updating the polyline as the user's location changes.

## 4. Marker Information Window
- Allows users to tap the marker to open an info window.
- Displays an info window with "My current location" as the title and the user's latitude and longitude as the snippet.

### How to Use the App
1. Clone this repository to your local machine.
2. Open the project in Flutter.
3. Build and run the app on your Android device or emulator.

```bash
git clone https://github.com/musfique113/LiveLocation.git
cd location-tracker-app
flutter run
```

## Configuration
Make sure to set up your Google Maps API key in this path
```
android/app/src/main/AndroidManifest.xml
```

```
<meta-data
android:name="com.google.android.geo.API_KEY"
android:value="YOUR_API_KEY_HERE"/>
```
Replace **"YOUR_API_KEY_HERE"** with your actual Google Maps API key.

## DEMO

demo/demo.gif