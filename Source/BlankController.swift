//
//  BlankController.swift
//  BlankState
//
//  Created by Jeff Kereakoglow on 9/12/15.
//  Copyright © 2015 Alexis Digital. All rights reserved.
//

import UIKit

// This protocol simply passes the IBAction along.
protocol BlankControllerDelegate {
  func buttonPressedAction(sender sender: BlankController)
}

class BlankController: UIViewController {
  static let storyboardIdentifier = "blank"
  // Uncomment the image and wire it up if you need it.
//  @IBOutlet weak var image: UIImage?
  @IBOutlet weak var aTitle: UILabel?
  @IBOutlet weak var message: UILabel?

  var delegate: BlankControllerDelegate?
}

// MARK: - Actions
extension BlankController {
  @IBAction func buttonPressedAction(_: UIButton) {
    if let aDelegate = delegate {
      aDelegate.buttonPressedAction(sender: self)
    }
  }
}
