# Web-HeatMaps
###Create interactive heatmaps using different Esri Basemaps

This node allows you to create a heatmap that is placed over a map of your choice.  The extension comes with the option of 25 different types of base maps.  The only input data needed to create the heat map is the longitude and latitude for the points of interest.  

![Install](https://github.com/IBMPredictiveAnalytics/Web-Heatmaps/blob/master/Screenshot/Illustration1.png?raw=true)

---
Requirements
----
- IBM SPSS Modeler v16 or later
- ‘R Essentials for SPSS Modeler’ plugin: [Download here](7)
-  R 2.15.x or R 3.1

###### This extension requires RTools to be installed.  This is a larger install than a normal R package.  

- The first time you run this extension, an installer for RTools will open
- This is a larger install process than a normal R package.  Click next through each screen.  You may be presented with an option for which version to download.    
  - Choose Rtools215.exe if you are using Modeler 16
  - Choose Rtools31.exe if you are using Modeler 17 
  
  ![Install](https://raw.githubusercontent.com/IBMPredictiveAnalytics/Web-HeatMaps/master/Screenshot/RtoolsInstall.png)

----
1. Download the extension: [Download](3) 
2. Close IBM SPSS Modeler. Save the .cfe file in the CDB directory, located by default on Windows in "C:\ProgramData\IBM\SPSS\Modeler\16\CDB" or under your IBM SPSS Modeler installation directory.
3. Restart IBM SPSS Modeler, the node will now appear in the Output palette.

---
R Packages used
----

The R packages will be installed the first time the node is used as long as an Internet connection is available.

- [plyr](4)
- [rjson](9)
- [installr](10)
- [RTools](11)

---
License
----

[Apache 2.0][1]


Contributors
----

  - Armand Ruiz ([armand_ruiz](https://twitter.com/armand_ruiz))



[1]: http://www.apache.org/licenses/LICENSE-2.0.html
[2]:https://www.ibm.com/smarterplanet/us/en/ibmwatson/developercloud/doc/personality-insights/overview.shtml
[3]: https://github.com/IBMPredictiveAnalytics/Web-Heatmaps/tree/master/Source%20code
[4]:https://cran.r-project.org/web/packages/plyr/
[7]:https://developer.ibm.com/predictiveanalytics/downloads/#tab2
[8]: https://developer.ibm.com/predictiveanalytics/downloads/
[9]: https://cran.r-project.org/web/packages/rjson/
[10]: https://cran.r-project.org/web/packages/installr/
[11]: https://cran.r-project.org/bin/windows/Rtools/