#  Blender - Keyframe Multiple
#    Adds hide render keyframes to all selected objects and creates animation sequence
#    Useful for 3D Screenshots from certain emulators.

#   Usage: 
#     First setup Render and Output panels in Blender.

#     Transparency: Render Properties > Film > Transparent [checked]

#     Format, Output Properties - 
#               Set Resolution to a 4:3 resolution (e.g. 1920x1440),
#               and Aspect X to 1.333 to match PlayStation 1. (natively: 320x240)
#     Set frame range, this will match the number of objects.
#     Output: Set output directory and file format, RGBA if transparency needed.

#     Select all objects you want to render.
#     Run script and then 'Render Animation' to output files. (CTRL + F12)

import bpy

# Starting Frame
cur_frame = 0
for object in bpy.context.selected_objects:
    # Add keyframe property
    object.hide_render = True
    object.keyframe_insert("hide_render", frame=cur_frame) 

prev_object = None
for object in bpy.context.selected_objects:
    if prev_object is not None:
        prev_object.hide_render = True
        prev_object.keyframe_insert("hide_render", frame=cur_frame)

    object.hide_render = False
    object.keyframe_insert("hide_render", frame=cur_frame)
    prev_object = object
    
    # Step frame
    cur_frame += 1