//
//  ViewController.swift
//  March25Exercise2
//
//  Created by Field Employee on 3/25/20.
//  Copyright © 2020 Field Employee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var segmentedOutlet: UISegmentedControl!
  @IBOutlet weak var triangleView: UIView!
  
  @IBAction func indexChanged(_ sender: Any) {
    switch segmentedOutlet.selectedSegmentIndex {
    case 0:
      triangleLayer?.removeFromSuperlayer()
      setUpSquare()
    case 1:
      triangleLayer?.removeFromSuperlayer()
      setUpTriangle()
    case 2:
      triangleLayer?.removeFromSuperlayer()
      setupCircle()
    case 3:
      triangleLayer?.removeFromSuperlayer()
      setupPie()
    default:
      break
    }
  }
  
  var triangleLayer: CAShapeLayer?
  
  func setupPie(){
    let heightWidth = triangleView.frame.size.width
    let circlePath = UIBezierPath(arcCenter: CGPoint(x: triangleView.center.x, y: triangleView.center.y), radius: CGFloat(heightWidth/2), startAngle: CGFloat(Double.pi * 1/6), endAngle: CGFloat(Double.pi * 5/6), clockwise: true)
    circlePath.addLine(to: CGPoint(x:triangleView.center.x, y:triangleView.center.y))
    var arcPath = circlePath.reversing()
    arcPath.addLine(to: CGPoint(x:triangleView.center.x, y:triangleView.center.y))



    let shapeLayer = CAShapeLayer()
    shapeLayer.path = arcPath.cgPath

    // Change the fill color
    shapeLayer.fillColor = UIColor.cyan.cgColor
    // You can change the stroke color
    shapeLayer.strokeColor = UIColor.black.cgColor
    // You can change the line width
    shapeLayer.lineWidth = 3.0

    triangleLayer = shapeLayer
    view.layer.addSublayer(shapeLayer)
  }
  
  
  func setUpTriangle(){
    let heightWidth = triangleView.frame.size.width
    let path = CGMutablePath()

    path.move(to: CGPoint(x: 0, y: heightWidth-120))
    path.addLine(to: CGPoint(x:heightWidth/2, y: heightWidth/2-120))
    path.addLine(to: CGPoint(x:heightWidth, y:heightWidth-120))
    path.addLine(to: CGPoint(x:0, y:heightWidth-120))

    let shape = CAShapeLayer()
    shape.path = path
    shape.fillColor = UIColor.cyan.cgColor
    shape.strokeColor = UIColor.black.cgColor
    shape.lineWidth = 3.0

    
    triangleLayer = shape
    triangleView.layer.insertSublayer(shape, at: 0)
  }
  
  func setUpSquare(){
    let heightWidth = triangleView.frame.size.width
    let path = CGMutablePath()

    path.move(to: CGPoint(x: 0, y: heightWidth-65))
    path.addLine(to: CGPoint(x:0, y: -65))
    path.addLine(to: CGPoint(x:heightWidth, y:-65))
    path.addLine(to: CGPoint(x:heightWidth, y:heightWidth-65))
    path.addLine(to: CGPoint(x:0, y:heightWidth-65))

    let shape = CAShapeLayer()
    shape.path = path
    shape.fillColor = UIColor.cyan.cgColor
    shape.strokeColor = UIColor.black.cgColor
    shape.lineWidth = 3.0
    
    triangleLayer = shape
    triangleView.layer.insertSublayer(shape, at: 0)
  }
  
  func setupCircle() {
    let heightWidth = triangleView.frame.size.width
    let circlePath = UIBezierPath(arcCenter: CGPoint(x: triangleView.center.x, y: triangleView.center.y), radius: CGFloat(heightWidth/2), startAngle: CGFloat(0), endAngle: CGFloat(Double.pi * 2), clockwise: true)

    let shapeLayer = CAShapeLayer()
    shapeLayer.path = circlePath.cgPath

    // Change the fill color
    shapeLayer.fillColor = UIColor.cyan.cgColor
    // You can change the stroke color
    shapeLayer.strokeColor = UIColor.black.cgColor
    // You can change the line width
    shapeLayer.lineWidth = 3.0

    triangleLayer = shapeLayer
    view.layer.addSublayer(shapeLayer)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    segmentedOutlet.insertSegment(withTitle: "Circle", at: 2, animated: false)
    segmentedOutlet.insertSegment(withTitle: "Pie", at: 3, animated: false)
    segmentedOutlet.setTitle("Triangle", forSegmentAt: 1)
    segmentedOutlet.setTitle("Square", forSegmentAt: 0)
  }


}

