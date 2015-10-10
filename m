From: Yakir Yang <ykk@rock-chips.com>
Subject: [PATCH v6 14/17] drm: bridge: analogix/dp: add max link rate and lane count limit for RK3288
Date: Sun, 11 Oct 2015 00:05:45 +0800
Message-ID: <1444493145-28096-1-git-send-email-ykk@rock-chips.com>
References: <1444491357-26095-1-git-send-email-ykk@rock-chips.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lucky1.263xmail.com ([211.157.147.130]:60919 "EHLO
	lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751423AbbJJQFy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 10 Oct 2015 12:05:54 -0400
In-Reply-To: <1444491357-26095-1-git-send-email-ykk@rock-chips.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Jingoo Han <jingoohan1@gmail.com>, Thierry Reding <treding@nvidia.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Rob Herring <robh+dt@kernel.org>, joe@perches.com, Heiko Stuebner <heiko@sntech.de>, Mark Yao <mark.yao@rock-chips.com>
Cc: Russell King <linux@arm.linux.org.uk>, djkurtz@chromium.org, dianders@chromium.org, Sean Paul <seanpaul@chromium.org>, Kukjin Kim <kgene@kernel.org>, Kumar Gala <galak@codeaurora.org>, emil.l.velikov@gmail.com, Ian Campbell <ijc+devicetree@hellion.org.uk>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Kishon Vijay Abraham I <kishon@ti.com>, Pawel Moll <pawel.moll@arm.com>, ajaynumb@gmail.com, robherring2@gmail.com, javier@osg.samsung.com, Andy Yan <andy.yan@rock-chips.com>, Yakir Yang <ykk@rock-chips.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org

There are some IP limit on rk3288 that only support 4 physical lanes
of 2.7/1.6 Gbps/lane, so seprate them out by device_type flag.

Signed-off-by: Yakir Yang <ykk@rock-chips.com>
---
Changes in v6: None
Changes in v5: None
Changes in v4:
- Seprate the link-rate and lane-count limit out with the device_type
  flag. (Thierry)

Changes in v3: None
Changes in v2: None

 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 33 ++++++++++++++--------
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.h |  4 +--
 2 files changed, 23 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 9d802ef..2982dd0 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -890,8 +890,8 @@ static void analogix_dp_commit(struct analogix_dp_device *dp)
 		return;
 	}
 
-	ret = analogix_dp_set_link_train(dp, dp->video_info.lane_count,
-					 dp->video_info.link_rate);
+	ret = analogix_dp_set_link_train(dp, dp->video_info.max_lane_count,
+					 dp->video_info.max_link_rate);
 	if (ret) {
 		dev_err(dp->dev, "unable to do link train\n");
 		return;
@@ -1156,16 +1156,25 @@ static int analogix_dp_dt_parse_pdata(struct analogix_dp_device *dp)
 	struct device_node *dp_node = dp->dev->of_node;
 	struct video_info *video_info = &dp->video_info;
 
-	if (of_property_read_u32(dp_node, "samsung,link-rate",
-				 &video_info->link_rate)) {
-		dev_err(dp->dev, "failed to get link-rate\n");
-		return -EINVAL;
-	}
-
-	if (of_property_read_u32(dp_node, "samsung,lane-count",
-				 &video_info->lane_count)) {
-		dev_err(dp->dev, "failed to get lane-count\n");
-		return -EINVAL;
+	switch (dp->plat_data && dp->plat_data->dev_type) {
+	case RK3288_DP:
+		/*
+		 * Like Rk3288 DisplayPort TRM indicate that "Main link
+		 * containing 4 physical lanes of 2.7/1.62 Gbps/lane".
+		 */
+		video_info->max_link_rate = 0x0A;
+		video_info->max_lane_count = 0x04;
+		break;
+	case EXYNOS_DP:
+		/*
+		 * NOTE: those property parseing code is used for
+		 * providing backward compatibility for samsung platform.
+		 */
+		of_property_read_u32(dp_node, "samsung,link-rate",
+				     &video_info->max_link_rate);
+		of_property_read_u32(dp_node, "samsung,lane-count",
+				     &video_info->max_lane_count);
+		break;
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
index 730486d..f4cb799 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
@@ -129,8 +129,8 @@ struct video_info {
 	enum color_coefficient ycbcr_coeff;
 	enum color_depth color_depth;
 
-	enum link_rate_type link_rate;
-	enum link_lane_count_type lane_count;
+	enum link_rate_type max_link_rate;
+	enum link_lane_count_type max_lane_count;
 };
 
 struct link_train {
-- 
1.9.1
