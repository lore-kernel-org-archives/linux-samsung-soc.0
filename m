From: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
Subject: [PATCH 3/3] drm/exynos: Add MODULE_DEVICE_TABLE entries for various components
Date: Fri, 18 Jul 2014 22:36:41 +0200
Message-ID: <1405715801-5325-4-git-send-email-sjoerd.simons@collabora.co.uk>
References: <1405715801-5325-1-git-send-email-sjoerd.simons@collabora.co.uk>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cube.luon.net ([37.72.100.20]:36899 "EHLO cube.luon.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1762255AbaGRUhZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 18 Jul 2014 16:37:25 -0400
In-Reply-To: <1405715801-5325-1-git-send-email-sjoerd.simons@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, Sjoerd Simons <sjoerd.simons@collabora.co.uk>

Add MODULE_DEVICE_TABLE calls for the various OF match tables that
currently don't have one. This allows the module to be
autoloaded based on devicetree information.

Signed-off-by: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos_drm_fimc.c    | 1 +
 drivers/gpu/drm/exynos/exynos_drm_rotator.c | 1 +
 drivers/gpu/drm/exynos/exynos_hdmi.c        | 1 +
 drivers/gpu/drm/exynos/exynos_mixer.c       | 1 +
 4 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimc.c b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
index 831dde9..ec7cc9e 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
@@ -1887,6 +1887,7 @@ static const struct of_device_id fimc_of_match[] = {
 	{ .compatible = "samsung,exynos4212-fimc" },
 	{ },
 };
+MODULE_DEVICE_TABLE(of, fimc_of_match);
 
 struct platform_driver fimc_driver = {
 	.probe		= fimc_probe,
diff --git a/drivers/gpu/drm/exynos/exynos_drm_rotator.c b/drivers/gpu/drm/exynos/exynos_drm_rotator.c
index f01fbb6..55af6b4 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_rotator.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_rotator.c
@@ -691,6 +691,7 @@ static const struct of_device_id exynos_rotator_match[] = {
 	},
 	{},
 };
+MODULE_DEVICE_TABLE(of, exynos_rotator_match);
 
 static int rotator_probe(struct platform_device *pdev)
 {
diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index fd8141f..d08e00d 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -2295,6 +2295,7 @@ static struct of_device_id hdmi_match_types[] = {
 		/* end node */
 	}
 };
+MODULE_DEVICE_TABLE (of, hdmi_match_types);
 
 static int hdmi_bind(struct device *dev, struct device *master, void *data)
 {
diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index 9d0c21a..6756d1c 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -1240,6 +1240,7 @@ static struct of_device_id mixer_match_types[] = {
 		/* end node */
 	}
 };
+MODULE_DEVICE_TABLE(of, mixer_match_types);
 
 static int mixer_bind(struct device *dev, struct device *manager, void *data)
 {
-- 
2.0.1
