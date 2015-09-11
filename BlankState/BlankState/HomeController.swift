//
//  MasterViewController.swift
//  BlankState
//
//  Created by Jeffrey Kereakoglow on 9/11/15.
//  Copyright © 2015 Alexis Digital. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
  var model: HomeModel?

  @IBOutlet weak var blankStateView: UIView?
  @IBOutlet weak var tableView: UITableView?

  override func viewDidLoad() {
    super.viewDidLoad()

    model = HomeModel(controller: self)
    tableView?.dataSource = model
  }
}

extension HomeController {
  @IBAction func buttonAction(_: UIButton) {
    guard let unwrapped = model else {
      assertionFailure("\n\n  model is nil.\n\n")
      return
    }

    unwrapped.dataSource = ["Lorem ipsum dolor sit amet",
      "consectetuer adipiscing elit",
      "Aenean commodo ligula eget dolor",
      "Aenean massa",
      "Cum sociis natoque penatibus et magnis dis parturient montes",
      "nascetur ridiculus mus",
      "Donec quam felis",
      "ultricies nec",
      "pellentesque eu",
      "pretium quis",
      "sem"
    ]

    // In a real project, you ought to move this routine to viewDidLoad() or
    // viewWillAppear() depending upon your app's implementation.
    if let x = unwrapped.dataSource  where x.count > 1 {
      
      // Fade the blank state view out
      UIView.animateWithDuration(0.5,
        animations: {[unowned self]() in self.blankStateView?.alpha = 0.0},
        completion: {[unowned self] (aBool: Bool) in
          self.blankStateView?.removeFromSuperview()

          // Reload the table prior to animation
          self.tableView?.reloadData()

          // Fade the table view in
          UIView.animateWithDuration(0.5,
            animations: {[unowned self]() in self.tableView?.alpha = 1.0},
            completion: nil
          )
        }
      )
    }
  }
}
