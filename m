From: Baole Ni <baolex.ni@intel.com>
Subject: [PATCH 0530/1285] Replace numeric parameter like 0444 with macro
Date: Tue,  2 Aug 2016 19:21:22 +0800
Message-ID: <20160802112122.17292-1-baolex.ni@intel.com>
Return-path: <linux-media-owner@vger.kernel.org>
Sender: linux-media-owner@vger.kernel.org
To: mchehab@kernel.org, maurochehab@gmail.com, mchehab@infradead.org, mchehab@redhat.com, m.chehab@samsung.com, sylvester.nawrocki@gmail.com, s.nawrocki@samsung.com, kgene@kernel.org, k.kozlowski@samsung.com
Cc: linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, chuansheng.liu@intel.com, baolex.ni@intel.com, nenggun.kim@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

I find that the developers often just specified the numeric value
when calling a macro which is defined with a parameter for access permission.
As we know, these numeric value for access permission have had the corresponding macro,
and that using macro can improve the robustness and readability of the code,
thus, I suggest replacing the numeric parameter with the macro.

Signed-off-by: Chuansheng Liu <chuansheng.liu@intel.com>
Signed-off-by: Baole Ni <baolex.ni@intel.com>
---
 drivers/media/platform/s3c-camif/camif-capture.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/s3c-camif/camif-capture.c b/drivers/media/platform/s3c-camif/camif-capture.c
index bd060ef..1d3405c 100644
--- a/drivers/media/platform/s3c-camif/camif-capture.c
+++ b/drivers/media/platform/s3c-camif/camif-capture.c
@@ -41,7 +41,7 @@
 #include "camif-regs.h"
 
 static int debug;
-module_param(debug, int, 0644);
+module_param(debug, int, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);
 
 /* Locking: called with vp->camif->slock spinlock held */
 static void camif_cfg_video_path(struct camif_vp *vp)
-- 
2.9.2
