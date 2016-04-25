From: Yakir Yang <ykk@rock-chips.com>
Subject: [PATCH v1 6/8] drm/bridge: analogix_dp: introduce connector mode_valid callback to plat driver
Date: Mon, 25 Apr 2016 19:36:29 +0800
Message-ID: <1461584189-6252-1-git-send-email-ykk@rock-chips.com>
References: <1461583748-5777-1-git-send-email-ykk@rock-chips.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lucky1.263xmail.com ([211.157.147.131]:40794 "EHLO
	lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754225AbcDYLii (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 25 Apr 2016 07:38:38 -0400
In-Reply-To: <1461583748-5777-1-git-send-email-ykk@rock-chips.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: David Airlie <airlied@linux.ie>, Thierry Reding <treding@nvidia.com>, Jingoo Han <jingoohan1@gmail.com>, Mark Yao <yzq@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>
Cc: Inki Dae <inki.dae@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, emil.l.velikov@gmail.com, Dan Carpenter <dan.carpenter@oracle.com>, Yakir Yang <ykk@rock-chips.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org

It's helpful to expand the mode_valid callback to platform driver,
so they could valid the display mode or information.

Signed-off-by: Yakir Yang <ykk@rock-chips.com>
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 15 +++++++++++++++
 include/drm/bridge/analogix_dp.h                   |  4 ++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 4a1b3b8..5af9ce4 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -943,6 +943,20 @@ int analogix_dp_get_modes(struct drm_connector *connector)
 	return num_modes;
 }
 
+static enum drm_mode_status
+analogix_dp_mode_valid(struct drm_connector *connector,
+		       struct drm_display_mode *mode)
+{
+	struct analogix_dp_device *dp = to_dp(connector);
+	enum drm_mode_status status = MODE_OK;
+
+	if (dp->plat_data->mode_valid)
+		status = dp->plat_data->mode_valid(dp->plat_data, connector,
+						   mode);
+
+	return status;
+}
+
 static struct drm_encoder *
 analogix_dp_best_encoder(struct drm_connector *connector)
 {
@@ -954,6 +968,7 @@ analogix_dp_best_encoder(struct drm_connector *connector)
 static const struct drm_connector_helper_funcs analogix_dp_connector_helper_funcs = {
 	.get_modes = analogix_dp_get_modes,
 	.best_encoder = analogix_dp_best_encoder,
+	.mode_valid = analogix_dp_mode_valid,
 };
 
 enum drm_connector_status
diff --git a/include/drm/bridge/analogix_dp.h b/include/drm/bridge/analogix_dp.h
index 9e5d013..f5348e6 100644
--- a/include/drm/bridge/analogix_dp.h
+++ b/include/drm/bridge/analogix_dp.h
@@ -29,6 +29,10 @@ struct analogix_dp_plat_data {
 	int (*attach)(struct analogix_dp_plat_data *, struct drm_bridge *,
 		      struct drm_connector *);
 	int (*get_modes)(struct analogix_dp_plat_data *);
+
+	enum drm_mode_status (*mode_valid)(struct analogix_dp_plat_data *,
+					   struct drm_connector *,
+					   struct drm_display_mode *);
 };
 
 int analogix_dp_resume(struct device *dev);
-- 
1.9.1
