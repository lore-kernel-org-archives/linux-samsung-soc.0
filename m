From: Chanho Park <parkch98@gmail.com>
Subject: [PATCH] drm/exynos: add mic_bypass option for exynos542x fimd
Date: Sat, 30 Jan 2016 22:58:51 +0900
Message-ID: <1454162331-23555-1-git-send-email-parkch98@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f52.google.com ([209.85.220.52]:34187 "EHLO
	mail-pa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756820AbcA3N7a (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 30 Jan 2016 08:59:30 -0500
Received: by mail-pa0-f52.google.com with SMTP id uo6so57608956pac.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Jan 2016 05:59:29 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: inki.dae@samsung.com
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, Chanho Park <chanho61.park@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>

From: Chanho Park <chanho61.park@samsung.com>

This patch adds a mic_bypass option to bypass the mic
from display out path. The mic(Mobile image compressor) compresses
RGB data from fimd and send the compressed data to the mipi dsi.
The bypass option can be founded from system register and the bit
of the option is 11.

Cc: Inki Dae <inki.dae@samsung.com>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 .../devicetree/bindings/display/exynos/samsung-fimd.txt    |  2 ++
 drivers/gpu/drm/exynos/exynos_drm_fimd.c                   | 14 ++++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/exynos/samsung-fimd.txt b/Documentation/devicetree/bindings/display/exynos/samsung-fimd.txt
index 27c3ce0..7f90c4a 100644
--- a/Documentation/devicetree/bindings/display/exynos/samsung-fimd.txt
+++ b/Documentation/devicetree/bindings/display/exynos/samsung-fimd.txt
@@ -45,6 +45,8 @@ Optional Properties:
 		Can be used in case timings cannot be provided otherwise
 		or to override timings provided by the panel.
 - samsung,sysreg: handle to syscon used to control the system registers
+- samsung,mic-bypass: bypass mic(mobile image compressor) from display path.
+		      This option is only available since exynos5420.
 - i80-if-timings: timing configuration for lcd i80 interface support.
   - cs-setup: clock cycles for the active period of address signal is enabled
               until chip select is enabled.
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index 70194d0..4fb2952 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -94,6 +94,7 @@ struct fimd_driver_data {
 	unsigned int lcdblk_offset;
 	unsigned int lcdblk_vt_shift;
 	unsigned int lcdblk_bypass_shift;
+	unsigned int lcdblk_mic_bypass_shift;
 
 	unsigned int has_shadowcon:1;
 	unsigned int has_clksel:1;
@@ -140,6 +141,7 @@ static struct fimd_driver_data exynos5_fimd_driver_data = {
 	.lcdblk_offset = 0x214,
 	.lcdblk_vt_shift = 24,
 	.lcdblk_bypass_shift = 15,
+	.lcdblk_mic_bypass_shift = 11,
 	.has_shadowcon = 1,
 	.has_vidoutcon = 1,
 	.has_vtsel = 1,
@@ -162,6 +164,7 @@ struct fimd_context {
 	u32				i80ifcon;
 	bool				i80_if;
 	bool				suspended;
+	bool				mic_bypass;
 	int				pipe;
 	wait_queue_head_t		wait_vsync_queue;
 	atomic_t			wait_vsync_event;
@@ -461,6 +464,14 @@ static void fimd_commit(struct exynos_drm_crtc *crtc)
 		return;
 	}
 
+	if (ctx->mic_bypass && ctx->sysreg && regmap_update_bits(ctx->sysreg,
+				driver_data->lcdblk_offset,
+				0x1 << driver_data->lcdblk_mic_bypass_shift,
+				0x1 << driver_data->lcdblk_mic_bypass_shift)) {
+		DRM_ERROR("Failed to update sysreg for bypass mic.\n");
+		return;
+	}
+
 	/* setup horizontal and vertical display size. */
 	val = VIDTCON2_LINEVAL(mode->vdisplay - 1) |
 	       VIDTCON2_HOZVAL(mode->hdisplay - 1) |
@@ -1014,6 +1025,9 @@ static int fimd_probe(struct platform_device *pdev)
 	if (of_property_read_bool(dev->of_node, "samsung,invert-vclk"))
 		ctx->vidcon1 |= VIDCON1_INV_VCLK;
 
+	if (of_property_read_bool(dev->of_node, "samsung,mic-bypass"))
+		ctx->mic_bypass = true;
+
 	i80_if_timings = of_get_child_by_name(dev->of_node, "i80-if-timings");
 	if (i80_if_timings) {
 		u32 val;
-- 
2.5.0
