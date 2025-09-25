
import SwiftUI
import Onboardings

struct ContentView: View {
    @State private var showOnboarding = true
    @State private var onboardingCompleted = false
    
    var body: some View {
        ZStack {
            if showOnboarding {
                ConfigurableOnboardingView(
                    configuration: OnboardingConfiguration.stand,
                    onComplete: {
                        showOnboarding = false
                        onboardingCompleted = true
                    }
                )
            } else {
                MainAppView(onboardingCompleted: onboardingCompleted, showOnboarding: $showOnboarding)
                    .transition(.opacity)
            }
        }
    }
}

struct MainAppView: View {
    let onboardingCompleted: Bool
    @Binding var showOnboarding: Bool
    
    var body: some View {
        VStack(spacing: 30) {
            Image(systemName: "checkmark.circle.fill")
                .imageScale(.large)
                .foregroundStyle(.green)
                .font(.system(size: 60))
            
            Text("Добро пожаловать!")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Онбординг успешно завершен!")
                .font(.title2)
                .foregroundStyle(.secondary)
            
            if onboardingCompleted {
                VStack(spacing: 10) {
                    Text("✅ Все 10 экранов пройдены!")
                        .font(.headline)
                        .foregroundStyle(.green)
                    
                    Text("Вы прошли полный онбординг")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                .padding()
                .background(Color.green.opacity(0.1))
                .cornerRadius(10)
            }
            
            Button("Пройти онбординг снова") {
                withAnimation(.easeInOut(duration: 0.5)) {
                    showOnboarding = true
                }
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}


