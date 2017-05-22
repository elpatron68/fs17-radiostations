# fs17-radiostations

Add radio stations from http://www.radio-browser.info/ (via API) to your Farming Simulator 2017 configuration.

![Screenshot](/screenshot/FS17_Radiomanager.png)

## Requirements
  - Windows 7 or higher
  - Installation of the game Farmin Simulator 2017

## Download
Download portable version or setup.exe from [Releases](/releases)

## Adding and removing radio stations
Start this program, enter a seach term into the text box and click on the search button. Save the station(s) you would like to be added to 
the list of FS17-Internet Radio Stations by right clicking on the station(s).

You can delete stations from the list by editing the configuration file (right button):

```
<?xml version="1.0" encoding="utf-8" standalone="no" ?>

<streamingInternetRadios>
<!--streamingInternetRadio href="http://www.please-edit-this-01.com/stream.m3u" /-->
<!--streamingInternetRadio href="http://www.please-edit-this-02.com/stream.m3u" /-->
<!--streamingInternetRadio href="http://www.please-edit-this-03.com/stream.m3u" /-->
</streamingInternetRadios>
```
Example `streamingInternetRadios.xml` file

Remove a station by deleting it´s corresponding line (`<!--streamingInternetRadio href="http://www.please-edit-this-02.com/stream.m3u" /-->`) from the file.

## Useage in the game
Start the game, get on a vehicle, start the radio with key `5`, play the next station (`6`) or gi to previous (`4`).

## Uninstallation
Uninstall this software by using the Windows Software Uninstall control panel.

