<p align="center">
	<img alt="Spinetail" title="Spinetail" src="Assets/logo.svg" height="200">
</p>

<h1 align="center"> Spinetail </h1>

A Swift pacakge for interfacing with your Mailchimp account, audiences, campaigns, and more. 

[![SwiftPM](https://img.shields.io/badge/SPM-Linux%20%7C%20iOS%20%7C%20macOS%20%7C%20watchOS%20%7C%20tvOS-success?logo=swift)](https://swift.org)
[![Twitter](https://img.shields.io/badge/twitter-@brightdigit-blue.svg?style=flat)](http://twitter.com/brightdigit)
![GitHub](https://img.shields.io/github/license/brightdigit/Spinetail)
![GitHub issues](https://img.shields.io/github/issues/brightdigit/Spinetail)

![GitHub Workflow Status](https://img.shields.io/github/workflow/status/brightdigit/Spinetail/Spinetail?label=Actions&logo=github)
[![Bitrise](https://img.shields.io/bitrise/b2595eab70c25d1b?logo=bitrise&?label=bitrise&token=rHUhEUFkU2RUL-KGmrKX1Q)](https://app.bitrise.io/app/b2595eab70c25d1b)
[![CircleCI](https://img.shields.io/circleci/build/github/brightdigit/Spinetail?logo=circleci&?label=circle-ci&token=45c9ff6a86f9ac6c1ec8c85c3bc02f4d8859aa6b)](https://app.circleci.com/pipelines/github/brightdigit/Spinetail)

<!--
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fbrightdigit%2FSpinetail%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/brightdigit/Spinetail)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fbrightdigit%2FSpinetail%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/brightdigit/Spinetail)

[![Codecov](https://img.shields.io/codecov/c/github/brightdigit/Spinetail)](https://codecov.io/gh/brightdigit/Spinetail)
[![CodeFactor Grade](https://img.shields.io/codefactor/grade/github/brightdigit/Spinetail)](https://www.codefactor.io/repository/github/brightdigit/Spinetail)
[![codebeat badge](https://codebeat.co/badges/c47b7e58-867c-410b-80c5-57e10140ba0f)](https://codebeat.co/projects/github-com-brightdigit-Spinetail-main)
[![Code Climate maintainability](https://img.shields.io/codeclimate/maintainability/brightdigit/Spinetail)](https://codeclimate.com/github/brightdigit/Spinetail)
[![Code Climate technical debt](https://img.shields.io/codeclimate/tech-debt/brightdigit/Spinetail?label=debt)](https://codeclimate.com/github/brightdigit/Spinetail)
[![Code Climate issues](https://img.shields.io/codeclimate/issues/brightdigit/Spinetail)](https://codeclimate.com/github/brightdigit/Spinetail)


[![Reviewed by Hound](https://img.shields.io/badge/Reviewed_by-Hound-8E64B0.svg)](https://houndci.com)
-->

![Demonstration of Spinetail](Assets/SpinetailDemo.gif)

<!--ts-->
# Table of Contents

* [Introduction](#introduction)
	  * [Demo Example](#demo-example)
* [Features](#features)
* [Installation](#installation)
* [Setting Up Your Mailchimp Client with Prch](#setting-up-your-mailchimp-client-with-prch)
* [Usage](#usage)
   * [Audience List Members](#audience-list-members)
	  * [Getting an Audience List Member](#getting-an-audience-list-member)
		 * [Closure-based Completion](#closure-based-completion)
		 * [Async/Await](#asyncawait)
		 * [Synchronous](#synchronous)
	  * [Adding new Audience List Members](#adding-new-audience-list-members)
	  * [Updating Existing Audience List Members](#updating-existing-audience-list-members)
	  * [Putting it together in Vapor](#putting-it-together-in-vapor)
   * [Templates and Campaigns](#templates-and-campaigns)
	  * [Pulling List of Campaigns](#pulling-list-of-campaigns)
	  * [Get Newsletter Content](#get-newsletter-content)
* [Requests](#requests)
* [License](#license)


<!--te-->

# Introduction

Spinetail is a Swift package for interfacing with your Mailchimp account, audiences, campaigns, and more. 

### Demo Example

```swift
// TODO: Sample Code
```

# Features 

Here's what's currently implemented with this library:

- [x] Pulling Your Current List of Newsletters and Campaigns
- [x] Get Your Audience List
- [x] Add to Your Audience List
- [x] Updating Subscriber Tags

... and more

# Installation

To integrate **Spinetail** into your project using SPM, specify it in your Package.swift file:

```swift    
let package = Package(
  ...
  dependencies: [
	.package(url: "https://github.com/brightdigit/Spinetail", from: "0.1.1")
  ],
  targets: [
	  .target(
		  name: "YourTarget",
		  dependencies: ["Spinetail", ...]),
	  ...
  ]
)
```

Spinetail uses `URLSession` for network communication via [Prch](https://github.com/brightdigit/Prch).

However if you are building a server-side application in Swift and wish to take advantage of SwiftNIO, then you'll want import [PrchNIO](https://github.com/brightdigit/PrchNIO) package as well:

```swift    
let package = Package(
  ...
  dependencies: [
	.package(url: "https://github.com/brightdigit/Spinetail", from: "0.1.1"),
	.package(url: "https://github.com/brightdigit/PrchNIO", from: "0.1.1")
  ],
  targets: [
	  .target(
		  name: "YourTarget",
		  dependencies: ["Spinetail", "PrchNIO", ...]),
	  ...
  ]
)
```

[PrchNIO](https://github.com/brightdigit/PrchNIO) adds support for `EventLoopFuture` and using the networking infrastructure already supplied by SwiftNIO.

If you are using Vapor, then you may also want to consider using SpinetailVapor package:

```swift    
let package = Package(
  ...
  dependencies: [
	.package(url: "https://github.com/brightdigit/Spinetail", from: "0.1.1"),
	.package(url: "https://github.com/brightdigit/SpinetailVapor", from: "0.1.1")
  ],
  targets: [
	  .target(
		  name: "YourTarget",
		  dependencies: ["Spinetail", "SpinetailVapor", ...]),
	  ...
  ]
)
```

The SpinetailVapor package adds helper properties and methods to help with setting up and accessing the APIClient.

# Setting Up Your Mailchimp Client with Prch

In order to get started with the Mailchimp API, [make sure you have created an API key](https://mailchimp.com/developer/marketing/guides/quick-start/#generate-your-api-key). Typically the API key looks something like this:

```
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx-us00
```

Once you have that, decide what you'll be using for your session depending on your platform:

* `URLSession` - iOS, tvOS, watchOS, macOS
* `AsyncHTTPClient` via `PrchNIO` - Linux Server
* `Vapor.Client` via `PrchVapor` - Vapor

Here's an example for setting up a client for Mailchimp on a standard Apple platform app:
 
```swift
let api = MailchimpAPI(apiKey: "")
let client = Client(api: api, session: URLSession.shared)
```

Now that we have setup the client, we'll be using let's begin to access the Mailchimp API.

# Usage 

To make a request via `Prch`, we have three options using our `client`:

* closure-based completion calls
* async/await 
* synchronous calls

Let's start with an example using audience member lists.

## Audience List Members

### Getting an Audience List Member

According to [the documentation for the Mailchimp API](https://mailchimp.com/developer/marketing/api/list-members/get-member-info/), we can get a member of our audience list based on their _subscriber_hash_.
This is described as:

> The MD5 hash of the lowercase version of the list member's email address. This endpoint also accepts a list member's email address or contact_id.

The means we can use:
* MD5 hash of the lowercase version of the list member's email address _but also_
* email address or
* `contact_id`

In our case, we'll be using an email address to see if we have someone subscribed. 
Additionally we need our audience's `listID` which is found on the audience settings page.

![ListID at the Mailchimp Admin Page](Assets/Mailchimp-listID.png)

With that email address, we can create a `Request`:

```swift
import Spinetail 

let api = MailchimpAPI(apiKey: "")
let client = Client(api: api, session: URLSession.shared)
let request = Lists.GetListsIdMembersId.Request(listId: listId, subscriberHash: emailAddress)
```

As previously noted there are three ways to execute a call:

#### Closure-based Completion

```swift
client.request(request) { result in
  switch result {
  case let .success(member):
  	// Successful Retrieval
	break
  case let .defaultResponse(statusCode, response):
  	// Non-2xx Response (ex. 404 member not found)
	break
  case let .failure(error):
  	// Other Errors (ex. networking, decoding or encoding JSON...)
	break
  }
}
```


#### Async/Await 

```swift
do {
  // Successful Retrieval
  let member = try await client.request(request)
} catch let error as ClientResponseResult<Lists.GetListsIdMembersId.Response>.FailedResponseError {
  // Non-2xx Response (ex. 404 member not found)
} catch  {
  // Other Errors (ex. networking, decoding or encoding JSON...)
}
```

#### Synchronous

```swift
do {
  // Successful Retrieval
  let member = try client.requestSync(request)
} catch let error as ClientResponseResult<Lists.GetListsIdMembersId.Response>.FailedResponseError {
  // Non-2xx Response (ex. 404 member not found)
} catch  {
  // Other Errors (ex. networking, decoding or encoding JSON...)
}
```

In each case there are possible results:

* The call was successful
* The call failed but the response was valid such as a 4xx status code
* The call failed due to an internal error (ex. decoding, encoding, networking, etc...)

An example of where we'd want to handle a 404 for instance is when we want to add or update a subscriber 
when someone signs up for a service. If the member is not found, we want go ahead and add that subscriber.

### Adding new Audience List Members

To [add a new audience member](https://mailchimp.com/developer/marketing/api/list-members/add-member-to-list/) we need to create a `Lists.PostListsIdMembers.Request`:

```swift
let request = Lists.PostListsIdMembers.Request(
  listId: listID, 
  body: .init(
    emailAddress: emailAddress, 
	status: .subscribed, 
	timestampOpt: .init(), 
	timestampSignup: .init()
  )
)
```

Now that we have a request let's use the completion handler call for adding a new member:

```swift
client.request(request) { result in
  switch result {
  case let .success(newMember):
	  // Successful Adding
	break
  case let .defaultResponse(statusCode, response):
	  // Non-2xx Response
	break
  case let .failure(error):
	  // Other Errors (ex. networking, decoding or encoding JSON...)
	break
  }
}
```

### Updating Existing Audience List Members

Let's say our attempt to find an existing subscriber member succeeds but we need to [update the member's interests](https://mailchimp.com/developer/marketing/api/list-members/update-list-member/). 
We can get `subscriberHash` from our found member and the [`interestID` can be queried](https://mailchimp.com/developer/marketing/api/interests/list-interests-in-category/). 

```swift
// get the subscriber hash id
let subscriberHash = member.id
let patch = Lists.PatchListsIdMembersId.Request(
  body: .init(
    emailAddress: emailAddress,
	emailType: nil, 
	interests: [interestID: true] 
  ), 
  options: .init(
    listId: Self.listID, 
	subscriberHash: subscriberHash
  )
)
```

### Putting it together in Vapor

Here's an example in Vapor using Fluent Middleware

```swift
import Fluent
import Prch
import PrchVapor
import Spinetail
import Vapor

struct MailchimpMiddleware: ModelMiddleware {
  // our client created during server initialization
  let client: Prch.Client<PrchVapor.SessionClient, Spinetail.Mailchimp.API>
  
  // the list id
  let listID: String
  
  // the interest id 
  let interestID : String

  func upsertSubscriptionForUser(_ user: User, withEventLoop eventLoop: EventLoop) -> EventLoopFuture<Void> {
	let memberRequest = Lists.GetListsIdMembersId.Request(listId: listID, subscriberHash: user.email)
	// find the subscription member
	return client.request(memberRequest).flatMapThrowing { response -> in
	  switch response {
	  case .defaultResponse(statusCode: 404, _):
		return nil
	  case let .status200(member):
		return member
	  default:
		throw ClientError.invalidResponse
	  }

	}.flatMap { member in
	  // if the subscriber already exists and has the interest id, don't do anything
	  if member?.interests?[self.interestID] == true {
		return eventLoop.future()
	  // if the subscriber already exists but doesn't have the interest id
	  } else if let subscriberHash = member?.id {
	  	// update the subscriber
		let patch = Lists.PatchListsIdMembersId.Request(body: .init(emailAddress: user.email, emailType: nil, interests: [self.interestID: true]), options: Lists.PatchListsIdMembersId.Request.Options(listId: self.listID, subscriberHash: subscriberHash))
		// transform to `Void` on success
		return client.request(patch).success()
	  // if the subscriber doesn't already exists
	  } else {
	  	// update the subscriber add them
		let post = Lists.PostListsIdMembers.Request(listId: self.listID, body: .init(emailAddress: user.email, status: Lists.PostListsIdMembers.Request.Body.Status.subscribed, interests: [self.interestID: true], timestampOpt: .init(), timestampSignup: .init()))
		// transform to `Void` on success
		return client.request(post).success()
	  }
	}
  }

  // after adding the row to the db, add the user to our subscription list with the interest id
  func create(model: User, on db: Database, next: AnyModelResponder) -> EventLoopFuture<Void> {
	next.create(model, on: db).transform(to: model).flatMap { user in
	  self.upsertSubscriptionForUser(user, withEventLoop: db.eventLoop)
	}
  }
}
```

Now that we have an example dealing with managing members, let's look at how to get a list of campaigns and email our subscribers in Swift.

## Templates and Campaigns

With newsletters there are [campaigns](https://mailchimp.com/developer/marketing/api/campaigns/) and [templates](https://mailchimp.com/developer/marketing/api/templates/). 
_Campaigns_ are how you send emails to your Mailchimp list. A _template_ is an HTML file used to create the layout and basic design for a campaign.
Before creating our own campaign and template, let's look at how to pull a list of campaigns.

### Pulling List of Campaigns

On the BrightDigit web site, I want to link to each newsletter that's sent out. To do this you just need the `listID` again.
We'll be pulling up to 1000 sent campaigns sorted from last sent to first sent:

```swift
let request = Campaigns.GetCampaigns.Request(
  count: 1000, 
  status: .sent, 
  listId: listID, 
  sortField: .sendTime, 
  sortDir: .desc
)
let response = try self.requestSync(request)
let campaigns = response.campaigns ?? []
```

To get the content we to grab it based on each campaign's `campaignID`.

### Get Newsletter Content

Before grabbing the content, we need to grab the `campaignID` from the campaign:

```swift
let campaign : Campaigns.GetCampaigns.Response.Status200.Campaigns
let html: String

guard let campaignID = campaign.id else {
  return
}

html = try self.htmlFromCampaign(withID: campaignProperties.campaignID)
```

### Creating a Template

To actually send we need to create an [template](https://mailchimp.com/developer/marketing/api/templates/) using [the
`POST` request](https://mailchimp.com/developer/marketing/api/templates/add-template/). Here's an example with async and await:

```swift
let templateName = "Example Email"
let templateHTML = "<strong>Hello World</strong>"
let templateRequest = Templates.PostTemplates.Request(body: .init(html: templateHTML, name: templateName))
let template = try await client.request(templateRequest)
```

Let's use the template to create a campaign and send it.


### Send an Campaign Email to Our Audience List

```swift
// make sure to get the templateID
guard let templateID = template.id else {
  return
}

// set the email settings
let settings: Campaigns.PostCampaigns.Request.Body.Settings = .init(
  fromName: "Leo", 
  replyTo: "leo@brightdigit.com", 
  subjectLine: "Hello World - Test Email", 
  templateId: templateID
)
// set the type and list you're sending to
let body: Campaigns.PostCampaigns.Request.Body = .init(
  type: .regular, 
  contentType: .template, 
  recipients: .init(listId: listID), 
  settings: settings
)
let request = Campaigns.PostCampaigns.Request(body: body)
await client.request(request)
```

# Requests

- **ActivityFeed**
	- **GetActivityFeedChimpChatter**: GET `/activity-feed/chimp-chatter`
- **AuthorizedApps**
	- **GetAuthorizedApps**: GET `/authorized-apps`
	- **GetAuthorizedAppsId**: GET `/authorized-apps/{app_id}`
- **Automations**
	- **ArchiveAutomations**: POST `/automations/{workflow_id}/actions/archive`
	- **DeleteAutomationsIdEmailsId**: DELETE `/automations/{workflow_id}/emails/{workflow_email_id}`
	- **GetAutomations**: GET `/automations`
	- **GetAutomationsId**: GET `/automations/{workflow_id}`
	- **GetAutomationsIdEmails**: GET `/automations/{workflow_id}/emails`
	- **GetAutomationsIdEmailsId**: GET `/automations/{workflow_id}/emails/{workflow_email_id}`
	- **GetAutomationsIdEmailsIdQueue**: GET `/automations/{workflow_id}/emails/{workflow_email_id}/queue`
	- **GetAutomationsIdEmailsIdQueueId**: GET `/automations/{workflow_id}/emails/{workflow_email_id}/queue/{subscriber_hash}`
	- **GetAutomationsIdRemovedSubscribers**: GET `/automations/{workflow_id}/removed-subscribers`
	- **GetAutomationsIdRemovedSubscribersId**: GET `/automations/{workflow_id}/removed-subscribers/{subscriber_hash}`
	- **PatchAutomationEmailWorkflowId**: PATCH `/automations/{workflow_id}/emails/{workflow_email_id}`
	- **PostAutomations**: POST `/automations`
	- **PostAutomationsIdActionsPauseAllEmails**: POST `/automations/{workflow_id}/actions/pause-all-emails`
	- **PostAutomationsIdActionsStartAllEmails**: POST `/automations/{workflow_id}/actions/start-all-emails`
	- **PostAutomationsIdEmailsIdActionsPause**: POST `/automations/{workflow_id}/emails/{workflow_email_id}/actions/pause`
	- **PostAutomationsIdEmailsIdActionsStart**: POST `/automations/{workflow_id}/emails/{workflow_email_id}/actions/start`
	- **PostAutomationsIdEmailsIdQueue**: POST `/automations/{workflow_id}/emails/{workflow_email_id}/queue`
	- **PostAutomationsIdRemovedSubscribers**: POST `/automations/{workflow_id}/removed-subscribers`
- **Batches**
	- **DeleteBatchesId**: DELETE `/batches/{batch_id}`
	- **GetBatches**: GET `/batches`
	- **GetBatchesId**: GET `/batches/{batch_id}`
	- **PostBatches**: POST `/batches`
- **BatchWebhooks**
	- **DeleteBatchWebhookId**: DELETE `/batch-webhooks/{batch_webhook_id}`
	- **GetBatchWebhook**: GET `/batch-webhooks/{batch_webhook_id}`
	- **GetBatchWebhooks**: GET `/batch-webhooks`
	- **PatchBatchWebhooks**: PATCH `/batch-webhooks/{batch_webhook_id}`
	- **PostBatchWebhooks**: POST `/batch-webhooks`
- **CampaignFolders**
	- **DeleteCampaignFoldersId**: DELETE `/campaign-folders/{folder_id}`
	- **GetCampaignFolders**: GET `/campaign-folders`
	- **GetCampaignFoldersId**: GET `/campaign-folders/{folder_id}`
	- **PatchCampaignFoldersId**: PATCH `/campaign-folders/{folder_id}`
	- **PostCampaignFolders**: POST `/campaign-folders`
- **Campaigns**
	- **DeleteCampaignsId**: DELETE `/campaigns/{campaign_id}`
	- **DeleteCampaignsIdFeedbackId**: DELETE `/campaigns/{campaign_id}/feedback/{feedback_id}`
	- **GetCampaigns**: GET `/campaigns`
	- **GetCampaignsId**: GET `/campaigns/{campaign_id}`
	- **GetCampaignsIdContent**: GET `/campaigns/{campaign_id}/content`
	- **GetCampaignsIdFeedback**: GET `/campaigns/{campaign_id}/feedback`
	- **GetCampaignsIdFeedbackId**: GET `/campaigns/{campaign_id}/feedback/{feedback_id}`
	- **GetCampaignsIdSendChecklist**: GET `/campaigns/{campaign_id}/send-checklist`
	- **PatchCampaignsId**: PATCH `/campaigns/{campaign_id}`
	- **PatchCampaignsIdFeedbackId**: PATCH `/campaigns/{campaign_id}/feedback/{feedback_id}`
	- **PostCampaigns**: POST `/campaigns`
	- **PostCampaignsIdActionsCancelSend**: POST `/campaigns/{campaign_id}/actions/cancel-send`
	- **PostCampaignsIdActionsCreateResend**: POST `/campaigns/{campaign_id}/actions/create-resend`
	- **PostCampaignsIdActionsPause**: POST `/campaigns/{campaign_id}/actions/pause`
	- **PostCampaignsIdActionsReplicate**: POST `/campaigns/{campaign_id}/actions/replicate`
	- **PostCampaignsIdActionsResume**: POST `/campaigns/{campaign_id}/actions/resume`
	- **PostCampaignsIdActionsSchedule**: POST `/campaigns/{campaign_id}/actions/schedule`
	- **PostCampaignsIdActionsSend**: POST `/campaigns/{campaign_id}/actions/send`
	- **PostCampaignsIdActionsTest**: POST `/campaigns/{campaign_id}/actions/test`
	- **PostCampaignsIdActionsUnschedule**: POST `/campaigns/{campaign_id}/actions/unschedule`
	- **PostCampaignsIdFeedback**: POST `/campaigns/{campaign_id}/feedback`
	- **PutCampaignsIdContent**: PUT `/campaigns/{campaign_id}/content`
- **ConnectedSites**
	- **DeleteConnectedSitesId**: DELETE `/connected-sites/{connected_site_id}`
	- **GetConnectedSites**: GET `/connected-sites`
	- **GetConnectedSitesId**: GET `/connected-sites/{connected_site_id}`
	- **PostConnectedSites**: POST `/connected-sites`
	- **PostConnectedSitesIdActionsVerifyScriptInstallation**: POST `/connected-sites/{connected_site_id}/actions/verify-script-installation`
- **Conversations**
	- **GetConversations**: GET `/conversations`
	- **GetConversationsId**: GET `/conversations/{conversation_id}`
	- **GetConversationsIdMessages**: GET `/conversations/{conversation_id}/messages`
	- **GetConversationsIdMessagesId**: GET `/conversations/{conversation_id}/messages/{message_id}`
- **CustomerJourneys**
	- **PostCustomerJourneysJourneysIdStepsIdActionsTrigger**: POST `/customer-journeys/journeys/{journey_id}/steps/{step_id}/actions/trigger`
- **Ecommerce**
	- **DeleteEcommerceStoresId**: DELETE `/ecommerce/stores/{store_id}`
	- **DeleteEcommerceStoresIdCartsId**: DELETE `/ecommerce/stores/{store_id}/carts/{cart_id}`
	- **DeleteEcommerceStoresIdCartsLinesId**: DELETE `/ecommerce/stores/{store_id}/carts/{cart_id}/lines/{line_id}`
	- **DeleteEcommerceStoresIdCustomersId**: DELETE `/ecommerce/stores/{store_id}/customers/{customer_id}`
	- **DeleteEcommerceStoresIdOrdersId**: DELETE `/ecommerce/stores/{store_id}/orders/{order_id}`
	- **DeleteEcommerceStoresIdOrdersIdLinesId**: DELETE `/ecommerce/stores/{store_id}/orders/{order_id}/lines/{line_id}`
	- **DeleteEcommerceStoresIdProductsId**: DELETE `/ecommerce/stores/{store_id}/products/{product_id}`
	- **DeleteEcommerceStoresIdProductsIdImagesId**: DELETE `/ecommerce/stores/{store_id}/products/{product_id}/images/{image_id}`
	- **DeleteEcommerceStoresIdProductsIdVariantsId**: DELETE `/ecommerce/stores/{store_id}/products/{product_id}/variants/{variant_id}`
	- **DeleteEcommerceStoresIdPromocodesId**: DELETE `/ecommerce/stores/{store_id}/promo-rules/{promo_rule_id}/promo-codes/{promo_code_id}`
	- **DeleteEcommerceStoresIdPromorulesId**: DELETE `/ecommerce/stores/{store_id}/promo-rules/{promo_rule_id}`
	- **GetEcommerceOrders**: GET `/ecommerce/orders`
	- **GetEcommerceStores**: GET `/ecommerce/stores`
	- **GetEcommerceStoresId**: GET `/ecommerce/stores/{store_id}`
	- **GetEcommerceStoresIdCarts**: GET `/ecommerce/stores/{store_id}/carts`
	- **GetEcommerceStoresIdCartsId**: GET `/ecommerce/stores/{store_id}/carts/{cart_id}`
	- **GetEcommerceStoresIdCartsIdLines**: GET `/ecommerce/stores/{store_id}/carts/{cart_id}/lines`
	- **GetEcommerceStoresIdCartsIdLinesId**: GET `/ecommerce/stores/{store_id}/carts/{cart_id}/lines/{line_id}`
	- **GetEcommerceStoresIdCustomers**: GET `/ecommerce/stores/{store_id}/customers`
	- **GetEcommerceStoresIdCustomersId**: GET `/ecommerce/stores/{store_id}/customers/{customer_id}`
	- **GetEcommerceStoresIdOrders**: GET `/ecommerce/stores/{store_id}/orders`
	- **GetEcommerceStoresIdOrdersId**: GET `/ecommerce/stores/{store_id}/orders/{order_id}`
	- **GetEcommerceStoresIdOrdersIdLines**: GET `/ecommerce/stores/{store_id}/orders/{order_id}/lines`
	- **GetEcommerceStoresIdOrdersIdLinesId**: GET `/ecommerce/stores/{store_id}/orders/{order_id}/lines/{line_id}`
	- **GetEcommerceStoresIdProducts**: GET `/ecommerce/stores/{store_id}/products`
	- **GetEcommerceStoresIdProductsId**: GET `/ecommerce/stores/{store_id}/products/{product_id}`
	- **GetEcommerceStoresIdProductsIdImages**: GET `/ecommerce/stores/{store_id}/products/{product_id}/images`
	- **GetEcommerceStoresIdProductsIdImagesId**: GET `/ecommerce/stores/{store_id}/products/{product_id}/images/{image_id}`
	- **GetEcommerceStoresIdProductsIdVariants**: GET `/ecommerce/stores/{store_id}/products/{product_id}/variants`
	- **GetEcommerceStoresIdProductsIdVariantsId**: GET `/ecommerce/stores/{store_id}/products/{product_id}/variants/{variant_id}`
	- **GetEcommerceStoresIdPromocodes**: GET `/ecommerce/stores/{store_id}/promo-rules/{promo_rule_id}/promo-codes`
	- **GetEcommerceStoresIdPromocodesId**: GET `/ecommerce/stores/{store_id}/promo-rules/{promo_rule_id}/promo-codes/{promo_code_id}`
	- **GetEcommerceStoresIdPromorules**: GET `/ecommerce/stores/{store_id}/promo-rules`
	- **GetEcommerceStoresIdPromorulesId**: GET `/ecommerce/stores/{store_id}/promo-rules/{promo_rule_id}`
	- **PatchEcommerceStoresId**: PATCH `/ecommerce/stores/{store_id}`
	- **PatchEcommerceStoresIdCartsId**: PATCH `/ecommerce/stores/{store_id}/carts/{cart_id}`
	- **PatchEcommerceStoresIdCartsIdLinesId**: PATCH `/ecommerce/stores/{store_id}/carts/{cart_id}/lines/{line_id}`
	- **PatchEcommerceStoresIdCustomersId**: PATCH `/ecommerce/stores/{store_id}/customers/{customer_id}`
	- **PatchEcommerceStoresIdOrdersId**: PATCH `/ecommerce/stores/{store_id}/orders/{order_id}`
	- **PatchEcommerceStoresIdOrdersIdLinesId**: PATCH `/ecommerce/stores/{store_id}/orders/{order_id}/lines/{line_id}`
	- **PatchEcommerceStoresIdProductsId**: PATCH `/ecommerce/stores/{store_id}/products/{product_id}`
	- **PatchEcommerceStoresIdProductsIdImagesId**: PATCH `/ecommerce/stores/{store_id}/products/{product_id}/images/{image_id}`
	- **PatchEcommerceStoresIdProductsIdVariantsId**: PATCH `/ecommerce/stores/{store_id}/products/{product_id}/variants/{variant_id}`
	- **PatchEcommerceStoresIdPromocodesId**: PATCH `/ecommerce/stores/{store_id}/promo-rules/{promo_rule_id}/promo-codes/{promo_code_id}`
	- **PatchEcommerceStoresIdPromorulesId**: PATCH `/ecommerce/stores/{store_id}/promo-rules/{promo_rule_id}`
	- **PostEcommerceStores**: POST `/ecommerce/stores`
	- **PostEcommerceStoresIdCarts**: POST `/ecommerce/stores/{store_id}/carts`
	- **PostEcommerceStoresIdCartsIdLines**: POST `/ecommerce/stores/{store_id}/carts/{cart_id}/lines`
	- **PostEcommerceStoresIdCustomers**: POST `/ecommerce/stores/{store_id}/customers`
	- **PostEcommerceStoresIdOrders**: POST `/ecommerce/stores/{store_id}/orders`
	- **PostEcommerceStoresIdOrdersIdLines**: POST `/ecommerce/stores/{store_id}/orders/{order_id}/lines`
	- **PostEcommerceStoresIdProducts**: POST `/ecommerce/stores/{store_id}/products`
	- **PostEcommerceStoresIdProductsIdImages**: POST `/ecommerce/stores/{store_id}/products/{product_id}/images`
	- **PostEcommerceStoresIdProductsIdVariants**: POST `/ecommerce/stores/{store_id}/products/{product_id}/variants`
	- **PostEcommerceStoresIdPromocodes**: POST `/ecommerce/stores/{store_id}/promo-rules/{promo_rule_id}/promo-codes`
	- **PostEcommerceStoresIdPromorules**: POST `/ecommerce/stores/{store_id}/promo-rules`
	- **PutEcommerceStoresIdCustomersId**: PUT `/ecommerce/stores/{store_id}/customers/{customer_id}`
	- **PutEcommerceStoresIdProductsIdVariantsId**: PUT `/ecommerce/stores/{store_id}/products/{product_id}/variants/{variant_id}`
- **FacebookAds**
	- **GetAllFacebookAds**: GET `/facebook-ads`
	- **GetFacebookAdsId**: GET `/facebook-ads/{outreach_id}`
- **FileManager**
	- **DeleteFileManagerFilesId**: DELETE `/file-manager/files/{file_id}`
	- **DeleteFileManagerFoldersId**: DELETE `/file-manager/folders/{folder_id}`
	- **GetFileManagerFiles**: GET `/file-manager/files`
	- **GetFileManagerFilesId**: GET `/file-manager/files/{file_id}`
	- **GetFileManagerFolders**: GET `/file-manager/folders`
	- **GetFileManagerFoldersId**: GET `/file-manager/folders/{folder_id}`
	- **PatchFileManagerFilesId**: PATCH `/file-manager/files/{file_id}`
	- **PatchFileManagerFoldersId**: PATCH `/file-manager/folders/{folder_id}`
	- **PostFileManagerFiles**: POST `/file-manager/files`
	- **PostFileManagerFolders**: POST `/file-manager/folders`
- **LandingPages**
	- **DeleteLandingPageId**: DELETE `/landing-pages/{page_id}`
	- **GetAllLandingPages**: GET `/landing-pages`
	- **GetLandingPageId**: GET `/landing-pages/{page_id}`
	- **GetLandingPageIdContent**: GET `/landing-pages/{page_id}/content`
	- **PatchLandingPageId**: PATCH `/landing-pages/{page_id}`
	- **PostAllLandingPages**: POST `/landing-pages`
	- **PostLandingPageIdActionsPublish**: POST `/landing-pages/{page_id}/actions/publish`
	- **PostLandingPageIdActionsUnpublish**: POST `/landing-pages/{page_id}/actions/unpublish`
- **Lists**
	- **DeleteListsId**: DELETE `/lists/{list_id}`
	- **DeleteListsIdInterestCategoriesId**: DELETE `/lists/{list_id}/interest-categories/{interest_category_id}`
	- **DeleteListsIdInterestCategoriesIdInterestsId**: DELETE `/lists/{list_id}/interest-categories/{interest_category_id}/interests/{interest_id}`
	- **DeleteListsIdMembersId**: DELETE `/lists/{list_id}/members/{subscriber_hash}`
	- **DeleteListsIdMembersIdNotesId**: DELETE `/lists/{list_id}/members/{subscriber_hash}/notes/{note_id}`
	- **DeleteListsIdMergeFieldsId**: DELETE `/lists/{list_id}/merge-fields/{merge_id}`
	- **DeleteListsIdSegmentsId**: DELETE `/lists/{list_id}/segments/{segment_id}`
	- **DeleteListsIdSegmentsIdMembersId**: DELETE `/lists/{list_id}/segments/{segment_id}/members/{subscriber_hash}`
	- **DeleteListsIdWebhooksId**: DELETE `/lists/{list_id}/webhooks/{webhook_id}`
	- **GetListMemberTags**: GET `/lists/{list_id}/members/{subscriber_hash}/tags`
	- **GetLists**: GET `/lists`
	- **GetListsId**: GET `/lists/{list_id}`
	- **GetListsIdAbuseReports**: GET `/lists/{list_id}/abuse-reports`
	- **GetListsIdAbuseReportsId**: GET `/lists/{list_id}/abuse-reports/{report_id}`
	- **GetListsIdActivity**: GET `/lists/{list_id}/activity`
	- **GetListsIdClients**: GET `/lists/{list_id}/clients`
	- **GetListsIdGrowthHistory**: GET `/lists/{list_id}/growth-history`
	- **GetListsIdGrowthHistoryId**: GET `/lists/{list_id}/growth-history/{month}`
	- **GetListsIdInterestCategories**: GET `/lists/{list_id}/interest-categories`
	- **GetListsIdInterestCategoriesId**: GET `/lists/{list_id}/interest-categories/{interest_category_id}`
	- **GetListsIdInterestCategoriesIdInterests**: GET `/lists/{list_id}/interest-categories/{interest_category_id}/interests`
	- **GetListsIdInterestCategoriesIdInterestsId**: GET `/lists/{list_id}/interest-categories/{interest_category_id}/interests/{interest_id}`
	- **GetListsIdLocations**: GET `/lists/{list_id}/locations`
	- **GetListsIdMembers**: GET `/lists/{list_id}/members`
	- **GetListsIdMembersId**: GET `/lists/{list_id}/members/{subscriber_hash}`
	- **GetListsIdMembersIdActivity**: GET `/lists/{list_id}/members/{subscriber_hash}/activity`
	- **GetListsIdMembersIdActivityFeed**: GET `/lists/{list_id}/members/{subscriber_hash}/activity-feed`
	- **GetListsIdMembersIdEvents**: GET `/lists/{list_id}/members/{subscriber_hash}/events`
	- **GetListsIdMembersIdGoals**: GET `/lists/{list_id}/members/{subscriber_hash}/goals`
	- **GetListsIdMembersIdNotes**: GET `/lists/{list_id}/members/{subscriber_hash}/notes`
	- **GetListsIdMembersIdNotesId**: GET `/lists/{list_id}/members/{subscriber_hash}/notes/{note_id}`
	- **GetListsIdMergeFields**: GET `/lists/{list_id}/merge-fields`
	- **GetListsIdMergeFieldsId**: GET `/lists/{list_id}/merge-fields/{merge_id}`
	- **GetListsIdSegmentsId**: GET `/lists/{list_id}/segments/{segment_id}`
	- **GetListsIdSegmentsIdMembers**: GET `/lists/{list_id}/segments/{segment_id}/members`
	- **GetListsIdSignupForms**: GET `/lists/{list_id}/signup-forms`
	- **GetListsIdWebhooks**: GET `/lists/{list_id}/webhooks`
	- **GetListsIdWebhooksId**: GET `/lists/{list_id}/webhooks/{webhook_id}`
	- **PatchListsId**: PATCH `/lists/{list_id}`
	- **PatchListsIdInterestCategoriesId**: PATCH `/lists/{list_id}/interest-categories/{interest_category_id}`
	- **PatchListsIdInterestCategoriesIdInterestsId**: PATCH `/lists/{list_id}/interest-categories/{interest_category_id}/interests/{interest_id}`
	- **PatchListsIdMembersId**: PATCH `/lists/{list_id}/members/{subscriber_hash}`
	- **PatchListsIdMembersIdNotesId**: PATCH `/lists/{list_id}/members/{subscriber_hash}/notes/{note_id}`
	- **PatchListsIdMergeFieldsId**: PATCH `/lists/{list_id}/merge-fields/{merge_id}`
	- **PatchListsIdSegmentsId**: PATCH `/lists/{list_id}/segments/{segment_id}`
	- **PatchListsIdWebhooksId**: PATCH `/lists/{list_id}/webhooks/{webhook_id}`
	- **PostListMemberEvents**: POST `/lists/{list_id}/members/{subscriber_hash}/events`
	- **PostListMemberTags**: POST `/lists/{list_id}/members/{subscriber_hash}/tags`
	- **PostLists**: POST `/lists`
	- **PostListsId**: POST `/lists/{list_id}`
	- **PostListsIdInterestCategories**: POST `/lists/{list_id}/interest-categories`
	- **PostListsIdInterestCategoriesIdInterests**: POST `/lists/{list_id}/interest-categories/{interest_category_id}/interests`
	- **PostListsIdMembers**: POST `/lists/{list_id}/members`
	- **PostListsIdMembersHashActionsDeletePermanent**: POST `/lists/{list_id}/members/{subscriber_hash}/actions/delete-permanent`
	- **PostListsIdMembersIdNotes**: POST `/lists/{list_id}/members/{subscriber_hash}/notes`
	- **PostListsIdMergeFields**: POST `/lists/{list_id}/merge-fields`
	- **PostListsIdSegments**: POST `/lists/{list_id}/segments`
	- **PostListsIdSegmentsId**: POST `/lists/{list_id}/segments/{segment_id}`
	- **PostListsIdSegmentsIdMembers**: POST `/lists/{list_id}/segments/{segment_id}/members`
	- **PostListsIdSignupForms**: POST `/lists/{list_id}/signup-forms`
	- **PostListsIdWebhooks**: POST `/lists/{list_id}/webhooks`
	- **PreviewASegment**: GET `/lists/{list_id}/segments`
	- **PutListsIdMembersId**: PUT `/lists/{list_id}/members/{subscriber_hash}`
	- **SearchTagsByName**: GET `/lists/{list_id}/tag-search`
- **Ping**
	- **GetPing**: GET `/ping`
- **Reporting**
	- **GetReportingFacebookAds**: GET `/reporting/facebook-ads`
	- **GetReportingFacebookAdsId**: GET `/reporting/facebook-ads/{outreach_id}`
	- **GetReportingFacebookAdsIdEcommerceProductActivity**: GET `/reporting/facebook-ads/{outreach_id}/ecommerce-product-activity`
	- **GetReportingLandingPages**: GET `/reporting/landing-pages`
	- **GetReportingLandingPagesId**: GET `/reporting/landing-pages/{outreach_id}`
- **Reports**
	- **GetReports**: GET `/reports`
	- **GetReportsId**: GET `/reports/{campaign_id}`
	- **GetReportsIdAbuseReportsId**: GET `/reports/{campaign_id}/abuse-reports`
	- **GetReportsIdAbuseReportsIdId**: GET `/reports/{campaign_id}/abuse-reports/{report_id}`
	- **GetReportsIdAdvice**: GET `/reports/{campaign_id}/advice`
	- **GetReportsIdClickDetails**: GET `/reports/{campaign_id}/click-details`
	- **GetReportsIdClickDetailsId**: GET `/reports/{campaign_id}/click-details/{link_id}`
	- **GetReportsIdClickDetailsIdMembers**: GET `/reports/{campaign_id}/click-details/{link_id}/members`
	- **GetReportsIdClickDetailsIdMembersId**: GET `/reports/{campaign_id}/click-details/{link_id}/members/{subscriber_hash}`
	- **GetReportsIdDomainPerformance**: GET `/reports/{campaign_id}/domain-performance`
	- **GetReportsIdEcommerceProductActivity**: GET `/reports/{campaign_id}/ecommerce-product-activity`
	- **GetReportsIdEepurl**: GET `/reports/{campaign_id}/eepurl`
	- **GetReportsIdEmailActivity**: GET `/reports/{campaign_id}/email-activity`
	- **GetReportsIdEmailActivityId**: GET `/reports/{campaign_id}/email-activity/{subscriber_hash}`
	- **GetReportsIdLocations**: GET `/reports/{campaign_id}/locations`
	- **GetReportsIdOpenDetails**: GET `/reports/{campaign_id}/open-details`
	- **GetReportsIdOpenDetailsIdMembersId**: GET `/reports/{campaign_id}/open-details/{subscriber_hash}`
	- **GetReportsIdSentTo**: GET `/reports/{campaign_id}/sent-to`
	- **GetReportsIdSentToId**: GET `/reports/{campaign_id}/sent-to/{subscriber_hash}`
	- **GetReportsIdSubReportsId**: GET `/reports/{campaign_id}/sub-reports`
	- **GetReportsIdUnsubscribed**: GET `/reports/{campaign_id}/unsubscribed`
	- **GetReportsIdUnsubscribedId**: GET `/reports/{campaign_id}/unsubscribed/{subscriber_hash}`
- **Root**
	- **GetRoot**: GET `/`
- **SearchCampaigns**
	- **GetSearchCampaigns**: GET `/search-campaigns`
- **SearchMembers**
	- **GetSearchMembers**: GET `/search-members`
- **TemplateFolders**
	- **DeleteTemplateFoldersId**: DELETE `/template-folders/{folder_id}`
	- **GetTemplateFolders**: GET `/template-folders`
	- **GetTemplateFoldersId**: GET `/template-folders/{folder_id}`
	- **PatchTemplateFoldersId**: PATCH `/template-folders/{folder_id}`
	- **PostTemplateFolders**: POST `/template-folders`
- **Templates**
	- **DeleteTemplatesId**: DELETE `/templates/{template_id}`
	- **GetTemplates**: GET `/templates`
	- **GetTemplatesId**: GET `/templates/{template_id}`
	- **GetTemplatesIdDefaultContent**: GET `/templates/{template_id}/default-content`
	- **PatchTemplatesId**: PATCH `/templates/{template_id}`
	- **PostTemplates**: POST `/templates`
- **VerifiedDomains**
	- **CreateVerifiedDomain**: POST `/verified-domains`
	- **DeleteVerifiedDomain**: DELETE `/verified-domains/{domain_name}`
	- **GetVerifiedDomain**: GET `/verified-domains/{domain_name}`
	- **GetVerifiedDomains**: GET `/verified-domains`
	- **VerifyDomain**: POST `/verified-domains/{domain_name}/actions/verify`


# License 

This code is distributed under the MIT license. See the [LICENSE](LICENSE) file for more info.
