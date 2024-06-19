Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978C1155346
	for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Jun 2024 18:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718821342; cv=none; b=uqqb30NUgYdadSA2ILeoixIm/wUV8U0FQsCITlQBXeObtZrCLngAxPwZTLe4Jzqj434sjGOigpQkeCYTh5CCmSKWZ7cfF4j/sJIjVQr8gbiT9Mi5zUjUbjwc29Ay381j+M+8l4+nvWmzFRAasP2OMN5hmrc0VYsNyqjTyCZR1Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718821342; c=relaxed/simple;
	bh=9KciZRo1qp7ZOj3ZkNrtmmD7WgHqGDXOL6z7FucHtTo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LN6uLQuTtceZaX5USvz7YdF0jAO0sdvHOhppAbQLzdYovAsFA4Mtuuvr2Q8AsQG7rTns9SDpJ8bDwaJGDbPe7E9OVwlZgfmPGj8xahs7l6ZsnISodJ+PkRoSXqCNWIhq1uRFiX8J/YJfFcdVXzHEWDYm2GIm3K6SEv/hCygIXg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <l.stach@pengutronix.de>)
	id 1sJzwX-00049h-K6; Wed, 19 Jun 2024 20:22:01 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <l.stach@pengutronix.de>)
	id 1sJzwX-003WTo-1y; Wed, 19 Jun 2024 20:22:01 +0200
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
Subject: [PATCH v2 10/14] drm/bridge: analogix_dp: move macro reset after link bandwidth setting
Date: Wed, 19 Jun 2024 20:21:56 +0200
Message-Id: <20240619182200.3752465-10-l.stach@pengutronix.de>
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

Setting the link bandwidth may change the PLL parameters, which will cause
the PLL to go out of lock, so make sure to apply the MACRO_RST, which
according to the comment is required to be pulsed after the PLL is locked.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
Reviewed-by: Robert Foss <rfoss@kernel.org>
Tested-by: Heiko Stuebner <heiko@sntech.de> (rk3288-veyron and rk3399-gru)
---
 .../gpu/drm/bridge/analogix/analogix_dp_core.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index bbf2c0808ace..d2c7a9117ce3 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -243,6 +243,11 @@ static int analogix_dp_link_start(struct analogix_dp_device *dp)
 
 	/* Set link rate and count as you want to establish*/
 	analogix_dp_set_link_bandwidth(dp, dp->link_train.link_rate);
+	/*
+	 * MACRO_RST must be applied after the PLL_LOCK to avoid
+	 * the DP inter pair skew issue for at least 10 us
+	 */
+	analogix_dp_reset_macro(dp);
 	analogix_dp_set_lane_count(dp, dp->link_train.lane_count);
 
 	/* Setup RX configuration */
@@ -562,12 +567,6 @@ static int analogix_dp_full_link_train(struct analogix_dp_device *dp,
 	int retval = 0;
 	bool training_finished = false;
 
-	/*
-	 * MACRO_RST must be applied after the PLL_LOCK to avoid
-	 * the DP inter pair skew issue for at least 10 us
-	 */
-	analogix_dp_reset_macro(dp);
-
 	/* Initialize by reading RX's DPCD */
 	analogix_dp_get_max_rx_bandwidth(dp, &dp->link_train.link_rate);
 	analogix_dp_get_max_rx_lane_count(dp, &dp->link_train.lane_count);
@@ -634,9 +633,12 @@ static int analogix_dp_fast_link_train(struct analogix_dp_device *dp)
 	u8 link_align, link_status[2];
 	enum pll_status status;
 
-	analogix_dp_reset_macro(dp);
-
 	analogix_dp_set_link_bandwidth(dp, dp->link_train.link_rate);
+	/*
+	 * MACRO_RST must be applied after the PLL_LOCK to avoid
+	 * the DP inter pair skew issue for at least 10 us
+	 */
+	analogix_dp_reset_macro(dp);
 	analogix_dp_set_lane_count(dp, dp->link_train.lane_count);
 	analogix_dp_set_lane_link_training(dp);
 
-- 
2.39.2

