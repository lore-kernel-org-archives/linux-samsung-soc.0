From: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: [PATCH] video: fbdev: s3c2410fb: Move to clk_prepare_enable/clk_disable_unprepare
Date: Mon, 30 Jun 2014 22:14:32 +0300
Message-ID: <1404155672-3158-1-git-send-email-anarsoul@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f180.google.com ([209.85.212.180]:44046 "EHLO
	mail-wi0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754601AbaF3TQw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Jun 2014 15:16:52 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-fbdev@vger.kernel.org
Cc: Vasily Khoruzhick <anarsoul@gmail.com>

Use clk_prepare_enable/clk_disable_unprepare to make the driver
work properly with common clock framework.

Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
---
 drivers/video/fbdev/s3c2410fb.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/video/fbdev/s3c2410fb.c b/drivers/video/fbdev/s3c2410fb.c
index 81af5a6..d68595d 100644
--- a/drivers/video/fbdev/s3c2410fb.c
+++ b/drivers/video/fbdev/s3c2410fb.c
@@ -932,7 +932,7 @@ static int s3c24xxfb_probe(struct platform_device *pdev,
 		goto release_irq;
 	}
 
-	clk_enable(info->clk);
+	clk_prepare_enable(info->clk);
 	dprintk("got and enabled clock\n");
 
 	usleep_range(1000, 1100);
@@ -996,7 +996,7 @@ static int s3c24xxfb_probe(struct platform_device *pdev,
 free_video_memory:
 	s3c2410fb_unmap_video_memory(fbinfo);
 release_clock:
-	clk_disable(info->clk);
+	clk_disable_unprepare(info->clk);
 	clk_put(info->clk);
 release_irq:
 	free_irq(irq, info);
@@ -1038,7 +1038,7 @@ static int s3c2410fb_remove(struct platform_device *pdev)
 	s3c2410fb_unmap_video_memory(fbinfo);
 
 	if (info->clk) {
-		clk_disable(info->clk);
+		clk_disable_unprepare(info->clk);
 		clk_put(info->clk);
 		info->clk = NULL;
 	}
@@ -1070,7 +1070,7 @@ static int s3c2410fb_suspend(struct platform_device *dev, pm_message_t state)
 	 * before the clock goes off again (bjd) */
 
 	usleep_range(1000, 1100);
-	clk_disable(info->clk);
+	clk_disable_unprepare(info->clk);
 
 	return 0;
 }
@@ -1080,7 +1080,7 @@ static int s3c2410fb_resume(struct platform_device *dev)
 	struct fb_info	   *fbinfo = platform_get_drvdata(dev);
 	struct s3c2410fb_info *info = fbinfo->par;
 
-	clk_enable(info->clk);
+	clk_prepare_enable(info->clk);
 	usleep_range(1000, 1100);
 
 	s3c2410fb_init_registers(fbinfo);
-- 
2.0.0
