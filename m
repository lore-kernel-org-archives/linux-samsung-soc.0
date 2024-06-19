Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2A215747F
	for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Jun 2024 18:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718821343; cv=none; b=Gm24z7MZE76En1q+MDNjZKYH5LZ6FmZ/agqQ70p49HGk7yr1+8koIV1MJRraSJuwGH8rvVGKvXHBU7sqTE6mvYJzFYxGuzVGdk9tS6fY4gGImPvGafd07iUn0rhDTYOFdn+vCLljcYnuPtet+CHVzOvVKgo3kUgpf2hRPfq3Zws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718821343; c=relaxed/simple;
	bh=EK/RhPJvoOiLcfI6NOxfDoeI+QKY+z8F+rnEI18GNrY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pg0RrAVMODuaNTWJWz46pXBzMxVBBFtS2OtiwLy9wdswawvCK7FP+6/z7RncRL2iR2ZWxxXEPbIl+t3xGMzMzFPt0undamFwoKpQ2MHr0fcv7SbSbbLjI1cxGSccn7WpbYBF+/ygv+XzMIgaxCUhIVdoKf19GNrCRYGhJ2EehcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <l.stach@pengutronix.de>)
	id 1sJzwX-00049d-K3; Wed, 19 Jun 2024 20:22:01 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <l.stach@pengutronix.de>)
	id 1sJzwW-003WTo-Mk; Wed, 19 Jun 2024 20:22:00 +0200
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
Subject: [PATCH v2 06/14] drm/bridge: analogix_dp: remove clk handling from analogix_dp_set_bridge
Date: Wed, 19 Jun 2024 20:21:52 +0200
Message-Id: <20240619182200.3752465-6-l.stach@pengutronix.de>
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

The clock is already managed by runtime PM, which is properly invoked
from the analogix_dp_set_bridge function, so there is no need for an
additional reference.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
Reviewed-by: Robert Foss <rfoss@kernel.org>
Tested-by: Heiko Stuebner <heiko@sntech.de> (rk3288-veyron and rk3399-gru)
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 7a5e25b6aa3a..d8c0751ab5c0 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1251,12 +1251,6 @@ static int analogix_dp_set_bridge(struct analogix_dp_device *dp)
 
 	pm_runtime_get_sync(dp->dev);
 
-	ret = clk_prepare_enable(dp->clock);
-	if (ret < 0) {
-		DRM_ERROR("Failed to prepare_enable the clock clk [%d]\n", ret);
-		goto out_dp_clk_pre;
-	}
-
 	if (dp->plat_data->power_on)
 		dp->plat_data->power_on(dp->plat_data);
 
@@ -1290,8 +1284,7 @@ static int analogix_dp_set_bridge(struct analogix_dp_device *dp)
 	phy_power_off(dp->phy);
 	if (dp->plat_data->power_off)
 		dp->plat_data->power_off(dp->plat_data);
-	clk_disable_unprepare(dp->clock);
-out_dp_clk_pre:
+
 	pm_runtime_put_sync(dp->dev);
 
 	return ret;
@@ -1360,8 +1353,6 @@ static void analogix_dp_bridge_disable(struct drm_bridge *bridge)
 	analogix_dp_set_analog_power_down(dp, POWER_ALL, 1);
 	phy_power_off(dp->phy);
 
-	clk_disable_unprepare(dp->clock);
-
 	pm_runtime_put_sync(dp->dev);
 
 	ret = analogix_dp_prepare_panel(dp, false, true);
-- 
2.39.2

