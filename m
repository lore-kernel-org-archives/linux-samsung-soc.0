Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B5E4B5A6
	for <linux-samsung-soc@vger.kernel.org>; Fri,  3 May 2024 15:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714749116; cv=none; b=LJ9d7wbRNd4qvILw7B2QdoMcu5C9pmXFePwM3XAvQr4Iq8g1vvVDGIGOCb7HaY/h09jJSHA3NOT4WzKhuqVX2HVxhDGs5rk7curWIAt4E4mndEQC8MiXpLHUnnZYWI0bSvN/NzVIRTTsRPpCBAaHp7sPv9fl+49HS7h8/bavDAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714749116; c=relaxed/simple;
	bh=ix5sNdJpNM5nL04VaCVojcbg9Hfy0Nde61E632Djeho=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lOXN32qLHMVvd2p6u4ChmKkdycBVMMJDIPYmmv7yZWwXkuOQjdiOEhOWTYruPQ1CO9y0Ai6n6Ya125WWocpd7XL2uKBtZsYSh+CvGUiZFLT9rFP8ygGd2izWJ3NMd0Wj70gvex8WZ1c0aVVtH7E+SQ5UeS2r1rdEbTeGCThSehw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <l.stach@pengutronix.de>)
	id 1s2uZR-0004Bs-K5; Fri, 03 May 2024 17:11:33 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <l.stach@pengutronix.de>)
	id 1s2uZN-00FjHY-EW; Fri, 03 May 2024 17:11:29 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Sandy Huang <hjc@rock-chips.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	kernel@pengutronix.de,
	patchwork-lst@pengutronix.de
Subject: [PATCH 01/14] drm/bridge: analogix_dp: remove unused platform power_on_end callback
Date: Fri,  3 May 2024 17:11:16 +0200
Message-Id: <20240503151129.3901815-2-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240503151129.3901815-1-l.stach@pengutronix.de>
References: <20240503151129.3901815-1-l.stach@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-samsung-soc@vger.kernel.org

This isn't used, but gives the impression of the power on and power off
platform calls being non-symmetrical. Remove the unused callback and
rename the power_on_start to simplay power_on.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 7 ++-----
 drivers/gpu/drm/exynos/exynos_dp.c                 | 2 +-
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    | 4 ++--
 include/drm/bridge/analogix_dp.h                   | 3 +--
 4 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 98454f0af90e..b39721588980 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1264,8 +1264,8 @@ static int analogix_dp_set_bridge(struct analogix_dp_device *dp)
 		goto out_dp_clk_pre;
 	}
 
-	if (dp->plat_data->power_on_start)
-		dp->plat_data->power_on_start(dp->plat_data);
+	if (dp->plat_data->power_on)
+		dp->plat_data->power_on(dp->plat_data);
 
 	phy_power_on(dp->phy);
 
@@ -1290,9 +1290,6 @@ static int analogix_dp_set_bridge(struct analogix_dp_device *dp)
 		goto out_dp_init;
 	}
 
-	if (dp->plat_data->power_on_end)
-		dp->plat_data->power_on_end(dp->plat_data);
-
 	enable_irq(dp->irq);
 	return 0;
 
diff --git a/drivers/gpu/drm/exynos/exynos_dp.c b/drivers/gpu/drm/exynos/exynos_dp.c
index f48c4343f469..30c8750187ad 100644
--- a/drivers/gpu/drm/exynos/exynos_dp.c
+++ b/drivers/gpu/drm/exynos/exynos_dp.c
@@ -233,7 +233,7 @@ static int exynos_dp_probe(struct platform_device *pdev)
 	/* The remote port can be either a panel or a bridge */
 	dp->plat_data.panel = panel;
 	dp->plat_data.dev_type = EXYNOS_DP;
-	dp->plat_data.power_on_start = exynos_dp_poweron;
+	dp->plat_data.power_on = exynos_dp_poweron;
 	dp->plat_data.power_off = exynos_dp_poweroff;
 	dp->plat_data.attach = exynos_dp_bridge_attach;
 	dp->plat_data.get_modes = exynos_dp_get_modes;
diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
index 7069a3d4d581..baeb41875a4b 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -92,7 +92,7 @@ static int rockchip_dp_pre_init(struct rockchip_dp_device *dp)
 	return 0;
 }
 
-static int rockchip_dp_poweron_start(struct analogix_dp_plat_data *plat_data)
+static int rockchip_dp_poweron(struct analogix_dp_plat_data *plat_data)
 {
 	struct rockchip_dp_device *dp = pdata_encoder_to_dp(plat_data);
 	int ret;
@@ -397,7 +397,7 @@ static int rockchip_dp_probe(struct platform_device *pdev)
 	dp->data = dp_data;
 	dp->plat_data.panel = panel;
 	dp->plat_data.dev_type = dp->data->chip_type;
-	dp->plat_data.power_on_start = rockchip_dp_poweron_start;
+	dp->plat_data.power_on = rockchip_dp_poweron;
 	dp->plat_data.power_off = rockchip_dp_powerdown;
 	dp->plat_data.get_modes = rockchip_dp_get_modes;
 
diff --git a/include/drm/bridge/analogix_dp.h b/include/drm/bridge/analogix_dp.h
index b0dcc07334a1..8709b6a74c0f 100644
--- a/include/drm/bridge/analogix_dp.h
+++ b/include/drm/bridge/analogix_dp.h
@@ -29,8 +29,7 @@ struct analogix_dp_plat_data {
 	struct drm_connector *connector;
 	bool skip_connector;
 
-	int (*power_on_start)(struct analogix_dp_plat_data *);
-	int (*power_on_end)(struct analogix_dp_plat_data *);
+	int (*power_on)(struct analogix_dp_plat_data *);
 	int (*power_off)(struct analogix_dp_plat_data *);
 	int (*attach)(struct analogix_dp_plat_data *, struct drm_bridge *,
 		      struct drm_connector *);
-- 
2.39.2

