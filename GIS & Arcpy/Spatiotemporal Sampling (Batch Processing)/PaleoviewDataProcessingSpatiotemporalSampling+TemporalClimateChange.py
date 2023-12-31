#Paleoview data processing into temporal movies of climate change
#Download Paleoview climate data to local computer
#Process Paleoview data into relevant climate variables in ESRI GRID format(Make sure the path does not have any spaces in the name for downstream processing)
#Record of Paleoview log files for the data I created:
	#Temperature variables:
		#11 Mar 2017 06:11AM
		#Grid Data Files Generated for Annual Mean Temperature
		#Region: Global
		#Period: 21000 BP - 0 BP
		#Interval: 30 year intervals taken in 20 year steps
		#Bias Correction: On
		#1051 ESRI ASCII data files generated in C:\Users\Lindsey\Documents\PhD\Analysis\Data\Paleoclimate Data\Paleoview\10Mar2017_1223AM_31.019s
		
#IMPORTANT: Update grid filenames using Batch Rename Utility so the dumb computer sort order follows the time frame. What I found to work was to sort on date modified, 
	then adding an alphanumeric prefix, and for A-Z also add a '0' prefix onto that, and for A** files add a 'ZZZ' prefix
#If needed, batch Extract by Mask the climate rasters to land shapefile to exclude ocean data (right click on tool for batch processing). Can add .asc files, but make output .tif	
#Calculate timestep differences in climate change from grid files
	#Update the paths etc (##) then copy and paste the following script into the Arcpy window:
import arcpy, os
import arcpy
from arcpy import env
from arcpy.sa import *
##Point to folder with batch of rasters for manipulation. Make sure sort order is dumb computer-proof
arcpy.env.workspace = r'C:\Users\Lindsey\Documents\PhD\Analysis\Data\RasterMath\1300_21000'
##Make sure the input file format is correct (e.g. .asc vs. .tif etc.)
rasters = arcpy.ListRasters("*.asc")
##Define where you want the output rasters to go
dirOut = r"C:\Users\Lindsey\Documents\PhD\Analysis\Data\RasterMath"
#Iterates through adjacent rasters to subtract one from the other
for x in range(1, len(rasters)):
    print("Subtracting {} from {}".format(rasters[x-1], rasters[x]))
    raster = Raster(rasters[x]) - Raster(rasters[x - 1])

    rasterOut = os.path.join(dirOut, '{}_{}.tif'.format(rasters[x], rasters[x-1]))
    if arcpy.Exists(rasterOut):
        print("\tThe output raster {} already exists.".format(rasterOut))
    else:
        print("\tSaving to {}".format(rasterOut))
        raster.save(rasterOut)

#Process Grid Files into Mosaic Datasets
	#In a new ArcMap, using ArcCatalog, create a new file geodatabase in the folder that stores all of the grid files for the variable you want to process. Make this the default geodatabase.
	#Run the following script to make mosaic datasets and then add the appropriate raster to them:
import arcpy, os
##Set working directory where all of the target rasters are saved.
arcpy.env.workspace = r'C:/Users/Lindsey/Documents/PhD/Analysis/Data/10Mar2017_1223AM_31.019s_MeanTemp/ExtractbyMask/Subset'
##Set the default geodatabase where all of the mosaic datesets will be saved
db = r'C:/Users/Lindsey/Documents/PhD/Analysis/Data/10Mar2017_1223AM_31.019s_MeanTemp/FinalMeanAnnualTemperature.gdb'
##Define the projection. Code 54001 is for World Plate Carree
sr = arcpy.SpatialReference(54001)
#Make sure the input format of the rasters you want to use is correct
rasters = arcpy.ListRasters("*.tif")
for x in range(0, len(rasters)):
	print "creating mosaic dataset {0}".format(rasters[x])
	mosaics = arcpy.CreateMosaicDataset_management(db, rasters[x], sr, "", "", "NONE", "")
	arcpy.AddRastersToMosaicDataset_management(mosaics, "Raster Dataset", rasters[x],"", "",
     "UPDATE_OVERVIEWS", "", "", "", 
     "", "", "NO_SUBFOLDERS", "EXCLUDE_DUPLICATES",
     "BUILD_PYRAMIDS", "CALCULATE_STATISTICS", "BUILD_THUMBNAILS", 
     "", "")
#Create Master Mosaic Dataset with all of the above newly created mosaics.
	#In ArcCatalog, right-click on the geodatabase containing all of the individual mosaics and click New > Mosaic Dataset. Give it a name and the coordinate system of the input rasters (e.g. World Plate Carree)
	#In ArcCatalog, right-click on the new master mosaic dataset and Add Rasters. Use the add Dataset option and open the folder to the geodatabase you are working in and select all of the input mosaic datasets.
	
#To ensure all time periods are on the same color scale, calculate cell stats? and find the minimum and maximum of the variable. Save this as a layer file. Use this range for the stretched color scheme.
#Making movies
	#The time slider isn't capable of handling BC dates. To work around this, add 2 long integer fields to the master mosaic dataset. Probably an easier way to do this, but what I did was to
		#field calculate the first field as whatever math will give you the year of the data. In my case it was to [(multiply the objectID field by 20)-20]. Now since we want the time slider to go from the 
		#oldest to the youngest dates, in the second field, I calculated the absolute value of [the date from field 1, minus 21000 years (or whatever the max BC year in your dataset is)].
	#May need to update the max number of rasters that can be displayed to e.g. 1058?
	#Right click on the master mosaic dataset and time-enable the file, using the "year" value calculated in the second field from above.