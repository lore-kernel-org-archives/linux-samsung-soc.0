Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF70915252C
	for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Jun 2024 18:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718821347; cv=none; b=NLmKhh+5daYLdlK+aQUNIme7ublmdmLgx/osUufD93g/UPxjqWUPdYGLyPfmOR6Ai4UNU21LaGz0YXoXYekmLhFwQzwsCnj5hzoVeeUw6NZ29z+n7OHFocMtIxOqHCoVtcnCu7gZOcxrgQ5DmewESTxqBzG91lg1UB1vJ0AjLO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718821347; c=relaxed/simple;
	bh=NWrzSOoGsVPeP3YK7imRLUxalE1pShGXA3lQFiZ3yDc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=h1VsT5pHEmvdyGzRbIZpZNK4UCJLTzBDxajUv35gMHI+0MeQLwZXu3rzQHJ0zmeejC80OiEIx5+FOZCNqijVz3WracVmVb9Po8ySYw38Bwg2/fHtErxlsaDjI7c5JOsMFhoaVO1sjvH2jP+AzAHSbvAYYUhi34Nr92iaW6sKm8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <l.stach@pengutronix.de>)
	id 1sJzwX-00049Z-K7; Wed, 19 Jun 2024 20:22:01 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <l.stach@pengutronix.de>)
	id 1sJzwW-003WTo-A3; Wed, 19 Jun 2024 20:22:00 +0200
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
Subject: [PATCH v2 02/14] drm/rockchip: analogix_dp: add runtime PM handling
Date: Wed, 19 Jun 2024 20:21:48 +0200
Message-Id: <20240619182200.3752465-2-l.stach@pengutronix.de>
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

Hook up the runtime PM suspend/resume paths to make the rockchip
glue behave more like the exynos one. The same suspend/resume
functions are used for system sleep via the runtime PM force
suspend/resume.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
Reviewed-by: Robert Foss <rfoss@kernel.org>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Tested-by: Heiko Stuebner <heiko@sntech.de> (rk3288-veyron and rk3399-gru)
---
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
index baeb41875a4b..8214265f1497 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -13,6 +13,7 @@
 #include <linux/of.h>
 #include <linux/of_graph.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
 #include <linux/clk.h>
@@ -430,7 +431,6 @@ static void rockchip_dp_remove(struct platform_device *pdev)
 	analogix_dp_remove(dp->adp);
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int rockchip_dp_suspend(struct device *dev)
 {
 	struct rockchip_dp_device *dp = dev_get_drvdata(dev);
@@ -450,14 +450,9 @@ static int rockchip_dp_resume(struct device *dev)
 
 	return analogix_dp_resume(dp->adp);
 }
-#endif
 
-static const struct dev_pm_ops rockchip_dp_pm_ops = {
-#ifdef CONFIG_PM_SLEEP
-	.suspend_late = rockchip_dp_suspend,
-	.resume_early = rockchip_dp_resume,
-#endif
-};
+static DEFINE_RUNTIME_DEV_PM_OPS(rockchip_dp_pm_ops, rockchip_dp_suspend,
+		rockchip_dp_resume, NULL);
 
 static const struct rockchip_dp_chip_data rk3399_edp = {
 	.lcdsel_grf_reg = RK3399_GRF_SOC_CON20,
@@ -485,7 +480,7 @@ struct platform_driver rockchip_dp_driver = {
 	.remove_new = rockchip_dp_remove,
 	.driver = {
 		   .name = "rockchip-dp",
-		   .pm = &rockchip_dp_pm_ops,
+		   .pm = pm_ptr(&rockchip_dp_pm_ops),
 		   .of_match_table = rockchip_dp_dt_ids,
 	},
 };
-- 
2.39.2

