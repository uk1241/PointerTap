//
//  ViewController.swift
//  PointerImagView
//
//  Created by R Unnikrishnan on 22/10/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    let pointerLoaction = "PointerLocation"
    override func viewDidLoad() {
        super.viewDidLoad()
        let pointerTap =  UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        imageView.addGestureRecognizer(pointerTap)
        loadPointers()
    }
    
    @objc func handleTap(_ gesture:UITapGestureRecognizer)
    {
        let tapLocation = gesture.location(in: imageView)
        print("imageview Tapped\(tapLocation)")
        addRedPointer(at: tapLocation)
        savePointer(tapLocation)
    }
}

extension ViewController
{
    func addRedPointer(at point: CGPoint) {
        let redPointer = UILabel()
        redPointer.text = "X"
        redPointer.textColor = .red
        redPointer.font = UIFont.boldSystemFont(ofSize: 10)
        redPointer.sizeToFit()
        redPointer.center = point
        imageView.addSubview(redPointer)
    }
    func savePointer(_ point: CGPoint)
    {
        var savedPoints = UserDefaults.standard.array(forKey: pointerLoaction) as? [[String: CGFloat]] ?? []
        let pointDict = ["x": point.x, "y": point.y]
        savedPoints.append(pointDict)
        print("savedPoints \(savedPoints)")
        UserDefaults.standard.set(savedPoints, forKey: pointerLoaction)
    }
    
    func loadPointers()
    {
        guard let savedPoints = UserDefaults.standard.array(forKey: pointerLoaction) as? [[String: CGFloat]] else { return }
        for pointDict in savedPoints {
            if let x = pointDict["x"], let y = pointDict["y"] {
                let point = CGPoint(x: x, y: y)
                addRedPointer(at: point)
            }
        }
    }
}
