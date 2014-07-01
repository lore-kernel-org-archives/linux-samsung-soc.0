From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 3/7] drm: hdmi/mixer: enable exynos 4210 and 4x12 soc support
Date: Tue, 01 Jul 2014 10:10:07 +0200
Message-ID: <1404202211-15788-4-git-send-email-m.szyprowski@samsung.com>
References: <1404202211-15788-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:45220 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755500AbaGAIKd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 1 Jul 2014 04:10:33 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N80001EUXDGGR80@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 01 Jul 2014 09:10:28 +0100 (BST)
In-reply-to: <1404202211-15788-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Tobias Jakobi <Liquid.Acid@gmx.net>, Daniel Drake <drake@endlessm.com>, Andrzej Hajda <a.hajda@samsung.com>, Inki Dae <inki.dae@samsung.com>, Tomasz Stanislawski <t.stanislaws@samsung.com>, Tomasz Figa <t.figa@samsung.com>

Configuration sets for Exynos 4210 and 4x12 SoC were already defined in
Exynos HDMI and Mixed drivers, but they lacked proper linking to device
tree 'compatible' values. This patch fixes this issue adding support for
following compatible values: samsung,exynos4210-mixer,
samsung,exynos4212-mixer and samsung,exynos4210-hdmi. It also corrects
access to sclk_mixer clock, which is available only on Exynos 4210.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 .../devicetree/bindings/video/exynos_mixer.txt     |  5 ++-
 drivers/gpu/drm/exynos/exynos_hdmi.c               | 10 +++++
 drivers/gpu/drm/exynos/exynos_mixer.c              | 51 +++++++++++++++-------
 3 files changed, 49 insertions(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/video/exynos_mixer.txt b/Documentation/devicetree/bindings/video/exynos_mixer.txt
index 7bfde9c9d658..08b394b1edbf 100644
--- a/Documentation/devicetree/bindings/video/exynos_mixer.txt
+++ b/Documentation/devicetree/bindings/video/exynos_mixer.txt
@@ -4,8 +4,9 @@ Required properties:
 - compatible: value should be one of the following:
 	1) "samsung,exynos5-mixer" <DEPRECATED>
 	2) "samsung,exynos4210-mixer"
-	3) "samsung,exynos5250-mixer"
-	4) "samsung,exynos5420-mixer"
+	3) "samsung,exynos4212-mixer"
+	4) "samsung,exynos5250-mixer"
+	5) "samsung,exynos5420-mixer"
 
 - reg: physical base address of the mixer and length of memory mapped
 	region.
diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index a9a87d024c56..7bd99939b984 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -593,6 +593,13 @@ static struct hdmi_driver_data exynos4212_hdmi_driver_data = {
 	.is_apb_phy	= 0,
 };
 
+static struct hdmi_driver_data exynos4210_hdmi_driver_data = {
+	.type		= HDMI_TYPE13,
+	.phy_confs	= hdmiphy_v13_configs,
+	.phy_conf_count	= ARRAY_SIZE(hdmiphy_v13_configs),
+	.is_apb_phy	= 0,
+};
+
 static struct hdmi_driver_data exynos5_hdmi_driver_data = {
 	.type		= HDMI_TYPE14,
 	.phy_confs	= hdmiphy_v13_configs,
@@ -2277,6 +2284,9 @@ static struct of_device_id hdmi_match_types[] = {
 		.compatible = "samsung,exynos5-hdmi",
 		.data = &exynos5_hdmi_driver_data,
 	}, {
+		.compatible = "samsung,exynos4210-hdmi",
+		.data = &exynos4210_hdmi_driver_data,
+	}, {
 		.compatible = "samsung,exynos4212-hdmi",
 		.data = &exynos4212_hdmi_driver_data,
 	}, {
diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index 7529946d0a74..9d0c21a50a86 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -76,7 +76,7 @@ struct mixer_resources {
 	struct clk		*vp;
 	struct clk		*sclk_mixer;
 	struct clk		*sclk_hdmi;
-	struct clk		*sclk_dac;
+	struct clk		*mout_mixer;
 };
 
 enum mixer_version_id {
@@ -93,6 +93,7 @@ struct mixer_context {
 	bool			interlace;
 	bool			powered;
 	bool			vp_enabled;
+	bool			has_sclk;
 	u32			int_en;
 
 	struct mutex		mixer_mutex;
@@ -106,6 +107,7 @@ struct mixer_context {
 struct mixer_drv_data {
 	enum mixer_version_id	version;
 	bool					is_vp_enabled;
+	bool					has_sclk;
 };
 
 static const u8 filter_y_horiz_tap8[] = {
@@ -809,19 +811,23 @@ static int vp_resources_init(struct mixer_context *mixer_ctx)
 		dev_err(dev, "failed to get clock 'vp'\n");
 		return -ENODEV;
 	}
-	mixer_res->sclk_mixer = devm_clk_get(dev, "sclk_mixer");
-	if (IS_ERR(mixer_res->sclk_mixer)) {
-		dev_err(dev, "failed to get clock 'sclk_mixer'\n");
-		return -ENODEV;
-	}
-	mixer_res->sclk_dac = devm_clk_get(dev, "sclk_dac");
-	if (IS_ERR(mixer_res->sclk_dac)) {
-		dev_err(dev, "failed to get clock 'sclk_dac'\n");
-		return -ENODEV;
-	}
 
-	if (mixer_res->sclk_hdmi)
-		clk_set_parent(mixer_res->sclk_mixer, mixer_res->sclk_hdmi);
+	if (mixer_ctx->has_sclk) {
+		mixer_res->sclk_mixer = devm_clk_get(dev, "sclk_mixer");
+		if (IS_ERR(mixer_res->sclk_mixer)) {
+			dev_err(dev, "failed to get clock 'sclk_mixer'\n");
+			return -ENODEV;
+		}
+		mixer_res->mout_mixer = devm_clk_get(dev, "mout_mixer");
+		if (IS_ERR(mixer_res->mout_mixer)) {
+			dev_err(dev, "failed to get clock 'mout_mixer'\n");
+			return -ENODEV;
+		}
+
+		if (mixer_res->sclk_hdmi && mixer_res->mout_mixer)
+			clk_set_parent(mixer_res->mout_mixer,
+				       mixer_res->sclk_hdmi);
+	}
 
 	res = platform_get_resource(mixer_ctx->pdev, IORESOURCE_MEM, 1);
 	if (res == NULL) {
@@ -1082,7 +1088,8 @@ static void mixer_poweron(struct exynos_drm_manager *mgr)
 	clk_prepare_enable(res->mixer);
 	if (ctx->vp_enabled) {
 		clk_prepare_enable(res->vp);
-		clk_prepare_enable(res->sclk_mixer);
+		if (ctx->has_sclk)
+			clk_prepare_enable(res->sclk_mixer);
 	}
 
 	mutex_lock(&ctx->mixer_mutex);
@@ -1121,7 +1128,8 @@ static void mixer_poweroff(struct exynos_drm_manager *mgr)
 	clk_disable_unprepare(res->mixer);
 	if (ctx->vp_enabled) {
 		clk_disable_unprepare(res->vp);
-		clk_disable_unprepare(res->sclk_mixer);
+		if (ctx->has_sclk)
+			clk_disable_unprepare(res->sclk_mixer);
 	}
 
 	pm_runtime_put_sync(ctx->dev);
@@ -1189,9 +1197,15 @@ static struct mixer_drv_data exynos5250_mxr_drv_data = {
 	.is_vp_enabled = 0,
 };
 
+static struct mixer_drv_data exynos4212_mxr_drv_data = {
+	.version = MXR_VER_0_0_0_16,
+	.is_vp_enabled = 1,
+};
+
 static struct mixer_drv_data exynos4210_mxr_drv_data = {
 	.version = MXR_VER_0_0_0_16,
 	.is_vp_enabled = 1,
+	.has_sclk = 1,
 };
 
 static struct platform_device_id mixer_driver_types[] = {
@@ -1208,6 +1222,12 @@ static struct platform_device_id mixer_driver_types[] = {
 
 static struct of_device_id mixer_match_types[] = {
 	{
+		.compatible = "samsung,exynos4210-mixer",
+		.data	= &exynos4210_mxr_drv_data,
+	}, {
+		.compatible = "samsung,exynos4212-mixer",
+		.data	= &exynos4212_mxr_drv_data,
+	}, {
 		.compatible = "samsung,exynos5-mixer",
 		.data	= &exynos5250_mxr_drv_data,
 	}, {
@@ -1251,6 +1271,7 @@ static int mixer_bind(struct device *dev, struct device *manager, void *data)
 	ctx->pdev = pdev;
 	ctx->dev = dev;
 	ctx->vp_enabled = drv->is_vp_enabled;
+	ctx->has_sclk = drv->has_sclk;
 	ctx->mxr_ver = drv->version;
 	init_waitqueue_head(&ctx->wait_vsync_queue);
 	atomic_set(&ctx->wait_vsync_event, 0);
-- 
1.9.2
