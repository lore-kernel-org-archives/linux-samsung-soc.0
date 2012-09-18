From: Leela Krishna Amudala <l.krishna@samsung.com>
Subject: [PATCH] video: drm: Add match table for drm platform device
Date: Wed, 19 Sep 2012 00:05:41 +0530
Message-ID: <1347993341-11340-1-git-send-email-l.krishna@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:26158 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932495Ab2IRMgu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Sep 2012 08:36:50 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MAJ00KAVPPDI341@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 18 Sep 2012 21:36:49 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.106])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MAJ00G3TPNWJ0B0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 18 Sep 2012 21:36:49 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, devicetree-discuss@lists.ozlabs.org
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, inki.dae@samsung.com, jg1.han@samsung.com

This patch adds match table for drm platform device.

Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_drv.c |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index d070719..18abdcc 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -294,12 +294,21 @@ static int exynos_drm_platform_remove(struct platform_device *pdev)
 	return 0;
 }
 
+#ifdef CONFIG_OF
+static const struct of_device_id drm_device_dt_match[] = {
+	{ .compatible = "samsung,exynos-drm-device"},
+	{},
+};
+MODULE_DEVICE_TABLE(of, drm_device_dt_match);
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
