From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [patch] [media] s3c-camif: forever loop in
 camif_hw_set_source_format()
Date: Fri, 23 Aug 2013 12:41:47 +0300
Message-ID: <20130823094147.GM31293@elgon.mountain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <kernel-janitors-owner@vger.kernel.org>
Content-Disposition: inline
Sender: kernel-janitors-owner@vger.kernel.org
To: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Cc: Mauro Carvalho Chehab <m.chehab@samsung.com>, linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org, kernel-janitors@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Because "i" is unsigned then "i-- >= 0" is always true.  If we don't
find what we are looking for then we loop forever.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Why do we count backwards anyway?  Counting upwards is easier.

diff --git a/drivers/media/platform/s3c-camif/camif-regs.c b/drivers/media/platform/s3c-camif/camif-regs.c
index a9e3b16..ebf5b18 100644
--- a/drivers/media/platform/s3c-camif/camif-regs.c
+++ b/drivers/media/platform/s3c-camif/camif-regs.c
@@ -106,15 +106,15 @@ static const u32 src_pixfmt_map[8][2] = {
 void camif_hw_set_source_format(struct camif_dev *camif)
 {
 	struct v4l2_mbus_framefmt *mf = &camif->mbus_fmt;
-	unsigned int i = ARRAY_SIZE(src_pixfmt_map);
+	int i;
 	u32 cfg;
 
-	while (i-- >= 0) {
+	for (i = ARRAY_SIZE(src_pixfmt_map) - 1; i >= 0; i--) {
 		if (src_pixfmt_map[i][0] == mf->code)
 			break;
 	}
-
-	if (i == 0 && src_pixfmt_map[i][0] != mf->code) {
+	if (i < 0) {
+		i = 0;
 		dev_err(camif->dev,
 			"Unsupported pixel code, falling back to %#08x\n",
 			src_pixfmt_map[i][0]);
