Received: from mail-m49221.qiye.163.com (mail-m49221.qiye.163.com [45.254.49.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6694E279DC0;
	Fri, 12 Sep 2025 08:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757667564; cv=none; b=F63YNuBjrvy7TlrSYFY6gpq2MCwnOp0nw3C/du29wO5ubHdfGVq/kZOtyYCghsIV6R7M93cTlrhKICB1Wkd9xMUv2CZMD7BNXXvUaCRh7cNKsZgN5p7lxtP6p74Xk6iA7oulV8gfEJuL5ygqtWT6/V5b3P23V9Nkvz+FUwakWUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757667564; c=relaxed/simple;
	bh=NH8MwASYOUnN0Uv48Qp5QeXu0J8gszVcrqnweG4SGL8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Nm99KrVtVRXAMXW7EbQEmjEPd/VZ7ve9n9/uqrDqpYziYh3lfEOIV6qfoI37ld2DBg1h6Gxn1pIqJUKvjUqE8LS01dzJiOhrmXAUJe9fELPyJMXXrgTZ6t0NpE4t/gEKXYghynLqGRhxKcxkA6ECPezUloV6ii6vn7yirGK7rOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=CuUUrGCp; arc=none smtp.client-ip=45.254.49.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="CuUUrGCp"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2298809b7;
	Fri, 12 Sep 2025 16:59:14 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	jingoohan1@gmail.com,
	inki.dae@samsung.com,
	sw0312.kim@samsung.com,
	kyungmin.park@samsung.com,
	krzk@kernel.org,
	alim.akhtar@samsung.com,
	hjc@rock-chips.com,
	heiko@sntech.de,
	andy.yan@rock-chips.com,
	dmitry.baryshkov@oss.qualcomm.com,
	dianders@chromium.org,
	m.szyprowski@samsung.com,
	luca.ceresoli@bootlin.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v5 07/17] drm/exynos: exynos_dp: Add legacy bridge to parse the display-timings node
Date: Fri, 12 Sep 2025 16:58:36 +0800
Message-Id: <20250912085846.7349-8-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250912085846.7349-1-damon.ding@rock-chips.com>
References: <20250912085846.7349-1-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a993d26758a03a3kunm813a8c8ea45c40
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQhlIQlZOSRhJSkwdTk1MHh9WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=CuUUrGCp3SMBooUrPs22ScQ/wJE6Cs/Q1quvt75cQMCx9X2yCBXl/NTvvsRNszieCe9lYi1FUuamNeWoNbp0vtrbguyJ0nTqp+qgPjPlaxt2SbBQn7m67k9XI9YhbHE6SahtB268HzLHHc2F5cKGyeNHXm/rA58SJz7U68wx3OA=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=DAmTwhSSOjeVvdgZsWyAdmIr2/ULoeK9dehgdSOeXuw=;
	h=date:mime-version:subject:message-id:from;

If there is neither a panel nor a bridge, the display timing can be
parsed from the display-timings node under the dp node.

Adding a legacy bridge to parse the display-timings node would get
rid of &analogix_dp_plat_data.get_modes() and make the codes more
consistent.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
---
 drivers/gpu/drm/exynos/exynos_dp.c | 132 ++++++++++++++++++-----------
 1 file changed, 82 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_dp.c b/drivers/gpu/drm/exynos/exynos_dp.c
index 702128d76ae3..33e9758bc00d 100644
--- a/drivers/gpu/drm/exynos/exynos_dp.c
+++ b/drivers/gpu/drm/exynos/exynos_dp.c
@@ -33,16 +33,90 @@
 
 #define to_dp(nm)	container_of(nm, struct exynos_dp_device, nm)
 
+#define to_legacy_bridge(bridge)	container_of(bridge, struct exynos_dp_legacy_bridge, base)
+
 struct exynos_dp_device {
 	struct drm_encoder         encoder;
 	struct drm_device          *drm_dev;
 	struct device              *dev;
 
-	struct videomode           vm;
 	struct analogix_dp_device *adp;
 	struct analogix_dp_plat_data plat_data;
 };
 
+struct exynos_dp_legacy_bridge {
+	struct drm_bridge base;
+	struct drm_display_mode mode;
+
+	u32 bus_flags;
+};
+
+static int exynos_dp_legacy_bridge_attach(struct drm_bridge *bridge,
+					  struct drm_encoder *encoder,
+					  enum drm_bridge_attach_flags flags)
+{
+	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR))
+		return -EINVAL;
+
+	return 0;
+}
+
+static int exynos_dp_legacy_bridge_get_modes(struct drm_bridge *bridge,
+					     struct drm_connector *connector)
+{
+	struct exynos_dp_legacy_bridge *legacy_bridge = to_legacy_bridge(bridge);
+	int ret;
+
+	ret = drm_connector_helper_get_modes_fixed(connector, &legacy_bridge->mode);
+	if (ret)
+		return ret;
+
+	connector->display_info.bus_flags = legacy_bridge->bus_flags;
+
+	return 0;
+}
+
+struct drm_bridge_funcs exynos_dp_legacy_bridge_funcs = {
+	.attach = exynos_dp_legacy_bridge_attach,
+	.get_modes = exynos_dp_legacy_bridge_get_modes,
+};
+
+static int exynos_dp_dt_parse_legacy_bridge(struct exynos_dp_device *dp,
+					    struct drm_bridge **bridge)
+{
+	struct exynos_dp_legacy_bridge *legacy_bridge;
+	int ret;
+
+	if (!bridge)
+		return -EINVAL;
+
+	legacy_bridge = devm_drm_bridge_alloc(dp->dev, struct exynos_dp_legacy_bridge,
+					      base, &exynos_dp_legacy_bridge_funcs);
+	if (IS_ERR(legacy_bridge))
+		return PTR_ERR(legacy_bridge);
+
+	ret = of_get_drm_display_mode(dp->dev->of_node,
+				      &legacy_bridge->mode,
+				      &legacy_bridge->bus_flags,
+				      OF_USE_NATIVE_MODE);
+	if (ret)
+		return ret;
+
+	legacy_bridge->mode.type |= DRM_MODE_TYPE_DRIVER;
+
+	legacy_bridge->base.of_node = dp->dev->of_node;
+	legacy_bridge->base.ops = DRM_BRIDGE_OP_MODES;
+	legacy_bridge->base.type = DRM_MODE_CONNECTOR_eDP;
+
+	ret = devm_drm_bridge_add(dp->dev, &legacy_bridge->base);
+	if (ret)
+		return ret;
+
+	*bridge = &legacy_bridge->base;
+
+	return 0;
+}
+
 static int exynos_dp_crtc_clock_enable(struct analogix_dp_plat_data *plat_data,
 				bool enable)
 {
@@ -67,44 +141,20 @@ static int exynos_dp_poweroff(struct analogix_dp_plat_data *plat_data)
 	return exynos_dp_crtc_clock_enable(plat_data, false);
 }
 
-static int exynos_dp_get_modes(struct analogix_dp_plat_data *plat_data,
-			       struct drm_connector *connector)
-{
-	struct exynos_dp_device *dp = to_dp(plat_data);
-	struct drm_display_mode *mode;
-
-	if (dp->plat_data.panel)
-		return 0;
-
-	mode = drm_mode_create(connector->dev);
-	if (!mode) {
-		DRM_DEV_ERROR(dp->dev,
-			      "failed to create a new display mode.\n");
-		return 0;
-	}
-
-	drm_display_mode_from_videomode(&dp->vm, mode);
-	connector->display_info.width_mm = mode->width_mm;
-	connector->display_info.height_mm = mode->height_mm;
-
-	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
-	drm_mode_set_name(mode);
-	drm_mode_probed_add(connector, mode);
-
-	return 1;
-}
-
 static int exynos_dp_bridge_attach(struct analogix_dp_plat_data *plat_data,
 				   struct drm_bridge *bridge,
 				   struct drm_connector *connector)
 {
 	struct exynos_dp_device *dp = to_dp(plat_data);
+	enum drm_bridge_attach_flags flags = 0;
 	int ret;
 
 	/* Pre-empt DP connector creation if there's a bridge */
 	if (plat_data->next_bridge) {
-		ret = drm_bridge_attach(&dp->encoder, plat_data->next_bridge, bridge,
-					0);
+		if (plat_data->next_bridge->funcs == &exynos_dp_legacy_bridge_funcs)
+			flags = DRM_BRIDGE_ATTACH_NO_CONNECTOR;
+
+		ret = drm_bridge_attach(&dp->encoder, plat_data->next_bridge, bridge, flags);
 		if (ret)
 			return ret;
 	}
@@ -129,19 +179,6 @@ static const struct drm_encoder_helper_funcs exynos_dp_encoder_helper_funcs = {
 	.disable = exynos_dp_nop,
 };
 
-static int exynos_dp_dt_parse_panel(struct exynos_dp_device *dp)
-{
-	int ret;
-
-	ret = of_get_videomode(dp->dev->of_node, &dp->vm, OF_USE_NATIVE_MODE);
-	if (ret) {
-		DRM_DEV_ERROR(dp->dev,
-			      "failed: of_get_videomode() : %d\n", ret);
-		return ret;
-	}
-	return 0;
-}
-
 static int exynos_dp_bind(struct device *dev, struct device *master, void *data)
 {
 	struct exynos_dp_device *dp = dev_get_drvdata(dev);
@@ -151,12 +188,6 @@ static int exynos_dp_bind(struct device *dev, struct device *master, void *data)
 
 	dp->drm_dev = drm_dev;
 
-	if (!dp->plat_data.panel && !dp->plat_data.next_bridge) {
-		ret = exynos_dp_dt_parse_panel(dp);
-		if (ret)
-			return ret;
-	}
-
 	drm_simple_encoder_init(drm_dev, encoder, DRM_MODE_ENCODER_TMDS);
 
 	drm_encoder_helper_add(encoder, &exynos_dp_encoder_helper_funcs);
@@ -223,6 +254,8 @@ static int exynos_dp_probe(struct platform_device *pdev)
 	}
 
 	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0, &panel, &bridge);
+	if (ret == -ENODEV)
+		ret = exynos_dp_dt_parse_legacy_bridge(dp, &bridge);
 	if (ret)
 		return ret;
 
@@ -233,7 +266,6 @@ static int exynos_dp_probe(struct platform_device *pdev)
 	dp->plat_data.power_on = exynos_dp_poweron;
 	dp->plat_data.power_off = exynos_dp_poweroff;
 	dp->plat_data.attach = exynos_dp_bridge_attach;
-	dp->plat_data.get_modes = exynos_dp_get_modes;
 
 out:
 	dp->adp = analogix_dp_probe(dev, &dp->plat_data);
-- 
2.34.1

