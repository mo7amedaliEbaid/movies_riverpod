https://github.com/mo7amedaliEbaid/movies_riverpod/assets/131966482/e6e4c60f-1ba1-43fd-8b2c-31aea4451299


# movies_riverpod

 movies_riverpod is a versatile Flutter app designed for seamless movie exploration across different platforms. The app follows a Clean Architecture pattern, ensuring a modular and maintainable codebase. It has been successfully tested on mobile platforms (Android, iOS) and desktop (Linux).

## Directory Structure.

📁 **core:** Houses fundamental components and shared files essential for the application, such as the main app configuration (`app.dart`), error handling (`observers.dart`), extensions, constants, and other core functionalities.

📁 **di (Dependency Injection):** Manages the dependency injection logic for improved code organization and testability. The `injector.dart` file resides here.

📁 **features:** Organized into three subdirectories: `data` for data-related logic and repositories, `domain` for the use cases, and `presentation` for UI screens and widgets. This follows a clean architecture approach, promoting separation of concerns.

📁 **models:** Contains the data models used throughout the application, such as `movies.dart` and `casts.dart`.

📄 **main.dart:** The entry point of the application, where the execution begins. It imports and initializes necessary components to kickstart the Flutter app.




## Features

- **Clean Architecture:** The project adheres to Clean Architecture principles, promoting separation of concerns and maintainability.

- **Multiplatform Compatibility:** Enjoy a consistent experience on mobile (both portrait and landscape) and desktop (Linux).

- **State Management with Riverpod:** Leverage Riverpod for efficient and scalable state management.

- **Dependency Injection:** Implement dependency injection for better code organization and testability.

- **Multiple Themes:** Choose from a variety of themes to customize the app's appearance according to your preferences.

- **Responsive Design:** Experience responsive design that adapts to different screen orientations on mobile and desktop.

- **Bookmarks:** Save your favorite movies for quick access and reference.

- **Upcoming Movies Screen:** Stay informed about the latest upcoming releases.

- **Trending Movies Screen:** Explore the current trending movies in the app.

- **Home Screen:** Navigate seamlessly through the app's main screen for a user-friendly experience.

- **Movie Details Screen:** Get detailed information about each movie, enhancing your viewing experience.

- **Now Showing Movies:** Stay updated on movies currently being screened.

- **Track Your Activity:** Utilize the "Notifications" feature to keep a record of your interactions within the app.

## Dependencies
The project utilizes a range of dependencies to enhance functionality and streamline development. Some key dependencies include:

- **flutter_riverpod:** State management library for Flutter.
- **dio:** HTTP client for making network requests.
- **flutter_svg:** SVG rendering library for Flutter.
- **freezed:** Code generation for immutable classes.
- **flutter_screenutil:** Screen adaptation utility for responsive design.
- **go_router:** Routing library for Flutter.
- **shimmer:** Loading animation library for a polished UI.
- **cached_network_image:** Caching library for network images.
- **shared_preferences:** Local storage for persisting simple data.
- **isar:** High-performance, easy-to-use NoSQL database for Flutter.
- **get_it:** Simple service locator for dependency injection.

## Development Dependencies
Key development dependencies include:

- **build_runner:** Code generation tool for Flutter.
- **json_serializable:** JSON serialization/deserialization for Dart objects.
- **isar_generator:** Code generation for Isar database.
- **auto_route_generator:** Code generation for routing with auto_route.


### Download Apk
<a href="https://github.com/mo7amedaliEbaid/movies_riverpod/releases/download/v1.0.1/movies-v2.apk"><img src="https://playerzon.com/asset/download.png" width="130"></img></a>
<br />


## Screen Shots

#### Mobile.

##### Portrait.

<p float="left">
   <img src="https://github.com/mo7amedaliEbaid/movies_riverpod/blob/506512b215ce53524989d541f26c30d4566a0a89/screenshots/portrait/details.jpg" width="170" />
   <img src="https://github.com/mo7amedaliEbaid/movies_riverpod/blob/506512b215ce53524989d541f26c30d4566a0a89/screenshots/portrait/detailslight.jpg" width="170" />
   <img src="https://github.com/mo7amedaliEbaid/movies_riverpod/blob/506512b215ce53524989d541f26c30d4566a0a89/screenshots/portrait/drawer_light.jpg" width="170" />
   <img src="https://github.com/mo7amedaliEbaid/movies_riverpod/blob/506512b215ce53524989d541f26c30d4566a0a89/screenshots/portrait/home_dark.jpg" width="170" />
   <img src="https://github.com/mo7amedaliEbaid/movies_riverpod/blob/506512b215ce53524989d541f26c30d4566a0a89/screenshots/portrait/bookmarks_dark.jpg" width="170" />
   <img src="https://github.com/mo7amedaliEbaid/movies_riverpod/blob/506512b215ce53524989d541f26c30d4566a0a89/screenshots/portrait/home_light.jpg" width="170" />
   <img src="https://github.com/mo7amedaliEbaid/movies_riverpod/blob/506512b215ce53524989d541f26c30d4566a0a89/screenshots/portrait/drawer_dark.jpg" width="170" />
   <img src="https://github.com/mo7amedaliEbaid/movies_riverpod/blob/506512b215ce53524989d541f26c30d4566a0a89/screenshots/portrait/upcom_dark.jpg" width="170" />
   <img src="https://github.com/mo7amedaliEbaid/movies_riverpod/blob/506512b215ce53524989d541f26c30d4566a0a89/screenshots/portrait/upcom_light.jpg" width="170" />
   <img src="https://github.com/mo7amedaliEbaid/movies_riverpod/blob/506512b215ce53524989d541f26c30d4566a0a89/screenshots/portrait/notidark.jpg" width="170" />
   <img src="https://github.com/mo7amedaliEbaid/movies_riverpod/blob/704fad6542c9461999dda1a3727eaad0749f4436/screenshots/portrait/trending.jpg" width="170" />
   <img src="https://github.com/mo7amedaliEbaid/movies_riverpod/blob/704fad6542c9461999dda1a3727eaad0749f4436/screenshots/portrait/trendingdark.jpg" width="170" />
</p>

##### Landscape.
<p float="left">
   <img src="https://github.com/mo7amedaliEbaid/movies_riverpod/blob/edcbfb0e807bf02345318c3f66befc435f35fbd2/screenshots/landscape/home.jpg" width="370" />
   <img src="https://github.com/mo7amedaliEbaid/movies_riverpod/blob/edcbfb0e807bf02345318c3f66befc435f35fbd2/screenshots/landscape/upcoming.jpg" width="370" />
   <img src="https://github.com/mo7amedaliEbaid/movies_riverpod/blob/edcbfb0e807bf02345318c3f66befc435f35fbd2/screenshots/landscape/bookmarks.jpg" width="370" />
</p>

#### Desktop "Linux".

<p float="left">
   <img src="https://github.com/mo7amedaliEbaid/movies_riverpod/blob/72d21e9e3abd2bce283c60d1291014a6a76b86e7/screenshots/desktop/desk1.png" width="670" />
<img src="https://github.com/mo7amedaliEbaid/movies_riverpod/blob/72d21e9e3abd2bce283c60d1291014a6a76b86e7/screenshots/desktop/desk.png" width="670" />
   <img src="https://github.com/mo7amedaliEbaid/movies_riverpod/blob/72d21e9e3abd2bce283c60d1291014a6a76b86e7/screenshots/desktop/desk2.png" width="670" />
   <img src="https://github.com/mo7amedaliEbaid/movies_riverpod/blob/72d21e9e3abd2bce283c60d1291014a6a76b86e7/screenshots/desktop/desk6.png" width="670" />
   <img src="https://github.com/mo7amedaliEbaid/movies_riverpod/blob/72d21e9e3abd2bce283c60d1291014a6a76b86e7/screenshots/desktop/desk5.png" width="670" />
</p>

### Getting Started
To get started with the project, follow these steps:

- Clone the repository.
- Install dependencies using flutter pub get.
- Run the app on your preferred platform using flutter run.


