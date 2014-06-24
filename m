From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH] drm/exynos: Support DP CLKCON register in FIMD driver
Date: Tue, 24 Jun 2014 16:39:24 +0530
Message-ID: <1403608164-23728-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:60781 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750806AbaFXLMK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 Jun 2014 07:12:10 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N7O00FT473G8660@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 24 Jun 2014 20:11:40 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com, seanpaul@google.com, ajaynumb@gmail.com, joshi@samsung.com, prashanth.g@samsung.com, Ajay Kumar <ajaykumar.rs@samsung.com>

Add the missing setting for DP CLKCON register.

This register is present on Exynos5 based FIMD controllers,
and needs to be used if we are using DP.

Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_fimd.c |    5 +++++
 include/video/samsung_fimd.h             |    4 ++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index 33161ad..5d3045d 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -72,6 +72,7 @@ struct fimd_driver_data {
 	unsigned int has_shadowcon:1;
 	unsigned int has_clksel:1;
 	unsigned int has_limited_fmt:1;
+	unsigned int has_dp_clkcon:1;
 };
 
 static struct fimd_driver_data s3c64xx_fimd_driver_data = {
@@ -88,6 +89,7 @@ static struct fimd_driver_data exynos4_fimd_driver_data = {
 static struct fimd_driver_data exynos5_fimd_driver_data = {
 	.timing_base = 0x20000,
 	.has_shadowcon = 1,
+	.has_dp_clkcon = 1,
 };
 
 struct fimd_win_data {
@@ -331,6 +333,9 @@ static void fimd_commit(struct exynos_drm_manager *mgr)
 	if (clkdiv > 1)
 		val |= VIDCON0_CLKVAL_F(clkdiv - 1) | VIDCON0_CLKDIR;
 
+	if (ctx->driver_data->has_dp_clkcon)
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
1.7.9.5
