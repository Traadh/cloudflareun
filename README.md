# CloudflareUn

Help Pharo pass through to Cloudflare guarded website.   
Background discussed at [blog.openinworld.com](http://blog.openinworld.com/2018/02/pharo-v-cloudflare "Pharo v. Cloudflare")

### Responsibilities  
I gather the magic keys required to enter a Cloudflare guarded site. Give me a URL to knock on, and I'll return a factory for generating ZnClients configured with the magic keys.

### Collaborators   
__cloudscraper__ is a nodejs library. Its where the magic happens to obtain the Cloudflare keys.  
__OSProcess__ is used to shell out to nodejs.  

### Class-side Public API and Key Messages  
__knockURL: aHostUrlString__ provides the url used for initial access.  

### Instance-side Public API and Key Messages  
__client__ returns a new ZnClient configured with the magic keys.  

### Usage 
```smalltalk
|client response| 
client := (CloudflareUn knockUrl: 'http://bittrex.com') client.
client url: 'https://bittrex.com/home/markets'. 
(response := client get) inspect. 
"Note: Cloudflare enforces a five second delay, so unless you fork, expect UI to block for 5 to 10 seconds"
```

### Installation 
On Ubuntu 16.04...  
```shell
$ sudo apt-get update  
$ sudo apt-get install nodejs  
$ sudo apt-get install npm  
$ npm install cloudscraper  
```
In Pharo 6 or 7...
1. Start Iceberg, click &lt;Clone repository&gt; and fill in the following details, then click &lt;Create repository&gt;
```
  Remote URL = git@github.com:Traadh/cloudflareun.git
  Local directory = (use default)
  Code subdirectory = src
```
2. In Iceberg main panel, click on "clourdflareun", then its [pacakges] tab.  You'll see "CloudflareUn" status "Not loaded". Right-click on it and select &lt;Load package&gt;
  
3. Since there is not yet a Baseline, in Playground evaluate...  
   CloudflareUn installOSProcess

4. Verify requirements, in Playground evaluate...  
   CloudflareUn checkInstallNodeJs
   
