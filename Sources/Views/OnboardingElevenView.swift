
import SwiftUI

public struct OnboardingElevenView: View {
    let onNext: () -> Void
    
    public init(onNext: @escaping () -> Void) {
        self.onNext = onNext
    }
    
    public var body: some View {
        ZStack {
            Color.appBackground.ignoresSafeArea()
            AppGradient.lightScrim.ignoresSafeArea()
        }
    }
}
