<?php /* #?ini charset="utf-8"?

# Setting file for ezflow blocks as used by the Layout datatype
# A layout is divided into zones and then blocks, take a look in
# zone.ini for zone definitions.
 
[General]
#AllowedTypes[]=Example
AllowedTypes[]=search_detal

[PushToBlock]
# List of content classes using Layout datatype
ContentClasses[]=frontpage
# The subtree node ID from which to fetch objects with Layout datatype
RootSubtree=1

[MainStory]
ViewList[]=main_story_full
ViewName[main_story_full]=Main story full

[search_detal]
Name=Search Detal
ManualAddingOfItems=disabled
CustomAttributes[]
ViewList[]=search
ViewName[search]=search detal

*/ ?>
