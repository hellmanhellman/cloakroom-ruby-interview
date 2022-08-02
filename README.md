# README

Welcome to the Cloakroom, the cutting-edge API for ordering coats.

The API consists of 2 user-facing endpoints:
* `GET /coats` fetches the list of all the available coats.
* `POST /coats/:id/order` places an order for a coat.

There are also 2 endpoints available only to Cloakroom employees:
* `POST /admin/load_inventory` updates the list of available coats from a remove CSV file.
* `POST /admin/fulfill_order` marks the user order as sent.

## Development

For setting up the local development environment, run:
```
bundle install
rails db:setup
```

# Tasks

Please solve the following tasks. We also welcome suggestions for code and performance improvements, but they don't have to be implemented.

## Task 1

The `/admin/load_inventory` endpoint doesn't seem to be working for some reason. Find out the issue and fix it.
```
solution:
CSV.parse(inventoy) -> CSV.parse(inventory)
```

## Task 2

Cloakroom employees want to be able provide an inventory URL of their own. They also want to be able to fetch inventories in JSON format.

Extend the `/admin/load_inventory` so it supports users sending `inventory_url` and `inventory_format` params.
```
solution:
See admin controller
```
## Task 3

When a coat is ordered, it first need to be sent to the packaging unit before it's shipped to the user. Users should also be able to cancel their orders before they are shipped.

Extend the application to allow cancelations and tracking which orders are in the packaging unit at the moment.

```
solution:
Migration added to remove "sent" column and add "status" column
Modify existing methods using sent to instead use status.
Add cancel and index_orders to admin controller. Users should be able to cancel, but since that would require auth we put cancel in admin for now.
```
