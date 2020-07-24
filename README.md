# driver_mobile

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter version of the drivers' mobile application.

## Running the app locally - debug mode
To debug and test the code locally, follow Flutter's [installation and set-up documentation](https://flutter.dev/docs/get-started/install) for your OS and preferred IDE.



## Work Timeline
1. Backend: (24/7)
* move unique id generation to front-end to get records from Drivers collection

2. Sign-up page (24/7)
- account registration option

3. Dashboard: (25/7)
* UI:
	- bottom navbar (navbar.dart)
 	- profile	 (profile.dart)
* initiaize with sending name, email, capacity to backend to update DB; get suitable orders list

4. Splash Screen: (24/7)
* before mount check if user logged in 
* animation

5. Navbar: (25/7)
* UI:
	- default focus on profile
	- rewards - profile - orders - map
* Routing

5. Orders: (26/7)
    *  UI
		- suitable orders list parsed
		- animation
    * Selection + confirmation logic

6. Map: (27-28/7)
    * Google maps-flutter integration
    * Path tracking, with multiplt stop option

7. Reward (optional):
    * Cumulative rewards
