import SwiftUI
import Combine

public struct LoadingView: View {
    @State private var progress: CGFloat = 0.0
    @State private var currentMainTextIndex = 0
    @State private var currentSubTextIndex = 0
    
    
    let subTexts = [
        "Estimating lifetime phone usage…",
        "Estimating your potential time saved…"
    ]
    
    let onComplete: () -> Void
    
    // Publishers for switching text
    private let mainTextTimer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    private let subTextTimer = Timer.publish(every: 1.5, on: .main, in: .common).autoconnect()
    
    public init(onComplete: @escaping () -> Void) {
        self.onComplete = onComplete
    }
    
    public var body: some View {
        ZStack {
            Color.appBackground.ignoresSafeArea()
            AppGradient.lightScrim.ignoresSafeArea()
            
            VStack {
                // Main text animation
                Text("Calculating...")
                    .font(.interMedium(size: 34))
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.leading, 16)
                    .padding(.bottom, 24)
                
                // Progress bar
                ZStack(alignment: .leading) {
                    Rectangle()
                        .fill(Color.appPoloska)
                        .frame(height: 8)
                        .cornerRadius(4)
                    
                    Rectangle()
                        .fill(AppGradient.buttonSimple)
                        .frame(width: max(0, progress * UIScreen.main.bounds.width - 32), height: 8)
                        .cornerRadius(4)
                        .animation(.linear(duration: 4.0), value: progress)
                }
                .padding(.horizontal, 16)
                
                // Sub text animation
                Text(subTexts[currentSubTextIndex])
                    .font(.interMedium(size: 17))
                    .foregroundStyle(Color.white.opacity(0.5))
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.top, 24)
                    .id(currentSubTextIndex)
                    .transition(.opacity) // Убрана scale анимация
                    .animation(.easeInOut(duration: 0.6), value: currentSubTextIndex)
            }
        }
        .onAppear {
            progress = 1.0
            DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                onComplete()
            }
        }
        .onReceive(subTextTimer) { _ in
            // Без анимации для subTexts
            currentSubTextIndex = (currentSubTextIndex + 1) % subTexts.count
        }
    }
}
