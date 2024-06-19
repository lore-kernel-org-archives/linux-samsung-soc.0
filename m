Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9787915252C
	for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Jun 2024 18:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718821342; cv=none; b=LT+bzPjXj/N0YQDz6+NNsl/Hwv2GBzuDoKRSz+pZfmeOQuqfDi4wi+fa9hKRTSPe0qSKVNLy2YUNebQ4PHYuYvNTwosC+HkUXB3kRMl3nJHoI14Ez4SYoYAGKKBEY0TXlEYmJkJxTUmNM9LJmgSJb2abrA50UWn2ssZxcKTFI6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718821342; c=relaxed/simple;
	bh=xl7JBVCboVplKePZ+LWZvbJgXJvLcOdS+pfYu7HsObI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CABvDrZ7BsF8h8lLoMeZcCGQXhFAZTWVDAfzdAwc8ktbi4hrANelhfCLo3gcfm8gGq2FqmpHtJnL8xrLhIvyCrs+judvMIC0RbUxtctwhyfMkCiV2ndhQctRwShDAcuMbe3Nrlwo1oQyvQ27Dhx/IU1qxcbMxBoIUidec8qXMNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <l.stach@pengutronix.de>)
	id 1sJzwX-00049g-K8; Wed, 19 Jun 2024 20:22:01 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <l.stach@pengutronix.de>)
	id 1sJzwW-003WTo-V5; Wed, 19 Jun 2024 20:22:01 +0200
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
Subject: [PATCH v2 09/14] drm/bridge: analogix_dp: remove PLL lock check from analogix_dp_config_video
Date: Wed, 19 Jun 2024 20:21:55 +0200
Message-Id: <20240619182200.3752465-9-l.stach@pengutronix.de>
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

This check is way too late in the DP enable flow. The PLL must be
locked much earlier, before any link training can happen. If the
PLL is unlocked at that point in time there is something seriously
wrong in the enable flow.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
Reviewed-by: Robert Foss <rfoss@kernel.org>
Tested-by: Heiko Stuebner <heiko@sntech.de> (rk3288-veyron and rk3399-gru)
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index c852d9517c27..bbf2c0808ace 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -717,11 +717,6 @@ static int analogix_dp_config_video(struct analogix_dp_device *dp)
 
 	analogix_dp_set_video_color_format(dp);
 
-	if (analogix_dp_get_pll_lock_status(dp) == PLL_UNLOCKED) {
-		dev_err(dp->dev, "PLL is not locked yet.\n");
-		return -EINVAL;
-	}
-
 	for (;;) {
 		timeout_loop++;
 		if (analogix_dp_is_slave_video_stream_clock_on(dp) == 0)
-- 
2.39.2

