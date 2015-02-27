From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH RFT] phy: exynos-mipi-video: Use spin_lock to protct
 state->regmap rmw operations
Date: Fri, 27 Feb 2015 11:50:57 +0800
Message-ID: <1425009057.12126.1.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f47.google.com ([209.85.220.47]:33650 "EHLO
	mail-pa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753279AbbB0DvE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 26 Feb 2015 22:51:04 -0500
Received: by pabli10 with SMTP id li10so3308318pab.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Feb 2015 19:51:03 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, Kyungmin Park <kyungmin.park@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

The state->regmap is initialized by devm_regmap_init_mmio().
So it's fine to use spin_lock rather than mutex to protct state->regmap rmw
operations.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
Hi Sylwester,
I don't have this hardware handy, so can you test if this patch works.
This patch is on top of my previous patch (phy: exynos-mipi-video: Fixup the test for state->regmap)
Thanks,
Axel
 drivers/phy/phy-exynos-mipi-video.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/phy-exynos-mipi-video.c b/drivers/phy/phy-exynos-mipi-video.c
index d196493..8d6d117 100644
--- a/drivers/phy/phy-exynos-mipi-video.c
+++ b/drivers/phy/phy-exynos-mipi-video.c
@@ -43,7 +43,6 @@ struct exynos_mipi_video_phy {
 	} phys[EXYNOS_MIPI_PHYS_NUM];
 	spinlock_t slock;
 	void __iomem *regs;
-	struct mutex mutex;
 	struct regmap *regmap;
 };
 
@@ -59,8 +58,9 @@ static int __set_phy_state(struct exynos_mipi_video_phy *state,
 	else
 		reset = EXYNOS4_MIPI_PHY_SRESETN;
 
+	spin_lock(&state->slock);
+
 	if (!IS_ERR(state->regmap)) {
-		mutex_lock(&state->mutex);
 		regmap_read(state->regmap, offset, &val);
 		if (on)
 			val |= reset;
@@ -72,7 +72,6 @@ static int __set_phy_state(struct exynos_mipi_video_phy *state,
 		else if (!(val & EXYNOS4_MIPI_PHY_RESET_MASK))
 			val &= ~EXYNOS4_MIPI_PHY_ENABLE;
 		regmap_write(state->regmap, offset, val);
-		mutex_unlock(&state->mutex);
 	} else {
 		addr = state->regs + EXYNOS_MIPI_PHY_CONTROL(id / 2);
 
@@ -90,9 +89,9 @@ static int __set_phy_state(struct exynos_mipi_video_phy *state,
 			val &= ~EXYNOS4_MIPI_PHY_ENABLE;
 
 		writel(val, addr);
-		spin_unlock(&state->slock);
 	}
 
+	spin_unlock(&state->slock);
 	return 0;
 }
 
@@ -158,7 +157,6 @@ static int exynos_mipi_video_phy_probe(struct platform_device *pdev)
 
 	dev_set_drvdata(dev, state);
 	spin_lock_init(&state->slock);
-	mutex_init(&state->mutex);
 
 	for (i = 0; i < EXYNOS_MIPI_PHYS_NUM; i++) {
 		struct phy *phy = devm_phy_create(dev, NULL,
-- 
1.9.1
