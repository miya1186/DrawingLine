//
//  ViewController.swift
//  DrawingLine
//
//  Created by miyazawaryohei on 2020/10/10.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let drawImage = drawLine()
        let drawView = UIImageView(image: drawImage)
        view.addSubview(drawView)
    }
    
    func drawLine() -> UIImage{
        var pointList = Array<CGPoint>()
        //点の個数
        let pointCount = 20
        let dx = Int(view.frame.height)/pointCount
        let height = UInt32(view.frame.height)/2
        
        for n in 1...pointCount{
            let px = CGFloat(dx * n)
            let py = CGFloat(arc4random_uniform(height) + 50)
            let point = CGPoint(x:px,y:py)
            pointList.append(point)
            
        }
        
        let size = view.bounds.size
        UIGraphicsBeginImageContextWithOptions(size, false, 1.0)
        
        let drawPath = UIBezierPath()
        drawPath.move(to: pointList[0])
        pointList.removeFirst()
        for pt in pointList {
            drawPath.addLine(to: pt)
        }
        
        UIColor.blue.setStroke()
        drawPath.lineWidth = 2.0
        drawPath.lineJoinStyle = .round
        drawPath.setLineDash([4.0,2.0], count: 2, phase: 0.0)
        drawPath.stroke()
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
}

