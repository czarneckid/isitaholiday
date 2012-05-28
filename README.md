# Is it a holiday?

This is an API to check if it is a holiday.

## API v1

It has one endpoint you care about:

```
/api/v1/check/:holiday/
```

The API will also accept a `timezone` parameter to check to see if 
it's still a holiday in the timezone where you live! The default 
timezone is set to `America/New_York`.

All API responses are in JSON.

Sample endpoints and JSON responses (assuming it actually IS Cinco de Mayo):

[http://isitaholiday.herokuapp.com/api/v1/check/cincodemayo/](http://isitaholiday.herokuapp.com/api/v1/check/cincodemayo/)

```
{"status":true,"name":"Cinco de Mayo"}
```

[http://isitaholiday.herokuapp.com/api/v1/check/cincodemayo?timezone=Asia/Kathmandu](http://isitaholiday.herokuapp.com/api/v1/check/cincodemayo?timezone=Asia/Kathmandu)

```
{"status":true,"name":"Cinco de Mayo"}
```

### Known Holidays

The current list of known holidays. Format is :holiday - Full holiday name.

* `cincodemayo` - Cinco de Mayo
* `halloween` - Halloween
* `memorial_day` - Memorial Day
* `thanksgiving` - Thanksgiving
* `christmas` - Christmas 

## API v2

It has one endpoint you care about:

```
/api/v2/holidays/:holiday/
```

The API will also accept a `timezone` parameter to check to see if 
it's still a holiday in the timezone where you live! The default 
timezone is set to `America/New_York`.

All API responses are in JSON.

### Known holidays

This endpoint uses the [holidays](https://github.com/alexdunae/holidays) gem 
to get its holiday information. 

You can use the `:holiday` parameter value of `today` to return all holidays 
for the current day. 

Below are a few sample API responses:

`/api/v2/holidays/today`

```json
{:status=>true, :holidays=>[{:date=>Mon, 28 May 2012, :name=>"Pfingstmontag", :regions=>[:at, :de, :li]}, {:date=>Mon, 28 May 2012, :name=>"2. Pinsedag", :regions=>[:dk]}, {:date=>Mon, 28 May 2012, :name=>"Lundi de Pentecôte", :regions=>[:fr]}, {:date=>Mon, 28 May 2012, :name=>"Annar í hvítasunnu", :regions=>[:is]}, {:date=>Mon, 28 May 2012, :name=>"Pinksteren", :regions=>[:nl]}, {:date=>Mon, 28 May 2012, :name=>"2. pinsedag", :regions=>[:no]}, {:date=>Mon, 28 May 2012, :name=>"Bank Holiday", :regions=>[:gb]}, {:date=>Mon, 28 May 2012, :name=>"Memorial Day", :regions=>[:us, :nyse, :ups]}]}
```

`/api/v2/holidays/memorial_day`

```json
{"status":true,"holidays":[{"date":"2012-05-28","name":"Memorial Day","regions":["us","nyse","ups"]}]}
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Copyright

Copyright (c) 2012 David Czarnecki. See LICENSE for further details.