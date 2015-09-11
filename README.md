# The Blank State
Displays a view indicating to the user that no data exists and gives the user an
option to add data. All of the views are defined in a Storyboard scene.

<img src="https://raw.githubusercontent.com/jkereako/blank-state/master/blank-view.png" alt="Document list" width="320" height="568" />

<img src="https://raw.githubusercontent.com/jkereako/blank-state/master/data-view.png" alt="Document list" width="320" height="568" />

# Usage
The blank state view must be a `UIView` which is a child view of the main view
of a `UIViewController`. This must always be the case. Storyboard will not allow
you to place a `UIView` over a table view in a `UITableViewController` scene.

The blank state view must be a sibling of the data view.  Once the data is
loaded, *remove it from the super view*. Don't just hide the view, remove it to
free up resources.

Going forward, when the app has a good supply of data, check for the presence of
said data and remove the blank state view from the view hierarchy as soon as
possible.

# Credit
The idea for this project came from [DNZEmptyDataSet](dnz). The code for that
project is over 900 lines long and did not contain a single Storyboard. I
thought it was overdone, so I made a simpler, more visual solution. My version
does require that you, the developer, adapt my idea to your project whereas
[dzenbot's][dzenbot] project allows you to use it immediately.

[dzenbot]: https://github.com/dzenbot
[dnz]: https://github.com/dzenbot/DZNEmptyDataSet
