Received: from mail-m15598.qiye.163.com (mail-m15598.qiye.163.com [101.71.155.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0C333F581;
	Thu,  9 Apr 2026 06:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775717619; cv=none; b=XP4HwxZG0BngcDdoLXqNY4MYdoHWful9DLlpfNaW3xz3oTpWnnXiTYStGrrcCvsbTepGA7VuJxRp4Z7T5R36qS0DT6R+TQ6S2LtGT7Xo3AZbC5YxIMkL70VR15uA0d2HpXWVZleJDxeDHUtW3COFERv0mM43IsZd64gjO7jw6Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775717619; c=relaxed/simple;
	bh=KuRjQ6sUnFKEgVz8f/qkn//5fJ53Dw6wpj8j7AnrI7k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TM8y20KF6KHN8LJa/IDfGtyU5U3nKbJ7Q1kfcLLK5yDg0K1SZh1jT1n6/pAcF2qsEPzHtFp21hqfAniS7871z6Kp7dKViVZAPLFj/7h1J62tT9HspkM5IPNKCHu4GXoFmGkd8LGgaRRmfAP4NT2kCr83qOIofAJfFKrK20Wju80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=fG4eTU8Y; arc=none smtp.client-ip=101.71.155.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="fG4eTU8Y"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3a11ab2fe;
	Thu, 9 Apr 2026 14:53:26 +0800 (GMT+08:00)
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
	Frank.Li@nxp.com,
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
Subject: [PATCH v13 07/17] drm/bridge: analogix_dp: Move the color format check to .atomic_check() for Rockchip platforms
Date: Thu,  9 Apr 2026 14:52:51 +0800
Message-Id: <20260409065301.446670-8-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260409065301.446670-1-damon.ding@rock-chips.com>
References: <20260409065301.446670-1-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9d7104642803a3kunmc1f4d6544039b1
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ0keGVZDHR1MSU4fQk0ZTk1WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=fG4eTU8Y6gI8LZufE0OZUpJIJpMGf/uQaTzMANpdDZjmOsHC/QpOPchiiG4c+V94RO933YOflxdwUDhNy9QQZh6MAlGm0G1rO2MHmgCzbcXyQENFAeOp/ErPjX0ggpSL3FD0PXphnT+gIlL+P9dsSqtd7ewEstpWSDhOrKtGnK4=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=5efsGfB2pxv5Psr5CbfD9hyEEEYI7WSMCyRa9CxLDTc=;
	h=date:mime-version:subject:message-id:from;

For Rockchip platforms, the YUV color formats are currently unsupported.
This compatibility check was previously implemented in
&analogix_dp_plat_data.get_modes().

Moving color format check to &drm_connector_helper_funcs.atomic_check()
would get rid of &analogix_dp_plat_data.get_modes() and be more
reasonable than before.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Tested-by: Heiko Stuebner <heiko@sntech.de> # rk3588

---

Changes in v9:
- Add Tested-by tag.

Changes in v13:
- Rebase after commit 01962a191242 ("drm/rockchip: analogix: Convert to
  drm_output_color_format")
- Modify '(on rk3588)' to '# rk3588' for Tested-by tag.
---
 .../gpu/drm/bridge/analogix/analogix_dp_core.c | 11 +++++++++++
 .../gpu/drm/rockchip/analogix_dp-rockchip.c    | 18 ------------------
 2 files changed, 11 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 88fb863fed78..c05cf100f17e 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -894,8 +894,19 @@ static int analogix_dp_atomic_check(struct drm_connector *connector,
 				    struct drm_atomic_state *state)
 {
 	struct analogix_dp_device *dp = to_dp(connector);
+	struct drm_display_info *di = &connector->display_info;
 	struct drm_connector_state *conn_state;
 	struct drm_crtc_state *crtc_state;
+	u32 mask = BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444) | BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422);
+
+	if (is_rockchip(dp->plat_data->dev_type)) {
+		if ((di->color_formats & mask)) {
+			DRM_DEBUG_KMS("Swapping display color format from YUV to RGB\n");
+			di->color_formats &= ~mask;
+			di->color_formats |= BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444);
+			di->bpc = 8;
+		}
+	}
 
 	conn_state = drm_atomic_get_new_connector_state(state, connector);
 	if (WARN_ON(!conn_state))
diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
index 387fb6259edd..48206a7b767f 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -166,23 +166,6 @@ static int rockchip_dp_powerdown(struct analogix_dp_plat_data *plat_data)
 	return 0;
 }
 
-static int rockchip_dp_get_modes(struct analogix_dp_plat_data *plat_data,
-				 struct drm_connector *connector)
-{
-	struct drm_display_info *di = &connector->display_info;
-	/* VOP couldn't output YUV video format for eDP rightly */
-	u32 mask = BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444) | BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422);
-
-	if ((di->color_formats & mask)) {
-		DRM_DEBUG_KMS("Swapping display color format from YUV to RGB\n");
-		di->color_formats &= ~mask;
-		di->color_formats |= BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444);
-		di->bpc = 8;
-	}
-
-	return 0;
-}
-
 static bool
 rockchip_dp_drm_encoder_mode_fixup(struct drm_encoder *encoder,
 				   const struct drm_display_mode *mode,
@@ -483,7 +466,6 @@ static int rockchip_dp_probe(struct platform_device *pdev)
 	dp->plat_data.dev_type = dp->data->chip_type;
 	dp->plat_data.power_on = rockchip_dp_poweron;
 	dp->plat_data.power_off = rockchip_dp_powerdown;
-	dp->plat_data.get_modes = rockchip_dp_get_modes;
 
 	ret = rockchip_dp_of_probe(dp);
 	if (ret < 0)
-- 
2.34.1

