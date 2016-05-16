![Sickrage](https://sickrage.github.io/images/logo.png)

## Tag available
* latest [(Dockerfile)](https://github.com/xataz/dockerfiles/tree/master/sickrage/Dockerfile)

## Description
What is [Sickrage](https://github.com/SickRage/SickRage) ?

Sickrage is an Automatic Video Library Manager for TV Shows. It watches for new episodes of your favorite shows, and when they are posted it does its magic.

Features :
* Kodi/XBMC library updates, poster/banner/fanart downloads, and NFO/TBN generation
* Configurable automatic episode renaming, sorting, and other processing
* Easily see what episodes you're missing, are airing soon, and more
* Automatic torrent/nzb searching, downloading, and processing at the qualities you want
* Largest list of supported torrent and nzb providers, both public and private
* Can notify Kodi, XBMC, Growl, Trakt, Twitter, and more when new episodes are available
* Searches TheTVDB.com and AniDB.net for shows, seasons, episodes, and metadata
* Episode status management allows for mass failing seasons/episodes to force retrying
* DVD Order numbering for returning the results in DVD order instead of Air-By-Date order
* Allows you to choose which indexer to have SickRage search its show info from when importing
* Automatic XEM Scene Numbering/Naming for seasons/episodes
* Available for any platform, uses a simple HTTP interface
* Specials and multi-episode torrent/nzb support
* Automatic subtitles matching and downloading
* Improved failed download handling
* DupeKey/DupeScore for NZBGet 12+
* Real SSL certificate validation
* Supports Anime shows

## Build Image

```shell
docker build -t xataz/sickrage github.com/xataz/dockerfiles.git#master:sickrage
```

## Configuration
### Environments
* WEBROOT : Choose webroot of sickrage (default : nothing)
* UID : Choose uid for launch sickrage (default : 991)
* GID : Choose gid for launch sickrage (default : 991)
* APIKEY : API KEY for use API (default : Random)

### Volumes
* /config : Path where is configuration of sickrage

### Ports
* 8081 

## Usage
### Speed launch
```shell
docker run -d -p 8081:8081 xataz/sickrage
```
URI access : http://XX.XX.XX.XX:5050

### Advanced launch
```shell
docker run -d -p 8080:8081 \
	-e WEBROOT=/sr \
	-e UID=1001 \
	-e GID=1001 \
	-v /docker/config/SR:/config \
	xataz/sickrage
```
URI access : http://XX.XX.XX.XX:8080/sr
