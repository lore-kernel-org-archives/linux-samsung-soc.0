From: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
Subject: [PATCH 1/3] Revert "drm/exynos: fix module build error"
Date: Fri, 18 Jul 2014 22:36:39 +0200
Message-ID: <1405715801-5325-2-git-send-email-sjoerd.simons@collabora.co.uk>
References: <1405715801-5325-1-git-send-email-sjoerd.simons@collabora.co.uk>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cube.luon.net ([37.72.100.20]:36885 "EHLO cube.luon.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1762141AbaGRUhU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 18 Jul 2014 16:37:20 -0400
In-Reply-To: <1405715801-5325-1-git-send-email-sjoerd.simons@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, Sjoerd Simons <sjoerd.simons@collabora.co.uk>

This reverts commit de1d3677017a1d58419722b60564cb56bd9462c3, which was
original added to fix build errors when building exynosdrm as a single
module caused by multiple MODULE_DEVICE_TABLE in one module. Which, as
a side-effect broke autoloading of the module.

Since 21bdd17b21b45ea48e06e23918d681afbe0622e9 it is possible to have
multiple calls to MODULE_DEVICE_TABLE, so the patch can be
reverted to restore support for autoloading

Conflicts:
	drivers/gpu/drm/exynos/exynos_drm_fimd.c
	drivers/gpu/drm/exynos/exynos_drm_g2d.c

Signed-off-by: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos_drm_fimd.c | 1 +
 drivers/gpu/drm/exynos/exynos_drm_g2d.c  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index 33161ad..081eb15 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -136,6 +136,7 @@ static const struct of_device_id fimd_driver_dt_match[] = {
 	  .data = &exynos5_fimd_driver_data },
 	{},
 };
+MODULE_DEVICE_TABLE(of, fimd_driver_dt_match);
 
 static inline struct fimd_driver_data *drm_fimd_get_driver_data(
 	struct platform_device *pdev)
diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
index 8001587..bb728c8 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
@@ -1546,6 +1546,7 @@ static const struct of_device_id exynos_g2d_match[] = {
 	{ .compatible = "samsung,exynos5250-g2d" },
 	{},
 };
+MODULE_DEVICE_TABLE(of, exynos_g2d_match);
 
 struct platform_driver g2d_driver = {
 	.probe		= g2d_probe,
-- 
2.0.1
