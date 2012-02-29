From: Karol Lewandowski <k.lewandowsk@samsung.com>
Subject: [PATCH] [media] s5p-g2d: Make it possible to instantiate driver from DT
Date: Wed, 29 Feb 2012 14:54:32 +0100
Message-ID: <1330523672-16453-1-git-send-email-k.lewandowsk@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:58009 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1030583Ab2B2NzD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 29 Feb 2012 08:55:03 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: k.debski@samsung.com
Cc: m.szyprowski@samsung.com, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, Karol Lewandowski <k.lewandowsk@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

This driver requires standard properties only (address and irq)
which are automatically marshalled into plain old resources by OF core.

Signed-off-by: Karol Lewandowski <k.lewandowsk@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/media/video/s5p-g2d/g2d.c |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/drivers/media/video/s5p-g2d/g2d.c b/drivers/media/video/s5p-g2d/g2d.c
index febaa67..e7c0020 100644
--- a/drivers/media/video/s5p-g2d/g2d.c
+++ b/drivers/media/video/s5p-g2d/g2d.c
@@ -20,6 +20,7 @@
 #include <linux/interrupt.h>
 
 #include <linux/platform_device.h>
+#include <linux/of.h>
 #include <media/v4l2-mem2mem.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-ioctl.h>
@@ -795,12 +796,20 @@ static int g2d_remove(struct platform_device *pdev)
 	return 0;
 }
 
+#ifdef CONFIG_OF
+static struct of_device_id g2d_dt_match[] = {
+	{ .compatible = "samsung,exynos4210-g2d" },
+	{},
+};
+#endif
+
 static struct platform_driver g2d_pdrv = {
 	.probe		= g2d_probe,
 	.remove		= g2d_remove,
 	.driver		= {
 		.name = G2D_NAME,
 		.owner = THIS_MODULE,
+		.of_match_table = of_match_ptr(g2d_dt_match),
 	},
 };
 
-- 
1.7.8.3
