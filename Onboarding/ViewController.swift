//
//  ViewController.swift
//  Onboarding
//
//  Created by Abdelrahman Mohamed on 9.07.2019.
//  Copyright © 2019 Abdelrahman Mohamed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var selectFloorButton: UIButton!
    @IBOutlet weak var floorsView: UIView!

    var selectFloorIsSelected: Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()

        selectFloorButton.roundCorners()
        floorsView.roundCorners()
        floorsView.isHidden = true
    }

    override func viewDidAppear(_ animated: Bool) {

        super.viewDidAppear(animated)

        floorsView.setAnchorPoint(CGPoint(x: 1.0, y: 1.0))
        setFloorSelectorInitialScale()
    }

    fileprivate func setFloorSelectorInitialScale() {

        let scaleX = selectFloorButton.bounds.width / floorsView.bounds.width
        let scaleY = selectFloorButton.bounds.height / floorsView.bounds.height
        floorsView.transform = CGAffineTransform(scaleX: scaleX, y: scaleY)
    }

    @IBAction func didTapSelectFloor(_ sender: Any) {

        floorsView.isHidden = false

        UIView.animate(withDuration: 0.6) {

            self.floorsView.transform = CGAffineTransform.identity
            self.selectFloorButton.alpha = 0.0
        }
    }

    @IBAction func didTapFloor(_ sender: UIButton) {

        UIView.animate(withDuration: 0.6, animations: {
            self.setFloorSelectorInitialScale()
            self.selectFloorButton.alpha = 1.0
        }, completion: { (isFinished) in

            if isFinished {
                self.floorsView.isHidden = true
            }
        })
    }
}

extension UIView {

    func setAnchorPoint(_ point: CGPoint) {

        var newPoint = CGPoint(x: bounds.size.width * point.x, y: bounds.size.height * point.y)
        var oldPoint = CGPoint(x: bounds.size.width * layer.anchorPoint.x, y: bounds.size.height * layer.anchorPoint.y);

        newPoint = newPoint.applying(transform)
        oldPoint = oldPoint.applying(transform)

        var position = layer.position

        position.x -= oldPoint.x
        position.x += newPoint.x

        position.y -= oldPoint.y
        position.y += newPoint.y

        layer.position = position
        layer.anchorPoint = point
    }

    func roundCorners(cornerRadius: CGFloat = 4) {

        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
    }
}
