From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 2/6] drm/exynos: add support for pipeline clock to the framework
Date: Wed, 23 Mar 2016 14:25:58 +0100
Message-ID: <1458739562-32327-3-git-send-email-a.hajda@samsung.com>
References: <1458739562-32327-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:36740 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754935AbcCWN0S (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 23 Mar 2016 09:26:18 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O4H00C35UNQNNA0@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 23 Mar 2016 13:26:14 +0000 (GMT)
In-reply-to: <1458739562-32327-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, "open list:DRM DRIVERS FOR EXYNOS" <dri-devel@lists.freedesktop.org>, "moderated list:ARM/SAMSUNG EXYNOS
	ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>

Components belonging to the same pipeline often requires
synchronized clocks. Such clocks are sometimes provided
by external clock controller, but they can be also provided by
pipeline components. In latter case there should be a way
to access them from another component belonging to the same pipeline.
This is the case of:
- DECON,FIMD -> HDMI and HDMI-PHY clock,
- FIMD -> DP and DP clock in FIMD.
The latter case has been solved by clock_enable callback
in exynos_drm_crtc_ops. This solutin will not work with
HDMI path as in this case clock is provided by encoder.

This patch provides more generic solution allowing to register
pipeline clock during initialization in exynos_drm_crtc structure.
This way the clock will be easily accessible from both components.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_drv.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index fcea940..6ee0b20 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -154,6 +154,10 @@ struct exynos_drm_crtc_ops {
 	void (*clock_enable)(struct exynos_drm_crtc *crtc, bool enable);
 };
 
+struct exynos_drm_clk {
+	void (*enable)(struct exynos_drm_clk *clk, bool enable);
+};
+
 /*
  * Exynos specific crtc structure.
  *
@@ -182,8 +186,16 @@ struct exynos_drm_crtc {
 	atomic_t			pending_update;
 	const struct exynos_drm_crtc_ops	*ops;
 	void				*ctx;
+	struct exynos_drm_clk		*pipe_clk;
 };
 
+static inline void exynos_drm_pipe_clk_enable(struct exynos_drm_crtc *crtc,
+					      bool enable)
+{
+	if (crtc->pipe_clk)
+		crtc->pipe_clk->enable(crtc->pipe_clk, enable);
+}
+
 struct exynos_drm_g2d_private {
 	struct device		*dev;
 	struct list_head	inuse_cmdlist;
-- 
1.9.1
