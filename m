From: Vivek Gautam <gautam.vivek@samsung.com>
Subject: [PATCH] rtc: rtc-s3c: use clk_prepare_enable and clk_disable_unprepare
Date: Tue, 09 Apr 2013 19:57:40 +0530
Message-ID: <1365517660-9322-1-git-send-email-gautam.vivek@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: rtc-linux@googlegroups.com, linux-kernel@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, a.zummo@towertech.it, kgene.kim@samsung.com, s.nawrocki@samsung.com, thomas.ab@samsung.com, dianders@chromium.org, Thomas Abraham <thomas.abraham@linaro.org>, Vivek Gautam <gautam.vivek@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

From: Thomas Abraham <thomas.abraham@linaro.org>

Convert clk_enable/clk_disable to clk_prepare_enable/clk_disable_unprepare
calls as required by common clock framework.

Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>
---

The v1 of this patch is pretty old, but the change needs to be merged to
avoid getting those needless WARN_ON() dumps on console.

Changes from v1:
 - Not using clk_disable_unprepare() at the end of s3c_rtc_probe(), since
   this will unprepare the rtc clock which is again getting used in other
   funtions later.
 - Using clk_unprepare() at the remove() instead to fix things up.

 drivers/rtc/rtc-s3c.c |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
index fb994e9..e3528c9 100644
--- a/drivers/rtc/rtc-s3c.c
+++ b/drivers/rtc/rtc-s3c.c
@@ -430,6 +430,7 @@ static int s3c_rtc_remove(struct platform_device *dev)
 
 	s3c_rtc_setaie(&dev->dev, 0);
 
+	clk_unprepare(rtc_clk);
 	rtc_clk = NULL;
 
 	return 0;
@@ -498,7 +499,7 @@ static int s3c_rtc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	clk_enable(rtc_clk);
+	clk_prepare_enable(rtc_clk);
 
 	/* check to see if everything is setup correctly */
 
@@ -578,7 +579,7 @@ static int s3c_rtc_probe(struct platform_device *pdev)
 
  err_nortc:
 	s3c_rtc_enable(pdev, 0);
-	clk_disable(rtc_clk);
+	clk_disable_unprepare(rtc_clk);
 
 	return ret;
 }
-- 
1.7.6.5
