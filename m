From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH V2] drm/exynos: Support DP CLKCON register in FIMD driver
Date: Thu, 26 Jun 2014 20:06:38 +0530
Message-ID: <1403793398-31593-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:30585 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752838AbaFZOj0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 26 Jun 2014 10:39:26 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N7S000AF61OTW10@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 26 Jun 2014 23:39:24 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com, seanpaul@google.com, ajaynumb@gmail.com, joshi@samsung.com, prashanth.g@samsung.com, Ajay Kumar <ajaykumar.rs@samsung.com>

Add the missing setting for DP CLKCON register.

This register is present on Exynos5 based FIMD controllers,
and needs to be used if we are using DP.

Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
---
Changes since V1:
 - Remove usage of driver_data to configure DP CLKCON register
 drivers/gpu/drm/exynos/exynos_dp_core.c  | 2 ++
 drivers/gpu/drm/exynos/exynos_drm_drv.h  | 8 ++++++++
 drivers/gpu/drm/exynos/exynos_drm_fimd.c | 5 +++++
 include/video/samsung_fimd.h             | 4 ++++
 4 files changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/drm/exynos/exynos_dp_core.c
index 2e77a15..d8868f3 100644
--- a/drivers/gpu/drm/exynos/exynos_dp_core.c
+++ b/drivers/gpu/drm/exynos/exynos_dp_core.c
@@ -1336,6 +1336,8 @@ static int exynos_dp_bind(struct device *dev, struct device *master, void *data)
 
 	platform_set_drvdata(pdev, &exynos_dp_display);
 
+	exynos_fimd_output_type = EXYNOS_FIMD_OUTPUT_DP;
+
 	return exynos_drm_create_enc_conn(drm_dev, &exynos_dp_display);
 }
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index 36535f3..1089744 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -60,6 +60,12 @@ enum exynos_drm_output_type {
 	EXYNOS_DISPLAY_TYPE_VIDI,
 };
 
+enum exynos_fimd_output_type {
+	EXYNOS_FIMD_OUTPUT_MIPI,
+	EXYNOS_FIMD_OUTPUT_DPI,
+	EXYNOS_FIMD_OUTPUT_DP,
+};
+
 /*
  * Exynos drm common overlay structure.
  *
@@ -380,4 +386,6 @@ extern struct platform_driver fimc_driver;
 extern struct platform_driver rotator_driver;
 extern struct platform_driver gsc_driver;
 extern struct platform_driver ipp_driver;
+
+extern enum exynos_fimd_output_type exynos_fimd_output_type;
 #endif
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index bb45ab2..a46a9c4 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -90,6 +90,8 @@ static struct fimd_driver_data exynos5_fimd_driver_data = {
 	.has_shadowcon = 1,
 };
 
+enum exynos_fimd_output_type exynos_fimd_output_type;
+
 struct fimd_win_data {
 	unsigned int		offset_x;
 	unsigned int		offset_y;
@@ -331,6 +333,9 @@ static void fimd_commit(struct exynos_drm_manager *mgr)
 	if (clkdiv > 1)
 		val |= VIDCON0_CLKVAL_F(clkdiv - 1) | VIDCON0_CLKDIR;
 
+	if (exynos_fimd_output_type == EXYNOS_FIMD_OUTPUT_DP)
+		writel(DP_CLK_ENABLE, ctx->regs + DP_CLKCON);
+
 	writel(val, ctx->regs + VIDCON0);
 }
 
diff --git a/include/video/samsung_fimd.h b/include/video/samsung_fimd.h
index b039320..d8f4b0b 100644
--- a/include/video/samsung_fimd.h
+++ b/include/video/samsung_fimd.h
@@ -435,6 +435,10 @@
 #define BLENDCON_NEW_8BIT_ALPHA_VALUE		(1 << 0)
 #define BLENDCON_NEW_4BIT_ALPHA_VALUE		(0 << 0)
 
+/* Video clock enable for DP */
+#define DP_CLKCON				0x27C
+#define DP_CLK_ENABLE				0x2
+
 /* Notes on per-window bpp settings
  *
  * Value	Win0	 Win1	  Win2	   Win3	    Win 4
-- 
1.8.3.2
