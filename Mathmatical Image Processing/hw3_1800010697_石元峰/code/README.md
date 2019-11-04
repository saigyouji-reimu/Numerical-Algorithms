### Homework 3:

###  Active Contour and CV model

----

Yuanfeng Shi, 1800010697


This project contains the following files:

**`active_contour.m`** implements the active contour method by  the function `v = active_contour(image_path, steps, rein_steps, k)` .

e.g. `active_contour('image/z.JPG', 20000, 20, 0.5)`

`active_contour('image/1.JPG',8000,20,0.01)`



**`CV_model.m`** implements the CV model :

`u = convex_MS(image_path,lambda, steps, rein_steps, u)`

e.g. `u=CV_model('image/1.JPG',1,100,20)`



. The result will be visualized as following function:

for the level set use `imshow(u<0)`

for the contour of the segmentation use `show_contour(v)`



The folder **`image/`** contains all the test image appeared in my report.