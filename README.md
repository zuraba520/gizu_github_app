# gizu_github_app

A Flutter project on github.

Flutter 3.10.0

``` dart
# github api 
final query = 'Search epository name';
final _host = 'https://api.github.com';
final url = '_host/search/repositories?per_page=100&sort=stars&q=$query';
```

## Test Task for Flutter Developer
### Minimum Requirements


Create a mobile application based on the Flutter framework. The application should have three
separate pages (routes), Landing (home), Details, and Favorites.


● Landing page should provide the ability to enter a search string and perform a search.
As part of the search process, the page should query Github API for available
repositories matching the string and display the results.

● Clicking the result should navigate the user to the second page, which will display
detailed information about the selected repository.

● Add an ability to favorite/unfavorite repository, then display content on the corresponding
page. Consider using a hive database to access/preload and manipulate repositories
while offline.


Considerations:
--------------
● Follow Material Design guidelines and use its components(M3 if available)

● Use a provider package for state management.

● Make sure that code is formatted properly and suits flutter_lints rules.

● Try to follow best practises, write easily readable code.

● Show user-friendly messages while service fails or returns an error, also consider
logging the message for further debugging.
The purpose of the test task is to demonstrate your skills in writing code. Some parts of the Test
Task are intentionally vague. Details of the implementation you need to figure out yourself. We
value your creativity and problem-solving skills.


Bonus
-----

As a bonus or extra, please complete any (or all) of the following:

● Use Debouncing technique when performing the search.

● Use named routes for navigation.

● Provide an option to display results in Grid or List format.

● Make at least one page adaptive (landscape/portrait)

● Implement Dark/Light themes and save preferred themes locally.

● Add animations to the application.

● Implement a splash screen to fetch/load crucial data before the main page shows up.


~~ Thanks for visiting! ~~
