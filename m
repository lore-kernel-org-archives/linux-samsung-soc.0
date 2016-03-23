From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 4/6] drm/exynos/decon5433: enable HDMI-PHY before configuring
 DECON
Date: Wed, 23 Mar 2016 14:26:00 +0100
Message-ID: <1458739562-32327-5-git-send-email-a.hajda@samsung.com>
References: <1458739562-32327-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:36740 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755108AbcCWN0U (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 23 Mar 2016 09:26:20 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O4H00C27UNROCA0@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 23 Mar 2016 13:26:15 +0000 (GMT)
In-reply-to: <1458739562-32327-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, "open list:DRM DRIVERS FOR EXYNOS" <dri-devel@lists.freedesktop.org>, "moderated list:ARM/SAMSUNG EXYNOS
	ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>

According to documentation and tests HDMI-PHY must be on prior
to MIXER configuration.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
index c8c921c..26b582c 100644
--- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
@@ -393,6 +393,8 @@ static void decon_enable(struct exynos_drm_crtc *crtc)
 
 	pm_runtime_get_sync(ctx->dev);
 
+	exynos_drm_pipe_clk_enable(crtc, true);
+
 	set_bit(BIT_CLKS_ENABLED, &ctx->flags);
 
 	decon_swreset(ctx);
@@ -424,6 +426,8 @@ static void decon_disable(struct exynos_drm_crtc *crtc)
 
 	clear_bit(BIT_CLKS_ENABLED, &ctx->flags);
 
+	exynos_drm_pipe_clk_enable(crtc, false);
+
 	pm_runtime_put_sync(ctx->dev);
 
 	set_bit(BIT_SUSPENDED, &ctx->flags);
-- 
1.9.1
