Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4884A99C
	for <linux-samsung-soc@vger.kernel.org>; Fri,  3 May 2024 15:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714749115; cv=none; b=jGOOt2RTPalI61TniDRC6SRPJbF1+zQ03gtDuRiGpe+Sd9gMqMDnWzurVyCpLRptvXKFWlLyI+Lrct0LdSAjQyKgD6fey/QU6mWluv5GphxON311pJOyxNivLGe9Z8F4uGG/SGsk6D25SPHfultp5cxBHHOKJfpIOqCbgfkTisg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714749115; c=relaxed/simple;
	bh=i0LMak0Teo/KX1E10KJAVyG0lERu2ftyH9rxzlfGM0k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DtCR4eNQz6rkVM/jdbuL55Wz1wYILrY00EyYqO164/kYSkJyN5XPkj86KhUNiubXf4BiBmww32NH1ol877PY84HJCyZqAFV44+8gCSohY0xc3mSp1zFv/HjLV9lYh94/PLFwN1szKG4ptmtwLt0nc8LyGycYFApGM9tWViEDh+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <l.stach@pengutronix.de>)
	id 1s2uZR-0004Cj-K8; Fri, 03 May 2024 17:11:33 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <l.stach@pengutronix.de>)
	id 1s2uZO-00FjHY-0o; Fri, 03 May 2024 17:11:30 +0200
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
Subject: [PATCH 07/14] drm/bridge: analogix_dp: move platform and PHY power handling into runtime PM
Date: Fri,  3 May 2024 17:11:22 +0200
Message-Id: <20240503151129.3901815-8-l.stach@pengutronix.de>
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

Platform and PHY power isn't only required when the actual display data
stream is active, but may be required earlier to support AUX channel
transactions. Move them into the runtime PM calls, so they are properly
managed whenever various other parts of the driver need them to be active.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 .../drm/bridge/analogix/analogix_dp_core.c    | 23 ++++++++-----------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 311e1e67486d..3281c00a39cd 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1258,11 +1258,6 @@ static int analogix_dp_set_bridge(struct analogix_dp_device *dp)
 
 	pm_runtime_get_sync(dp->dev);
 
-	if (dp->plat_data->power_on)
-		dp->plat_data->power_on(dp->plat_data);
-
-	phy_power_on(dp->phy);
-
 	ret = analogix_dp_init_dp(dp);
 	if (ret)
 		goto out_dp_init;
@@ -1288,10 +1283,6 @@ static int analogix_dp_set_bridge(struct analogix_dp_device *dp)
 	return 0;
 
 out_dp_init:
-	phy_power_off(dp->phy);
-	if (dp->plat_data->power_off)
-		dp->plat_data->power_off(dp->plat_data);
-
 	pm_runtime_put_sync(dp->dev);
 
 	return ret;
@@ -1354,11 +1345,7 @@ static void analogix_dp_bridge_disable(struct drm_bridge *bridge)
 
 	disable_irq(dp->irq);
 
-	if (dp->plat_data->power_off)
-		dp->plat_data->power_off(dp->plat_data);
-
 	analogix_dp_set_analog_power_down(dp, POWER_ALL, 1);
-	phy_power_off(dp->phy);
 
 	pm_runtime_put_sync(dp->dev);
 
@@ -1713,6 +1700,11 @@ EXPORT_SYMBOL_GPL(analogix_dp_probe);
 
 int analogix_dp_suspend(struct analogix_dp_device *dp)
 {
+	phy_power_off(dp->phy);
+
+	if (dp->plat_data->power_off)
+		dp->plat_data->power_off(dp->plat_data);
+
 	clk_disable_unprepare(dp->clock);
 
 	return 0;
@@ -1729,6 +1721,11 @@ int analogix_dp_resume(struct analogix_dp_device *dp)
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

