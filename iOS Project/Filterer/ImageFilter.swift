import UIKit
public enum Filtertype {
    case Red(Float)      
    case Green(Float)
    case Blue(Float)

}

public class ImageFilter {
    var rgba: RGBAImage?
    
    public init(image: UIImage) {
        rgba = RGBAImage(image: image)!
    }
    
    public func applyFilter(filter: Filtertype){
        let width: Int = (rgba?.width)!
        let height: Int = (rgba?.height)!
        
        switch filter {
        case .Red(let value):
            for y in 0..<height {
                for x in 0..<width {
                    
                    let index = y * width + x
                    var pixel = (rgba?.pixels[index])!
                    let red: Float = Float(pixel.red) * value
                    let green: Float = 0
                    let blue: Float = 0

                    pixel.red = UInt8(red)
                    pixel.green = UInt8(green)
                    pixel.blue = UInt8(blue)
                    
                    rgba?.pixels[index] = pixel;
                }
            }

        case .Green(let value):
            for y in 0..<height {
                for x in 0..<width {
                    
                    let index = y * width + x
                    var pixel = (rgba?.pixels[index])!
                    let red: Float = 0
                    let green: Float = Float(pixel.green) * value
                    let blue: Float = 0
                    
                    pixel.red = UInt8(red)
                    pixel.green = UInt8(green)
                    pixel.blue = UInt8(blue)
                    
                    rgba?.pixels[index] = pixel;
                }
            }
        case .Blue(let value):
            for y in 0..<height {
                for x in 0..<width {
                    
                    let index = y * width + x
                    var pixel = (rgba?.pixels[index])!
                    let red: Float = 0
                    let green: Float = 0
                    let blue: Float = Float(pixel.blue) * value
                    
                    pixel.red = UInt8(red)
                    pixel.green = UInt8(green)
                    pixel.blue = UInt8(blue)
                    
                    rgba?.pixels[index] = pixel;
                }
            }
                default: break
        }
        
    }
    
    public var image : UIImage? {
        return rgba?.toUIImage()
    }
}
