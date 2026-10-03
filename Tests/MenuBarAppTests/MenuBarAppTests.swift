import XCTest
@testable import MenuBarApp

final class MenuBarAppTests: XCTestCase {
    @MainActor
    func testMenuBarPanelConfiguration() {
        let rect = NSRect(x: 0, y: 0, width: 320, height: 400)
        let panel = MenuBarPanel(contentRect: rect)

        XCTAssertFalse(panel.isOpaque)
        XCTAssertEqual(panel.backgroundColor, .clear)
        XCTAssertTrue(panel.hasShadow)
        XCTAssertEqual(panel.level, .floating)
        XCTAssertTrue(panel.collectionBehavior.contains(.canJoinAllSpaces))
        XCTAssertTrue(panel.collectionBehavior.contains(.fullScreenAuxiliary))
        XCTAssertTrue(panel.canBecomeKey)
    }
}
