Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903071E4B1
	for <linux-samsung-soc@vger.kernel.org>; Fri,  3 May 2024 15:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714749158; cv=none; b=G+kaZNv6P5V7p/9hOVN5H3OmFGvcp+80Hz9ZwlWNrXJkPB9JzbX+YHpdlCsWs8v3mYnomWhYHMqM+U8EPTz0NVl0ms7InVx/YAEwvYnFlzlEXudEWmGXVgqfF2qc/+lWtxcth3OowEyKszAA+KfK5cHfMbMpbE00YlJhDJbNzDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714749158; c=relaxed/simple;
	bh=3XE4xN+zrBKD58IkoB2Xzd1Iv8DAPBRKwIzQnpFIJ60=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZN7HNZ6JlnHWO5S3Zhy1TcHQIKZxPfhheCcmwCVGi+2ytAj1l6oR6LXmdQ5YnamfBeoe4dh06broA4B5kKtmp7r3Kpd0jhXiFhSZp0oc1gS8mNx9QMlD5s87jYz3XyLX33w7v8pT5NsHaS8WbjaYp2y9/nwBKUUs8zMPh+d/Ci0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <l.stach@pengutronix.de>)
	id 1s2uaK-0004vQ-6W; Fri, 03 May 2024 17:12:28 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <l.stach@pengutronix.de>)
	id 1s2uZO-00FjHY-Bq; Fri, 03 May 2024 17:11:30 +0200
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
Subject: [PATCH 10/14] drm/bridge: analogix_dp: move macro reset after link bandwidth setting
Date: Fri,  3 May 2024 17:11:25 +0200
Message-Id: <20240503151129.3901815-11-l.stach@pengutronix.de>
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

Setting the link bandwidth may change the PLL parameters, which will cause
the PLL to go out of lock, so make sure to apply the MACRO_RST, which
according to the comment is required to be pulsed after the PLL is locked.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 .../gpu/drm/bridge/analogix/analogix_dp_core.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index b4a47311cfe8..736b2ed745e1 100644
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
@@ -565,12 +570,6 @@ static int analogix_dp_full_link_train(struct analogix_dp_device *dp,
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
@@ -637,9 +636,12 @@ static int analogix_dp_fast_link_train(struct analogix_dp_device *dp)
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

