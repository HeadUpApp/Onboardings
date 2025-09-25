import SwiftUI

public struct ReviewView: View {
    let onNext: () -> Void
    @State private var showReviewIndices: [Bool] = [false, false, false]
    
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
                        Image(.review)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 300, height: 128)
                            .padding(.top, 33)
                        
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
            // Запускаем анимацию с задержкой для каждого элемента
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
