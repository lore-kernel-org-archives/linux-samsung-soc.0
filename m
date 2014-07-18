From: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
Subject: [PATCH 2/3] Revert "drm/exynos: remove MODULE_DEVICE_TABLE definitions"
Date: Fri, 18 Jul 2014 22:36:40 +0200
Message-ID: <1405715801-5325-3-git-send-email-sjoerd.simons@collabora.co.uk>
References: <1405715801-5325-1-git-send-email-sjoerd.simons@collabora.co.uk>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cube.luon.net ([37.72.100.20]:36893 "EHLO cube.luon.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1762254AbaGRUhW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 18 Jul 2014 16:37:22 -0400
In-Reply-To: <1405715801-5325-1-git-send-email-sjoerd.simons@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, Sjoerd Simons <sjoerd.simons@collabora.co.uk>

This reverts commit d089621896c3530a9bd309f96e9c9124d07f6c3f was
original to prevent multiple MODULE_DEVICE_TABLE in one module.
Which, as a side-effect broke autoloading of the module.

Since 21bdd17b21b45ea48e06e23918d681afbe0622e9 it is possible to have
multiple calls to MODULE_DEVICE_TABLE, so the patch can be
reverted to restore support for autoloading

Signed-off-by: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos_dp_core.c | 1 +
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/drm/exynos/exynos_dp_core.c
index 845d766..31c3de9 100644
--- a/drivers/gpu/drm/exynos/exynos_dp_core.c
+++ b/drivers/gpu/drm/exynos/exynos_dp_core.c
@@ -1376,6 +1376,7 @@ static const struct of_device_id exynos_dp_match[] = {
 	{ .compatible = "samsung,exynos5-dp" },
 	{},
 };
+MODULE_DEVICE_TABLE(of, exynos_dp_match);
 
 struct platform_driver dp_driver = {
 	.probe		= exynos_dp_probe,
diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 2df3592..46b7bf6 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1529,6 +1529,7 @@ static struct of_device_id exynos_dsi_of_match[] = {
 	{ .compatible = "samsung,exynos4210-mipi-dsi" },
 	{ }
 };
+MODULE_DEVICE_TABLE(of, exynos_dsi_of_match);
 
 struct platform_driver dsi_driver = {
 	.probe = exynos_dsi_probe,
-- 
2.0.1
