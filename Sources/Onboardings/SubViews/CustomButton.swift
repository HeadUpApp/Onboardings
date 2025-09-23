
import SwiftUI

public struct CustomButton: View {
    let title: String
    let action: () -> Void
    let height: CGFloat
    let width: CGFloat
    
    public var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(.white)
                .frame(maxWidth: width, maxHeight: height)
                .background(
                    RoundedRectangle(cornerRadius: 56)
                        .fill(Color.white.opacity(0.05))
                )
        }
    }
}

