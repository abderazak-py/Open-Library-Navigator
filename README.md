# Bookly: A Book Discovery App

[![Flutter Version](https://img.shields.io/badge/Flutter-3.x-blue.svg)](https://flutter.dev)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)

Bookly is a Flutter-based mobile application that allows users to discover and browse through a vast collection of books. The app provides a clean and intuitive interface to explore featured books, search for specific titles, and view detailed information about each book.

<!-- 
## Screenshots

| Splash Screen | Home Screen | Book Details |
| :-----------: | :---------: | :----------: |
| ![Splash Screen](https://via.placeholder.com/200x400.png?text=Splash+Screen) | ![Home Screen](https://via.placeholder.com/200x400.png?text=Home+Screen) | ![Book Details](https://via.placeholder.com/200x400.png?text=Book+Details) | -->

## Table of Contents

- [Features](#features)
- [Tech Stack & Architecture](#tech-stack--architecture)
- [Installation](#installation)
- [Dependencies](#dependencies)
- [API Reference](#api-reference)
- [Contributing](#contributing)
- [License](#license)

## Features

- **Splash Screen:** A visually appealing entry point to the application.
- **Home Page:**
    - Displays a list of "Featured Books" in a horizontal list.
    - Shows a "Newest Books" section in a vertical list.
- **Book Details:**
    - Provides comprehensive details about a selected book.
    - Shows similar books to the one being viewed.
- **Search Functionality:** Allows users to search for books by title.
- **Error Handling:** Gracefully handles network errors and displays appropriate messages.
- **Loading Indicators:** Provides visual feedback while data is being fetched.

## Tech Stack & Architecture

### Tech Stack

- **[Flutter](https://flutter.dev/):** The UI toolkit for building natively compiled applications for mobile, web, and desktop from a single codebase.
- **[Dart](https://dart.dev/):** The programming language used for Flutter development.
- **[BLoC (Business Logic Component):](https://bloclibrary.dev/)** A predictable state management library for Dart that helps implement the BLoC design pattern.
- **[GetIt](https://pub.dev/packages/get_it):** A simple service locator for Dart and Flutter projects.
- **[GoRouter](https://pub.dev/packages/go_router):** A declarative routing package for Flutter that simplifies navigation.
- **[Dio](https://pub.dev/packages/dio):** A powerful HTTP client for Dart, which supports interceptors, global configuration, FormData, request cancellation, file downloading, timeout, and more.
- **[Google Fonts](https://pub.dev/packages/google_fonts):** A Flutter package to use fonts from fonts.google.com.

### Architecture

The project follows the principles of **Clean Architecture**, which separates the code into distinct layers:

-   **`lib/features`**: Each feature of the application (e.g., `home`, `search`, `splash`) is a self-contained module.
    -   **`data`**: Contains the data sources (remote and local) and the repository implementation.
        -   `models`: Defines the data structures.
        -   `repos`: Abstract definitions of the repositories.
    -   **`presentation`**: Contains the UI and the presentation logic.
        -   `manager`: BLoCs/Cubits for state management.
        -   `views`: The screens and their widgets.
-   **`lib/core`**: Contains the shared code and utilities used across multiple features.
    -   `utils`: Shared utility classes like `AppRouter`, `ApiService`, `ServiceLocator`.
    -   `widgets`: Common widgets like custom buttons and error messages.
    -   `errors`: Failure handling classes.

## Installation

To get a local copy up and running, follow these simple steps.

### Prerequisites

-   [Flutter SDK](https://flutter.dev/docs/get-started/install)
-   [Android Studio](https://developer.android.com/studio) or [VS Code](https://code.visualstudio.com/)

### Steps

1.  **Clone the repository:**
    ```sh
    git clone https://github.com/abderazak-py/bookly.git
    ```
2.  **Navigate to the project directory:**
    ```sh
    cd bookly
    ```
3.  **Install dependencies:**
    ```sh
    flutter pub get
    ```
4.  **Run the application:**
    ```sh
    flutter run
    ```

## Dependencies

The project relies on the following packages:

| Package                                                              | Version | Description                               |
| -------------------------------------------------------------------- | ------- | ----------------------------------------- |
| [bloc](https://pub.dev/packages/bloc)                                | ^9.0.0  | State management                          |
| [cached_network_image](https://pub.dev/packages/cached_network_image) | ^3.4.1  | For caching network images                |
| [cupertino_icons](https://pub.dev/packages/cupertino_icons)           | ^1.0.8  | iOS-style icons                           |
| [dartz](https://pub.dev/packages/dartz)                               | ^0.10.1 | Functional programming in Dart            |
| [dio](https://pub.dev/packages/dio)                                   | ^5.9.0  | HTTP client                               |
| [equatable](https://pub.dev/packages/equatable)                       | ^2.0.7  | Simplify equality comparisons             |
| [flutter_bloc](https://pub.dev/packages/flutter_bloc)                 | ^9.1.1  | Flutter widgets for BLoC                  |
| [font_awesome_flutter](https://pub.dev/packages/font_awesome_flutter) | ^10.10.0| Font Awesome icons                        |
| [get_it](https://pub.dev/packages/get_it)                             | ^8.2.0  | Service locator                           |
| [go_router](https://pub.dev/packages/go_router)                       | ^16.2.2 | Declarative routing                       |
| [google_fonts](https://pub.dev/packages/google_fonts)                 | ^6.3.1  | Google Fonts                              |
| [url_launcher](https://pub.dev/packages/url_launcher)                 | ^6.3.2  | Launching URLs                            |

## API Reference

The application uses the [Google Books API](https://developers.google.com/books) to fetch book data.

## Contributing

Contributions are what make the open-source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".

1.  Fork the Project
2.  Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3.  Commit your Changes (`git commit -m '''Add some AmazingFeature'''`)
4.  Push to the Branch (`git push origin feature/AmazingFeature`)
5.  Open a Pull Request

## License

Distributed under the MIT License. See `LICENSE` for more information.
