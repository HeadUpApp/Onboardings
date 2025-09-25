# 🚀 Onboardings SPM Package

A beautiful, customizable SwiftUI onboarding library with 27 pre-designed screens, perfect for iOS applications. This package provides a seamless onboarding experience with smooth animations, progress indicators, and portrait-only orientation support.

## ✨ Features

- 🎨 **27 Beautiful Screens** - Pre-designed onboarding screens with consistent styling
- 📱 **Portrait Only** - Optimized for portrait orientation with automatic enforcement
- 🎯 **Progress Tracking** - Visual progress indicator showing current screen
- ⚡ **Smooth Animations** - Fluid transitions between screens
- 🎨 **Customizable Design** - Consistent color scheme and typography
- 📦 **SPM Ready** - Easy integration via Swift Package Manager
- 🔄 **Callback Support** - Completion callback for seamless app flow
- 🎨 **Modern UI** - Dark theme with gradient backgrounds and custom fonts

## 📋 Requirements

- iOS 17.0+
- Swift 5.9+
- Xcode 15.0+

## 🛠 Installation

### Swift Package Manager

1. In Xcode, go to **File** → **Add Package Dependencies**
2. Enter the repository URL or select your local package
3. Choose **Onboardings** library
4. Click **Add Package**

### Manual Integration

1. Add the `Onboardings` folder to your project
2. Make sure all resources (fonts, images) are included
3. Import the module in your Swift files

## 🚀 Quick Start

### Basic Usage (All 27 Screens)

```swift
import SwiftUI
import Onboardings

struct ContentView: View {
    @State private var showOnboarding = true
    
    var body: some View {
        if showOnboarding {
            OnboardingView {
                // Called when onboarding completes
                showOnboarding = false
                print("Onboarding completed!")
            }
        } else {
            // Your main app content
            MainAppView()
        }
    }
}
```

### Flexible Usage (Custom Screen Selection)

```swift
import SwiftUI
import Onboardings

struct ContentView: View {
    @State private var showOnboarding = true
    
    var body: some View {
        if showOnboarding {
            // Custom configuration - only first 5 screens
            ConfigurableOnboardingView(
                configuration: .short, // Predefined: first 5 screens
                onComplete: {
                    showOnboarding = false
                }
            )
        } else {
            MainAppView()
        }
    }
}
```

### Advanced Usage with State Management

```swift
import SwiftUI
import Onboardings

struct AppView: View {
    @State private var onboardingCompleted = false
    @State private var showOnboarding = true
    
    var body: some View {
        ZStack {
            if showOnboarding {
                OnboardingView {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        onboardingCompleted = true
                        showOnboarding = false
                    }
                }
                .transition(.opacity)
            } else {
                MainAppView(hasCompletedOnboarding: onboardingCompleted)
                    .transition(.opacity)
            }
        }
        .animation(.easeInOut(duration: 0.5), value: showOnboarding)
    }
}
```

## 📱 Screen Structure

The package includes 27 carefully designed screens:

### Screen Flow
1. **OnboardingStartView** - Welcome screen
2. **OnboardingSecondView** - Introduction
3. **OnboardingThirdView** - Features overview
4. **OnboardingFourthView** - Benefits
5. **OnboardingFiveView** - Getting started
6. **OnboardingSixView** - Tips and tricks
7. **OnboardingSevenView** - Advanced features
8. **OnboardingEightView** - Community
9. **OnboardingNineView** - Support
10. **OnboardingTenView** - Almost there
11. **OnboardingElevenView** - Screen 11
12. **OnboardingTwelveView** - Screen 12
13. **OnboardingThirteenView** - Screen 13
14. **OnboardingFourteenView** - Screen 14
15. **OnboardingFifteenView** - Screen 15
16. **OnboardingSixteenView** - Screen 16
17. **OnboardingSeventeenView** - Screen 17
18. **OnboardingEighteenView** - Screen 18
19. **OnboardingNineteenView** - Screen 19
20. **OnboardingTwentyView** - Screen 20
21. **OnboardingTwentyOneView** - Screen 21
22. **OnboardingTwentyTwoView** - Screen 22
23. **OnboardingTwentyThreeView** - Screen 23
24. **OnboardingTwentyFourView** - Screen 24
25. **OnboardingTwentyFiveView** - Screen 25
26. **OnboardingAssignmentView** - Assignment screen
27. **OnboardingPaywall** - Paywall screen

## 🎨 Customization

### Colors and Themes

The package uses a consistent dark theme with custom colors:

```swift
// Available colors
Color.appBackground          // Main background (#0B0B0B)
Color.backgroundWithOpacity  // Semi-transparent white
Color.secondaryText         // Secondary text color

// Available gradients
AppGradient.buttonSimple     // Button gradient
AppGradient.simpleBackground // Background gradient
AppGradient.textPrimary      // Text gradient
```

### Typography

Custom Inter fonts are included:

```swift
// Available fonts
Font.interLight(size: 18)    // Inter Light
Font.interMedium(size: 28)   // Inter Medium
```

## 🔧 API Reference

### OnboardingView

The main view that manages the entire onboarding flow.

```swift
public struct OnboardingView: View {
    public init(onComplete: @escaping () -> Void)
}
```

**Parameters:**
- `onComplete`: Closure called when the user completes the onboarding

### Individual Screen Views

Each screen is a separate SwiftUI view with consistent interface:

```swift
public struct OnboardingStartView: View {
    public init(onNext: @escaping () -> Void)
}

public struct OnboardingSecondView: View {
    public init(onComplete: @escaping () -> Void)
}

// ... and so on for all 25 screens
```

## ⚙️ Configuration Examples

### Predefined Configurations

```swift
// Все 27 экранов
let fullConfig = OnboardingConfiguration.full

// Первые 5 экранов
let shortConfig = OnboardingConfiguration.short

// Первые 10 экранов
let mediumConfig = OnboardingConfiguration.medium

// Кастомные экраны в любом порядке
let customConfig = OnboardingConfiguration.custom(
    .start, .third, .five, .ten, .assignment, .paywall
)

// Диапазон экранов (с 1-го по 10-й)
let rangeConfig = OnboardingConfiguration.range(
    from: .start, 
    to: .ten
)

// Первые N экранов
let firstFiveConfig = OnboardingConfiguration.first(5)

// Последние N экранов
let lastThreeConfig = OnboardingConfiguration.last(3)

// Экраны по индексам
let specificConfig = OnboardingConfiguration.indices([0, 2, 4, 6, 8])
```

### Custom Configuration with Options

```swift
let customConfig = OnboardingConfiguration(
    screens: [.start, .second, .third, .fourth, .five],
    showProgressIndicator: true,    // Показывать индикатор прогресса
    allowSwipeNavigation: false     // Запретить свайпы (только кнопки)
)
```

## 📝 Usage Examples

### Example 1: Simple Integration

```swift
import SwiftUI
import Onboardings

@main
struct MyApp: App {
    @State private var showOnboarding = true
    
    var body: some Scene {
        WindowGroup {
            if showOnboarding {
                OnboardingView {
                    showOnboarding = false
                }
            } else {
                MainAppView()
            }
        }
    }
}
```

### Example 2: With UserDefaults Persistence

```swift
import SwiftUI
import Onboardings

struct ContentView: View {
    @State private var showOnboarding = !UserDefaults.standard.bool(forKey: "hasCompletedOnboarding")
    
    var body: some View {
        if showOnboarding {
            OnboardingView {
                UserDefaults.standard.set(true, forKey: "hasCompletedOnboarding")
                showOnboarding = false
            }
        } else {
            MainAppView()
        }
    }
}
```

### Example 3: With Analytics Tracking

```swift
import SwiftUI
import Onboardings

struct ContentView: View {
    @State private var showOnboarding = true
    
    var body: some View {
        if showOnboarding {
            OnboardingView {
                // Track onboarding completion
                Analytics.track("onboarding_completed")
                showOnboarding = false
            }
        } else {
            MainAppView()
        }
    }
}
```

### Example 4: Custom Screen Selection

```swift
import SwiftUI
import Onboardings

struct ContentView: View {
    @State private var showOnboarding = true
    
    var body: some View {
        if showOnboarding {
            ConfigurableOnboardingView(
                configuration: .custom(.start, .third, .five, .ten),
                onComplete: {
                    showOnboarding = false
                }
            )
        } else {
            MainAppView()
        }
    }
}
```

### Example 5: Different Configurations for Different Users

```swift
import SwiftUI
import Onboardings

struct ContentView: View {
    @State private var showOnboarding = true
    @State private var userType: UserType = .new
    
    var body: some View {
        if showOnboarding {
            ConfigurableOnboardingView(
                configuration: configurationForUserType(userType),
                onComplete: {
                    showOnboarding = false
                }
            )
        } else {
            MainAppView()
        }
    }
    
    private func configurationForUserType(_ type: UserType) -> OnboardingConfiguration {
        switch type {
        case .new:
            return .short // First 5 screens for new users
        case .returning:
            return .custom(.start, .ten, .twentyFive) // Key screens only
        case .premium:
            return .full // All 27 screens for premium users
        }
    }
}

enum UserType {
    case new, returning, premium
}
```

## 🎯 Best Practices

### 1. State Management
- Use `@State` for simple local state
- Consider `@AppStorage` for persistence
- Use `@ObservableObject` for complex state management

### 2. Performance
- The package is optimized for smooth 60fps animations
- All images and fonts are bundled efficiently
- Memory usage is minimal

### 3. Accessibility
- All screens support VoiceOver
- High contrast mode is supported
- Dynamic Type is respected

### 4. Orientation
- Package enforces portrait-only orientation
- Automatically handles device rotation
- Optimized for all iPhone sizes

## 🔍 Troubleshooting

### Common Issues

**Q: Onboarding doesn't show up**
A: Make sure you're importing the package correctly and the completion callback is properly implemented.

**Q: Screens look different on different devices**
A: The package is designed to be responsive. Check that you're not overriding the safe area insets.

**Q: Fonts don't appear correctly**
A: Ensure the font files are properly included in your app bundle and the package resources are processed.

**Q: Orientation changes are not working**
A: The package handles orientation automatically. Make sure you're not conflicting with your app's orientation settings.

### Debug Tips

1. Check console for any import errors
2. Verify package dependencies are resolved
3. Test on different device sizes
4. Ensure all resources are included

## 📄 License

This package is available under the MIT license. See the LICENSE file for more information.

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📞 Support

If you encounter any issues or have questions:

1. Check the troubleshooting section above
2. Review the example code
3. Open an issue on GitHub
4. Contact the maintainer

## 🎉 Acknowledgments

- Designed with ❤️ for iOS developers
- Built with SwiftUI best practices
- Optimized for performance and accessibility

---

**Made with SwiftUI** • **iOS 17+** • **Swift Package Manager**
