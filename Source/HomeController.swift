//
//  MasterViewController.swift
//  BlankState
//
//  Created by Jeffrey Kereakoglow on 9/11/15.
//  Copyright © 2015 Alexis Digital. All rights reserved.
//

import UIKit

class HomeController: UITableViewController {
  var model: HomeModel?

  override func viewDidLoad() {
    super.viewDidLoad()

    model = HomeModel(controller: self)
    tableView?.dataSource = model
  }

  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)

    // Because BlankController is presented on top of the root view controller, we set everything up
    // in viewDidAppear to make sure that the root view controller is fully initialized and has been
    // added to the view stack
    if let aModel = model where aModel.dataSource == nil {
      let storyBoard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())

      guard let blank = storyBoard.instantiateViewControllerWithIdentifier(
        BlankController.storyboardIdentifier
        ) as? BlankController else {
          assertionFailure("\n\n  Expected a BlankController.\n\n")
          return
      }

      blank.delegate = self

      // Present the view controller WITHOUT animation. This will show the blank state view
      // immediately, giving the impression that it is actually the root view and not a modal view.
      presentViewController(blank, animated: false, completion: nil)

      // You must first present the controller before setting values to its IBOutlets.
      blank.message?.text = "Hello from HomeController."
    }
  }
}


// MARK: - Create data delegate
extension HomeController: BlankControllerDelegate {

  // Respond to an event sent by the blank state view and, if necessary, remove the blank state view
  // from the view controller stack *the same way it was presented*. In this case, because we
  // presented the blank state view with `presentViewController(completion:)`, we must remove it
  // with `dismissViewControllerAnimated(completion:)`
  func buttonPressedAction(sender sender: BlankController) {
    guard let aModel = model else {
      assertionFailure("\n\n  Model is nil.\n\n")
      return
    }

    // Set the datasource for the model.
    aModel.dataSource = ["Lorem ipsum dolor sit amet",
      "consectetuer adipiscing elit",
      "Aenean commodo ligula eget dolor",
      "Aenean massa",
      "Cum sociis natoque penatibus",
      "et magnis dis parturient montes",
      "nascetur ridiculus mus",
      "Donec quam felis",
      "ultricies nec",
      "pellentesque eu",
      "pretium quis",
      "sem"
    ]

    tableView.reloadData()

    sender.dismissViewControllerAnimated(true, completion: nil)
  }
}
