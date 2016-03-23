From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 5/6] drm/exynos/mixer: enable HDMI-PHY before configuring MIXER
Date: Wed, 23 Mar 2016 14:26:01 +0100
Message-ID: <1458739562-32327-6-git-send-email-a.hajda@samsung.com>
References: <1458739562-32327-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:56478 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754935AbcCWN0U (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 23 Mar 2016 09:26:20 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O4H002ZZUNSV790@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 23 Mar 2016 13:26:16 +0000 (GMT)
In-reply-to: <1458739562-32327-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, "open list:DRM DRIVERS FOR EXYNOS" <dri-devel@lists.freedesktop.org>, "moderated list:ARM/SAMSUNG EXYNOS
	ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>

According to documentation HDMI-PHY must be on prior to MIXER configuration.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_mixer.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index 0a5a600..27f36c0 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -1065,6 +1065,8 @@ static void mixer_enable(struct exynos_drm_crtc *crtc)
 
 	pm_runtime_get_sync(ctx->dev);
 
+	exynos_drm_pipe_clk_enable(crtc, true);
+
 	mixer_vsync_set_update(ctx, false);
 
 	mixer_reg_writemask(res, MXR_STATUS, ~0, MXR_STATUS_SOFT_RESET);
@@ -1094,6 +1096,8 @@ static void mixer_disable(struct exynos_drm_crtc *crtc)
 	for (i = 0; i < MIXER_WIN_NR; i++)
 		mixer_disable_plane(crtc, &ctx->planes[i]);
 
+	exynos_drm_pipe_clk_enable(crtc, false);
+
 	pm_runtime_put(ctx->dev);
 
 	clear_bit(MXR_BIT_POWERED, &ctx->flags);
-- 
1.9.1
