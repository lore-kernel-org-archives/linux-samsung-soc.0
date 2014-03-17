From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 8/9] drm/exynos/fimd: use polarization flags provided by
 drm_display_mode
Date: Mon, 17 Mar 2014 11:27:24 +0100
Message-ID: <1395052045-23848-9-git-send-email-a.hajda@samsung.com>
References: <1395052045-23848-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:34331 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932656AbaCQK2F (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Mar 2014 06:28:05 -0400
In-reply-to: <1395052045-23848-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: Andrzej Hajda <a.hajda@samsung.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Sean Paul <seanpaul@chromium.org>, Inki Dae <inki.dae@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Denis Carikli <denis@eukrea.com>

The patch replaces fimd private bindings for signal polarization by
polarization flags provided by drm_display_mode.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_fimd.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index 15d6b37..dbfad4e 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -115,7 +115,6 @@ struct fimd_context {
 	unsigned int			default_win;
 	unsigned long			irq_flags;
 	u32				vidcon0;
-	u32				vidcon1;
 	bool				suspended;
 	int				pipe;
 	wait_queue_head_t		wait_vsync_queue;
@@ -232,7 +231,11 @@ static void fimd_commit(struct exynos_drm_manager *mgr)
 		return;
 
 	/* setup polarity values */
-	vidcon1 = ctx->vidcon1;
+	vidcon1 = 0;
+	if (mode->pol_flags & DRM_MODE_FLAG_POL_DE_NEGEDGE)
+		vidcon1 |= VIDCON1_INV_VDEN;
+	if (mode->pol_flags & DRM_MODE_FLAG_POL_PIXDATA_NEGEDGE)
+		vidcon1 |= VIDCON1_INV_VCLK;
 	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
 		vidcon1 |= VIDCON1_INV_VSYNC;
 	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
@@ -875,11 +878,6 @@ static int fimd_probe(struct platform_device *pdev)
 	ctx->dev = dev;
 	ctx->suspended = true;
 
-	if (of_property_read_bool(dev->of_node, "samsung,invert-vden"))
-		ctx->vidcon1 |= VIDCON1_INV_VDEN;
-	if (of_property_read_bool(dev->of_node, "samsung,invert-vclk"))
-		ctx->vidcon1 |= VIDCON1_INV_VCLK;
-
 	ctx->bus_clk = devm_clk_get(dev, "fimd");
 	if (IS_ERR(ctx->bus_clk)) {
 		dev_err(dev, "failed to get bus clock\n");
-- 
1.8.3.2
