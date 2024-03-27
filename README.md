# Github Search🔍

Flutter application written according to technical specifications for the recruitment process. The application works with API 
technology and contains a local Hive database. Allows user to search for repositories on GitHub by name and save them to the 
favorites list. It also saves the user’s search history.

## Technologies🔧
#### - Flutter
#### - OOP
#### - Hive
#### - API
#### - GitHub
#### - Custom Fonts
  
## Interface💻

When launching the application, the user is greeted with a blue loading screen, which is present until all internal databases 
are loaded. Afterwards the main screen automatically opens.

On the main screen there is an AppBar with the name of the application and a button to go to the favorite repositories screen. 
Below is a search text field. If the user has already used the application, below he will find a list of repositories that he 
was looking for before, if not, the corresponding inscription. When you start a search, the search history is replaced with a 
list of found repositories for the request.

When you click on the button on the AppBar, the user goes to the favorite repositories screen. There is a return button on the 
AppBar of this screen. Below the user can find a list of his favorite repositories saved over the entire period of using the 
application.

## Functionality🕹

The loading screen contains an asynchronous function that initializes Hive and opens boxes with the user's favorite repositories 
and search history. After successful opening, redirects the user to the main screen.

The main screen text field has validation that prevents searching with an empty text field. The search starts after pressing the 
enter button on the device keyboard or after pressing the search button built into the text field. When you enter at least one 
character into a text field, its design changes and a button to clear the text field appears on the right. Clicking this button 
clears the text field and returns to the original design. Clearing the text field manually also returns to the original design.

Below the text field there is one of three widgets:
- Search history when starting the application, up to the moment of the first search after app launch
- Loading widget at the time of execution of the asynchronous data search function on request
- List of search results after entering a query in the text field and clicking the search button

Search history stores a list of the first matching items in the user's search result lists, which are added after each new search.
The list of results found is limited to the first 15 elements of the match list. If there are fewer matches, displays the number 
of matches. If the search does not produce results, the corresponding message is displayed.

Lists of search history repositories, featured repositories, and search results consist of cards. Each found repository has its 
own card, which contains the name of the repository and a button to add/remove the repository to/from the favorites list.

The application saves favorite repositories and if they come up in the search or search history, they are marked as favorites.

The application uses the unique identifiers of the corresponding GitHub repositories as keys for saving repositories in lists.

Application has:
- The ability to view the search history of repositories in subsequent runs of the application
- The possibility to see the list of favorite repositories at subsequent runs of the application
- The ability to show previously favorited repositories in search results list

As a result, we get a project for searching GitHub repositories using API, which can become the foundation for creating a mobile 
application that fully works with GitHub🧐

## Possible future improvements⬆️
- UI update
- Increasing the number of text field validation rules
- Animation improvements
- Storing more information about repositories
- Make repository cards active with certain functions
