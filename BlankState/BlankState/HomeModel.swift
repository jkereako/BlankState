//
//  HomeModel.swift
//  BlankState
//
//  Created by Jeffrey Kereakoglow on 9/11/15.
//  Copyright © 2015 Alexis Digital. All rights reserved.
//

import UIKit

class HomeModel: NSObject {
  let controller: HomeController
  var dataSource: Array<String>?

  init(controller aController: HomeController) {
    controller = aController
  }
}

extension HomeModel: UITableViewDataSource {

  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }

  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if let unwrapped = dataSource {
      return unwrapped.count
    }

    return 0
  }

  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

    guard let cell = tableView.dequeueReusableCellWithIdentifier("cell"),
      data = dataSource else {
      fatalError("\n\n  Unable to compute.\n\n")
    }

    cell.textLabel?.text = data[indexPath.row]

    return cell
  }
}
