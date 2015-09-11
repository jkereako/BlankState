# The Blank State
This project is a simple example of how to communicate to users that no data
exists. All of the views are defined in a Storyboard scene.

<img src="https://raw.githubusercontent.com/jkereako/blank-state/master/blank-view.png" alt="Document list" width="320" height="568" />

<img src="https://raw.githubusercontent.com/jkereako/blank-state/master/data-view.png" alt="Document list" width="320" height="568" />

The blank state view is intended to be a simple, static view which conveys 1
message: the app does not have any data to operate on.

# Usage
As previously mentioned, this is only an example. Use this project as a guide to
designing a blank state view for your app. Below are some general guidelines to
follow when creating a blank state view.

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
The idea for this project came from [DNZEmptyDataSet][repo]. He had a fabulous
idea, but the code for that project is over 900 lines long and does not contain
a single Storyboard.

The difference between both projects is my version requires that you, the
developer, adapt my idea to your project whereas [dzenbot's][dzenbot] project
allows you to use it immediately. His is more user-friendly, but it's also more
complex. This is always the case with frameworks.

[dzenbot]: https://github.com/dzenbot
[repo]: https://github.com/dzenbot/DZNEmptyDataSet
