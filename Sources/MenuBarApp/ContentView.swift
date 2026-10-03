import SwiftUI

public struct ContentView: View {
    @State private var isEnabled: Bool = true
    @State private var brightness: Double = 0.8
    var onQuit: () -> Void = {}

    public init(onQuit: @escaping () -> Void = {}) {
        self.onQuit = onQuit
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Header
            HStack {
                Label("Status Utility", systemImage: "sparkles")
                    .font(.headline)
                Spacer()
                Button(action: onQuit) {
                    Image(systemName: "power")
                        .foregroundColor(.secondary)
                }
                .buttonStyle(.plain)
                .help("Quit Application")
            }

            Divider()

            // Controls
            Toggle(isOn: $isEnabled) {
                Text("Enable Background Service")
                    .font(.subheadline)
            }
            .toggleStyle(.switch)

            VStack(alignment: .leading, spacing: 6) {
                Text("Intensity")
                    .font(.caption)
                    .foregroundColor(.secondary)

                Slider(value: $brightness, in: 0...1)
            }

            Divider()

            // Footer
            HStack {
                Text("macOS MenuBar Starter")
                    .font(.caption2)
                    .foregroundColor(.secondary)
                Spacer()
                Text("v1.0.0")
                    .font(.caption2)
                    .foregroundColor(.secondary)
            }
        }
        .padding(16)
        .frame(width: 280)
        .background(
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(.ultraThinMaterial)
                .shadow(color: .black.opacity(0.15), radius: 10, x: 0, y: 5)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .stroke(Color.white.opacity(0.2), lineWidth: 1)
        )
        .padding(8)
    }
}
