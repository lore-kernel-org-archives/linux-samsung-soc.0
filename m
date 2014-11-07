From: YoungJun Cho <yj44.cho@samsung.com>
Subject: [PATCH 1/4] drm/exynos: dsi: support Exynos4415 SoC
Date: Fri, 07 Nov 2014 15:12:24 +0900
Message-ID: <1415340747-27904-2-git-send-email-yj44.cho@samsung.com>
References: <1415340747-27904-1-git-send-email-yj44.cho@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:45485 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751059AbaKGGMd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 7 Nov 2014 01:12:33 -0500
In-reply-to: <1415340747-27904-1-git-send-email-yj44.cho@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, mark.rutland@arm.com, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, robh+dt@kernel.org, galak@codeaurora.org, kyungmin.park@samsung.com, inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, a.hajda@samsung.com, cw00.choi@samsung.com, kgene.kim@samsung.com

This patch supports Exynos4415 SoC.

Signed-off-by: YoungJun Cho <yj44.cho@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 Documentation/devicetree/bindings/video/exynos_dsim.txt | 1 +
 drivers/gpu/drm/exynos/exynos_drm_dsi.c                 | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/video/exynos_dsim.txt b/Documentation/devicetree/bindings/video/exynos_dsim.txt
index e74243b..ca2b4aa 100644
--- a/Documentation/devicetree/bindings/video/exynos_dsim.txt
+++ b/Documentation/devicetree/bindings/video/exynos_dsim.txt
@@ -4,6 +4,7 @@ Required properties:
   - compatible: value should be one of the following
 		"samsung,exynos3250-mipi-dsi" /* for Exynos3250/3472 SoCs */
 		"samsung,exynos4210-mipi-dsi" /* for Exynos4 SoCs */
+		"samsung,exynos4415-mipi-dsi" /* for Exynos4415 SoC */
 		"samsung,exynos5410-mipi-dsi" /* for Exynos5410/5420/5440 SoCs */
   - reg: physical base address and length of the registers set for the device
   - interrupts: should contain DSI interrupt
diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index acf7e9e..ff17c6e 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -316,6 +316,11 @@ static struct exynos_dsi_driver_data exynos4_dsi_driver_data = {
 	.has_clklane_stop = 1,
 };
 
+static struct exynos_dsi_driver_data exynos4415_dsi_driver_data = {
+	.plltmr_reg = 0x58,
+	.has_clklane_stop = 1,
+};
+
 static struct exynos_dsi_driver_data exynos5_dsi_driver_data = {
 	.plltmr_reg = 0x58,
 };
@@ -325,6 +330,8 @@ static struct of_device_id exynos_dsi_of_match[] = {
 	  .data = &exynos3_dsi_driver_data },
 	{ .compatible = "samsung,exynos4210-mipi-dsi",
 	  .data = &exynos4_dsi_driver_data },
+	{ .compatible = "samsung,exynos4415-mipi-dsi",
+	  .data = &exynos4415_dsi_driver_data },
 	{ .compatible = "samsung,exynos5410-mipi-dsi",
 	  .data = &exynos5_dsi_driver_data },
 	{ }
-- 
1.9.0
