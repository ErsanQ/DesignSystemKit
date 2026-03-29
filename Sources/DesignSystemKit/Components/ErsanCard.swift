import SwiftUI

/// A container that renders a stylized card in the ErsanQ system.
public struct ErsanCard<Content: View>: View {
    private let content: Content
    private let isLoading: Bool
    
    public init(isLoading: Bool = false, @ViewBuilder content: () -> Content) {
        self.isLoading = isLoading
        self.content = content()
    }
    
    public var body: some View {
        ZStack {
            content
                .opacity(isLoading ? 0 : 1)
            
            if isLoading {
                SkeletonLayer()
            }
        }
        .padding(Ersan.Spacing.medium)
        .background(
            RoundedRectangle(cornerRadius: Ersan.Radius.card)
                .fill(Ersan.Color.secondary.opacity(0.8))
                .overlay(
                    RoundedRectangle(cornerRadius: Ersan.Radius.card)
                        .stroke(Ersan.Color.glassStroke.opacity(0.2), lineWidth: 1)
                )
        )
        .shadow(color: Color.black.opacity(0.3), radius: 15, x: 0, y: 10)
    }
}

private struct SkeletonLayer: View {
    @State private var phase: CGFloat = 0
    
    var body: some View {
        LinearGradient(
            colors: [.white.opacity(0.05), .white.opacity(0.15), .white.opacity(0.05)],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .opacity(0.6)
        .offset(x: phase)
        .onAppear {
            withAnimation(.linear(duration: 1.5).repeatForever(autoreverses: false)) {
                phase = 300
            }
        }
    }
}
