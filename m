Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E04648CCC
	for <linux-samsung-soc@vger.kernel.org>; Fri,  3 May 2024 15:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714749115; cv=none; b=eG8/3bCn07AdKDt8Oej2BFC4AEwazMZC085tzC5mKGjPH9UBsfeHUB2ckt/e7HAaB/KevUhZZpnIVdmoq7HlhKgIwGGSD0St3A3evDO3vPH6s6GlnmlriIn6YDxdackDi2A/y2yIQ378QaGxHyAbNAw24d+PV+jM1GrSEcLlZmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714749115; c=relaxed/simple;
	bh=FYKRiyYkBPwPUw8roJ/8rcRbJYYGfA39vQ2T5EllXRY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KYLnJXZUGiiJuHsFyrA0um4MbzN8H+59WAOWOBJSLvqpKOxXgBF0Ca4DCamyTtMkHcovuw6tbQYpcwldYy6BE9UFIMRKx2CWUHruZGdJzFQq/0geWZeA9pAWNtAmSmenjE7wjCg7dj+oHhbX9Ovpt4xr0vzTS/0BxvQsMMqRQwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <l.stach@pengutronix.de>)
	id 1s2uZR-0004Bv-K7; Fri, 03 May 2024 17:11:33 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <l.stach@pengutronix.de>)
	id 1s2uZN-00FjHY-N8; Fri, 03 May 2024 17:11:29 +0200
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
Subject: [PATCH 04/14] drm/bridge: analogix_dp: handle clock via runtime PM
Date: Fri,  3 May 2024 17:11:19 +0200
Message-Id: <20240503151129.3901815-5-l.stach@pengutronix.de>
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

There is no reason to enable the controller clock in driver probe, as
there is no HW initialization done in this function. Instead rely on
either runtime PM to handle the controller clock or statically enable
it in the driver bind routine, after which real hardware access is
required to work.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 .../drm/bridge/analogix/analogix_dp_core.c    | 78 +++++++++++--------
 1 file changed, 45 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 0af2a70ae5bf..9e3308257586 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1658,8 +1658,6 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
 		return ERR_CAST(dp->clock);
 	}
 
-	clk_prepare_enable(dp->clock);
-
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 
 	dp->reg_base = devm_ioremap_resource(&pdev->dev, res);
@@ -1721,6 +1719,29 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
 }
 EXPORT_SYMBOL_GPL(analogix_dp_probe);
 
+
+int analogix_dp_suspend(struct analogix_dp_device *dp)
+{
+	clk_disable_unprepare(dp->clock);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(analogix_dp_suspend);
+
+int analogix_dp_resume(struct analogix_dp_device *dp)
+{
+	int ret;
+
+	ret = clk_prepare_enable(dp->clock);
+	if (ret < 0) {
+		DRM_ERROR("Failed to prepare_enable the clock clk [%d]\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(analogix_dp_resume);
+
 int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *drm_dev)
 {
 	int ret;
@@ -1728,9 +1749,15 @@ int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *drm_dev)
 	dp->drm_dev = drm_dev;
 	dp->encoder = dp->plat_data->encoder;
 
-	pm_runtime_use_autosuspend(dp->dev);
-	pm_runtime_set_autosuspend_delay(dp->dev, 100);
-	pm_runtime_enable(dp->dev);
+	if (IS_ENABLED(CONFIG_PM)) {
+		pm_runtime_use_autosuspend(dp->dev);
+		pm_runtime_set_autosuspend_delay(dp->dev, 100);
+		pm_runtime_enable(dp->dev);
+	} else {
+		ret = analogix_dp_resume(dp);
+		if (ret)
+			return ret;
+	}
 
 	dp->aux.name = "DP-AUX";
 	dp->aux.transfer = analogix_dpaux_transfer;
@@ -1754,8 +1781,12 @@ int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *drm_dev)
 err_unregister_aux:
 	drm_dp_aux_unregister(&dp->aux);
 err_disable_pm_runtime:
-	pm_runtime_dont_use_autosuspend(dp->dev);
-	pm_runtime_disable(dp->dev);
+	if (IS_ENABLED(CONFIG_PM)) {
+		pm_runtime_dont_use_autosuspend(dp->dev);
+		pm_runtime_disable(dp->dev);
+	} else {
+		analogix_dp_suspend(dp);
+	}
 
 	return ret;
 }
@@ -1772,40 +1803,21 @@ void analogix_dp_unbind(struct analogix_dp_device *dp)
 	}
 
 	drm_dp_aux_unregister(&dp->aux);
-	pm_runtime_dont_use_autosuspend(dp->dev);
-	pm_runtime_disable(dp->dev);
+
+	if (IS_ENABLED(CONFIG_PM)) {
+		pm_runtime_dont_use_autosuspend(dp->dev);
+		pm_runtime_disable(dp->dev);
+	} else {
+		analogix_dp_suspend(dp);
+	}
 }
 EXPORT_SYMBOL_GPL(analogix_dp_unbind);
 
 void analogix_dp_remove(struct analogix_dp_device *dp)
 {
-	clk_disable_unprepare(dp->clock);
 }
 EXPORT_SYMBOL_GPL(analogix_dp_remove);
 
-#ifdef CONFIG_PM
-int analogix_dp_suspend(struct analogix_dp_device *dp)
-{
-	clk_disable_unprepare(dp->clock);
-	return 0;
-}
-EXPORT_SYMBOL_GPL(analogix_dp_suspend);
-
-int analogix_dp_resume(struct analogix_dp_device *dp)
-{
-	int ret;
-
-	ret = clk_prepare_enable(dp->clock);
-	if (ret < 0) {
-		DRM_ERROR("Failed to prepare_enable the clock clk [%d]\n", ret);
-		return ret;
-	}
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(analogix_dp_resume);
-#endif
-
 int analogix_dp_start_crc(struct drm_connector *connector)
 {
 	struct analogix_dp_device *dp = to_dp(connector);
-- 
2.39.2

