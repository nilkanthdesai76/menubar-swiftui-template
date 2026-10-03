# MenuBar SwiftUI Template 🍏

A production-ready starter architecture for building high-performance macOS menu bar extra utilities using **SwiftUI**, **AppKit** (`NSPanel`), and **Swift Concurrency**.

[![Swift](https://img.shields.io/badge/Swift-5.9%20%7C%206.0-orange?style=flat-square&logo=swift)](https://swift.org)
[![Platform](https://img.shields.io/badge/Platform-macOS%2013%2B-blue?style=flat-square&logo=apple)](https://developer.apple.com/macos)
[![License](https://img.shields.io/badge/License-MIT-lightgrey?style=flat-square)](LICENSE)

---

## Why this template?

While macOS 13+ introduced native SwiftUI `MenuBarExtra`, production utilities often hit roadblocks:
- Standard popovers cannot float borderless or adjust window levels.
- Menus close unpredictably or steal active application focus.
- Advanced window animations, blurred materials, and custom click-outside dismissal are cumbersome with pure SwiftUI.

This template bridges the best of both worlds:
1. **SwiftUI** for the UI, state management, and modern animations.
2. **AppKit (`NSPanel` + `NSStatusItem`)** for exact screen positioning, non-activating window levels, and outside click monitoring.

---

## Architecture

- `MenuBarController`: Coordinates the `NSStatusBar` item, click actions, and screen-relative window anchoring.
- `MenuBarPanel`: A borderless, non-activating `NSPanel` with `.floating` level and multi-space support.
- `ContentView`: Pure SwiftUI component hosted inside `NSHostingView`.
- Global Event Monitor: Automatically dismisses the popover when the user clicks elsewhere on screen.

---

## Quick Start

```sh
# Clone the template
git clone https://github.com/nilkanthdesai76/menubar-swiftui-template.git
cd menubar-swiftui-template

# Build and run
swift run
```

---

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
