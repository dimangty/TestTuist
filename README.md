# TestingTask - Modular Architecture with Tuist

This iOS project has been successfully migrated to use Tuist with a modular architecture, split into focused frameworks.

## Modular Architecture

The project is now split into the following modules:

### 🏗️ **Core Module**
- **Purpose**: Shared foundation components
- **Contents**:
  - VIPER base classes and protocols
  - UI Extensions (UIViewController+, UIView+, etc.)
  - Models (DTO, POSO)
  - Services (Network, Cache, Error, Progress)
  - Dependency Injection (@Injected, ServiceLocator)
  - Configuration (Configurator)

### 🔐 **Auth Module**
- **Purpose**: Authentication flows  
- **Contents**:
  - SplashScreen (entry point)
  - LoginScreen 
  - SignUpScreen
  - AuthService (mock authentication)
- **Dependencies**: Core

### 🏠 **Home Module**
- **Purpose**: Home and main functionality
- **Contents**:
  - HomeScreen (main dashboard)
  - MainScreen (currency converter - if applicable)
- **Dependencies**: Core

### 👤 **Profile Module** 
- **Purpose**: User profile management
- **Contents**:
  - ProfileScreen (user info display)
- **Dependencies**: Core

### 📱 **Main App Target**
- **Purpose**: App entry point and coordination
- **Contents**:
  - AppDelegate, SceneDelegate
  - Storyboards and Assets
- **Dependencies**: Core, Auth, Home, Profile

## Project Structure

```
TestingTask/
├── Modules/
│   ├── Core/Sources/          # 🏗️ Foundation components
│   ├── Auth/Sources/          # 🔐 Authentication flows  
│   ├── Home/Sources/          # 🏠 Home functionality
│   └── Profile/Sources/       # 👤 Profile management
├── TestingTask/               # 📱 Main app target
├── Project.swift              # 🔧 Tuist configuration
├── Workspace.swift            # 📂 Workspace setup
└── README.md                  # 📖 Documentation
```

## Tuist Configuration

- `Project.swift` - Defines all modules and dependencies
- `Workspace.swift` - Workspace configuration  
- `Tuist.swift` - Global Tuist settings
- `.tuist-version` - Pins Tuist version to 4.65.5

## Getting Started

1. **Install Tuist**: `curl -Ls https://install.tuist.io | bash`
2. **Generate project**: `tuist generate`
3. **Open workspace**: `TestingTask.xcworkspace`

## Build & Run

Build individual modules:
```bash
# Build Core module
xcodebuild -workspace TestingTask.xcworkspace -scheme Core build

# Build Auth module  
xcodebuild -workspace TestingTask.xcworkspace -scheme Auth build

# Build complete app
xcodebuild -workspace TestingTask.xcworkspace -scheme TestingTask build
```

## Module Benefits

- **🔀 Clear Separation** - Each module has focused responsibility
- **🔗 Explicit Dependencies** - Dependency graph clearly defined
- **⚡ Faster Builds** - Only changed modules need rebuilding
- **🧪 Testable** - Each module can be tested independently
- **♻️ Reusable** - Modules can be shared across projects
- **👥 Team Development** - Teams can work on separate modules

## Architecture Benefits

- **📦 Encapsulation** - Private implementation details per module
- **🎯 Single Responsibility** - Each module has one purpose
- **🔧 Maintainable** - Easier to modify and debug
- **📈 Scalable** - Easy to add new modules and features