Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD244BAA6
	for <linux-samsung-soc@vger.kernel.org>; Fri,  3 May 2024 15:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714749116; cv=none; b=VS7bXqth/ILaH79BSuoLLHwrAPk0SfSz6I/wfbv75cuTK7kYPgaXYciTjAasl0HzzIOi70GxAmk1Q9IvMhE+65GCBZWwgRMn1jJppETVSj6/cOJ0oWVBWTBoarvcXUJIOuz0KaZvnX8NoBMOOixJOglTuYEv5f4wZDxwHDmzcgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714749116; c=relaxed/simple;
	bh=BoBUlyWQEfS78uxfkUkFS905sHFhIFgByEUquSl2cJ4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cRKNBzFBEdX8Bnk2BhIOJe/eUZprBK5RhY3lT+d8DrkHTXXagZQXc7ejW0kyzqa3E8iwlJ+WMSBNwe5TolGS9iFuWgKM4zKTv5shdNY/CQJeYqH9TvCH6+D533fMyaQkDHf7AbrjKBEaFZr2SfENFjdB3OfsE1anrrcWjpxYwgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <l.stach@pengutronix.de>)
	id 1s2uZR-0004Bu-K6; Fri, 03 May 2024 17:11:33 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <l.stach@pengutronix.de>)
	id 1s2uZN-00FjHY-JD; Fri, 03 May 2024 17:11:29 +0200
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
Subject: [PATCH 03/14] drm/bridge: analogix_dp: register AUX bus after enabling runtime PM
Date: Fri,  3 May 2024 17:11:18 +0200
Message-Id: <20240503151129.3901815-4-l.stach@pengutronix.de>
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

AUX transactions require the controller to be in working state and
take a runtime PM reference. To avoid potential races beween the
first transactions on the bus and runtime PM being set up, move the
AUX registration behind the runtime PM setup.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 .../drm/bridge/analogix/analogix_dp_core.c    | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index b39721588980..0af2a70ae5bf 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1728,31 +1728,34 @@ int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *drm_dev)
 	dp->drm_dev = drm_dev;
 	dp->encoder = dp->plat_data->encoder;
 
+	pm_runtime_use_autosuspend(dp->dev);
+	pm_runtime_set_autosuspend_delay(dp->dev, 100);
+	pm_runtime_enable(dp->dev);
+
 	dp->aux.name = "DP-AUX";
 	dp->aux.transfer = analogix_dpaux_transfer;
 	dp->aux.dev = dp->dev;
 	dp->aux.drm_dev = drm_dev;
 
 	ret = drm_dp_aux_register(&dp->aux);
-	if (ret)
-		return ret;
-
-	pm_runtime_use_autosuspend(dp->dev);
-	pm_runtime_set_autosuspend_delay(dp->dev, 100);
-	pm_runtime_enable(dp->dev);
+	if (ret) {
+		DRM_ERROR("failed to register AUX (%d)\n", ret);
+		goto err_disable_pm_runtime;
+	}
 
 	ret = analogix_dp_create_bridge(drm_dev, dp);
 	if (ret) {
 		DRM_ERROR("failed to create bridge (%d)\n", ret);
-		goto err_disable_pm_runtime;
+		goto err_unregister_aux;
 	}
 
 	return 0;
 
+err_unregister_aux:
+	drm_dp_aux_unregister(&dp->aux);
 err_disable_pm_runtime:
 	pm_runtime_dont_use_autosuspend(dp->dev);
 	pm_runtime_disable(dp->dev);
-	drm_dp_aux_unregister(&dp->aux);
 
 	return ret;
 }
-- 
2.39.2

