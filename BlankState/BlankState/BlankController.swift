//
//  BlankController.swift
//  BlankState
//
//  Created by Jeff Kereakoglow on 9/12/15.
//  Copyright © 2015 Alexis Digital. All rights reserved.
//

import UIKit

// I can't think of a better name
protocol CreateDataDelegate {
  func createData(sender sender: BlankController)
}

class BlankController: UIViewController {
  var delegate: CreateDataDelegate?
}

// MARK: - Actions
extension BlankController {
  @IBAction func createDataAction(_: UIButton) {
    if let aDelegate = delegate {
      aDelegate.createData(sender: self)
    }
  }
}
