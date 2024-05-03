Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A604AEE5
	for <linux-samsung-soc@vger.kernel.org>; Fri,  3 May 2024 15:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714749115; cv=none; b=ALxXdHsbefHI4Y+ovaySSRfY2IAd/1XoB4MO2h1gQyr8M89pG3bSDtRZq6fDr+mtvTJSqACbkGQa3ALXTaBfQduG6Ot/VUoAAuufSv9Ff3+K5YtL8HAa/aI5gbvslyMnaDFjzBaJsyfWTAOyxiqrgQLWhIzgwWymhj+NW2b+3iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714749115; c=relaxed/simple;
	bh=lzx4hP3a+p4899zEDW3LToLRjsF69ke+Z6D8yzomwbE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LudMN9n2HxifgVh9jZQlw0M2s2BVex2m9dwy/iQPsbrLK0HbwAT+cpiAd6ZDxSK8fDK5r673QgBTpb2KTiT77iO+oaUhCKyjKNH9DaB7lAY4ajuMHugFxSs1MEjti79RE3Z203DAEpcpl7u8+V/Yo14tlHfpzqWxCeHDWR7FiGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <l.stach@pengutronix.de>)
	id 1s2uZR-0004Ck-K7; Fri, 03 May 2024 17:11:33 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <l.stach@pengutronix.de>)
	id 1s2uZO-00FjHY-4X; Fri, 03 May 2024 17:11:30 +0200
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
Subject: [PATCH 08/14] drm/bridge: analogix_dp: move basic controller init into runtime PM
Date: Fri,  3 May 2024 17:11:23 +0200
Message-Id: <20240503151129.3901815-9-l.stach@pengutronix.de>
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

Make sure the controller is in a basic working state after runtime
resume. Keep the analog function enable in the mode set path as this
enables parts of the PHY that are only required to be powered when
there is a data stream being sent out.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 3281c00a39cd..fdb2c2a2b69a 100644
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
@@ -1258,9 +1252,9 @@ static int analogix_dp_set_bridge(struct analogix_dp_device *dp)
 
 	pm_runtime_get_sync(dp->dev);
 
-	ret = analogix_dp_init_dp(dp);
+	ret = analogix_dp_init_analog_func(dp);
 	if (ret)
-		goto out_dp_init;
+		return ret;
 
 	/*
 	 * According to DP spec v1.3 chap 3.5.1.2 Link Training,
@@ -1726,6 +1720,8 @@ int analogix_dp_resume(struct analogix_dp_device *dp)
 
 	phy_power_on(dp->phy);
 
+	analogix_dp_init_dp(dp);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(analogix_dp_resume);
-- 
2.39.2

