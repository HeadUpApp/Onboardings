import SwiftUI

public struct OnboardingAssignmentView: View {
    let onNext: () -> Void

    public init(onNext: @escaping () -> Void) {
        self.onNext = onNext
    }

    @State public var currentDrawing = DrawingPath()
    @State public var drawings: [DrawingPath] = []
    @State public var clearedDrawings: [DrawingPath] = []
    @State public var showTrashButton = false

    @State public var isFirstConfirmed = false
    @State public var isSecondConfirmed = false
    @State public var isThirdConfirmed = false
    @State public var showErrorMessage = false

    public var body: some View {
        GeometryReader { geometry in
            let screenHeight = geometry.size.height
            let screenWidth = geometry.size.width

            ZStack {
                Color.appBackground.ignoresSafeArea()
                AppGradient.lightScrim.ignoresSafeArea()
                VStack {
                    textContent
                        .font(.interMedium(size: 42))
                        .foregroundStyle(Color.white)
                        .multilineTextAlignment(.leading)
                        .padding(.top, 16)
                        .padding(.bottom, 16)
                        .padding(.leading, 16)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    VStack(spacing: 12) {
                        Text("By signing, I confirm that I will:")
                            .font(.interMedium(size: 17))
                            .foregroundStyle(Color.grayBackground)
                            .frame(maxWidth: .infinity, alignment: .leading)

                        HStack(spacing: 10) {
                            Group {
                                Image(isFirstConfirmed ? "confirm" : "notReady", bundle: .module)
                                    .resizable()
                                    .frame(width: 20, height: 20)

                                Text("Stay in control of my digital habits")
                                    .font(.interMedium(size: 17))
                                    .foregroundStyle(Color.white)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .onTapGesture {
                                isFirstConfirmed.toggle()
                                if allConditionsConfirmed {
                                    showErrorMessage = false
                                }
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)

                        HStack(spacing: 10) {
                            Group {
                                Image(isSecondConfirmed ? "confirm" : "notReady", bundle: .module)
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                Text("Protect my time and energy")
                                    .font(.interMedium(size: 17))
                                    .foregroundStyle(Color.white)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .onTapGesture {
                                isSecondConfirmed.toggle()
                                if allConditionsConfirmed {
                                    showErrorMessage = false
                                }
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)

                        HStack(spacing: 10) {
                            Group {
                                Image(isThirdConfirmed ? "confirm" : "notReady", bundle: .module)
                                    .resizable()
                                    .frame(width: 20, height: 20)

                                Text("Focus on what truly matters.")
                                    .font(.interMedium(size: 17))
                                    .foregroundStyle(Color.white)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .onTapGesture {
                                isThirdConfirmed.toggle()
                                if allConditionsConfirmed {
                                    showErrorMessage = false
                                }
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(.leading, 16)
                    .frame(maxWidth: .infinity, alignment: .leading)

                    ZStack {
                        Color.darkPurple
                        Canvas { context, _ in
                            for drawing in drawings {
                                var path = Path()
                                if let firstPoint = drawing.points.first {
                                    path.move(to: firstPoint)
                                    for point in drawing.points.dropFirst() {
                                        path.addLine(to: point)
                                    }
                                    context.stroke(path, with: .color(.white), lineWidth: 2)
                                }
                            }

                            if !currentDrawing.points.isEmpty {
                                var currentPath = Path()
                                if let firstPoint = currentDrawing.points.first {
                                    currentPath.move(to: firstPoint)
                                    for point in currentDrawing.points.dropFirst() {
                                        currentPath.addLine(to: point)
                                    }
                                    context.stroke(currentPath, with: .color(.white), lineWidth: 2)
                                }
                            }
                        }

                        if drawings.isEmpty && currentDrawing.points.isEmpty {
                            Text("Draw your sign to commit")
                                .font(.interMedium(size: 17))
                                .foregroundStyle(Color.white.opacity(0.4))
                                .multilineTextAlignment(.center)
                        }

                        if showTrashButton && !drawings.isEmpty {
                            VStack {
                                HStack {
                                    Spacer()
                                    Button {
                                        clearSignature()
                                    } label: {
                                        Image(bundleResource: "trash")
                                            .resizable()
                                            .frame(width: 40, height: 40)
                                            .padding(16)
                                    }
                                }
                                Spacer()
                            }
                        }
                    }
                    .frame(maxWidth: screenHeight * 0.8, maxHeight: screenHeight * 0.6)
                    .cornerRadius(16)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.darkGray, lineWidth: 1)
                    )
                    .gesture(
                        DragGesture(minimumDistance: 0)
                            .onChanged { value in
                                let point = value.location
                                currentDrawing.points.append(point)
                                showTrashButton = false
                            }
                            .onEnded { _ in
                                if !currentDrawing.points.isEmpty {
                                    drawings.append(currentDrawing)
                                    currentDrawing = DrawingPath()
                                    showTrashButton = true
                                }
                            }
                    )
                    .padding(.top, 24)
                    .padding(.horizontal, 16)
                    .padding(.bottom, 24)

                    if showErrorMessage {
                        Text("Please select all items before signing.")
                            .font(.interMedium(size: 14))
                            .foregroundStyle(.red)
                            .padding(.horizontal, 16)
                            .padding(.bottom, 8)
                    }

                    Button {
                        if allConditionsConfirmed && !drawings.isEmpty {
                            onNext()
                        } else if !allConditionsConfirmed {
                            showErrorMessage = true
                        }
                    } label: {
                        Text("Sign")
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(PrimaryButtonStyle())
                    .padding(.horizontal, screenWidth * 0.04)
                    .padding(.top, screenHeight * 0.01)
                    .padding(.bottom, screenHeight * 0.01)
                    .opacity(allConditionsConfirmed ? 1.0 : 0.6)
                }
            }
        }
    }

    private var allConditionsConfirmed: Bool {
        return isFirstConfirmed && isSecondConfirmed && isThirdConfirmed
    }

    private func clearSignature() {
        drawings.removeAll()
        currentDrawing = DrawingPath()
        showTrashButton = false
    }

    private var textContent: Text {
        let part1 = Text("Sign your\n")
        let part2 = Text("commitment")
            .foregroundStyle(AppGradient.textPrimary)
            .font(.interMedium(size: 42))

        return part1 + part2
    }
}

public struct DrawingPath {
    var points: [CGPoint] = []
}
