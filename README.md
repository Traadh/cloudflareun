# cloudflareun

For Pharo I gather the magic keys required to enter a Cloudflare protected site.

### Responsibilities  
Give me a url door to knock on, and I'll return a factory for generating ZnClients configured with the magic keys.

### Collaborators   
_cloudscraper_ is a nodejs library. Its where the magic happens to obtain the Cloudflare keys.  
_OSProcess_ is used to shell out to nodejs.  

### Class-side Public API and Key Messages  
*knockURL: aHostUrlString* provides the url used for initial access.  

### Instance-side Public API and Key Messages  
_client_ returns a new ZnClient configured with the magic keys.  

### Usage 
```smalltalk
|client response| 
client := (CloudflareUn knockUrl: 'http://bittrex.com') client.
client url: 'https://bittrex.com/home/markets'. 
(response := client get) inspect. 
"Note: Cloudflare enforces a five second delay, so expect UI to block for 5 to 10 seconds"
```
### Installation
Ubuntu 16.04 command line...
$ sudo apt-get update
$ sudo apt-get install nodejs
$ sudo apt-get install npm
$ npm install cloudscraper

Pharo 6 or 7...
1. Start Iceberg, click <Clone repository>, fill in these details and click <Create repository>
```Remote URL = git@github.com:Traadh/cloudflareun.git
  Local directory = (use default)
  Code subdirectory = src
```
2.  
