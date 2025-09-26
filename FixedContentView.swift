import SwiftUI
import Onboardings

struct ContentView: View {
    @State private var showOnboarding = !UserDefaults.standard.bool(forKey: "onboardingCompleted")
    
    var body: some View {
        if showOnboarding {
            ConfigurableOnboardingView(
                configuration: OnboardingConfiguration.stand,
                onComplete: {
                    // Сохраняем, что онбординг завершен
                    UserDefaults.standard.set(true, forKey: "onboardingCompleted")
                    showOnboarding = false
                }
            )
        } else {
            smallView()
        }
    }
    
    private func smallView() -> some View {
        VStack {
            Text("Добро пожаловать!")
                .font(.title)
                .padding()
            
            Text("Онбординг завершен")
                .foregroundColor(.secondary)
            
            Button("Сбросить онбординг") {
                UserDefaults.standard.set(false, forKey: "onboardingCompleted")
                showOnboarding = true
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
