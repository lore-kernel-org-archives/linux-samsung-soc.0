From: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Subject: [PATCH] drm/exynos: dsi: Remove bridge node reference in removal
Date: Mon, 13 Feb 2017 15:19:15 +0900
Message-ID: <1486966755-24517-1-git-send-email-hoegeun.kwon@samsung.com>
References: <CGME20170213061933epcas1p40510b18ee1ae688f4e5e5187969830f0@epcas1p4.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:44941 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751340AbdBMGTn (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 13 Feb 2017 01:19:43 -0500
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OLA00X7AUWM9K60@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 13 Feb 2017 15:19:34 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: inki.dae@samsung.com
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, Hoegeun Kwon <hoegeun.kwon@samsung.com>

Since bridge node is referenced during in the probe, it should be
released on removal.

Suggested-by: Andrzej Hajda <a.hajda@samsung.com>
Signed-off-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 214d486..2d4e118 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1821,6 +1821,10 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 
 static int exynos_dsi_remove(struct platform_device *pdev)
 {
+	struct exynos_dsi *dsi = platform_get_drvdata(pdev);
+
+	of_node_put(dsi->bridge_node);
+
 	pm_runtime_disable(&pdev->dev);
 
 	component_del(&pdev->dev, &exynos_dsi_component_ops);
-- 
1.9.1
