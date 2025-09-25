import SwiftUI

public struct OnboardingEightView: View {
    let onNext: () -> Void
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
                    HStack(alignment: .bottom) {
                        VStack(spacing: 0) {
                            Image(.sleepEmoji)
                                .resizable()
                                .frame(width: 24, height: isLargeScreen ? screenHeight * 0.134 : isSmallScreen ? screenHeight * 0.100 : screenHeight * 0.120)
                                .offset(y: showGraphic ? 0 : 100)
                                .opacity(showGraphic ? 1 : 0)
                            
                            Image(.years25)
                                .resizable()
                                .frame(width: 27, height: isSmallScreen ? screenHeight * 0.140 : screenHeight * 0.150)
                                .offset(y: showGraphic ? 0 : 100)
                                .opacity(showGraphic ? 1 : 0)
                        }
                        
                        Image(.sevenViewGraphic)
                            .resizable()
                            .frame(maxWidth: screenWidth * 0.80, maxHeight: isSmallScreen ? screenHeight * 0.64 : screenHeight * 0.72)
                            .offset(y: showGraphic ? 0 : 100)
                            .opacity(showGraphic ? 1 : 0)
                    }
                    .padding(.top, isSmallScreen ? screenHeight * 0.24 : screenHeight * 0.2)
                    
                    Image(.cifry24)
                        .resizable()
                        .frame(maxWidth: 254, maxHeight: 20)
                        .padding(.leading, 100)
                        .padding(.bottom, 24)
                        .offset(y: showNumbers ? 0 : 50)
                        .opacity(showNumbers ? 1 : 0)
                    
                    Button {
                        onNext()
                    } label: {
                        Text("Oh, okay")
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
            // Анимация графики
            withAnimation(.easeOut(duration: 0.6)) {
                showGraphic = true
            }
            
            // Анимация цифр с задержкой
            withAnimation(.easeOut(duration: 0.6).delay(0.3)) {
                showNumbers = true
            }
            
            // Анимация кнопки с дополнительной задержкой
            withAnimation(.easeOut(duration: 0.6).delay(0.6)) {
                showButton = true
            }
        }
    }
}
