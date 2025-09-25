import SwiftUI

// MARK: - Public API
public struct Onboardings {
    @MainActor public static func createOnboardingView(onComplete: @escaping () -> Void) -> some View {
        OnboardingView(onComplete: onComplete)
    }
    
    @MainActor public static func createConfigurableOnboardingView(
        configuration: OnboardingConfiguration,
        onComplete: @escaping () -> Void
    ) -> some View {
        ConfigurableOnboardingView(configuration: configuration, onComplete: onComplete)
    }
}
