From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 4/7] drm/exynos: propagate info about command mode from panel
Date: Tue, 18 Apr 2017 14:40:00 +0200
Message-ID: <1492519203-23537-5-git-send-email-a.hajda@samsung.com>
References: <1492519203-23537-1-git-send-email-a.hajda@samsung.com>
 <CGME20170418124013eucas1p15b1db76e79fb76f825be90793525c9b3@eucas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:24193 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753123AbdDRMkS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 18 Apr 2017 08:40:18 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OOL00GCQV71W890@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 18 Apr 2017 13:40:15 +0100 (BST)
In-reply-to: <1492519203-23537-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org

mipi_dsi framework provides information about panel's mode of work.
This info should be propagated upstream to configure all elements of
the pipeline. As CRTC is the common nominator of the pipeline we can put
such info into its structures.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_drv.h | 1 +
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index 527bf1d..96b9d49 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -165,6 +165,7 @@ struct exynos_drm_crtc {
 	const struct exynos_drm_crtc_ops	*ops;
 	void				*ctx;
 	struct exynos_drm_clk		*pipe_clk;
+	bool				i80_mode : 1;
 };
 
 static inline void exynos_drm_pipe_clk_enable(struct exynos_drm_crtc *crtc,
diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 515090f..79df1c9 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1545,6 +1545,8 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
 		drm_panel_attach(dsi->panel, &dsi->connector);
 		dsi->connector.status = connector_status_connected;
 	}
+	exynos_drm_crtc_get_by_type(drm, EXYNOS_DISPLAY_TYPE_LCD)->i80_mode =
+			!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO);
 
 	mutex_unlock(&drm->mode_config.mutex);
 
-- 
2.7.4
