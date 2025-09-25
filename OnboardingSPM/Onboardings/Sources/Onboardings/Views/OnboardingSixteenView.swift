import SwiftUI

public struct OnboardingSixteenView: View {
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
                            Image(.dedushka)
                                .resizable()
                                .frame(width: 30)
                                .frame(minHeight: screenHeight * 0.04, maxHeight: isSmallScreen ? screenHeight * 0.14 : screenHeight * 0.17)
                                .offset(y: showGraphic ? 0 : 100)
                                .opacity(showGraphic ? 1 : 0)
                            
                            Image(.programmer)
                                .resizable()
                                .frame(width: 34)
                                .frame(minHeight: screenHeight * 0.04, maxHeight: isLargeScreen ? screenHeight * 0.14 : screenHeight * 0.11)
                                .offset(y: showGraphic ? 0 : 100)
                                .opacity(showGraphic ? 1 : 0)
                            
                            Image(.home)
                                .resizable()
                                .frame(width: 34)
                                .frame(minHeight: screenHeight * 0.04, maxHeight: screenHeight * 0.06)
                                .offset(y: showGraphic ? 0 : 100)
                                .opacity(showGraphic ? 1 : 0)
                        }
                        
                        Image(.sixteenViewGraphic)
                            .resizable()
                            .frame(maxWidth: screenWidth * 0.80, maxHeight: screenHeight * 0.72)
                            .offset(y: showGraphic ? 0 : 100)
                            .opacity(showGraphic ? 1 : 0)
                    }
                    .padding(.top, 23)
                    
                    Image(.cifry18)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: screenWidth * 0.6)
                        .frame(minHeight: screenHeight * 0.01, maxHeight: 20)
                        .padding(.leading, screenWidth * 0.32)
                        .padding(.bottom, 24)
                        .offset(y: showNumbers ? 0 : 50)
                        .opacity(showNumbers ? 1 : 0)
                    
                    Button {
                        onNext()
                    } label: {
                        Text("Not that bad, right?..")
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(PrimaryButtonStyle())
                    .padding(.horizontal, screenWidth * 0.04)
                    .padding(.top, screenHeight * 0.01)
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
        let part1 = Text("Add the years\n")
        let part2 = Text("75 to 90, when life\n")
        let part3 = Text("slows down.")
            .foregroundStyle(AppGradient.textPrimary)
            .font(.interMedium(size: 34))
           
        return part1 + part2 + part3
    }
}
