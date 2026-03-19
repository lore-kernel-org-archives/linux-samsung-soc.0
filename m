Received: from mail-m3276.qiye.163.com (mail-m3276.qiye.163.com [220.197.32.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B37D264A9D;
	Thu, 19 Mar 2026 08:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773909062; cv=none; b=PAJqPAnSILsG8LYnXmUR9vBTlLSL6d3naFUSsGmsNHMZHusLHeEshTFtJSgWqGbP7IXenXMJaCIzcz3izsopCh5yKZjaA8jGNnaAQ1gF3IRYAmvEdPm1brL47zq1tL3W3AusAPw2Qok1cGFv5QqRB8t8SFmEuMhEAiSAX7trql4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773909062; c=relaxed/simple;
	bh=yVlKiHcaRs4I5vgaxZMyvoqwS5TOpj16JX1AoSpevUw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SZuhEMHzQCqKQcr/JUHVyBprW3SxTyUk1zuzMYownaXDKCGn73hbpUxi0ixugIeSKuVFQmHRnJPvh7T2qZT1P+6sJk4iwEYeu47k13bZrpLmPyaZ6aJBaAIO8DobU9DYCSK65OluYRpJ+WB9M5K5YMpSlG/N82lXBk1wu9JQhms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=IHs+jtCK; arc=none smtp.client-ip=220.197.32.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="IHs+jtCK"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3788743d2;
	Thu, 19 Mar 2026 15:15:16 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	victor.liu@nxp.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	inki.dae@samsung.com,
	sw0312.kim@samsung.com,
	kyungmin.park@samsung.com,
	krzk@kernel.org,
	jingoohan1@gmail.com,
	p.zabel@pengutronix.de,
	hjc@rock-chips.com,
	heiko@sntech.de,
	andy.yan@rock-chips.com
Cc: Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	kernel@pengutronix.de,
	festevam@gmail.com,
	alim.akhtar@samsung.com,
	dmitry.baryshkov@oss.qualcomm.com,
	luca.ceresoli@bootlin.com,
	nicolas.frattaroli@collabora.com,
	dianders@chromium.org,
	m.szyprowski@samsung.com,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v11 03/17] drm/exynos: exynos_dp: Remove &exynos_dp_device.ptn_bridge
Date: Thu, 19 Mar 2026 15:14:38 +0800
Message-Id: <20260319071452.1961274-4-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260319071452.1961274-1-damon.ding@rock-chips.com>
References: <20260319071452.1961274-1-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9d04f2d4f503a3kunm86e540ee3964de
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ09DHlZPGkgYTx4YT0xKSR9WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=IHs+jtCKod2+eHuv4A1epPQP2Z68/McBrY85xvaLm0umFveR9iamcPgttq3Zl/EcxkOCJMDrJoYwEu3eC8gkcGRXd8opYeMm/2ASBh8C0Pmh6trdFty5T3jyA+wRraU2adVXizm13Mn2ra94VLzPem0R1fq/dX83B84cjdWlxyw=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=d5GS5vfwTVfAl23/CtmQinQG9E3Zp0oDflrp1gqCYsc=;
	h=date:mime-version:subject:message-id:from;

Use &analogix_dp_plat_data.bridge instead of &exynos_dp_device.ptn_bridge
directly.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Tested-by: Heiko Stuebner <heiko@sntech.de> (on rk3588)

------

Changes in v3:
- Fix the typographical error for &dp->plat_data.bridge.

Changes in v4:
- Rename the &analogix_dp_plat_data.bridge to
  &analogix_dp_plat_data.next_bridge.

Changes in v9:
- Add Reviewed-by and Tested-by tags.
---
 drivers/gpu/drm/exynos/exynos_dp.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_dp.c b/drivers/gpu/drm/exynos/exynos_dp.c
index 5bcf41e0bd04..f469ac5b3c2a 100644
--- a/drivers/gpu/drm/exynos/exynos_dp.c
+++ b/drivers/gpu/drm/exynos/exynos_dp.c
@@ -36,7 +36,6 @@
 struct exynos_dp_device {
 	struct drm_encoder         encoder;
 	struct drm_connector       *connector;
-	struct drm_bridge          *ptn_bridge;
 	struct drm_device          *drm_dev;
 	struct device              *dev;
 
@@ -106,8 +105,8 @@ static int exynos_dp_bridge_attach(struct analogix_dp_plat_data *plat_data,
 	dp->connector = connector;
 
 	/* Pre-empt DP connector creation if there's a bridge */
-	if (dp->ptn_bridge) {
-		ret = drm_bridge_attach(&dp->encoder, dp->ptn_bridge, bridge,
+	if (plat_data->next_bridge) {
+		ret = drm_bridge_attach(&dp->encoder, plat_data->next_bridge, bridge,
 					0);
 		if (ret)
 			return ret;
@@ -155,7 +154,7 @@ static int exynos_dp_bind(struct device *dev, struct device *master, void *data)
 
 	dp->drm_dev = drm_dev;
 
-	if (!dp->plat_data.panel && !dp->ptn_bridge) {
+	if (!dp->plat_data.panel && !dp->plat_data.next_bridge) {
 		ret = exynos_dp_dt_parse_panel(dp);
 		if (ret)
 			return ret;
@@ -232,6 +231,7 @@ static int exynos_dp_probe(struct platform_device *pdev)
 
 	/* The remote port can be either a panel or a bridge */
 	dp->plat_data.panel = panel;
+	dp->plat_data.next_bridge = bridge;
 	dp->plat_data.dev_type = EXYNOS_DP;
 	dp->plat_data.power_on = exynos_dp_poweron;
 	dp->plat_data.power_off = exynos_dp_poweroff;
@@ -239,8 +239,6 @@ static int exynos_dp_probe(struct platform_device *pdev)
 	dp->plat_data.get_modes = exynos_dp_get_modes;
 	dp->plat_data.skip_connector = !!bridge;
 
-	dp->ptn_bridge = bridge;
-
 out:
 	dp->adp = analogix_dp_probe(dev, &dp->plat_data);
 	if (IS_ERR(dp->adp))
-- 
2.34.1

