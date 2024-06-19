Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2EC157480
	for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Jun 2024 18:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718821343; cv=none; b=AGqjPkHHk4ycHD9AjLSRf6/iuC7Qm69ZaTvrSqgyNaj0Tg7JJvaLURc4ZEBCmPXXz/2lLS5/msBs1ox2tB2LvYhuUhI/Tbu/G5JuV6TBpbOigZT+TU6ctgV0tn0gN4n99Yvla4p9Dm0z+A5ki6hP+cdqUb3cql3Gv5RieooAJ3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718821343; c=relaxed/simple;
	bh=Ybh8JAFI8zFn2J+Iz9ya7pP6+dh8wQ8aMipitQX5Nk8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fPWqkArqXnqydDzMaIAEfpFnZgkFrB/kmQnuCAoBUnmd8PHFzO6opXjPcmK7DmPwvzpsnzLrO1kbexaKHPNV6nejVHssmUSNrE0nABGd4LKbWjTBNUWiUnSPy1FmJ49PlTWR++DVwRHOs+plQpfsZe96bWBaoz20fcfUx6S3DPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <l.stach@pengutronix.de>)
	id 1sJzwX-00049c-K4; Wed, 19 Jun 2024 20:22:01 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <l.stach@pengutronix.de>)
	id 1sJzwW-003WTo-Jj; Wed, 19 Jun 2024 20:22:00 +0200
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
Subject: [PATCH v2 05/14] drm/bridge: analogix_dp: remove unused analogix_dp_remove
Date: Wed, 19 Jun 2024 20:21:51 +0200
Message-Id: <20240619182200.3752465-5-l.stach@pengutronix.de>
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

Now that the clock is handled dynamically through
analogix_dp_resume/suspend and it isn't statically enabled in the
driver probe routine, there is no need for the remove function anymore.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
Reviewed-by: Robert Foss <rfoss@kernel.org>
Tested-by: Heiko Stuebner <heiko@sntech.de> (rk3288-veyron and rk3399-gru)
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 5 -----
 drivers/gpu/drm/exynos/exynos_dp.c                 | 3 ---
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    | 9 +--------
 include/drm/bridge/analogix_dp.h                   | 1 -
 4 files changed, 1 insertion(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 4453d1672686..7a5e25b6aa3a 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1805,11 +1805,6 @@ void analogix_dp_unbind(struct analogix_dp_device *dp)
 }
 EXPORT_SYMBOL_GPL(analogix_dp_unbind);
 
-void analogix_dp_remove(struct analogix_dp_device *dp)
-{
-}
-EXPORT_SYMBOL_GPL(analogix_dp_remove);
-
 int analogix_dp_start_crc(struct drm_connector *connector)
 {
 	struct analogix_dp_device *dp = to_dp(connector);
diff --git a/drivers/gpu/drm/exynos/exynos_dp.c b/drivers/gpu/drm/exynos/exynos_dp.c
index 8ad2ec5c6455..22142b293279 100644
--- a/drivers/gpu/drm/exynos/exynos_dp.c
+++ b/drivers/gpu/drm/exynos/exynos_dp.c
@@ -251,10 +251,7 @@ static int exynos_dp_probe(struct platform_device *pdev)
 
 static void exynos_dp_remove(struct platform_device *pdev)
 {
-	struct exynos_dp_device *dp = platform_get_drvdata(pdev);
-
 	component_del(&pdev->dev, &exynos_dp_ops);
-	analogix_dp_remove(dp->adp);
 }
 
 static int exynos_dp_suspend(struct device *dev)
diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
index 8214265f1497..362c7951ca4a 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -414,21 +414,14 @@ static int rockchip_dp_probe(struct platform_device *pdev)
 
 	ret = component_add(dev, &rockchip_dp_component_ops);
 	if (ret)
-		goto err_dp_remove;
+		return ret;
 
 	return 0;
-
-err_dp_remove:
-	analogix_dp_remove(dp->adp);
-	return ret;
 }
 
 static void rockchip_dp_remove(struct platform_device *pdev)
 {
-	struct rockchip_dp_device *dp = platform_get_drvdata(pdev);
-
 	component_del(&pdev->dev, &rockchip_dp_component_ops);
-	analogix_dp_remove(dp->adp);
 }
 
 static int rockchip_dp_suspend(struct device *dev)
diff --git a/include/drm/bridge/analogix_dp.h b/include/drm/bridge/analogix_dp.h
index 8709b6a74c0f..6002c5666031 100644
--- a/include/drm/bridge/analogix_dp.h
+++ b/include/drm/bridge/analogix_dp.h
@@ -44,7 +44,6 @@ struct analogix_dp_device *
 analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data);
 int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *drm_dev);
 void analogix_dp_unbind(struct analogix_dp_device *dp);
-void analogix_dp_remove(struct analogix_dp_device *dp);
 
 int analogix_dp_start_crc(struct drm_connector *connector);
 int analogix_dp_stop_crc(struct drm_connector *connector);
-- 
2.39.2

