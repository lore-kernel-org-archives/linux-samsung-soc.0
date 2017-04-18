From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 5/7] drm/exynos/mic: use mode info stored in CRTC to detect i80
 mode
Date: Tue, 18 Apr 2017 14:40:01 +0200
Message-ID: <1492519203-23537-6-git-send-email-a.hajda@samsung.com>
References: <1492519203-23537-1-git-send-email-a.hajda@samsung.com>
 <CGME20170418124013eucas1p1524b3f5028ca0d5b9d962ab17c557913@eucas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:46152 "EHLO
        mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752911AbdDRMkU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 18 Apr 2017 08:40:20 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OOL00DS0V733490@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 18 Apr 2017 13:40:15 +0100 (BST)
In-reply-to: <1492519203-23537-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org

MIC driver should use info from CRTC to check mode of work instead of
illegally peeking into nodes of other devices.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_mic.c | 44 +++------------------------------
 1 file changed, 4 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_mic.c b/drivers/gpu/drm/exynos/exynos_drm_mic.c
index e457205..9f2fa8a 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_mic.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_mic.c
@@ -21,9 +21,12 @@
 #include <linux/component.h>
 #include <linux/pm_runtime.h>
 #include <drm/drmP.h>
+#include <drm/drm_encoder.h>
 #include <linux/mfd/syscon.h>
 #include <linux/regmap.h>
 
+#include <exynos_drm_drv.h>
+
 /* Sysreg registers for MIC */
 #define DSD_CFG_MUX	0x1004
 #define MIC0_RGB_MUX	(1 << 0)
@@ -85,12 +88,6 @@
 
 #define MIC_BS_SIZE_2D(x)	((x) & 0x3fff)
 
-enum {
-	ENDPOINT_DECON_NODE,
-	ENDPOINT_DSI_NODE,
-	NUM_ENDPOINTS
-};
-
 static char *clk_names[] = { "pclk_mic0", "sclk_rgb_vclk_to_mic0" };
 #define NUM_CLKS		ARRAY_SIZE(clk_names)
 static DEFINE_MUTEX(mic_mutex);
@@ -229,36 +226,6 @@ static void mic_set_reg_on(struct exynos_mic *mic, bool enable)
 	writel(reg, mic->reg + MIC_OP);
 }
 
-static int parse_dt(struct exynos_mic *mic)
-{
-	int ret = 0, i, j;
-	struct device_node *remote_node;
-	struct device_node *nodes[3];
-
-	/*
-	 * The order of endpoints does matter.
-	 * The first node must be for decon and the second one must be for dsi.
-	 */
-	for (i = 0, j = 0; i < NUM_ENDPOINTS; i++) {
-		remote_node = of_graph_get_remote_node(mic->dev->of_node, i, 0);
-		if (!remote_node) {
-			ret = -EPIPE;
-			goto exit;
-		}
-		nodes[j++] = remote_node;
-
-		if (i == ENDPOINT_DECON_NODE &&
-			of_get_child_by_name(remote_node, "i80-if-timings"))
-			mic->i80_mode = 1;
-	}
-
-exit:
-	while (--j > -1)
-		of_node_put(nodes[j]);
-
-	return ret;
-}
-
 static void mic_disable(struct drm_bridge *bridge) { }
 
 static void mic_post_disable(struct drm_bridge *bridge)
@@ -286,6 +253,7 @@ static void mic_mode_set(struct drm_bridge *bridge,
 
 	mutex_lock(&mic_mutex);
 	drm_display_mode_to_videomode(mode, &mic->vm);
+	mic->i80_mode = to_exynos_crtc(bridge->encoder->crtc)->i80_mode;
 	mutex_unlock(&mic_mutex);
 }
 
@@ -425,10 +393,6 @@ static int exynos_mic_probe(struct platform_device *pdev)
 
 	mic->dev = dev;
 
-	ret = parse_dt(mic);
-	if (ret)
-		goto err;
-
 	ret = of_address_to_resource(dev->of_node, 0, &res);
 	if (ret) {
 		DRM_ERROR("mic: Failed to get mem region for MIC\n");
-- 
2.7.4
