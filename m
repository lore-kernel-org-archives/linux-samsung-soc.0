Received: from mail-m19731103.qiye.163.com (mail-m19731103.qiye.163.com [220.197.31.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72346217659;
	Tue, 30 Sep 2025 09:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759225386; cv=none; b=eMONPTbxHHnD3q9ApKw2RZj1uM0T/8Jq/6+3h4yLxM/AL5RobJWfWlefc1btThKPktQxBDfpoIC7AN7AU+0oK4ER/4ylZ//xPkWpE7HWwufeGnHLymYEGHiBJ1UC+XK6toTuxuXBLvFTBrJrZHpDj4lnXq4gE2DkqMq1FZ8vwHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759225386; c=relaxed/simple;
	bh=xaWYrXLOEA36cWWzxeZ9ba8crtQcYR6Vt+ufMwTg3lE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rokjjS7eW30tE4OEYSWD1lBlMeJq6TOjZw959HS9HIn2W2YgvYkVNbgc3xSeDS1XTMwZDZVBHccUZJnoTMj8sqcPrLSxzUeRphmdP0hQIRzoeAuypgixWUrbY5VEs1qMoGbxBFrlifjENbqBxeC2h/SOqtU0HHgyfihjRVDiq8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=aqc/3LE5; arc=none smtp.client-ip=220.197.31.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="aqc/3LE5"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2494f4fd3;
	Tue, 30 Sep 2025 17:42:58 +0800 (GMT+08:00)
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
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	inki.dae@samsung.com,
	sw0312.kim@samsung.com,
	kyungmin.park@samsung.com,
	krzk@kernel.org,
	alim.akhtar@samsung.com,
	jingoohan1@gmail.com,
	p.zabel@pengutronix.de,
	hjc@rock-chips.com,
	heiko@sntech.de,
	andy.yan@rock-chips.com,
	dmitry.baryshkov@oss.qualcomm.com,
	dianders@chromium.org,
	m.szyprowski@samsung.com,
	luca.ceresoli@bootlin.com,
	jani.nikula@intel.com,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v6 16/18] drm/bridge: analogix_dp: Attach the next bridge in analogix_dp_bridge_attach()
Date: Tue, 30 Sep 2025 17:42:49 +0800
Message-Id: <20250930094251.131314-3-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250930094251.131314-1-damon.ding@rock-chips.com>
References: <20250930094251.131314-1-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a999a00f70203a3kunm8f77df7e445b86
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQxkZTlZOSBkdTkpCSB9LSB5WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=aqc/3LE5c2YN4ROrb+2iJpaEzsgI3vsma4mb9oFF8aoTH9+jAyoN0FbnuAZ9MPPp0s/d3ue3MDT4puTK8YoRKCDlAvy/OqFv8VCxXhLC5Gwumb5ujse4bcWZFQKv3VhcrGTfb7rWAWBVeqsJI0R9WENk3TvPWMJuP1T4gb/ok3Q=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=wN0QR6GO1Iklgjrc9D84f4ibQzRcqUGkz9XtAh3D5sI=;
	h=date:mime-version:subject:message-id:from;

Uniformly, move the next bridge attachment to the Analogix side
rather than scattered on Rockchip and Exynos sides. It can also
help get rid of the callback &analogix_dp_plat_data.attach() and
make codes more concise.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

------

Changes in v6:
- Move the next bridge attachment to the Analogix side rather than
  scattered on Rockchip and Exynos sides.
---
 .../gpu/drm/bridge/analogix/analogix_dp_core.c |  7 ++++---
 drivers/gpu/drm/exynos/exynos_dp.c             | 18 ------------------
 include/drm/bridge/analogix_dp.h               |  1 -
 3 files changed, 4 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 933f1843777f..a6c5601e16ff 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -930,10 +930,11 @@ static int analogix_dp_bridge_attach(struct drm_bridge *bridge,
 		return -EINVAL;
 	}
 
-	if (dp->plat_data->attach) {
-		ret = dp->plat_data->attach(dp->plat_data, bridge);
+	if (dp->plat_data->next_bridge) {
+		ret = drm_bridge_attach(dp->encoder, dp->plat_data->next_bridge, bridge,
+					DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 		if (ret) {
-			DRM_ERROR("Failed at platform attach func\n");
+			dev_err(dp->dev, "failed to attach following panel or bridge (%d)\n", ret);
 			return ret;
 		}
 	}
diff --git a/drivers/gpu/drm/exynos/exynos_dp.c b/drivers/gpu/drm/exynos/exynos_dp.c
index 1c189b5d2b63..2d56bf366ef7 100644
--- a/drivers/gpu/drm/exynos/exynos_dp.c
+++ b/drivers/gpu/drm/exynos/exynos_dp.c
@@ -81,23 +81,6 @@ static int exynos_dp_poweroff(struct analogix_dp_plat_data *plat_data)
 	return exynos_dp_crtc_clock_enable(plat_data, false);
 }
 
-static int exynos_dp_bridge_attach(struct analogix_dp_plat_data *plat_data,
-				   struct drm_bridge *bridge)
-{
-	struct exynos_dp_device *dp = to_dp(plat_data);
-	int ret;
-
-	/* Pre-empt DP connector creation if there's a bridge */
-	if (plat_data->next_bridge) {
-		ret = drm_bridge_attach(&dp->encoder, plat_data->next_bridge, bridge,
-					DRM_BRIDGE_ATTACH_NO_CONNECTOR);
-		if (ret)
-			return ret;
-	}
-
-	return 0;
-}
-
 static void exynos_dp_mode_set(struct drm_encoder *encoder,
 			       struct drm_display_mode *mode,
 			       struct drm_display_mode *adjusted_mode)
@@ -200,7 +183,6 @@ static int exynos_dp_probe(struct platform_device *pdev)
 	dp->plat_data.dev_type = EXYNOS_DP;
 	dp->plat_data.power_on = exynos_dp_poweron;
 	dp->plat_data.power_off = exynos_dp_poweroff;
-	dp->plat_data.attach = exynos_dp_bridge_attach;
 	dp->plat_data.ops = &exynos_dp_ops;
 
 out:
diff --git a/include/drm/bridge/analogix_dp.h b/include/drm/bridge/analogix_dp.h
index bae969dec63a..854af692229b 100644
--- a/include/drm/bridge/analogix_dp.h
+++ b/include/drm/bridge/analogix_dp.h
@@ -34,7 +34,6 @@ struct analogix_dp_plat_data {
 
 	int (*power_on)(struct analogix_dp_plat_data *);
 	int (*power_off)(struct analogix_dp_plat_data *);
-	int (*attach)(struct analogix_dp_plat_data *, struct drm_bridge *);
 };
 
 int analogix_dp_resume(struct analogix_dp_device *dp);
-- 
2.34.1

