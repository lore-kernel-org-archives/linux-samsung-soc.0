From: Yakir Yang <ykk@rock-chips.com>
Subject: [PATCH v2 01/10] drm/bridge: analogix_dp: rename RK3288_DP to ROCKCHIP_DP
Date: Tue, 24 May 2016 13:02:11 +0800
Message-ID: <1464066131-22562-1-git-send-email-ykk@rock-chips.com>
References: <1464066086-21967-1-git-send-email-ykk@rock-chips.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lucky1.263xmail.com ([211.157.147.132]:46602 "EHLO
	lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751154AbcEXFCW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 May 2016 01:02:22 -0400
In-Reply-To: <1464066086-21967-1-git-send-email-ykk@rock-chips.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: David Airlie <airlied@linux.ie>, Inki Dae <inki.dae@samsung.com>, Mark Yao <yzq@rock-chips.com>, Thierry Reding <treding@nvidia.com>, Jingoo Han <jingoohan1@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Heiko Stuebner <heiko@sntech.de>, Douglas Anderson <dianders@chromium.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, Javier Martinez Canillas <javier@osg.samsung.com>, emil.l.velikov@gmail.com, Dan Carpenter <dan.carpenter@oracle.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, Yakir Yang <ykk@rock-chips.com>

Rename RK3288_DP marcos to ROCKCHIP_DP, prepare to add eDP
support for more Rockchip chips.

Signed-off-by: Yakir Yang <ykk@rock-chips.com>
---
Changes in v2: None

 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 4 ++--
 drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c  | 6 +++---
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    | 2 +-
 include/drm/bridge/analogix_dp.h                   | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 7699597..4a1b3b8 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1207,9 +1207,9 @@ static int analogix_dp_dt_parse_pdata(struct analogix_dp_device *dp)
 	struct video_info *video_info = &dp->video_info;
 
 	switch (dp->plat_data->dev_type) {
-	case RK3288_DP:
+	case ROCKCHIP_DP:
 		/*
-		 * Like Rk3288 DisplayPort TRM indicate that "Main link
+		 * Like Rockchip DisplayPort TRM indicate that "Main link
 		 * containing 4 physical lanes of 2.7/1.62 Gbps/lane".
 		 */
 		video_info->max_link_rate = 0x0A;
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
index 49205ef..931a76c 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
@@ -74,7 +74,7 @@ void analogix_dp_init_analog_param(struct analogix_dp_device *dp)
 	reg = SEL_24M | TX_DVDD_BIT_1_0625V;
 	writel(reg, dp->reg_base + ANALOGIX_DP_ANALOG_CTL_2);
 
-	if (dp->plat_data && (dp->plat_data->dev_type == RK3288_DP)) {
+	if (dp->plat_data && (dp->plat_data->dev_type == ROCKCHIP_DP)) {
 		writel(REF_CLK_24M, dp->reg_base + ANALOGIX_DP_PLL_REG_1);
 		writel(0x95, dp->reg_base + ANALOGIX_DP_PLL_REG_2);
 		writel(0x40, dp->reg_base + ANALOGIX_DP_PLL_REG_3);
@@ -244,7 +244,7 @@ void analogix_dp_set_analog_power_down(struct analogix_dp_device *dp,
 	u32 reg;
 	u32 phy_pd_addr = ANALOGIX_DP_PHY_PD;
 
-	if (dp->plat_data && (dp->plat_data->dev_type == RK3288_DP))
+	if (dp->plat_data && (dp->plat_data->dev_type == ROCKCHIP_DP))
 		phy_pd_addr = ANALOGIX_DP_PD;
 
 	switch (block) {
@@ -448,7 +448,7 @@ void analogix_dp_init_aux(struct analogix_dp_device *dp)
 	analogix_dp_reset_aux(dp);
 
 	/* Disable AUX transaction H/W retry */
-	if (dp->plat_data && (dp->plat_data->dev_type == RK3288_DP))
+	if (dp->plat_data && (dp->plat_data->dev_type == ROCKCHIP_DP))
 		reg = AUX_BIT_PERIOD_EXPECTED_DELAY(0) |
 		      AUX_HW_RETRY_COUNT_SEL(3) |
 		      AUX_HW_RETRY_INTERVAL_600_MICROSECONDS;
diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
index 7f6a55c..2bc8a7e 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -270,7 +270,7 @@ static int rockchip_dp_bind(struct device *dev, struct device *master,
 
 	dp->plat_data.encoder = &dp->encoder;
 
-	dp->plat_data.dev_type = RK3288_DP;
+	dp->plat_data.dev_type = ROCKCHIP_DP;
 	dp->plat_data.power_on = rockchip_dp_poweron;
 	dp->plat_data.power_off = rockchip_dp_powerdown;
 
diff --git a/include/drm/bridge/analogix_dp.h b/include/drm/bridge/analogix_dp.h
index 25afb31..9e5d013 100644
--- a/include/drm/bridge/analogix_dp.h
+++ b/include/drm/bridge/analogix_dp.h
@@ -15,7 +15,7 @@
 
 enum analogix_dp_devtype {
 	EXYNOS_DP,
-	RK3288_DP,
+	ROCKCHIP_DP,
 };
 
 struct analogix_dp_plat_data {
-- 
1.9.1
