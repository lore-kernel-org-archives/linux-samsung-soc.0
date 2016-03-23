From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 1/3] phy: exynos-mipi-video: Drop support for direct access to
 PMU
Date: Wed, 23 Mar 2016 12:09:16 +0100
Message-ID: <1458731358-773-2-git-send-email-m.szyprowski@samsung.com>
References: <1458731358-773-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:28393 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755023AbcCWLJe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 23 Mar 2016 07:09:34 -0400
In-reply-to: <1458731358-773-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Kishon Vijay Abraham I <kishon@ti.com>, Inki Dae <inki.dae@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

From: Sylwester Nawrocki <s.nawrocki@samsung.com>

There is no need to support access to the PMU through memory ioresource
as now access through PMU regmap should only be used.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/phy/phy-exynos-mipi-video.c | 57 +++++++++----------------------------
 1 file changed, 13 insertions(+), 44 deletions(-)

diff --git a/drivers/phy/phy-exynos-mipi-video.c b/drivers/phy/phy-exynos-mipi-video.c
index 2a54cab..d4f5d8e 100644
--- a/drivers/phy/phy-exynos-mipi-video.c
+++ b/drivers/phy/phy-exynos-mipi-video.c
@@ -22,9 +22,6 @@
 #include <linux/spinlock.h>
 #include <linux/mfd/syscon.h>
 
-/* MIPI_PHYn_CONTROL reg. offset (for base address from ioremap): n = 0..1 */
-#define EXYNOS_MIPI_PHY_CONTROL(n)	((n) * 4)
-
 enum exynos_mipi_phy_id {
 	EXYNOS_MIPI_PHY_ID_CSIS0,
 	EXYNOS_MIPI_PHY_ID_DSIM0,
@@ -50,7 +47,6 @@ static int __set_phy_state(struct exynos_mipi_video_phy *state,
 			enum exynos_mipi_phy_id id, unsigned int on)
 {
 	const unsigned int offset = EXYNOS4_MIPI_PHY_CONTROL(id / 2);
-	void __iomem *addr;
 	u32 val, reset;
 
 	if (is_mipi_dsim_phy_id(id))
@@ -60,35 +56,17 @@ static int __set_phy_state(struct exynos_mipi_video_phy *state,
 
 	spin_lock(&state->slock);
 
-	if (!IS_ERR(state->regmap)) {
-		regmap_read(state->regmap, offset, &val);
-		if (on)
-			val |= reset;
-		else
-			val &= ~reset;
-		regmap_write(state->regmap, offset, val);
-		if (on)
-			val |= EXYNOS4_MIPI_PHY_ENABLE;
-		else if (!(val & EXYNOS4_MIPI_PHY_RESET_MASK))
-			val &= ~EXYNOS4_MIPI_PHY_ENABLE;
-		regmap_write(state->regmap, offset, val);
-	} else {
-		addr = state->regs + EXYNOS_MIPI_PHY_CONTROL(id / 2);
-
-		val = readl(addr);
-		if (on)
-			val |= reset;
-		else
-			val &= ~reset;
-		writel(val, addr);
-		/* Clear ENABLE bit only if MRESETN, SRESETN bits are not set */
-		if (on)
-			val |= EXYNOS4_MIPI_PHY_ENABLE;
-		else if (!(val & EXYNOS4_MIPI_PHY_RESET_MASK))
-			val &= ~EXYNOS4_MIPI_PHY_ENABLE;
-
-		writel(val, addr);
-	}
+	regmap_read(state->regmap, offset, &val);
+	if (on)
+		val |= reset;
+	else
+		val &= ~reset;
+	regmap_write(state->regmap, offset, val);
+	if (on)
+		val |= EXYNOS4_MIPI_PHY_ENABLE;
+	else if (!(val & EXYNOS4_MIPI_PHY_RESET_MASK))
+		val &= ~EXYNOS4_MIPI_PHY_ENABLE;
+	regmap_write(state->regmap, offset, val);
 
 	spin_unlock(&state->slock);
 	return 0;
@@ -142,17 +120,8 @@ static int exynos_mipi_video_phy_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	state->regmap = syscon_regmap_lookup_by_phandle(dev->of_node, "syscon");
-	if (IS_ERR(state->regmap)) {
-		struct resource *res;
-
-		dev_info(dev, "regmap lookup failed: %ld\n",
-			 PTR_ERR(state->regmap));
-
-		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-		state->regs = devm_ioremap_resource(dev, res);
-		if (IS_ERR(state->regs))
-			return PTR_ERR(state->regs);
-	}
+	if (IS_ERR(state->regmap))
+		return PTR_ERR(state->regmap);
 
 	dev_set_drvdata(dev, state);
 	spin_lock_init(&state->slock);
-- 
1.9.2
