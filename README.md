# The Harry Potter Wiki

An immersive iOS experience built in SwiftUI, using CoreData, DocC, and Harry Potter!

The **Harry Potter Wiki App** provides users with a magical journey into the Harry Potter universe.

Built from scratch using **SwiftUI** and **CoreData**, it focuses on performance, design consistency, and user experience.

### How to run

1. Clone the repository:

    ```bash
    git clone https://github.com/FilipeNMarques/hp-wiki
    ```

2. Open the project in Xcode:

    ```bash
    open HarryPotterWiki.xcodeproj
    ```

3. Make sure you are using the latest version of **Xcode** (15.0 or later).

4. To view the our developer documentation
    - In Xcode, go to **Product** > **Build Documentation** (or use the shortcut **Shift + Cmd + D**).
    - Browse the DocC pages for detailed insights about the app structure.

### Key Features

- 📜 **Character & Spells Listing**: Explore all characters, students, staff, and spells from Hogwarts.
- ⭐ **Favorites Management**: Save your favorite characters locally with CoreData.
- 🏠 **Onboarding & House Selection**: Choose your house and have the app styled accordingly.
- 🌟 **Modern UI**: Fully built with SwiftUI using custom accent colors and smooth animations.
- 📡 **Network Layer**: Async/Await-based network requests for a modern iOS experience.
- 🛠 **Architecture**: Clean MVVM architecture, environment-driven CoreData context, and persistence handled carefully.
- 📚 **DocC Documentation**: Full DocC documentation coverage, with code samples and external links.
- 🎨 **Dynamic Theming**: Accent color and styles dynamically change based on your chosen house.

### Core Technologies

- `SwiftUI`
- `CoreData`
- `Async/Await`
- `DocC`
- `MVVM Architecture`
- `Custom Theming`

### Future Improvements

- **Add Unit Tests**:  
  Cover key view models (e.g., `HomeViewModel`, `FavoriteViewModel`) and services with unit and integration tests to ensure better stability and maintainability.

- **Implement API Caching**:  
  Introduce a lightweight caching mechanism (e.g., in-memory or disk cache) for API responses to reduce network usage and improve performance during navigation.

- **Accessibility Enhancements**:  
  Improve VoiceOver support, dynamic type scaling, and color contrast adjustments to make the app fully accessible to all users.

- **Offline Mode**:  
  Allow users to browse previously loaded characters and spells even when offline, using CoreData as a local cache for fetched data.

---