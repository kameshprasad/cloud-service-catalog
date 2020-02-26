# cloud-service-catalog

## Environment
ruby '2.6.3'
rails '6.0.2'
default rails environment

## Setup
```sh
rails db:create
rails db:migrate
rails db:seed
rails server
```
## Exceptions
To run the Job first time, run in rails console
```sh
rails console
> AwsCloudfrontPricingSyncJob.perform_now
```

## To test
* After the setup, execute the Job through rails console
* Open browser window and open API url: [localhost:3000](http://localhost:3000/service/AmazonCloudFront/region/us-east-1.json)
* Pass date as parameter to filter by date - date on which data is synced: [localhost with date](http://localhost:3000/service/AmazonCloudFront/region/us-east-1.json?date=2018-09-01)

## ToDo
* Added Scheduler - resque
* Add rspec
* Added validations and Error handling
