From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH RESEND] phy: exynos-mipi-video: simplify check for coupled phy
 status
Date: Mon, 07 Nov 2016 11:48:32 +0100
Message-ID: <1478515712-650-1-git-send-email-m.szyprowski@samsung.com>
References: <CGME20161107104844eucas1p2b5571119dff76e33d6ec038c359224f7@eucas1p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:11843 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751012AbcKGKst (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 7 Nov 2016 05:48:49 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Kishon Vijay Abraham I <kishon@ti.com>, Krzysztof Kozlowski <krzk@kernel.org>

There is no need to access regmap of coupled phy to check its state - such
information is already in the phy device itself, so use it directly. This
let us to avoid possible access to registers of the device in the disabled
power domain if the coupled phy is already disabled.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 drivers/phy/phy-exynos-mipi-video.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/phy/phy-exynos-mipi-video.c b/drivers/phy/phy-exynos-mipi-video.c
index 8b851f7..6bee04c 100644
--- a/drivers/phy/phy-exynos-mipi-video.c
+++ b/drivers/phy/phy-exynos-mipi-video.c
@@ -229,19 +229,6 @@ struct exynos_mipi_video_phy {
 	spinlock_t slock;
 };
 
-static inline int __is_running(const struct exynos_mipi_phy_desc *data,
-			struct exynos_mipi_video_phy *state)
-{
-	u32 val;
-	int ret;
-
-	ret = regmap_read(state->regmaps[data->resetn_map], data->resetn_reg, &val);
-	if (ret)
-		return 0;
-
-	return val & data->resetn_val;
-}
-
 static int __set_phy_state(const struct exynos_mipi_phy_desc *data,
 			   struct exynos_mipi_video_phy *state, unsigned int on)
 {
@@ -251,7 +238,7 @@ static int __set_phy_state(const struct exynos_mipi_phy_desc *data,
 
 	/* disable in PMU sysreg */
 	if (!on && data->coupled_phy_id >= 0 &&
-	    !__is_running(state->phys[data->coupled_phy_id].data, state)) {
+	    state->phys[data->coupled_phy_id].phy->power_count == 0) {
 		regmap_read(state->regmaps[data->enable_map], data->enable_reg,
 			    &val);
 		val &= ~data->enable_val;
-- 
1.9.1
