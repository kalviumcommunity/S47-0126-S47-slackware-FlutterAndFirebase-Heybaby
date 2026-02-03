# HeyBaby - Flutter Project Structure

## 1. Introduction to Flutter Folder Structure
A well-organized folder structure is the backbone of any scalable Flutter application. When you create a new Flutter project, a default directory structure is generated to handle cross-platform development (Android, iOS, Web, etc.) while keeping the core application logic separate.

Understanding this structure is crucial because it allows developers to:
- Navigate the codebase efficiently.
- Keep platform-specific configurations isolated.
- Manage assets and dependencies systematically.

## 2. Key Directories & Files

| Directory / File | Purpose |
| :--- | :--- |
| **`lib/`** | The heart of the application. Contains all Dart code, including UI, logic, and models. `main.dart` lives here as the entry point. |
| &nbsp;&nbsp;`screens/` | (Custom) Holds full-page widgets for better modularity. |
| &nbsp;&nbsp;`widgets/` | (Custom) Reusable UI components used across multiple screens. |
| &nbsp;&nbsp;`models/` | (Custom) Data classes defining the shape of app data. |
| &nbsp;&nbsp;`services/` | (Custom) API calls, database interactions, and business logic. |
| **`android/`** | Contains native Android configuration files, Gradle scripts (`build.gradle`), and manifest files (`AndroidManifest.xml`). Used for Android-specific settings. |
| **`ios/`** | Contains native iOS configuration files and Xcode project settings. The `Info.plist` file here manages permissions and app metadata. |
| **`test/`** | Stores automated tests. `widget_test.dart` is included by default to verify that UI components render and behave correctly. |

| **`assets/`** |  (Manually Created) A folder for static resources like images, fonts, and JSON files. These must be registered in `pubspec.yaml`. |
| **`pubspec.yaml`** | The project's configuration center. It manages dependencies (packages), asset registration, fonts, and app versioning. |
| **`analysis_options.yaml`** | Configures the Dart analyzer, allowing you to customize linting rules for code quality. |
| **`.gitignore`** | Specifies which files and directories should be ignored by Git (e.g., build artifacts, IDE settings). |

## 3. Folder Hierarchy Diagram

```text
heybaby/
├── android/               # Android native code & config
├── ios/                   # iOS native code & config
├── lib/
│   ├── main.dart          # Entry point
│   ├── models/            # Data models
│   ├── screens/           # Application screens
│   ├── services/          # Business logic & APIs
│   └── widgets/           # Reusable UI components
├── test/                  # Unit & Widget tests
├── web/                   # Web-specific files
├── windows/               # Windows-specific files
├── .gitignore             # Git ignore rules
├── analysis_options.yaml  # Linter rules
├── pubspec.yaml           # Dependencies & Assets
└── README.md              # Project documentation
```

## 4. Reflection
Understanding this structure supports scalability and teamwork by:
- **Enforcing Separation of Concerns:** Logic, UI, and Native config are kept separate.
- **Improving Onboarding:** New team members can intuitively know where to find screens vs. logic.
- **Simplifying Maintenance:** Platform-specific bugs (e.g., Android permission issues) are isolated in their respective folders (`android/`), keeping the main Dart code clean.
