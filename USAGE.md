# OnboardingSPM Library

Swift Package Manager библиотека для онбординга с исправленной загрузкой изображений.

## Установка

1. Добавьте зависимость в ваш проект:
```swift
dependencies: [
    .package(url: "https://github.com/Gleb76/OnboardingSPM.git", from: "1.0.0")
]
```

2. Добавьте библиотеку в target:
```swift
.target(
    name: "YourApp",
    dependencies: ["Onboardings"]
)
```

## Использование

### Импорт библиотеки
```swift
import Onboardings
```

### Использование изображений из библиотеки
```swift
// Правильный способ - используйте Image(bundleResource:)
Image(bundleResource: "videoView")
    .resizable()
    .scaledToFit()

// НЕ используйте старый способ:
// Image("videoView") // ❌ Это не будет работать!
```

### Использование views из библиотеки
```swift
OnboardingStartView {
    print("Onboarding completed!")
}
```

## Важные изменения

- Все изображения теперь загружаются через `Image(bundleResource:)` вместо `Image()`
- Это исправляет ошибки "No image named X found in asset catalog"
- Библиотека автоматически предоставляет расширение `Image+Bundle` для правильной загрузки ресурсов

## Доступные изображения

- videoView
- blackGradient  
- hand
- moon
- confirm
- galochka
- и многие другие...

## Доступные views

- OnboardingStartView
- OnboardingSecondView
- OnboardingPaywall
- ConfigurableOnboardingView
- и другие...
