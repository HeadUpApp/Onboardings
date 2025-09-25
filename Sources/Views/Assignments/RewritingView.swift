import SwiftUI

public struct RewritingView: View {
    let onNext: () -> Void
    @State private var showReviewIndices: [Bool] = [false, false, false]
    @State private var showTitle = false
    
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
                    Text("Rewiring Benefits")
                        .font(.interMedium(size: 36))
                        .foregroundStyle(Color.white)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 16)
                        .offset(y: showTitle ? 0 : -50)
                        .opacity(showTitle ? 1 : 0)
                    
                    VStack(spacing: 10) {
                        // Первый отзыв
                        Image(.firstman)
                            .resizable()
                            .scaledToFit()
                            .frame(width: screenWidth * 0.9, height: screenHeight * 0.3)
                            .offset(y: showReviewIndices[0] ? 0 : -100)
                            .opacity(showReviewIndices[0] ? 1 : 0)
                        
                        // Второй отзыв
                        Image(.secondgirl)
                            .resizable()
                            .scaledToFit()
                            .frame(width: screenWidth * 0.9, height: screenHeight * 0.3)
                            .offset(y: showReviewIndices[1] ? 0 : -100)
                            .opacity(showReviewIndices[1] ? 1 : 0)
                        
                        // Третий отзыв
                        Image(.thirdMan)
                            .resizable()
                            .scaledToFit()
                            .frame(width: screenWidth * 0.9, height: screenHeight * 0.3)
                            .offset(y: showReviewIndices[2] ? 0 : -100)
                            .opacity(showReviewIndices[2] ? 1 : 0)
                    }
                }

                VStack {
                    Spacer()
                    Image(.newShadow)
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
            // Анимация заголовка
            withAnimation(.easeOut(duration: 0.6)) {
                showTitle = true
            }
            
            // Последовательная анимация отзывов
            withAnimation(.easeOut(duration: 0.6).delay(0.2)) {
                showReviewIndices[0] = true
            }
            withAnimation(.easeOut(duration: 0.6).delay(0.4)) {
                showReviewIndices[1] = true
            }
            withAnimation(.easeOut(duration: 0.6).delay(0.6)) {
                showReviewIndices[2] = true
            }
        }
    }
}
