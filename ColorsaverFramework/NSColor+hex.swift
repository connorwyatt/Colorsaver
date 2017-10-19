extension NSColor
{

  var hexString: String
  {
    let red = Int(round(redComponent * 0xFF))
    let green = Int(round(greenComponent * 0xFF))
    let blue = Int(round(blueComponent * 0xFF))
    let hexString = NSString(format: "#%02X%02X%02X", red, green, blue)
    return hexString as String
  }

}
