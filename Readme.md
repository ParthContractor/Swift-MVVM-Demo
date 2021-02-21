
*******SWAPI*******

The goal is to create a simple iOS app for the SWAPI API (https://swapi.dev/).

The app should display:
• A list of the movies with the most recent movie being displayed first.
• When selecting a movie, it should bring up their information such as release year,
director and producer…
• A separate section should display the list of the characters appearing in that movie.
• UX / UI is left to your discretion but will be considered.

The app must:
• Follow Swift/iOS best practices.
• Use the MVVM pattern.
• Implement an intelligent caching system for data.
• Be properly documented.
• Include unit testing.

<---Code Overview--->
• MVVM pattern is being used for overall architecture of the application along with modular classes/helper methods/extensions as and when required
• Code is supported by unit test cases with test coverage more than 60%
• Swift generics and decodable is used as part of reusability/simplicity/redability within code
• No storyboards being used however seperate view controllers with xibs are being used for modularity and seperation concerns.
• Necessary constants are defined in Constants.swift file.
• For caching, NSCache in-memory caching mechanism is being used.
• Every time application launches. fresh data is being consumed through API and no cached or local data storage comes into picture until first download.
• Specifically,  movies data are consumed once only with provision to refresh the data by user interaction.
• Also,  characters specifc to movie are cached which gives us a great benefit while navigating back and forth to the same movie details screen.
• On refresh. we are removing old cached data and caching latest one.








