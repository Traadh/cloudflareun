# cloudflareun

For Pharo I gather the magic keys required to enter a Cloudflare protected site.

### Responsibilities  
Give me a url door to knock on, and I'll return a factory for generating ZnClients configured with the magic keys.

### Collaborators   
*__cloudscraper__* is a nodejs library. Its where the magic happens to obtain the Cloudflare keys.  
*__OSProcess__* is used to shell out to nodejs.  

### Class-side Public API and Key Messages  
*__knockURL: aHostUrlString__* provides the url used for initial access.  

### Instance-side Public API and Key Messages  
*__client__* returns a new ZnClient configured with the magic keys.  

### Usage 
```smalltalk
|client response| 
client := (CloudflareUn knockUrl: 'http://bittrex.com') client.
client url: 'https://bittrex.com/home/markets'. 
(response := client get) inspect. 
"Note: Cloudflare enforces a five second delay, so expect UI to block for 5 to 10 seconds"
```
