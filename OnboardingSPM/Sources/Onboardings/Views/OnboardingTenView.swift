import SwiftUI

public struct OnboardingTenView: View {
    let onNext: () -> Void
    @State private var showContent = false
    @State private var showGraphic = false
    @State private var showButton = false
    
    public init(onNext: @escaping () -> Void) {
        self.onNext = onNext
    }
    
    public var body: some View {
        GeometryReader { geometry in
            let screenHeight = geometry.size.height
            let screenWidth = geometry.size.width
            
            ZStack {
                Color.appBackground.ignoresSafeArea()
                AppGradient.lightScrim.ignoresSafeArea()
                
                VStack {
                    textContent
                        .font(.interMedium(size: 34))
                        .kerning(0.36)
                        .foregroundStyle(Color.white)
                        .multilineTextAlignment(.leading)
                        .padding(.top, 16)
                        .padding(.leading, 16)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .offset(y: showContent ? 0 : -50)
                        .opacity(showContent ? 1 : 0)
                    
                    HStack(alignment: .bottom) {
                        VStack(spacing: 0) {
                            Image(bundleResource: "walkingMan")
                                .resizable()
                                .frame(maxWidth: 26, maxHeight: screenHeight * 0.39)
                                .offset(y: showGraphic ? 0 : 100)
                                .opacity(showGraphic ? 1 : 0)
                        }
                        
                        Image(bundleResource: "tenViewGraphic")
                            .resizable()
                            .frame(maxWidth: screenWidth * 0.80, maxHeight: screenHeight * 0.39)
                            .offset(y: showGraphic ? 0 : 100)
                            .opacity(showGraphic ? 1 : 0)
                    }
                    .padding(.top, 17)
                    
                    Spacer()
                    
                    Button {
                        onNext()
                    } label: {
                        Text("I understand")
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(PrimaryButtonStyle())
                    .padding(.horizontal, screenWidth * 0.04)
                    .padding(.bottom, screenHeight * 0.01)
                    .offset(y: showButton ? 0 : 50)
                    .opacity(showButton ? 1 : 0)
                }
            }
        }
        .onAppear {
            // Анимация текста
            withAnimation(.easeOut(duration: 0.6)) {
                showContent = true
            }
            
            // Анимация графики с задержкой
            withAnimation(.easeOut(duration: 0.6).delay(0.3)) {
                showGraphic = true
            }
            
            // Анимация кнопки с дополнительной задержкой
            withAnimation(.easeOut(duration: 0.6).delay(0.6)) {
                showButton = true
            }
        }
    }
    
    private var textContent: Text {
        let part1 = Text("But the rest is the\n")
        let part2 = Text("active waking life. And\n")
        let part3 = Text("we can ")
        let part4 = Text("influence ")
            .foregroundStyle(AppGradient.textPrimary)
            .font(.interMedium(size: 34))
        let part5 = Text("it.")
        
        return part1 + part2 + part3 + part4 + part5
    }
}
