# The Weather app

The Weather app is an app for retrieving current weather details for a certain location. This weather information is retrieved from [Weather api][weather_api_url]. I have chosen this API because of the following points:
- Easy to use 
- Has a nice control over the API to just include or exclude certain paramter from response ( like graphQL)
- adopts with HTTPS
- can search by address and retrieve weather through only one API 

### Design Pattern

I have applied MVC pattern in project + separated modules for:
- StartupManager : configuring start up of the app including configuring , intializing third party framework and setting configuration mode ( developement or production)
- LocationManager : Module for Location permission and getting location
- APIClient : handler for consuming API


## Installation

Weather app requires cocoapods


```sh
cd theweatherapp_EPIC
pod install 
```

## TODO: 
- autocomplete for address: add automcomplete from google map SDK to the Location input 
- forcast until next week: for the selected location , a new api should be called to retrieve forecast for the next 7 days
- update in UI design : update in location input screen 
    
## License

MIT

**Free Software, Hell Yeah!**

[//]: # (These are reference links used in the body of this note and get stripped out when the markdown processor does its job. There is no need to format nicely because it shouldn't be seen. Thanks SO - http://stackoverflow.com/questions/4823468/store-comments-in-markdown-syntax)
   [weather_api_url]: <http://daringfireball.net/projects/markdown/>

