import SwiftUI
import Onboardings

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Onboarding SPM Library Test")
                .font(.title)
                .padding()
            
            // Пример использования изображения из SPM библиотеки
            Image(bundleResource: "videoView")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
            
            // Пример использования view из библиотеки
            OnboardingStartView {
                print("Onboarding completed!")
            }
        }
    }
}

#Preview {
    ContentView()
}
