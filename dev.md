2016-06-19
PacMacro
dev
Joshua Wu

# Development Summary
## Summary
## Structure
### Classes
* `LoginScreenController` : Login Screen View Controller
* `MapViewController` : Map View Controller
  * Manages icons and annotations
  * Calls `PacMacroController` to request player list
* `PacMacroController` : Internal Logic
  * Calls `ServerManager` to manage connection
  * Store player list
* `ServerManager` : Server Interaction
