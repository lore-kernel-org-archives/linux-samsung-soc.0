Received: from mail-m49237.qiye.163.com (mail-m49237.qiye.163.com [45.254.49.237])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49FC0298981;
	Wed,  9 Jul 2025 11:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.237
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752061121; cv=none; b=HUwmmc0OWIbCEcQxSx21JqbmLYwqS37+Ch7LOJjMeWm3fkUNw/ACa63+mPnh9EMWZZdPQykYUN+30F2gFKhD0wsnDXi5YUMg11yQP8YYFbuiXjT6vpuDhF+h8PC1/B5wDuZKxLnNcO6NDBKsFDOXZsoKtYjIVZNZrlRcY23+yMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752061121; c=relaxed/simple;
	bh=dwlIfREyYsosZSrXvNyfoG2Bye3iq1yERCCXhZTuGsM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bqjs0hv/3zRtbiduy0XgENqklDcBWSL0NLzOZTxWidi7ydnL5qfFCL/TlpJz3OY2WoT9uHoxXaNcFkayfSXRjXM/uv1N+6VEbe23CxDb4Vt98MS8H1GVhI6RCJLdcoMnvJFfHy+HrWwK9ZfseqPwb/bbEQLcj4uQtn0Crss/Z3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=TC8XKsNM; arc=none smtp.client-ip=45.254.49.237
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="TC8XKsNM"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1b69b79d6;
	Wed, 9 Jul 2025 15:02:25 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	jingoohan1@gmail.com,
	inki.dae@samsung.com,
	sw0312.kim@samsung.com,
	kyungmin.park@samsung.com,
	krzk@kernel.org,
	alim.akhtar@samsung.com,
	hjc@rock-chips.com,
	heiko@sntech.de,
	andy.yan@rock-chips.com,
	dmitry.baryshkov@oss.qualcomm.com,
	l.stach@pengutronix.de,
	dianders@chromium.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v2 04/12] drm/exynos: exynos_dp: Remove &exynos_dp_device.ptn_bridge
Date: Wed,  9 Jul 2025 15:01:31 +0800
Message-Id: <20250709070139.3130635-5-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250709070139.3130635-1-damon.ding@rock-chips.com>
References: <20250709070139.3130635-1-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGk1KH1ZNQkwYTx8fSB9DGhhWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a97edfe26e603a3kunm3a7bcd50c839b2
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MxQ6CQw5FzE6Ky8fIxAWIj8f
	CxQaCTlVSlVKTE5JS09PTk9DSE9DVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFISENMNwY+
DKIM-Signature:a=rsa-sha256;
	b=TC8XKsNMf20U9Up3zo4p2YEAeLYBwTD57JXHH8LdU0K6Cak3chQkmr/ON72ZwWvNL9M3TH8YlR8EYDDcTnuoZfdm8glfHMjsCfX0pgRnvqn9TVWa2sNpiKic5bOJIryO+zSiON9na8VR37gPw/CW1p8ITpP7GvFQg0zAP12Adf8=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=rXkA9sraLLYJdYKCh/Eg6csTIU1/0XUNSygkdO9ShiI=;
	h=date:mime-version:subject:message-id:from;

Use &analogix_dp_plat_data.bridge instead of &exynos_dp_device.ptn_bridge
directly.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
---
 drivers/gpu/drm/exynos/exynos_dp.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_dp.c b/drivers/gpu/drm/exynos/exynos_dp.c
index 5bcf41e0bd04..9d7d3f009e58 100644
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
+	if (plat_data->bridge) {
+		ret = drm_bridge_attach(&dp->encoder, plat_data->bridge, bridge,
 					0);
 		if (ret)
 			return ret;
@@ -155,7 +154,7 @@ static int exynos_dp_bind(struct device *dev, struct device *master, void *data)
 
 	dp->drm_dev = drm_dev;
 
-	if (!dp->plat_data.panel && !dp->ptn_bridge) {
+	if (!dp->plat_data.panel && !dp->plat_data.panel) {
 		ret = exynos_dp_dt_parse_panel(dp);
 		if (ret)
 			return ret;
@@ -232,6 +231,7 @@ static int exynos_dp_probe(struct platform_device *pdev)
 
 	/* The remote port can be either a panel or a bridge */
 	dp->plat_data.panel = panel;
+	dp->plat_data.bridge = bridge;
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

