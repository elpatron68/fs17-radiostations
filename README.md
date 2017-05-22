# fs17-radiostations

Add radio stations from http://www.radio-browser.info/ (via API) to your Farming Simulator 2017 configuration.

![Screenshot](/screenshot/FS17_Radiomanager.png)

## Requirements
  - Windows 7 or higher
  - Microsoft .NET Framework 4.5 or higher
  - Installation of the game Farmin Simulator 2017

## Download
Download portable version or setup.exe from [Releases](/releases).

## Adding and removing radio stations
Start this program, enter a seach term into the text box and click on the search button. Save the station(s) you would like to be added to 
the list of FS17-Internet radio stations by right clicking on the station(s).

You can delete stations from the list by editing the configuration file (right button):

```
<?xml version="1.0" encoding="utf-8" standalone="no"?>
<streamingInternetRadios>
  <streamingInternetRadio href="http://strm112.1.fm/crock_mobile_mp3">
    <!--1.FM - Classic Rock Replay Radio-->
  </streamingInternetRadio>
  <streamingInternetRadio href="http://str4uice.streamakaci.com/4uclassicrock.mp3">
    <!--123 All Classic Rock-->
  </streamingInternetRadio>
  <streamingInternetRadio href="http://178.32.62.154:8922/stream">
    <!--Radio Nora-->
  </streamingInternetRadio>
  <streamingInternetRadio href="http://provisioning.streamtheworld.com/pls/CJRLFMAAC.pls">
    <!--CJRL 89.5 "The Lake" Kenora, ON-->
  </streamingInternetRadio>
</streamingInternetRadios>
```
(Example `streamingInternetRadios.xml` file)

Remove a station by deleting it´s corresponding lines. Example: Delete the lines
```
  <streamingInternetRadio href="http://strm112.1.fm/crock_mobile_mp3">
    <!--1.FM - Classic Rock Replay Radio-->
  </streamingInternetRadio>
```
to remove the station *1.FM - Classic Rock Replay Radio*. Save the file and restart FS17 (if it was running).


## Useage in the game
Start the game, enter a vehicle and start the radio with key `[5]`, play the next station `[6]` or go to previous `[4]`.

## Uninstallation
Uninstall this software by using the Windows Software Uninstall control panel.

