import SwiftUI

public struct OnboardingFiveView: View {
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
            let isSmallScreen = screenHeight <= 667
            let isLargeScreen = screenHeight > 812
            
            ZStack {
                Color.appBackground.ignoresSafeArea()
                AppGradient.lightScrim.ignoresSafeArea()
                
                VStack(spacing: 0) {
                    // Первая часть текста
                    Text("It's a part of your\nlife that's already ")
                        .font(.interMedium(size: 36))
                        .foregroundStyle(Color.white)
                        .multilineTextAlignment(.leading)
                        .padding(.top, 16)
                        .padding(.leading, 16)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .offset(y: showContent ? 0 : -screenHeight * 0.1) // Смещение сверху
                        .opacity(showContent ? 1 : 0)
                    
                    // Вторая часть текста с градиентом
                    Text("behind you.")
                        .font(.interMedium(size: 36))
                        .foregroundStyle(AppGradient.textPrimary)
                        .multilineTextAlignment(.leading)
                        .padding(.leading, 16)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .offset(y: showContent ? 0 : -screenHeight * 0.1) // Смещение сверху
                        .opacity(showContent ? 1 : 0)
                    
                    // График с изображениями
                    HStack(alignment: .bottom) {
                        ZStack {
                            Image(.lines)
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
                        .padding(.bottom, 22)
                        
                        Image(.fiveViewGraphic)
                            .resizable()
                            .frame(maxWidth: screenWidth * 0.80, maxHeight: isSmallScreen ? screenHeight * 0.64 : screenHeight * 0.72)
                            .offset(y: showGraphic ? 0 : 100)
                            .opacity(showGraphic ? 1 : 0)
                    }
                    .padding(.bottom, 24)
                    .padding(.top, screenHeight * 0.02)
                    
                    Button {
                        onNext()
                    } label: {
                        Text("I understand")
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(PrimaryButtonStyle())
                    .padding(.horizontal, screenWidth * 0.04)
                    .padding(.top, screenHeight * 0.03)
                    .padding(.bottom, screenHeight * 0.01)
                    .offset(y: showButton ? 0 : 50)
                    .opacity(showButton ? 1 : 0)
                }
            }
        }
        .onAppear {
            // Анимация текста сверху вниз
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
}
