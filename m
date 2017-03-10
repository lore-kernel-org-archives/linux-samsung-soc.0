From: Sean Paul <seanpaul@chromium.org>
Subject: [PATCH 39/41] drm/bridge: analogix_dp: Split the platform-specific poweron in two parts
Date: Thu,  9 Mar 2017 23:32:54 -0500
Message-ID: <20170310043305.17216-40-seanpaul@chromium.org>
References: <20170310043305.17216-1-seanpaul@chromium.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qk0-f182.google.com ([209.85.220.182]:36603 "EHLO
        mail-qk0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753120AbdCJEm7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 9 Mar 2017 23:42:59 -0500
Received: by mail-qk0-f182.google.com with SMTP id 1so151656923qkl.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 09 Mar 2017 20:42:58 -0800 (PST)
In-Reply-To: <20170310043305.17216-1-seanpaul@chromium.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Cc: Douglas Anderson <dianders@chromium.org>, "Kristian H . Kristensen" <hoegsberg@chromium.org>, Sean Paul <seanpaul@chromium.org>, Archit Taneja <architt@codeaurora.org>, David Airlie <airlied@linux.ie>, Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Mark Yao <mark.yao@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>, Yakir Yang <ykk@rock-chips.com>, zain wang <wzz@rock-chips.com>, Lin Huang <hl@rock-chips.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Tomasz Figa <tfiga@chromium>

From: Douglas Anderson <dianders@chromium.org>

Some of the platform-specific stuff in rockchip_dp_poweron() needs to
happen before the generic code.  Some needs to happen after.  Let's
split the callback in two.

Specifically we can't start doing PSR work until _after_ the whole
controller is up, so don't set the enable until the end.

Cc: Kristian H. Kristensen <hoegsberg@chromium.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
[seanpaul added exynos change]
Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |  7 +++++--
 drivers/gpu/drm/exynos/exynos_dp.c                 |  2 +-
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    | 12 ++++++++++--
 include/drm/bridge/analogix_dp.h                   |  3 ++-
 4 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index a05bc0271188..bc9a0a28ab1d 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1254,8 +1254,8 @@ static int analogix_dp_set_bridge(struct analogix_dp_device *dp)
 		goto out_dp_clk_pre;
 	}
 
-	if (dp->plat_data->power_on)
-		dp->plat_data->power_on(dp->plat_data);
+	if (dp->plat_data->power_on_start)
+		dp->plat_data->power_on_start(dp->plat_data);
 
 	phy_power_on(dp->phy);
 
@@ -1278,6 +1278,9 @@ static int analogix_dp_set_bridge(struct analogix_dp_device *dp)
 		goto out_dp_init;
 	}
 
+	if (dp->plat_data->power_on_end)
+		dp->plat_data->power_on_end(dp->plat_data);
+
 	enable_irq(dp->irq);
 	return 0;
 
diff --git a/drivers/gpu/drm/exynos/exynos_dp.c b/drivers/gpu/drm/exynos/exynos_dp.c
index 1ef0be338b85..6b79c3b3802f 100644
--- a/drivers/gpu/drm/exynos/exynos_dp.c
+++ b/drivers/gpu/drm/exynos/exynos_dp.c
@@ -168,7 +168,7 @@ static int exynos_dp_bind(struct device *dev, struct device *master, void *data)
 	dp->drm_dev = drm_dev;
 
 	dp->plat_data.dev_type = EXYNOS_DP;
-	dp->plat_data.power_on = exynos_dp_poweron;
+	dp->plat_data.power_on_start = exynos_dp_poweron;
 	dp->plat_data.power_off = exynos_dp_poweroff;
 	dp->plat_data.attach = exynos_dp_bridge_attach;
 	dp->plat_data.get_modes = exynos_dp_get_modes;
diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
index 14f68e792e6f..07dd09e1e32f 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -127,7 +127,7 @@ static int rockchip_dp_pre_init(struct rockchip_dp_device *dp)
 	return 0;
 }
 
-static int rockchip_dp_poweron(struct analogix_dp_plat_data *plat_data)
+static int rockchip_dp_poweron_start(struct analogix_dp_plat_data *plat_data)
 {
 	struct rockchip_dp_device *dp = to_dp(plat_data);
 	int ret;
@@ -145,6 +145,13 @@ static int rockchip_dp_poweron(struct analogix_dp_plat_data *plat_data)
 		return ret;
 	}
 
+	return ret;
+}
+
+static int rockchip_dp_poweron_end(struct analogix_dp_plat_data *plat_data)
+{
+	struct rockchip_dp_device *dp = to_dp(plat_data);
+
 	return rockchip_drm_psr_activate(&dp->encoder);
 }
 
@@ -399,7 +406,8 @@ static int rockchip_dp_bind(struct device *dev, struct device *master,
 	dp->plat_data.encoder = &dp->encoder;
 
 	dp->plat_data.dev_type = dp->data->chip_type;
-	dp->plat_data.power_on = rockchip_dp_poweron;
+	dp->plat_data.power_on_start = rockchip_dp_poweron_start;
+	dp->plat_data.power_on_end = rockchip_dp_poweron_end;
 	dp->plat_data.power_off = rockchip_dp_powerdown;
 	dp->plat_data.get_modes = rockchip_dp_get_modes;
 	dp->plat_data.cleanup = rockchip_dp_cleanup;
diff --git a/include/drm/bridge/analogix_dp.h b/include/drm/bridge/analogix_dp.h
index c079ca1ffc76..1049ee56ae76 100644
--- a/include/drm/bridge/analogix_dp.h
+++ b/include/drm/bridge/analogix_dp.h
@@ -30,7 +30,8 @@ struct analogix_dp_plat_data {
 	struct drm_encoder *encoder;
 	struct drm_connector *connector;
 
-	int (*power_on)(struct analogix_dp_plat_data *);
+	int (*power_on_start)(struct analogix_dp_plat_data *);
+	int (*power_on_end)(struct analogix_dp_plat_data *);
 	int (*power_off)(struct analogix_dp_plat_data *);
 	int (*attach)(struct analogix_dp_plat_data *, struct drm_bridge *,
 		      struct drm_connector *);
-- 
2.12.0.246.ga2ecc84866-goog
