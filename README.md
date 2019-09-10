# The Stubborn Network Demo

This repository hosts an example project with an iOS application and UITests to highlight how you can make use of [The Stubborn Network](https://github.com/q231950/the-stubborn-network).

## SwiftUI Previews

[ContentView.swift](https://github.com/q231950/the-stubborn-network-demo/blob/master/Demo/ContentView.swift#L25-L32):

```swift
    static var previews: some View {
//        let urlSession = URLSession(configuration: .ephemeral)
        let urlSession = StubbornNetwork.stubbed { (session) in
//            session.recordMode = .recording
            let path = URL(string: ProcessInfo().environment["PROJECT_DIR"]!)!
            session.setupStubSource(name: "ContentView_Previews", path: path)
        }
```

## UI Tests
[SceneDelegate.swift](https://github.com/q231950/the-stubborn-network-demo/blob/master/Demo/SceneDelegate.swift#L18-L27) and 
[DemoUITests.swift](https://github.com/q231950/the-stubborn-network-demo/blob/master/DemoUITests/DemoUITests.swift#L16-L30):

```swift
    override func setUp() {
        super.setUp()

        app.launchEnvironment["TESTING"] = "TESTING"
        app.launchEnvironment["STUB_NAME"] = self.name

        let processInfo = ProcessInfo()
        app.launchEnvironment["STUB_PATH"] = processInfo.environment["PROJECT_DIR"]
        app.launch()
    }

    func testBytesText() {
        let bytesText = app.staticTexts["417 bytes"]
        wait(forElement:bytesText, timeout:2)
    }
```
