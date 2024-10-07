# Location Based Maps

## Overview

This is a simple Flutter application that uses OpenStreetMap to display a location based on user input, along with an option to detect the user's current location and display it on the map. It also provides a toggle to switch between different map types (such as street and satellite views).


## Features

- Display the entered location on the map with a marker.
- Detect and display the user's current location on the map.
- Switch between different map types (Street and Satellite views).
- A simple and intuitive UI with map interactions.

## Tech Stack

- Flutter
- flutter_map(v7.0.2)
- latlong2(v0.9.1)
- geolocator(v13.0.1)
- OpenStreetMap

## Screenshots

### 1. Initial Location Display
This screen shows the user-entered location with a red marker.

<table>
  <tr>
    <td>
      <img src="https://github.com/Praveen5102/location_based_maps/blob/main/lib/input_location.jpeg" alt="Initial Location Display" width="400"/>
    </td>
    <td>
      <img src="https://github.com/Praveen5102/location_based_maps/blob/main/lib/search_location.jpeg" alt="Search Location Detection" width="400"/>
    </td>
    <td>
      <img src="https://github.com/Praveen5102/location_based_maps/blob/main/lib/current.jpeg" alt="User's Current Location" width="400"/>
    </td>
  </tr>
  <tr>
    <td align="center">Initial Location Display</td>
    <td align="center">Search Location Detection</td>
    <td align="center">User's Current Location</td>
  </tr>
</table>


##  Setup Instructions

Follow these steps to get the project running locally on your system:

1. **Install Flutter**

   Ensure that Flutter is installed on your machine. You can download it from the official Flutter site: Flutter          Installation Guide.

2. **Clone the Repository**
   
   Open your terminal or command prompt, and run the following command to clone the project:
   ```bash
   git clone https://github.com/yourusername/location_map_app.git
   ```
   Navigate to the project directory:

   ```bash
   cd location_map_app
   ```
3. **Install Dependencies**

   Run the following command to install the required packages and dependencies:
   
    ```bash
     flutter pub get
    ```
4. **Set Up Permissions**

   To access the user's location, you must add location permissions for Android.

   Open android/app/src/main/AndroidManifest.xml and add the following permissions:
   
   ```bash
   <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
   <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
   <uses-permission android:name="android.permission.INTERNET" />
   ```
5. **Run the App**
   
   Once you've set up permissions and installed dependencies, you can run the app on your emulator or physical device:
   ```bash
   flutter run
   ```
6. **Optional - Set Up Android Emulator**
   
   If you don’t have an Android emulator set up, you can create one by following these steps:

     - Open Android Studio.
     - Go to AVD Manager
     - Create a new virtual device and choose a system image
     - Launch the emulator

## How to Use the App

1. **Enter Location:** When the app starts, it will display the user-provided location on the map with a red marker.

2. **Detect Current Location:** The app will automatically detect the user's current location and display it with a blue marker on the map.
  
3. **Toggle Map Type:** You can switch between street and satellite map views by tapping the Map button on the top right corner of the app.

## Package Used

- **flutter_map:** Used to render maps using OpenStreetMap tiles.
- **latlong2:** Provides geographical coordinates for mapping purposes.
- **geolocator:** For accessing the device's location and location services.

## Contributing
If you'd like to contribute to this project, feel free to fork the repository and submit a pull request. Please ensure your code is well-documented and follows the project's coding style.

## License
This project is licensed under the MIT License. See the LICENSE file for more details.

## Contact
For any questions or feedback, feel free to reach out to [Praveen Kumar Gone] at [praveenkumargone229@gmail.com].

##
By following this README, you should be able to successfully set up and run the Location Map App on your local machine. Enjoy exploring map functionalities with the convenience of OpenStreetMap!


