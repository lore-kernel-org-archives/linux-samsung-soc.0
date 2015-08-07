From: Yakir Yang <ykk@rock-chips.com>
Subject: [PATCH v2 6/8] drm: bridge: analogix_dp: add some rk3288 special registers setting
Date: Fri,  7 Aug 2015 05:49:24 -0500
Message-ID: <1438944564-19010-1-git-send-email-ykk@rock-chips.com>
References: <1438943674-18191-1-git-send-email-ykk@rock-chips.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from regular1.263xmail.com ([211.150.99.135]:54038 "EHLO
	regular1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751437AbbHGKvk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 7 Aug 2015 06:51:40 -0400
In-Reply-To: <1438943674-18191-1-git-send-email-ykk@rock-chips.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>, Russell King <rmk+kernel@arm.linux.org.uk>, Fabio Estevam <fabio.estevam@freescale.com>, Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>
Cc: djkurtz@google.com, dianders@google.com, seanpaul@google.com, joe@perches.com, Takashi Iwai <tiwai@suse.de>, Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <treding@nvidia.com>, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, Ajay Kumar <ajaykumar.rs@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Vincent Palatin <vpalatin@chromium.org>, Mark Yao <mark.yao@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>, ajaynumb@gmail.com, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Yakir Yang <ykk@rock-c>

RK3288 need some special registers setting, we can separate
them out by the dev_type of plat_data.

Signed-off-by: Yakir Yang <ykk@rock-chips.com>
---
Changes in v2:
- Fix compile failed dut to phy_pd_addr variable misspell error

 drivers/gpu/drm/bridge/analogix_dp_reg.c | 76 ++++++++++++++++++++------------
 drivers/gpu/drm/bridge/analogix_dp_reg.h | 12 +++++
 2 files changed, 60 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix_dp_reg.c b/drivers/gpu/drm/bridge/analogix_dp_reg.c
index cc5cdbf..a0fc1fb 100644
--- a/drivers/gpu/drm/bridge/analogix_dp_reg.c
+++ b/drivers/gpu/drm/bridge/analogix_dp_reg.c
@@ -15,6 +15,8 @@
 #include <linux/delay.h>
 #include <linux/gpio.h>
 
+#include <drm/bridge/analogix_dp.h>
+
 #include "analogix_dp_core.h"
 #include "analogix_dp_reg.h"
 
@@ -72,6 +74,14 @@ void analogix_dp_init_analog_param(struct analogix_dp_device *dp)
 	reg = SEL_24M | TX_DVDD_BIT_1_0625V;
 	writel(reg, dp->reg_base + ANALOGIX_DP_ANALOG_CTL_2);
 
+	if (dp->plat_data && (dp->plat_data->dev_type == RK3288_DP)) {
+		writel(REF_CLK_24M, dp->reg_base + ANALOGIX_DP_PLL_REG_1);
+		writel(0x95, dp->reg_base + ANALOGIX_DP_PLL_REG_2);
+		writel(0x40, dp->reg_base + ANALOGIX_DP_PLL_REG_3);
+		writel(0x58, dp->reg_base + ANALOGIX_DP_PLL_REG_4);
+		writel(0x22, dp->reg_base + ANALOGIX_DP_PLL_REG_5);
+	}
+
 	reg = DRIVE_DVDD_BIT_1_0625V | VCO_BIT_600_MICRO;
 	writel(reg, dp->reg_base + ANALOGIX_DP_ANALOG_CTL_3);
 
@@ -206,81 +216,85 @@ void analogix_dp_set_analog_power_down(struct analogix_dp_device *dp,
 				       bool enable)
 {
 	u32 reg;
+	u32 phy_pd_addr = ANALOGIX_DP_PHY_PD;
+
+	if (dp->plat_data && (dp->plat_data->dev_type == RK3288_DP))
+		phy_pd_addr = ANALOGIX_DP_PD;
 
 	switch (block) {
 	case AUX_BLOCK:
 		if (enable) {
-			reg = readl(dp->reg_base + ANALOGIX_DP_PHY_PD);
+			reg = readl(dp->reg_base + phy_pd_addr);
 			reg |= AUX_PD;
-			writel(reg, dp->reg_base + ANALOGIX_DP_PHY_PD);
+			writel(reg, dp->reg_base + phy_pd_addr);
 		} else {
-			reg = readl(dp->reg_base + ANALOGIX_DP_PHY_PD);
+			reg = readl(dp->reg_base + phy_pd_addr);
 			reg &= ~AUX_PD;
-			writel(reg, dp->reg_base + ANALOGIX_DP_PHY_PD);
+			writel(reg, dp->reg_base + phy_pd_addr);
 		}
 		break;
 	case CH0_BLOCK:
 		if (enable) {
-			reg = readl(dp->reg_base + ANALOGIX_DP_PHY_PD);
+			reg = readl(dp->reg_base + phy_pd_addr);
 			reg |= CH0_PD;
-			writel(reg, dp->reg_base + ANALOGIX_DP_PHY_PD);
+			writel(reg, dp->reg_base + phy_pd_addr);
 		} else {
-			reg = readl(dp->reg_base + ANALOGIX_DP_PHY_PD);
+			reg = readl(dp->reg_base + phy_pd_addr);
 			reg &= ~CH0_PD;
-			writel(reg, dp->reg_base + ANALOGIX_DP_PHY_PD);
+			writel(reg, dp->reg_base + phy_pd_addr);
 		}
 		break;
 	case CH1_BLOCK:
 		if (enable) {
-			reg = readl(dp->reg_base + ANALOGIX_DP_PHY_PD);
+			reg = readl(dp->reg_base + phy_pd_addr);
 			reg |= CH1_PD;
-			writel(reg, dp->reg_base + ANALOGIX_DP_PHY_PD);
+			writel(reg, dp->reg_base + phy_pd_addr);
 		} else {
-			reg = readl(dp->reg_base + ANALOGIX_DP_PHY_PD);
+			reg = readl(dp->reg_base + phy_pd_addr);
 			reg &= ~CH1_PD;
-			writel(reg, dp->reg_base + ANALOGIX_DP_PHY_PD);
+			writel(reg, dp->reg_base + phy_pd_addr);
 		}
 		break;
 	case CH2_BLOCK:
 		if (enable) {
-			reg = readl(dp->reg_base + ANALOGIX_DP_PHY_PD);
+			reg = readl(dp->reg_base + phy_pd_addr);
 			reg |= CH2_PD;
-			writel(reg, dp->reg_base + ANALOGIX_DP_PHY_PD);
+			writel(reg, dp->reg_base + phy_pd_addr);
 		} else {
-			reg = readl(dp->reg_base + ANALOGIX_DP_PHY_PD);
+			reg = readl(dp->reg_base + phy_pd_addr);
 			reg &= ~CH2_PD;
-			writel(reg, dp->reg_base + ANALOGIX_DP_PHY_PD);
+			writel(reg, dp->reg_base + phy_pd_addr);
 		}
 		break;
 	case CH3_BLOCK:
 		if (enable) {
-			reg = readl(dp->reg_base + ANALOGIX_DP_PHY_PD);
+			reg = readl(dp->reg_base + phy_pd_addr);
 			reg |= CH3_PD;
-			writel(reg, dp->reg_base + ANALOGIX_DP_PHY_PD);
+			writel(reg, dp->reg_base + phy_pd_addr);
 		} else {
-			reg = readl(dp->reg_base + ANALOGIX_DP_PHY_PD);
+			reg = readl(dp->reg_base + phy_pd_addr);
 			reg &= ~CH3_PD;
-			writel(reg, dp->reg_base + ANALOGIX_DP_PHY_PD);
+			writel(reg, dp->reg_base + phy_pd_addr);
 		}
 		break;
 	case ANALOG_TOTAL:
 		if (enable) {
-			reg = readl(dp->reg_base + ANALOGIX_DP_PHY_PD);
+			reg = readl(dp->reg_base + phy_pd_addr);
 			reg |= DP_PHY_PD;
-			writel(reg, dp->reg_base + ANALOGIX_DP_PHY_PD);
+			writel(reg, dp->reg_base + phy_pd_addr);
 		} else {
-			reg = readl(dp->reg_base + ANALOGIX_DP_PHY_PD);
+			reg = readl(dp->reg_base + phy_pd_addr);
 			reg &= ~DP_PHY_PD;
-			writel(reg, dp->reg_base + ANALOGIX_DP_PHY_PD);
+			writel(reg, dp->reg_base + phy_pd_addr);
 		}
 		break;
 	case POWER_ALL:
 		if (enable) {
 			reg = DP_PHY_PD | AUX_PD | CH3_PD | CH2_PD |
 				CH1_PD | CH0_PD;
-			writel(reg, dp->reg_base + ANALOGIX_DP_PHY_PD);
+			writel(reg, dp->reg_base + phy_pd_addr);
 		} else {
-			writel(0x00, dp->reg_base + ANALOGIX_DP_PHY_PD);
+			writel(0x00, dp->reg_base + phy_pd_addr);
 		}
 		break;
 	default:
@@ -399,8 +413,14 @@ void analogix_dp_init_aux(struct analogix_dp_device *dp)
 	analogix_dp_reset_aux(dp);
 
 	/* Disable AUX transaction H/W retry */
-	reg = AUX_BIT_PERIOD_EXPECTED_DELAY(3) | AUX_HW_RETRY_COUNT_SEL(0) |
-	      AUX_HW_RETRY_INTERVAL_600_MICROSECONDS;
+	if (dp->plat_data && (dp->plat_data->dev_type == RK3288_DP))
+		reg = AUX_BIT_PERIOD_EXPECTED_DELAY(0) |
+		      AUX_HW_RETRY_COUNT_SEL(3) |
+		      AUX_HW_RETRY_INTERVAL_600_MICROSECONDS;
+	else
+		reg = AUX_BIT_PERIOD_EXPECTED_DELAY(3) |
+		      AUX_HW_RETRY_COUNT_SEL(0) |
+		      AUX_HW_RETRY_INTERVAL_600_MICROSECONDS;
 	writel(reg, dp->reg_base + ANALOGIX_DP_AUX_HW_RETRY_CTL);
 
 	/* Receive AUX Channel DEFER commands equal to DEFFER_COUNT*64 */
diff --git a/drivers/gpu/drm/bridge/analogix_dp_reg.h b/drivers/gpu/drm/bridge/analogix_dp_reg.h
index bed226f..e38af21 100644
--- a/drivers/gpu/drm/bridge/analogix_dp_reg.h
+++ b/drivers/gpu/drm/bridge/analogix_dp_reg.h
@@ -22,6 +22,14 @@
 #define ANALOGIX_DP_VIDEO_CTL_8			0x3C
 #define ANALOGIX_DP_VIDEO_CTL_10			0x44
 
+#define ANALOGIX_DP_PLL_REG_1			0xfc
+#define ANALOGIX_DP_PLL_REG_2			0x9e4
+#define ANALOGIX_DP_PLL_REG_3			0x9e8
+#define ANALOGIX_DP_PLL_REG_4			0x9ec
+#define ANALOGIX_DP_PLL_REG_5			0xa00
+
+#define ANALOGIX_DP_PD                          0x12c
+
 #define ANALOGIX_DP_LANE_MAP			0x35C
 
 #define ANALOGIX_DP_ANALOG_CTL_1			0x370
@@ -154,6 +162,10 @@
 #define VSYNC_POLARITY_CFG			(0x1 << 1)
 #define HSYNC_POLARITY_CFG			(0x1 << 0)
 
+/* ANALOGIX_DP_PLL_REG_1 */
+#define REF_CLK_24M				(0x1 << 1)
+#define REF_CLK_27M				(0x0 << 1)
+
 /* ANALOGIX_DP_LANE_MAP */
 #define LANE3_MAP_LOGIC_LANE_0			(0x0 << 6)
 #define LANE3_MAP_LOGIC_LANE_1			(0x1 << 6)
-- 
1.9.1
