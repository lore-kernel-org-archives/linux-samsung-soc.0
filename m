From: Leela Krishna Amudala <l.krishna@samsung.com>
Subject: [PATCH V2] drm/exynos: Add match table for drm platform device
Date: Sat, 22 Sep 2012 00:07:41 +0530
Message-ID: <1348252661-6983-1-git-send-email-l.krishna@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:40376 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752176Ab2IUMMi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 21 Sep 2012 08:12:38 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MAP00MGI8KZDQ90@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 21 Sep 2012 21:12:36 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.106])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MAP00I6B8JJ4Y70@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 21 Sep 2012 21:12:36 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, devicetree-discuss@lists.ozlabs.org
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, inki.dae@samsung.com, jg1.han@samsung.com

This patch is a part of moving the driver to support DT style probing
of exynos drm device. The compatible name should match with the
entry in the dtsi file.

Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_drv.c |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index d070719..495be89 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -294,12 +294,23 @@ static int exynos_drm_platform_remove(struct platform_device *pdev)
 	return 0;
 }
 
+#ifdef CONFIG_OF
+static const struct of_device_id drm_device_dt_match[] = {
+	{ .compatible = "samsung,exynos-drm-device"},
+	{},
+};
+MODULE_DEVICE_TABLE(of, drm_device_dt_match);
+#else
+#define drm_device_dt_match NULL
+#endif
+
 static struct platform_driver exynos_drm_platform_driver = {
 	.probe		= exynos_drm_platform_probe,
 	.remove		= __devexit_p(exynos_drm_platform_remove),
 	.driver		= {
 		.owner	= THIS_MODULE,
 		.name	= "exynos-drm",
+		.of_match_table = of_match_ptr(drm_device_dt_match),
 	},
 };
 
-- 
1.7.0.4
