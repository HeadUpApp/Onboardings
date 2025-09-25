# 📦 Публикация Onboardings SPM Package

## 🚀 Инструкция по публикации

### 1. Подготовка репозитория

```bash
# Перейти в папку проекта
cd /Users/glebklyga/Desktop/SPMOnboarding/OnboardingSPM

# Инициализировать git (если еще не сделано)
git init

# Добавить все файлы
git add .

# Сделать первый коммит
git commit -m "Initial commit: Onboardings SPM Package v1.0.0"

# Создать главную ветку
git branch -M main
```

### 2. Создание GitHub репозитория

1. Перейти на [GitHub](https://github.com)
2. Нажать **"New repository"**
3. Название: `Onboardings` (или любое другое)
4. Описание: `Beautiful SwiftUI onboarding library with 27 customizable screens`
5. Сделать **Public** (для SPM)
6. **НЕ** добавлять README, .gitignore, лицензию (уже есть)
7. Нажать **"Create repository"**

### 3. Подключение к GitHub

```bash
# Добавить remote origin (заменить YOUR_USERNAME на свой GitHub username)
git remote add origin https://github.com/YOUR_USERNAME/Onboardings.git

# Отправить код на GitHub
git push -u origin main
```

### 4. Создание релиза

1. Перейти в репозиторий на GitHub
2. Нажать **"Releases"** → **"Create a new release"**
3. **Tag version**: `v1.0.0`
4. **Release title**: `Onboardings v1.0.0`
5. **Description**:
   ```
   🎉 First release of Onboardings SPM Package!
   
   Features:
   - 27 beautiful onboarding screens
   - Flexible configuration system
   - Custom screen selection
   - Progress indicators
   - Portrait-only orientation
   - SwiftUI compatible
   ```
6. Нажать **"Publish release"**

## 📱 Использование в других проектах

### Через Xcode:

1. **File** → **Add Package Dependencies**
2. Вставить URL: `https://github.com/YOUR_USERNAME/Onboardings.git`
3. Выбрать версию: `Up to Next Major Version` от `1.0.0`
4. Нажать **Add Package**
5. Выбрать **Onboardings** library
6. Нажать **Add Package**

### Через Package.swift:

```swift
dependencies: [
    .package(url: "https://github.com/YOUR_USERNAME/Onboardings.git", from: "1.0.0")
]
```

## 🔄 Обновления

При обновлении библиотеки:

1. Внести изменения в код
2. Обновить версию в `Package.swift`:
   ```swift
   let package = Package(
       name: "Onboardings",
       platforms: [.iOS(.v17)],
       products: [...],
       targets: [...],
       swiftLanguageVersions: [.v5]
   )
   ```
3. Сделать коммит:
   ```bash
   git add .
   git commit -m "Update to v1.1.0: Add new features"
   git tag v1.1.0
   git push origin main --tags
   ```
4. Создать новый релиз на GitHub

## ✅ Проверка

После публикации проверить:

1. **URL работает**: `https://github.com/YOUR_USERNAME/Onboardings`
2. **Package.swift доступен**: `https://github.com/YOUR_USERNAME/Onboardings/blob/main/Package.swift`
3. **Можно добавить в Xcode** через URL
4. **Все файлы на месте** в правильной структуре

## 📁 Финальная структура репозитория

```
Onboardings/
├── Package.swift
├── README.md
├── .gitignore
└── Sources/
    └── Onboardings/
        ├── Models/
        │   ├── OnboardingConfiguration.swift
        │   └── OnboardingPage.swift
        ├── Views/
        │   ├── OnboardingView.swift
        │   ├── ConfigurableOnboardingView.swift
        │   ├── OnboardingStartView.swift
        │   ├── OnboardingSecondView.swift
        │   ├── ...
        │   ├── OnboardingTwentyFiveView.swift
        │   ├── OnboardingAssignmentView.swift
        │   └── OnboardingPaywall.swift
        ├── Extensions/
        │   ├── Colors + Extensions.swift
        │   └── Font+Extensions.swift
        ├── Resources/
        │   ├── Assets.xcassets/
        │   └── Fonts/
        └── Onboardings.swift
```

## 🎯 Готово!

Теперь ваша библиотека доступна как SPM пакет! 🎉






