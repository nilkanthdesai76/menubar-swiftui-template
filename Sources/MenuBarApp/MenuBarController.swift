import AppKit
import SwiftUI

@MainActor
public final class MenuBarController: NSObject {
    private var statusItem: NSStatusItem?
    private var panel: MenuBarPanel?
    private var eventMonitor: Any?

    public override init() {
        super.init()
        setupStatusItem()
        setupPanel()
    }

    private func setupStatusItem() {
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        if let button = statusItem?.button {
            button.image = NSImage(systemSymbolName: "command", accessibilityDescription: "MenuBar Utility")
            button.target = self
            button.action = #selector(togglePanel)
        }
    }

    private func setupPanel() {
        let hostingView = NSHostingView(rootView: ContentView(onQuit: {
            NSApplication.shared.terminate(nil)
        }))
        hostingView.frame = NSRect(x: 0, y: 0, width: 296, height: 220)

        panel = MenuBarPanel(contentRect: hostingView.frame)
        panel?.contentView = hostingView
    }

    @objc public func togglePanel() {
        guard let panel = panel, let button = statusItem?.button else { return }

        if panel.isVisible {
            closePanel()
        } else {
            openPanel(relativeTo: button)
        }
    }

    public func openPanel(relativeTo button: NSStatusBarButton) {
        guard let panel = panel, let buttonWindow = button.window else { return }

        let buttonRect = button.convert(button.bounds, to: nil)
        let screenRect = buttonWindow.convertToScreen(buttonRect)

        let panelWidth = panel.frame.width
        let panelHeight = panel.frame.height

        let x = screenRect.midX - (panelWidth / 2.0)
        let y = screenRect.minY - panelHeight - 6

        panel.setFrameOrigin(NSPoint(x: x, y: y))
        panel.makeKeyAndOrderFront(nil)

        // Dismiss when clicking outside
        eventMonitor = NSEvent.addGlobalMonitorForEvents(matching: [.leftMouseDown, .rightMouseDown]) { [weak self] _ in
            self?.closePanel()
        }
    }

    public func closePanel() {
        panel?.orderOut(nil)
        if let monitor = eventMonitor {
            NSEvent.removeMonitor(monitor)
            eventMonitor = nil
        }
    }
}
