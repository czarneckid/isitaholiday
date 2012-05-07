# Is it a holiday?

This is an API to check if it is a holiday.

## API

It has one endpoint you care about:

```
/api/v1/check/:holiday/
```

The API will also accept a `timezone` parameter to check to see if it's still a holiday in the timezone where you live!

All API responses are in JSON.

Sample endpoints and JSON responses:

[http://isitaholiday.herokuapp.com/api/v1/check/cincodemayo/](http://isitaholiday.herokuapp.com/api/v1/check/cincodemayo/)

```
{"status":true,"name":"Cinco de Mayo"}
```

[http://isitaholiday.herokuapp.com/api/v1/check/cincodemayo?timezone=Asia/Kathmandu](http://isitaholiday.herokuapp.com/api/v1/check/cincodemayo?timezone=Asia/Kathmandu)

```
{"status":true,"name":"Cinco de Mayo"}
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Copyright

Copyright (c) 2012 David Czarnecki. See LICENSE for further details.