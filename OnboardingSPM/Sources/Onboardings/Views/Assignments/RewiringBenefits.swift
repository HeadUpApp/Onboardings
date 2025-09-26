
import SwiftUI

public struct RewiringBenefits: View {
    let onNext: () -> Void
    @State private var isShowingReviews = false
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
                        Text("Rewiring Benefits")
                            .font(.interMedium(size: 36))
                            .foregroundStyle(Color.white)
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity, alignment: .center)
                        
                        Image(bundleResource: "review")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 400, height: 128)
                            .padding(.top, 33)
                        
                        VStack(spacing: 10) {
                            Image(bundleResource: "firstman")
                                .resizable()
                                .scaledToFit()
                                .frame(width: screenWidth * 0.9, height: screenHeight * 0.3)
                                .offset(y: showReviewIndices[0] ? 0 : -100)
                                .opacity(showReviewIndices[0] ? 1 : 0)

                            Image(bundleResource: "secondgirl")
                                .resizable()
                                .scaledToFit()
                                .frame(width: screenWidth * 0.9, height: screenHeight * 0.3)
                                .offset(y: showReviewIndices[1] ? 0 : -100)
                                .opacity(showReviewIndices[1] ? 1 : 0)

                            Image(bundleResource: "thirdMan")
                                .resizable()
                                .scaledToFit()
                                .frame(width: screenWidth * 0.9, height: screenHeight * 0.3)
                                .offset(y: showReviewIndices[2] ? 0 : -100)
                                .opacity(showReviewIndices[2] ? 1 : 0)
                        }
                        .padding(.top, 32)
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
