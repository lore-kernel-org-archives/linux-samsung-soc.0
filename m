From: Kiran Padwal <kiran.padwal@smartplayin.com>
Subject: [PATCH] drm: exynos: Make of_device_id array const
Date: Thu, 21 Aug 2014 17:58:07 +0530
Message-ID: <1408624087-30083-1-git-send-email-kiran.padwal@smartplayin.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: inki.dae@samsung.com, jy0922.shim@samsung.com, w0312.kim@samsung.com, kyungmin.park@samsung.com, airlied@linux.ie, kgene.kim@samsung.com
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Kiran Padwal <kiran.padwal@smartplayin.com>
List-Id: linux-samsung-soc@vger.kernel.org

Make of_device_id array const, because all OF functions handle it as const.

Signed-off-by: Kiran Padwal <kiran.padwal@smartplayin.com>
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c |    2 +-
 drivers/gpu/drm/exynos/exynos_hdmi.c    |    2 +-
 drivers/gpu/drm/exynos/exynos_mixer.c   |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 442aa2d..2f96fb7 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -310,7 +310,7 @@ static struct exynos_dsi_driver_data exynos5_dsi_driver_data = {
 	.plltmr_reg = 0x58,
 };
 
-static struct of_device_id exynos_dsi_of_match[] = {
+static const struct of_device_id exynos_dsi_of_match[] = {
 	{ .compatible = "samsung,exynos4210-mipi-dsi",
 	  .data = &exynos4_dsi_driver_data },
 	{ .compatible = "samsung,exynos5410-mipi-dsi",
diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 562966d..fc44a91 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -2278,7 +2278,7 @@ err_data:
 	return NULL;
 }
 
-static struct of_device_id hdmi_match_types[] = {
+static const struct of_device_id hdmi_match_types[] = {
 	{
 		.compatible = "samsung,exynos5-hdmi",
 		.data = &exynos5_hdmi_driver_data,
diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index e8b4ec8..637aa8f 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -1225,7 +1225,7 @@ static struct platform_device_id mixer_driver_types[] = {
 	}
 };
 
-static struct of_device_id mixer_match_types[] = {
+static const struct of_device_id mixer_match_types[] = {
 	{
 		.compatible = "samsung,exynos4210-mixer",
 		.data	= &exynos4210_mxr_drv_data,
-- 
1.7.9.5
