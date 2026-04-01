#if canImport(SwiftUI)
import SwiftUI
import DesignSystemKit

struct DesignSystemDemoView: View {
    @State private var isLoading = false
    @State private var showAlert = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                // Header
                VStack(spacing: 8) {
                    Text("ErsanQ")
                        .font(.system(size: 40, weight: .black))
                        .foregroundColor(.blue)
                    Text("Design System Flagship")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                // Cards & Skeleton
                VStack(alignment: .leading, spacing: 12) {
                    HeaderLabel("Cards & Skeleton")
                    ErsanCard(isLoading: isLoading) {
                        VStack(alignment: .leading, spacing: 12) {
                            HStack {
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                                Text("Feature Highlight")
                                    .fontWeight(.bold)
                            }
                            Text("This card supports integrated skeleton loading shimmer effects when the content is fetching.")
                                .font(.footnote)
                                .foregroundColor(.secondary)
                        }
                        .foregroundColor(.white)
                    }
                }
                
                // Buttons & Haptics
                VStack(alignment: .leading, spacing: 12) {
                    HeaderLabel("Buttons & Interactions")
                    
                    HStack(spacing: 12) {
                        ErsanButton("Primary", icon: "paperplane.fill") {
                            print("Primary action")
                        }
                        
                        ErsanButton("Secondary", isProminent: false) {
                            isLoading.toggle()
                        }
                    }
                }
                
                // Theming
                VStack(alignment: .leading, spacing: 12) {
                    HeaderLabel("Color Tokens")
                    HStack(spacing: 8) {
                        TokenEntry(color: .blue, name: "Primary")
                        TokenEntry(color: .purple, name: "Accent")
                        TokenEntry(color: Color(red: 0.1, green: 0.1, blue: 0.1), name: "Deep Surface")
                    }
                }
            }
            .padding()
        }
    }
}

struct HeaderLabel: View {
    let title: String
    init(_ title: String) { self.title = title }
    var body: some View {
        Text(title)
            .font(.caption)
            .fontWeight(.bold)
            .foregroundColor(.secondary)
            .textCase(.uppercase)
            .padding(.leading, 8)
    }
}

struct TokenEntry: View {
    let color: Color
    let name: String
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(color)
                .frame(width: 80, height: 80)
            Text(name)
                .font(.caption2)
                .foregroundColor(.secondary)
        }
    }
}

#Preview {
    DesignSystemDemoView()
}
#endif
