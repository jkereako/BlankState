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

    // TODO: Check for presence of data
    // In your project, this is where you ought to check for the presence of
    // data. If data exists, then remove the blankStateView from the super view.

    model = HomeModel(controller: self)
    tableView?.dataSource = model
  }

  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)

    if let aModel = model where aModel.dataSource == nil {
      let storyBoard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())

      guard let blank = storyBoard.instantiateViewControllerWithIdentifier("blank")
        as? BlankController else {
          assertionFailure("\n\n  Expected a BlankController.\n\n")
          return
      }

      blank.delegate = self

      // Present the view controller WITHOUT animation to make it seem as if the presented view
      // controller was actually the root view controller.
      presentViewController(blank, animated: false, completion: nil)
    }
  }
}

extension HomeController: CreateDataDelegate {
  func createData(sender sender: BlankController) {
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
