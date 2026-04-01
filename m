Received: from mail-m3295.qiye.163.com (mail-m3295.qiye.163.com [220.197.32.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88956395D8B;
	Wed,  1 Apr 2026 09:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775035269; cv=none; b=AAsTXaA+kxoRSZKaXiaJgOqQSfT2Z22AuoTGMOOIvAsggGwhjsgPb8VZFl3/ZGbSNlvOLd+Z0BS4SYj4zgBqKlN0BmT/sD5ISy0EcYWQZKFfht0O1ljxu+V5xhvwelN5jzcgCmWU/LioLLcdh7uXeaYGFVXZ7X52hZp/6UX8Y4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775035269; c=relaxed/simple;
	bh=yxexZG8nOv1R5vP6h2dOI+43lJ6jiXcZG2/ZXUu/hyY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eHX3lxktEPpDF9xTgpBoA2dSGXoaUdYVX9jZ9ZP8ko6p/XjvW6HW2jZpMvC93rZZAyAm4wr4xiljhu2Xz02QKl8151hq6YknTdwF+4D5BZV2NZRE1/bCxBGLJV/JGLOSGzd5wFtLncWk7icSqglbIH59fSnmA7lJHCoAEal3nNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=ExfpS2nl; arc=none smtp.client-ip=220.197.32.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="ExfpS2nl"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3923a3007;
	Wed, 1 Apr 2026 17:15:47 +0800 (GMT+08:00)
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
Subject: [PATCH v12 10/17] drm/bridge: analogix_dp: Pass struct drm_atomic_state* for analogix_dp_bridge_mode_set()
Date: Wed,  1 Apr 2026 17:14:47 +0800
Message-Id: <20260401091454.25730-11-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260401091454.25730-1-damon.ding@rock-chips.com>
References: <20260401091454.25730-1-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9d4853d8ee03a3kunm479af8c3b32e55
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ0JCHVZNSx8dH09JS0hJTBlWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=ExfpS2nlheWXYyK8+dpPYiOL2MhMxlOa6EtDJ/7zMVzoANLlLeg1IoeB5w9k4ORSX4j4tRFsKBwn2KVXcL96Z17JVBVFzEwDZAADkPqG64AE8kI1hxQN8JNvNnSO4UH4WjT3AatfvQ751F8hb2imrSCYEKiQE4jnbhefbloeiKM=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=3mUNpLWOwfKveBwjN46ySOYdLKqUaTMP8Er2MwQ6Noc=;
	h=date:mime-version:subject:message-id:from;

To avoid using &analogix_dp_device.connector for compatibility
with the bridge connector framework, get &drm_connector from
&drm_atomic_state instead.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 3efd910ea463..7e42eb18313d 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1095,14 +1095,21 @@ static int analogix_dp_set_bridge(struct analogix_dp_device *dp)
 }
 
 static void analogix_dp_bridge_mode_set(struct drm_bridge *bridge,
+					struct drm_atomic_state *state,
 					const struct drm_display_mode *mode)
 {
 	struct analogix_dp_device *dp = to_dp(bridge);
-	struct drm_display_info *display_info = &dp->connector.display_info;
 	struct video_info *video = &dp->video_info;
 	struct device_node *dp_node = dp->dev->of_node;
+	struct drm_connector *connector;
+	struct drm_display_info *display_info;
 	int vic;
 
+	connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
+	if (!connector)
+		return;
+	display_info = &connector->display_info;
+
 	/* Input video interlaces & hsync pol & vsync pol */
 	video->interlaced = !!(mode->flags & DRM_MODE_FLAG_INTERLACE);
 	video->v_sync_polarity = !!(mode->flags & DRM_MODE_FLAG_NVSYNC);
@@ -1186,7 +1193,7 @@ static void analogix_dp_bridge_atomic_enable(struct drm_bridge *bridge,
 	new_crtc_state = drm_atomic_get_new_crtc_state(old_state, crtc);
 	if (!new_crtc_state)
 		return;
-	analogix_dp_bridge_mode_set(bridge, &new_crtc_state->adjusted_mode);
+	analogix_dp_bridge_mode_set(bridge, old_state, &new_crtc_state->adjusted_mode);
 
 	old_crtc_state = drm_atomic_get_old_crtc_state(old_state, crtc);
 	/* Not a full enable, just disable PSR and continue */
-- 
2.34.1

