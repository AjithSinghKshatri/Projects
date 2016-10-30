//: Playground - noun: a place where people can play

import UIKit
import CoreImage

let image = UIImage(named: "sample.png")!

let rgbaImage = RGBAImage(image: image)!

class ImageProcessor
{
    
    func applySomeFilters(transperancy: String,color: String) -> UIImage
    {
        var totalRed=0
        var totalBlue=0
        var totalGreen=0
        for y in 0..<rgbaImage.height
        {
            for x in 0..<rgbaImage.width
            {
                let index = y * rgbaImage.width + x
                var pixel = rgbaImage.pixels[index]
                totalRed += Int(pixel.red)
                totalGreen += Int(pixel.green)
                totalBlue += Int(pixel.blue)
                
                
            }
        }
        let count = rgbaImage.width * rgbaImage.height
        let avgRed = totalRed/count
        let avgBlue = totalBlue/count
        let avgGreen = totalGreen/count
        
        var value = 0
        
        if color == "red"
        {
            if transperancy == "incr"
            {
                value = 0
            }
            else
            {
                value = 1
            }
        }
        else if color == "blue"
        {
            if transperancy == "incr"
            {
                value = 2
            }
            else
            {
                value = 3
            }
        }
        else if color == "green"
        {
            if transperancy == "incr"
            {
                value = 4
            }
            else
            {
                value = 5
            }
        }
        
        
        for y in 0..<rgbaImage.height{
            for x in 0..<rgbaImage.width{
                let index = y * rgbaImage.width + x
                var pixel = rgbaImage.pixels[index]
                
                switch value{
                    
                case 0:
                    let redDiff = Int(pixel.red) - avgRed
                    if(redDiff>0)
                    {
                        pixel.red = UInt8(max(0,min(255, avgRed + redDiff*10)))
                        rgbaImage.pixels[index]=pixel
                    }
                    
                case 1:
                    let redDiff = Int(pixel.red) - avgRed
                    if(redDiff>0)
                    {
                        pixel.red = UInt8(max(0,min(255, avgRed + redDiff/10)))
                        rgbaImage.pixels[index]=pixel
                    }
                    
                case 2:
                    let blueDiff = Int(pixel.blue) - avgBlue
                    if(blueDiff>0)
                    {
                        pixel.blue = UInt8(max(0,min(255, avgBlue + blueDiff*10)))
                        rgbaImage.pixels[index]=pixel
                    }
                case 3:
                    let blueDiff = Int(pixel.blue) - avgBlue
                    if(blueDiff>0)
                    {
                        pixel.blue = UInt8(max(0,min(255, avgBlue + blueDiff/10)))
                    }
                case 4:
                    let greenDiff = Int(pixel.green) - avgGreen
                    if(greenDiff>0)
                    {
                        pixel.green = UInt8(max(0,min(255, avgGreen + greenDiff*25)))
                        rgbaImage.pixels[index]=pixel
                    }
                case 5:
                    let greenDiff = Int(pixel.green) - avgGreen
                    if(greenDiff>0)
                    {
                        pixel.green = UInt8(max(0,min(255, avgGreen + greenDiff*25)))
                        rgbaImage.pixels[index]=pixel
                    }
                default:
                    print("No image changes")
                    
                }
            }
        }
        
        let newImage = rgbaImage.toUIImage()!
        return newImage
        
    }
}
var processor: ImageProcessor = ImageProcessor()
var resultImage:UIImage = processor.applySomeFilters("incr",color: "blue")
