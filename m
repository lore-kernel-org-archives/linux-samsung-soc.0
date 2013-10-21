From: Tomasz Stanislawski <t.stanislaws@samsung.com>
Subject: [RFC 09/12] drm: exynos: add compatibles for HDMI and Mixer chips and
 exynos4210 SoC
Date: Mon, 21 Oct 2013 16:18:28 +0200
Message-ID: <1382365111-6533-10-git-send-email-t.stanislaws@samsung.com>
References: <1382365111-6533-1-git-send-email-t.stanislaws@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1382365111-6533-1-git-send-email-t.stanislaws@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, kyungmin.park@samsung.com, t.figa@samsung.com, kishon@ti.com, sw0312.kim@samsung.com, inki.dae@samsung.com, rahul.sharma@samsung.com, kgene.kim@samsung.com, s.nawrocki@samsung.com, thomas.abraham@linaro.org, mturquette@linaro.org, Tomasz Stanislawski <t.stanislaws@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

This patch add proper compatibles for Mixer and HDMI chip
available on exynos4210 SoCs.

Signed-off-by: Tomasz Stanislawski <t.stanislaws@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c  |    3 +++
 drivers/gpu/drm/exynos/exynos_mixer.c |    3 +++
 2 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 5adb5c1..ae21fa5 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -1874,6 +1874,9 @@ static struct s5p_hdmi_platform_data *drm_hdmi_dt_parse_pdata
 
 static struct of_device_id hdmi_match_types[] = {
 	{
+		.compatible = "samsung,exynos4210-hdmi",
+		.data	= (void	*)HDMI_TYPE13,
+	}, {
 		.compatible = "samsung,exynos5-hdmi",
 		.data	= (void	*)HDMI_TYPE14,
 	}, {
diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index 63bc5f9..892afb5 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -1161,6 +1161,9 @@ static struct platform_device_id mixer_driver_types[] = {
 
 static struct of_device_id mixer_match_types[] = {
 	{
+		.compatible = "samsung,exynos4-mixer",
+		.data	= &exynos4_mxr_drv_data,
+	}, {
 		.compatible = "samsung,exynos5-mixer",
 		.data	= &exynos5250_mxr_drv_data,
 	}, {
-- 
1.7.9.5
