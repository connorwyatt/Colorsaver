import Foundation

public class HexClock: NSView
{

  var clock: Clock!
  var time: Date?
  {
    didSet
    {
      guard let time = time else { return }

      clock.time = time

      NSLog(time.color.description)

      layer?.backgroundColor = time.color.cgColor

      setNeedsDisplay(frame)
    }
  }

  public required init?(coder decoder: NSCoder)
  {
    super.init(coder: decoder)

    initialize()
  }

  public init(frame frameRect: NSRect, isPreview: Bool)
  {
    super.init(frame: frameRect)

    initialize()
  }

  private func initialize()
  {
    wantsLayer = true

    clock = Clock(frame: frame)

    addSubview(clock)

    updateTime()
  }

  private func updateTime()
  {
    time = Date()

    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
      self.updateTime()
    }
  }

}
