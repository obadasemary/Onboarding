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

    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!

    var selectFloorIsSelected: Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()

        selectFloorButton.roundCorners()
        floorsView.roundCorners()

        addNavBarImage()
    }

    func addNavBarImage() {
        let imageView = UIImageView(frame: (CGRect(x: 0, y: 0, width: 40, height: 40)))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage (named: "vngrs_red_logo")
        imageView.image = image
        self.navigationItem.titleView = imageView
    }

    fileprivate func setFloorSelectorInitialScale() {

        let scaleX = selectFloorButton.bounds.width / floorsView.bounds.width
        let scaleY = selectFloorButton.bounds.height / floorsView.bounds.height
        floorsView.transform = CGAffineTransform(scaleX: scaleX, y: scaleY)
    }

    @IBAction func didTapSelectFloor(_ sender: Any) {

        widthConstraint.constant = 200
        heightConstraint.constant = 288

        UIView.animate(withDuration: 0.6) {
            self.view.layoutIfNeeded()
        }
    }

    @IBAction func didTapFloor(_ sender: UIButton) {

        selectFloorButton.setTitle(sender.title(for: .normal), for: .normal)

        widthConstraint.constant = 0
        heightConstraint.constant = 0

        UIView.animate(withDuration: 0.6) {
            self.view.layoutIfNeeded()
        }
    }
}

extension UIView {

    func roundCorners(cornerRadius: CGFloat = 4) {

        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
    }
}
