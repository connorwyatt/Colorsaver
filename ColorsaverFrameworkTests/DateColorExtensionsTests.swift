import XCTest
@testable import ColorsaverFramework

class DateColorExtensionsTests: XCTestCase {

  func test_date_has_a_color_representation()
  {
    let testData: [(NSColor, NSColor)] = [
      (
        dateColorFor(hour: 0, minute: 0, second: 0),
        NSColor(red: 0, green: 0, blue: 0, alpha: 1)
      ),
      (
        dateColorFor(hour: 2, minute: 5, second: 7),
        NSColor(red: 0.007843137255, green: 0.01960784314, blue: 0.02745098039, alpha: 1)
      ),
      (
        dateColorFor(hour: 10, minute: 10, second: 10),
        NSColor(red: 0.06274509804, green: 0.06274509804, blue: 0.06274509804, alpha: 1)
      ),
      (
        dateColorFor(hour: 23, minute: 59, second: 59),
        NSColor(red: 0.137254902, green: 0.3490196078, blue: 0.3490196078, alpha: 1)
      )
    ]

    testData.forEach { (actualColor, expectedColor) in
      XCTAssertEqual(actualColor, expectedColor)
    }
  }

  private func dateColorFor(hour: Int, minute: Int, second: Int) -> NSColor
  {
    let calendar = Calendar(identifier: .gregorian)

    let dateComponents = DateComponents(
      calendar: calendar,
      timeZone: TimeZone(secondsFromGMT: 0),
      era: nil,
      year: 2017,
      month: 1,
      day: 1,
      hour: hour,
      minute: minute,
      second: second,
      nanosecond: 0,
      weekday: nil,
      weekdayOrdinal: nil,
      quarter: nil,
      weekOfMonth: nil,
      weekOfYear: nil,
      yearForWeekOfYear: nil)

    return calendar.date(from: dateComponents)!.color
  }

}
