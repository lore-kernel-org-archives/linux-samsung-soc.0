Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF756157A61
	for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Jun 2024 18:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718821346; cv=none; b=hyBj2YSD2Y83KTIRU6tmwzqZM55ufUaVDZakmwzd58WH0/FIXfSABjqVjd7ATVWzbMuAh9lbsbvRzwahcoO6g+wUTT+2l9j6zZw1EVcgDoA/d3hN1lX0rRbAlOh/0wZe7C5z9tKM9adxutcALy86Oyh3FNkCybRnS333ltFlzGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718821346; c=relaxed/simple;
	bh=uy7FRXOHgxK0a1U3UDEuHFxXxNjAG4/jZoTTK+ILehk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uqF/9haz3qO4OZfp8MOcwfr5Py4yNtVbQ8WlrTaZe84A+1vz/mvpoJIetvSmJ3MGm75cyJqhBFgcDhcbmIm5gFzplVm0pTSF2GdribmNFN3WGQo4MFG3icJ8HCtL7iApqC6DnCeEu2c7+D/Zmk68nLJoWxTok8PdQHo7hs4je1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <l.stach@pengutronix.de>)
	id 1sJzwX-00049e-K3; Wed, 19 Jun 2024 20:22:01 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <l.stach@pengutronix.de>)
	id 1sJzwW-003WTo-Oe; Wed, 19 Jun 2024 20:22:00 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: Robert Foss <rfoss@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	patchwork-lst@pengutronix.de,
	kernel@pengutronix.de
Subject: [PATCH v2 07/14] drm/bridge: analogix_dp: move platform and PHY power handling into runtime PM
Date: Wed, 19 Jun 2024 20:21:53 +0200
Message-Id: <20240619182200.3752465-7-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240619182200.3752465-1-l.stach@pengutronix.de>
References: <20240619182200.3752465-1-l.stach@pengutronix.de>
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

Platform and PHY power isn't only required when the actual display data
stream is active, but may be required earlier to support AUX channel
transactions. Move them into the runtime PM calls, so they are properly
managed whenever various other parts of the driver need them to be active.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
Reviewed-by: Robert Foss <rfoss@kernel.org>
Tested-by: Heiko Stuebner <heiko@sntech.de> (rk3288-veyron and rk3399-gru)
---
 .../drm/bridge/analogix/analogix_dp_core.c    | 23 ++++++++-----------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index d8c0751ab5c0..d2b6d5a87188 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1251,11 +1251,6 @@ static int analogix_dp_set_bridge(struct analogix_dp_device *dp)
 
 	pm_runtime_get_sync(dp->dev);
 
-	if (dp->plat_data->power_on)
-		dp->plat_data->power_on(dp->plat_data);
-
-	phy_power_on(dp->phy);
-
 	ret = analogix_dp_init_dp(dp);
 	if (ret)
 		goto out_dp_init;
@@ -1281,10 +1276,6 @@ static int analogix_dp_set_bridge(struct analogix_dp_device *dp)
 	return 0;
 
 out_dp_init:
-	phy_power_off(dp->phy);
-	if (dp->plat_data->power_off)
-		dp->plat_data->power_off(dp->plat_data);
-
 	pm_runtime_put_sync(dp->dev);
 
 	return ret;
@@ -1347,11 +1338,7 @@ static void analogix_dp_bridge_disable(struct drm_bridge *bridge)
 
 	disable_irq(dp->irq);
 
-	if (dp->plat_data->power_off)
-		dp->plat_data->power_off(dp->plat_data);
-
 	analogix_dp_set_analog_power_down(dp, POWER_ALL, 1);
-	phy_power_off(dp->phy);
 
 	pm_runtime_put_sync(dp->dev);
 
@@ -1705,6 +1692,11 @@ EXPORT_SYMBOL_GPL(analogix_dp_probe);
 
 int analogix_dp_suspend(struct analogix_dp_device *dp)
 {
+	phy_power_off(dp->phy);
+
+	if (dp->plat_data->power_off)
+		dp->plat_data->power_off(dp->plat_data);
+
 	clk_disable_unprepare(dp->clock);
 
 	return 0;
@@ -1721,6 +1713,11 @@ int analogix_dp_resume(struct analogix_dp_device *dp)
 		return ret;
 	}
 
+	if (dp->plat_data->power_on)
+		dp->plat_data->power_on(dp->plat_data);
+
+	phy_power_on(dp->phy);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(analogix_dp_resume);
-- 
2.39.2

