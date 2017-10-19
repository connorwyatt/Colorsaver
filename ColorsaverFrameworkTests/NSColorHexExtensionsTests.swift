import XCTest
@testable import ColorsaverFramework

class NSColorHexExtensionsTests: XCTestCase
{

  func test_color_has_hex_string_representation()
  {
    let testData: [(NSColor, String)] = [
      (NSColor(red: 1, green: 1, blue: 1, alpha: 1), "#FFFFFF"),
      (NSColor(red: 0, green: 0, blue: 0, alpha: 1), "#000000"),
      (NSColor(red: 1, green: 0, blue: 0, alpha: 1), "#FF0000"),
      (NSColor(red: 0, green: 1, blue: 0, alpha: 1), "#00FF00"),
      (NSColor(red: 0, green: 0, blue: 1, alpha: 1), "#0000FF"),
      (NSColor(red: 0.001, green: 0.001, blue: 0.001, alpha: 1), "#000000")
    ]

    testData.forEach { (color, expectedHex) in
      XCTAssertEqual(color.hexString, expectedHex)
    }
  }

}
