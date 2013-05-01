From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: [PATCH 1/4] drm/exynos: fimd: Hold pointer to driver data in context struct
Date: Wed,  1 May 2013 21:02:26 +0200
Message-ID: <1367434949-14838-2-git-send-email-tomasz.figa@gmail.com>
References: <1367434949-14838-1-git-send-email-tomasz.figa@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f47.google.com ([74.125.83.47]:64936 "EHLO
	mail-ee0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755978Ab3EATCm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 May 2013 15:02:42 -0400
Received: by mail-ee0-f47.google.com with SMTP id b57so764723eek.6
        for <linux-samsung-soc@vger.kernel.org>; Wed, 01 May 2013 12:02:40 -0700 (PDT)
In-Reply-To: <1367434949-14838-1-git-send-email-tomasz.figa@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org, inki.dae@samsung.com, jy0922.shim@samsung.com, t.figa@samsung.com, Tomasz Figa <tomasz.figa@gmail.com>

This patch adds pointer to driver data to fimd_context structure, to
remove the need to call drm_fimd_get_driver_data() each time access to
driver data is necessary.

Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
---
 drivers/gpu/drm/exynos/exynos_drm_fimd.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index 746b282..264434f 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -107,6 +107,7 @@ struct fimd_context {
 	atomic_t			wait_vsync_event;
 
 	struct exynos_drm_panel_info *panel;
+	struct fimd_driver_data *driver_data;
 };
 
 #ifdef CONFIG_OF
@@ -239,10 +240,9 @@ static void fimd_commit(struct device *dev)
 	struct exynos_drm_panel_info *panel = ctx->panel;
 	struct fb_videomode *timing = &panel->timing;
 	struct fimd_driver_data *driver_data;
-	struct platform_device *pdev = to_platform_device(dev);
 	u32 val;
 
-	driver_data = drm_fimd_get_driver_data(pdev);
+	driver_data = ctx->driver_data;
 	if (ctx->suspended)
 		return;
 
@@ -949,6 +949,7 @@ static int fimd_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	ctx->driver_data = drm_fimd_get_driver_data(pdev);
 	ctx->vidcon0 = pdata->vidcon0;
 	ctx->vidcon1 = pdata->vidcon1;
 	ctx->default_win = pdata->default_win;
-- 
1.8.2.1
