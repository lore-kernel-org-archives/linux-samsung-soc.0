From: Bhumika Goyal <bhumirks@gmail.com>
Subject: [PATCH] media: platform: s3c-camif: constify v4l2_subdev_ops structures
Date: Wed, 14 Dec 2016 16:41:10 +0530
Message-ID: <1481713870-7513-1-git-send-email-bhumirks@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: julia.lawall@lip6.fr, sylvester.nawrocki@gmail.com, mchehab@kernel.org, linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Bhumika Goyal <bhumirks@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org

Check for v4l2_subdev_ops structures that are only passed as an
argument to the function v4l2_subdev_init. This argument is of type
const, so v4l2_subdev_ops structures having this property can also  be
declared const.
Done using Coccinelle:

@r1 disable optional_qualifier @
identifier i;
position p;
@@
static struct v4l2_subdev_ops i@p = {...};

@ok1@
identifier r1.i;
position p;
@@
v4l2_subdev_init(...,&i@p)

@bad@
position p!={r1.p,ok1.p};
identifier r1.i;
@@
i@p

@depends on !bad disable optional_qualifier@
identifier r1.i;
@@
+const
struct v4l2_subdev_ops i;

File size before:
   text	   data	    bss	    dec	    hex	filename
  17171	   1912	     20	  19103	   4a9f
platform/s3c-camif/camif-capture.o

File size after:
   text	   data	    bss	    dec	    hex	filename
  17235	   1848	     20	  19103	   4a9f
platform/s3c-camif/camif-capture.o

Signed-off-by: Bhumika Goyal <bhumirks@gmail.com>
---
 drivers/media/platform/s3c-camif/camif-capture.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/s3c-camif/camif-capture.c b/drivers/media/platform/s3c-camif/camif-capture.c
index 0413a86..6125e72 100644
--- a/drivers/media/platform/s3c-camif/camif-capture.c
+++ b/drivers/media/platform/s3c-camif/camif-capture.c
@@ -1488,7 +1488,7 @@ static int s3c_camif_subdev_set_selection(struct v4l2_subdev *sd,
 	.set_fmt = s3c_camif_subdev_set_fmt,
 };
 
-static struct v4l2_subdev_ops s3c_camif_subdev_ops = {
+static const struct v4l2_subdev_ops s3c_camif_subdev_ops = {
 	.pad = &s3c_camif_subdev_pad_ops,
 };
 
-- 
1.9.1
