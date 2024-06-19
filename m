Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD243157A67
	for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Jun 2024 18:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718821346; cv=none; b=GkJLDPblZSkKkShjYCKPldtD9ShDWsNnVS0ji9hOQs/nQe3HwX7nnhFqRi2xaXSSZlpeEuDY8rP7t8sMkgOl4VlRUiJVM6Q21OGlXkfRoAf1EdaNR/E2Bq+srEoiJCVk7rxkfAj/EkViFPVRCrAuFsDVAObENugHa+1tIyw2Ti8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718821346; c=relaxed/simple;
	bh=31uGTmMkWiTb7NQBk9t4b6W8uGYvk4lENDri/v3aM8E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ow2NKIWm+KrM/6mvut5vo02NwjT1zBDW8QupBRGEVlY9J6LyXjzgadG0Ng1rbqTqZ6NS6bHud1vC5G7Ex9QqTQy4a4DY3eKpQ3Qy8mgshV5zrpGlvUlVKEX99CGGJQjuM/P6ZjknlN9NBAfp5/dyGc69wBlYroPIHQb9dXVKVYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <l.stach@pengutronix.de>)
	id 1sJzwX-00049f-KA; Wed, 19 Jun 2024 20:22:01 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <l.stach@pengutronix.de>)
	id 1sJzwW-003WTo-Rr; Wed, 19 Jun 2024 20:22:00 +0200
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
Subject: [PATCH v2 08/14] drm/bridge: analogix_dp: move basic controller init into runtime PM
Date: Wed, 19 Jun 2024 20:21:54 +0200
Message-Id: <20240619182200.3752465-8-l.stach@pengutronix.de>
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

Make sure the controller is in a basic working state after runtime
resume. Keep the analog function enable in the mode set path as this
enables parts of the PHY that are only required to be powered when
there is a data stream being sent out.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
Reviewed-by: Robert Foss <rfoss@kernel.org>
Tested-by: Heiko Stuebner <heiko@sntech.de> (rk3288-veyron and rk3399-gru)
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index d2b6d5a87188..c852d9517c27 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -41,10 +41,8 @@ struct bridge_init {
 	struct device_node *node;
 };
 
-static int analogix_dp_init_dp(struct analogix_dp_device *dp)
+static void analogix_dp_init_dp(struct analogix_dp_device *dp)
 {
-	int ret;
-
 	analogix_dp_reset(dp);
 
 	analogix_dp_swreset(dp);
@@ -56,13 +54,9 @@ static int analogix_dp_init_dp(struct analogix_dp_device *dp)
 	analogix_dp_enable_sw_function(dp);
 
 	analogix_dp_config_interrupt(dp);
-	ret = analogix_dp_init_analog_func(dp);
-	if (ret)
-		return ret;
 
 	analogix_dp_init_hpd(dp);
 	analogix_dp_init_aux(dp);
-	return 0;
 }
 
 static int analogix_dp_detect_hpd(struct analogix_dp_device *dp)
@@ -1251,9 +1245,9 @@ static int analogix_dp_set_bridge(struct analogix_dp_device *dp)
 
 	pm_runtime_get_sync(dp->dev);
 
-	ret = analogix_dp_init_dp(dp);
+	ret = analogix_dp_init_analog_func(dp);
 	if (ret)
-		goto out_dp_init;
+		return ret;
 
 	/*
 	 * According to DP spec v1.3 chap 3.5.1.2 Link Training,
@@ -1718,6 +1712,8 @@ int analogix_dp_resume(struct analogix_dp_device *dp)
 
 	phy_power_on(dp->phy);
 
+	analogix_dp_init_dp(dp);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(analogix_dp_resume);
-- 
2.39.2

