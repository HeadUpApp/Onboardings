import SwiftUI
import Onboardings

struct OnboardingTestView: View {
    @State private var showOnboarding = true
    
    var body: some View {
        ZStack {
            if showOnboarding {
                OnboardingView {
                    print("🎉 Онбординг завершен!")
                    withAnimation {
                        showOnboarding = false
                    }
                }
            } else {
                VStack(spacing: 20) {
                    Text("🎉 Тест успешен!")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Text("SPM пакет работает корректно")
                        .font(.title2)
                        .foregroundStyle(.secondary)
                    
                    Button("Повторить тест") {
                        withAnimation {
                            showOnboarding = true
                        }
                    }
                    .buttonStyle(.borderedProminent)
                }
                .padding()
            }
        }
    }
}

#Preview {
    OnboardingTestView()
}







