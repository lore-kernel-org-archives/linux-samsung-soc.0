From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH] phy: exynos-dp-video: Kill exynos_dp_video_phy_pwr_isol
 function
Date: Fri, 27 Feb 2015 12:34:10 +0800
Message-ID: <1425011650.23256.1.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Jingoo Han <jg1.han@samsung.com>, linux-kernel@vger.kernel.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

If IS_ERR(state->regs) the .probe fails.
So IS_ERR(state->regs) test in exynos_dp_video_phy_pwr_isol() is not necessary.
exynos_dp_video_phy_pwr_isol() simply does a regmap_update_bits() call now,
just call regmap_update_bits() instead and return proper return value.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/phy/phy-exynos-dp-video.c | 24 ++++--------------------
 1 file changed, 4 insertions(+), 20 deletions(-)

diff --git a/drivers/phy/phy-exynos-dp-video.c b/drivers/phy/phy-exynos-dp-video.c
index f86cbe6..179cbf9 100644
--- a/drivers/phy/phy-exynos-dp-video.c
+++ b/drivers/phy/phy-exynos-dp-video.c
@@ -30,28 +30,13 @@ struct exynos_dp_video_phy {
 	const struct exynos_dp_video_phy_drvdata *drvdata;
 };
 
-static void exynos_dp_video_phy_pwr_isol(struct exynos_dp_video_phy *state,
-							unsigned int on)
-{
-	unsigned int val;
-
-	if (IS_ERR(state->regs))
-		return;
-
-	val = on ? 0 : EXYNOS5_PHY_ENABLE;
-
-	regmap_update_bits(state->regs, state->drvdata->phy_ctrl_offset,
-			   EXYNOS5_PHY_ENABLE, val);
-}
-
 static int exynos_dp_video_phy_power_on(struct phy *phy)
 {
 	struct exynos_dp_video_phy *state = phy_get_drvdata(phy);
 
 	/* Disable power isolation on DP-PHY */
-	exynos_dp_video_phy_pwr_isol(state, 0);
-
-	return 0;
+	return regmap_update_bits(state->regs, state->drvdata->phy_ctrl_offset,
+				  EXYNOS5_PHY_ENABLE, EXYNOS5_PHY_ENABLE);
 }
 
 static int exynos_dp_video_phy_power_off(struct phy *phy)
@@ -59,9 +44,8 @@ static int exynos_dp_video_phy_power_off(struct phy *phy)
 	struct exynos_dp_video_phy *state = phy_get_drvdata(phy);
 
 	/* Enable power isolation on DP-PHY */
-	exynos_dp_video_phy_pwr_isol(state, 1);
-
-	return 0;
+	return regmap_update_bits(state->regs, state->drvdata->phy_ctrl_offset,
+				  EXYNOS5_PHY_ENABLE, 0);
 }
 
 static struct phy_ops exynos_dp_video_phy_ops = {
-- 
1.9.1
