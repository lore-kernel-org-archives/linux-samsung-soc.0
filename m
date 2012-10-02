From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH] [media] s5p-jpeg: use clk_prepare_enable and clk_disable_unprepare
Date: Wed,  3 Oct 2012 08:55:02 +0900
Message-ID: <1349222102-3183-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-media-owner@vger.kernel.org>
Sender: linux-media-owner@vger.kernel.org
To: linux-media@vger.kernel.org
Cc: mchehab@infradead.org, andrzej.p@samsung.com, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Convert clk_enable/clk_disable to clk_prepare_enable/clk_disable_unprepare
calls as required by common clock framework.

Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
---
 drivers/media/platform/s5p-jpeg/jpeg-core.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/s5p-jpeg/jpeg-core.c b/drivers/media/platform/s5p-jpeg/jpeg-core.c
index 90459cef..9df35b2 100644
--- a/drivers/media/platform/s5p-jpeg/jpeg-core.c
+++ b/drivers/media/platform/s5p-jpeg/jpeg-core.c
@@ -1353,7 +1353,7 @@ static int s5p_jpeg_probe(struct platform_device *pdev)
 		return ret;
 	}
 	dev_dbg(&pdev->dev, "clock source %p\n", jpeg->clk);
-	clk_enable(jpeg->clk);
+	clk_prepare_enable(jpeg->clk);
 
 	/* v4l2 device */
 	ret = v4l2_device_register(&pdev->dev, &jpeg->v4l2_dev);
@@ -1459,7 +1459,7 @@ device_register_rollback:
 	v4l2_device_unregister(&jpeg->v4l2_dev);
 
 clk_get_rollback:
-	clk_disable(jpeg->clk);
+	clk_disable_unprepare(jpeg->clk);
 	clk_put(jpeg->clk);
 
 	return ret;
@@ -1479,7 +1479,7 @@ static int s5p_jpeg_remove(struct platform_device *pdev)
 	v4l2_m2m_release(jpeg->m2m_dev);
 	v4l2_device_unregister(&jpeg->v4l2_dev);
 
-	clk_disable(jpeg->clk);
+	clk_disable_unprepare(jpeg->clk);
 	clk_put(jpeg->clk);
 
 	return 0;
-- 
1.7.4.1
