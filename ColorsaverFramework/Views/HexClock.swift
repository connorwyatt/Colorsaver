import Foundation

public class HexClock: NSView
{

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

  public override func draw(_ dirtyRect: NSRect)
  {
    super.draw(dirtyRect)

    layer?.backgroundColor = Date().color.cgColor

    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
      self.setNeedsDisplay(self.frame)
    }
  }

  private func initialize()
  {
    wantsLayer = true
  }

}
