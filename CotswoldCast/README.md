#  CotswoldCast

You can build and run this in Xcode 12. Minimum iOS version for deployment is iOS 14.0

The app will tell you the weather forecast in the lovely Cotswolds region of the United Kingdom, in 3 hour increments (8 per 24h day)
over the next 5 days.

It will summarise the weather for easy reading.

### Ideas for first version

- parse data for human consumption, map the open weather map data to a more human readable form
- weather will be divided into 'period' structs, each mapped to a 3h period
- the structs will hold: time, temperature, feels like, min and max and humidity
- also, weather icon name, weather description, cloud cover (%), wind speed, wind direction, rain probability, rain amount, isDaytime
- basic unit tests for the above parsing

- sideways scrolling display for a day
- vertical scrolling for each day? or some kind of tabs to switch days?


### Future work

If you wanted to flesh this out, further work might be:
- simple UI tests
- internationalisation
- work on the accessibility elements of the app, e.g. voice over
- a more complex, animated layout, using something like collection view layouts to adjust between a 5 day view and a drill into
much like apple weather and bbc weather do
