# EPG Viewer Flutter Application

## Overview

The **EPG Viewer** is a Flutter-based application that fetches, parses, and displays an EPG from an XML source. The app allows users to navigate between TV channels, view program details, set reminders, and filter programs efficiently. It leverages modern state management and performance optimization techniques.

## Approach & Implementation

The application is designed using:

- **State Management**: Uses Riverpod for handling global state efficiently.
- **Data Models**: Utilizes the Freezed package to define immutable data models.
- **XML Parsing**: Parses large XML files using `xml` to optimize memory usage.
- **Caching Strategy**: Implements local storage via `SharedPreference` to save fetched EPG data for offline use.
- **Reminders**: Uses `flutter_local_notifications` to allow users to set reminders for TV programs.
- **Performance Optimization**: Uses Flutter Hooks for better widget lifecycle management.

## Data Structures

The app is built around two primary models:

- `Channel`: Represents a TV channel and contains a list of `Program` objects.
- `Program`: Represents individual TV programs with attributes like channel, title, start time, end time, and description.

Both models are defined using the **Freezed** package to enable serialization and immutability.

## Caching Strategy

To improve performance and allow offline access:

- The app fetches EPG data from the given XML URL and stores it using **SharedPreference**.
- On subsequent launches, the app first loads data from Hive before fetching new data.
- The caching strategy ensures minimal network requests and a seamless user experience.

## Running the Application

### Prerequisites

Ensure you have Flutter installed. If not, follow the official guide: [Flutter Installation](https://flutter.dev/docs/get-started/install)

### Steps to Run

1. Clone this repository:
   ```sh
   git clone https://github.com/sabbir420/epg_viewer.git
   ```
2. Navigate to the project directory:
   ```sh
   cd epg_viewer_flutter
   ```
3. Install dependencies:
   ```sh
   flutter pub get
   ```
4. Run the application:
   ```sh
   flutter run
   ```

## Features

- Fetch and parse EPG XML data.
- Navigate between different channels.
- View program details, including start time, end time, and description.
- Set reminders for upcoming programs.
- Filter programs based on search queries.
- Cache data for offline access.

## Error Handling

- If fetching the EPG data fails, the app will use cached data (if available).
- Displays user-friendly error messages for network or parsing issues.

## Testing

To run unit and widget tests:

```sh
flutter test
```

