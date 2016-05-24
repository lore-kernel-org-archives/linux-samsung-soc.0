From: Yakir Yang <ykk@rock-chips.com>
Subject: [PATCH v2 04/10] drm/bridge: analogix_dp: some rockchip chips need to flip REF_CLK bit setting
Date: Tue, 24 May 2016 13:02:23 +0800
Message-ID: <1464066143-22691-1-git-send-email-ykk@rock-chips.com>
References: <1464066086-21967-1-git-send-email-ykk@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1464066086-21967-1-git-send-email-ykk@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Airlie <airlied@linux.ie>, Inki Dae <inki.dae@samsung.com>, Mark Yao <yzq@rock-chips.com>, Thierry Reding <treding@nvidia.com>, Jingoo Han <jingoohan1@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Heiko Stuebner <heiko@sntech.de>, Douglas Anderson <dianders@chromium.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, Javier Martinez Canillas <javier@osg.samsung.com>, emil.l.velikov@gmail.com, Dan Carpenter <dan.carpenter@oracle.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, Yakir Yang <ykk@rock-chips.com>
List-Id: linux-samsung-soc@vger.kernel.org

As vendor document indicate, when REF_CLK bit set 0, then DP
phy's REF_CLK should switch to 24M source clock.

But due to IC PHY layout mistaken, some chips need to flip this
bit(like RK3288), and unfortunately they didn't indicate in the
DP version register. That's why we have to make this little hack.

Signed-off-by: Yakir Yang <ykk@rock-chips.com>
---
Changes in v2:
- new patch in v2

 drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c | 6 +++++-
 drivers/gpu/drm/bridge/analogix/analogix_dp_reg.h | 1 +
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c   | 3 +++
 include/drm/bridge/analogix_dp.h                  | 5 +++++
 4 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
index 931a76c..31366bf 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
@@ -75,7 +75,11 @@ void analogix_dp_init_analog_param(struct analogix_dp_device *dp)
 	writel(reg, dp->reg_base + ANALOGIX_DP_ANALOG_CTL_2);
 
 	if (dp->plat_data && (dp->plat_data->dev_type == ROCKCHIP_DP)) {
-		writel(REF_CLK_24M, dp->reg_base + ANALOGIX_DP_PLL_REG_1);
+		reg = REF_CLK_24M;
+		if (dp->plat_data->subdev_type == RK3288_DP)
+			reg = ~reg & REF_CLK_MASK;
+
+		writel(reg, dp->reg_base + ANALOGIX_DP_PLL_REG_1);
 		writel(0x95, dp->reg_base + ANALOGIX_DP_PLL_REG_2);
 		writel(0x40, dp->reg_base + ANALOGIX_DP_PLL_REG_3);
 		writel(0x58, dp->reg_base + ANALOGIX_DP_PLL_REG_4);
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.h b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.h
index 88d56ad..cdcc6c5 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.h
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.h
@@ -165,6 +165,7 @@
 /* ANALOGIX_DP_PLL_REG_1 */
 #define REF_CLK_24M				(0x1 << 0)
 #define REF_CLK_27M				(0x0 << 0)
+#define REF_CLK_MASK				(0x1 << 0)
 
 /* ANALOGIX_DP_LANE_MAP */
 #define LANE3_MAP_LOGIC_LANE_0			(0x0 << 6)
diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
index 260c43f..29c4105 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -41,6 +41,7 @@ struct rockchip_dp_chip_data {
 	u32	lcdsel_big;
 	u32	lcdsel_lit;
 	u32	lcdsel_mask;
+	u32	chip_type;
 };
 
 struct rockchip_dp_device {
@@ -281,6 +282,7 @@ static int rockchip_dp_bind(struct device *dev, struct device *master,
 	dp->plat_data.encoder = &dp->encoder;
 
 	dp->plat_data.dev_type = ROCKCHIP_DP;
+	dp->plat_data.subdev_type = dp_data->chip_type;
 	dp->plat_data.power_on = rockchip_dp_poweron;
 	dp->plat_data.power_off = rockchip_dp_powerdown;
 
@@ -380,6 +382,7 @@ static const struct rockchip_dp_chip_data rk3288_dp = {
 	.lcdsel_big = 0,
 	.lcdsel_lit = BIT(5),
 	.lcdsel_mask = BIT(21),
+	.chip_type = RK3288_DP,
 };
 
 static const struct of_device_id rockchip_dp_dt_ids[] = {
diff --git a/include/drm/bridge/analogix_dp.h b/include/drm/bridge/analogix_dp.h
index 9e5d013..06c0250 100644
--- a/include/drm/bridge/analogix_dp.h
+++ b/include/drm/bridge/analogix_dp.h
@@ -18,8 +18,13 @@ enum analogix_dp_devtype {
 	ROCKCHIP_DP,
 };
 
+enum analogix_dp_sub_devtype {
+	RK3288_DP,
+};
+
 struct analogix_dp_plat_data {
 	enum analogix_dp_devtype dev_type;
+	enum analogix_dp_sub_devtype subdev_type;
 	struct drm_panel *panel;
 	struct drm_encoder *encoder;
 	struct drm_connector *connector;
-- 
1.9.1
