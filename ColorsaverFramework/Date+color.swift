import Foundation

public extension Date
{

  public var color: NSColor
  {
    let dateComponents = Calendar.current.dateComponents(
      in: TimeZone.current,
      from: self)

    let valueLimit: CGFloat = 255

    return NSColor(
      red: CGFloat(convert(hex: dateComponents.hour!)) / valueLimit,
      green: CGFloat(convert(hex: dateComponents.minute!)) / valueLimit,
      blue: CGFloat(convert(hex: dateComponents.second!)) / valueLimit,
      alpha: 1)
  }

  private func convert(hex: Int) -> Int
  {
    return Int(String(hex), radix: 16)!
  }

}
