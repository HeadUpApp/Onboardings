import SwiftUI

public struct RateOurAppView: View {
    let onNext: () -> Void
    @State private var showReviewIndices: [Bool] = [false, false, false]
    @State private var showContent = false
    
    public init(onNext: @escaping () -> Void) {
        self.onNext = onNext
    }
    
    public var body: some View {
        GeometryReader { geometry in
            let screenHeight = geometry.size.height
            let screenWidth = geometry.size.width
            ZStack {
                Color.appBackground.ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 0) {
                        ZStack {
                            VStack(spacing: 6){
                                Text("Rate Our App")
                                    .font(.interMedium(size: 30))
                                    .foregroundStyle(Color.white)
                                    .offset(y: showContent ? 0 : -50)
                                    .opacity(showContent ? 1 : 0)
                                
                                Text("Every review helps us create a better\n HeadUp experience.")
                                    .font(.interMedium(size: 16))
                                    .foregroundStyle(Color.white.opacity(0.5))
                                    .multilineTextAlignment(.center)
                                    .offset(y: showContent ? 0 : -50)
                                    .opacity(showContent ? 1 : 0)
                                
                                Image(bundleResource: "review")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 300, height: 128)
                                    .offset(y: showContent ? 0 : -50)
                                    .opacity(showContent ? 1 : 0)
                            }
                            
                            Image(bundleResource: "rateOurApp")
                                .resizable()
                                .scaledToFill()
                                .frame(maxWidth: .infinity)
                                .frame(maxHeight: screenHeight * 0.2)
                                .padding(.bottom, 33)
                                .offset(y: showContent ? 0 : -50)
                                .opacity(showContent ? 1 : 0)
                        }
                        .padding(.bottom, 53)
                        
                        VStack(spacing: 0) {
                            textContent
                                .font(.interMedium(size: 24))
                                .foregroundStyle(Color.white)
                                .multilineTextAlignment(.center)
                                .offset(y: showContent ? 0 : -50)
                                .opacity(showContent ? 1 : 0)
                            
                            Image(bundleResource: "people")
                                .resizable()
                                .frame(width: 322, height: 68)
                                .padding(.top, 14)
                                .offset(y: showContent ? 0 : -50)
                                .opacity(showContent ? 1 : 0)
                            
                            textContentSecondary
                                .foregroundStyle(Color.white.opacity(0.5))
                                .multilineTextAlignment(.center)
                                .padding(.top, 16)
                                .offset(y: showContent ? 0 : -50)
                                .opacity(showContent ? 1 : 0)
                        }
                        .padding(.bottom, 28)
                        
                        VStack(spacing: 10) {
                            // Первый отзыв
                            Image(bundleResource: "firstman")
                                .resizable()
                                .scaledToFit()
                                .frame(width: screenWidth * 0.9, height: screenHeight * 0.3)
                                .offset(y: showReviewIndices[0] ? 0 : -100)
                                .opacity(showReviewIndices[0] ? 1 : 0)
                            
                            // Второй отзыв
                            Image(bundleResource: "secondgirl")
                                .resizable()
                                .scaledToFit()
                                .frame(width: screenWidth * 0.9, height: screenHeight * 0.3)
                                .offset(y: showReviewIndices[1] ? 0 : -100)
                                .opacity(showReviewIndices[1] ? 1 : 0)
                            
                            // Третий отзыв
                            Image(bundleResource: "thirdMan")
                                .resizable()
                                .scaledToFit()
                                .frame(width: screenWidth * 0.9, height: screenHeight * 0.3)
                                .offset(y: showReviewIndices[2] ? 0 : -100)
                                .opacity(showReviewIndices[2] ? 1 : 0)
                        }
                    }
                }

                VStack {
                    Spacer()
                    Image(bundleResource: "newShadow")
                        .resizable()
                        .frame(height: screenHeight * 0.2)
                        .frame(maxWidth: .infinity)
                }
                .ignoresSafeArea()

                VStack {
                    Spacer()
                    Button {
                        onNext()
                    } label: {
                        Text("Continue")
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(PrimaryButtonStyle())
                    .padding(.horizontal, 16)
                }
            }
        }
        .onAppear {
            // Анимация верхнего контента
            withAnimation(.easeOut(duration: 0.6)) {
                showContent = true
            }
            
            // Последовательная анимация отзывов
            withAnimation(.easeOut(duration: 0.6).delay(0.3)) {
                showReviewIndices[0] = true
            }
            withAnimation(.easeOut(duration: 0.6).delay(0.5)) {
                showReviewIndices[1] = true
            }
            withAnimation(.easeOut(duration: 0.6).delay(0.7)) {
                showReviewIndices[2] = true
            }
        }
    }
    
    private var textContent: Text {
        let part1 = Text("HeadUp is designed for\n")
        let part2 = Text("people ")
        let part3 = Text("like you.")
            .foregroundStyle(AppGradient.textPrimary)
            .font(.interMedium(size: 24))
        return part1 + part2 + part3
    }
    
    private var textContentSecondary: Text {
        let part1 = Text("More than")
        let part2 = Text(" 10 000 ")
            .foregroundStyle(Color.white)
            .font(.interMedium(size: 24))
        let part3 = Text("users every months")
        return part1 + part2 + part3
    }
}
