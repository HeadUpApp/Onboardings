import SwiftUI
import Onboardings

struct ContentView: View {
    @AppStorage("onboardingCompleted") private var onboardingCompleted = false
    
    var body: some View {
        if !onboardingCompleted {
            ConfigurableOnboardingView(
                configuration: OnboardingConfiguration.stand,
                onComplete: {
                    onboardingCompleted = true
                }
            )
        } else {
            smallView()
        }
    }
    
    private func smallView() -> some View {
        VStack(spacing: 20) {
            Text("🎉 Добро пожаловать!")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Онбординг успешно завершен")
                .font(.title2)
                .foregroundColor(.secondary)
            
            Button("🔄 Показать онбординг снова") {
                onboardingCompleted = false
            }
            .buttonStyle(.borderedProminent)
            .padding()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
