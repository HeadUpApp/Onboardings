import SwiftUI

public struct OnboardingNineView: View {
    let onNext: () -> Void
    @State private var showContent = false
    @State private var showGraphic = false
    @State private var showNumbers = false
    @State private var showButton = false
    
    public init(onNext: @escaping () -> Void) {
        self.onNext = onNext
    }
    
    public var body: some View {
        GeometryReader { geometry in
            let screenHeight = geometry.size.height
            let screenWidth = geometry.size.width
            let isSmallScreen = screenHeight <= 667
            let isLargeScreen = screenHeight > 812
            
            ZStack {
                Color.appBackground.ignoresSafeArea()
                AppGradient.lightScrim.ignoresSafeArea()
                
                VStack {
                    textContent
                        .font(.interMedium(size: 36))
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
                                .frame(width: 26, height: isLargeScreen ? screenHeight * 0.373 : isSmallScreen ? screenHeight * 0.35 : screenHeight * 0.38)
                                .offset(y: showGraphic ? 0 : 100)
                                .opacity(showGraphic ? 1 : 0)
                            
                            Image(bundleResource: "sleepEmoji")
                                .resizable()
                                .frame(width: 24, height: isLargeScreen ? screenHeight * 0.138 : isSmallScreen ? screenHeight * 0.110 : screenHeight * 0.120)
                                .offset(y: showGraphic ? 0 : 100)
                                .opacity(showGraphic ? 1 : 0)
                            
                            ZStack {
                                Image(bundleResource: "lines")
                                    .resizable()
                                    .frame(width: 14, height: isSmallScreen ? screenHeight * 0.140 : screenHeight * 0.150)
                                    .offset(y: showGraphic ? 0 : 100)
                                    .opacity(showGraphic ? 1 : 0)
                                
                                Text("your\nage")
                                    .font(.interMedium(size: 12))
                                    .foregroundStyle(Color.white)
                                    .offset(y: showGraphic ? 0 : 100)
                                    .opacity(showGraphic ? 1 : 0)
                            }
                            .padding(.bottom, 2)
                        }
                        
                        Image(bundleResource: "nineViewGraphic")
                            .resizable()
                            .frame(maxWidth: screenWidth * 0.80, maxHeight: screenHeight * 0.72)
                            .offset(y: showGraphic ? 0 : 100)
                            .opacity(showGraphic ? 1 : 0)
                    }
                    .padding(.top, isLargeScreen ? 50 : 30)
                    
                    Image(bundleResource: "cifry24")
                        .resizable()
                        .frame(maxWidth: 254, maxHeight: 20)
                        .padding(.leading, 100)
                        .padding(.bottom, 24)
                        .offset(y: showNumbers ? 0 : 50)
                        .opacity(showNumbers ? 1 : 0)
                    
                    Button {
                        onNext()
                    } label: {
                        Text("Good")
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
            
            // Анимация цифр с дополнительной задержкой
            withAnimation(.easeOut(duration: 0.6).delay(0.6)) {
                showNumbers = true
            }
            
            // Анимация кнопки с дополнительной задержкой
            withAnimation(.easeOut(duration: 0.6).delay(0.9)) {
                showButton = true
            }
        }
    }
    
    private var textContent: Text {
        let part1 = Text("But the rest is the\n")
        let part2 = Text("active waking life.")
            .foregroundStyle(AppGradient.textPrimary)
            .font(.interMedium(size: 36))
        
        return part1 + part2
    }
}
