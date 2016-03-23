From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 2/3] phy: exynos-mipi-video: Rewrite handling of phy registers
Date: Wed, 23 Mar 2016 12:09:17 +0100
Message-ID: <1458731358-773-3-git-send-email-m.szyprowski@samsung.com>
References: <1458731358-773-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1458731358-773-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Kishon Vijay Abraham I <kishon@ti.com>, Inki Dae <inki.dae@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Controlling Exynos MIPI DPHY is done by handling 2 registers: one for
phy reset and one for enabling it. This patch moves definitions of those
2 registers to speparate exynos_mipi_phy_desc structure, which can be
defined separately for each PHY for each supported hardware variant.
This code rewrite is needed to add support for newer Exynos SoCs, which
have MIPI PHY related registers at different offsets or even different
register regions.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/phy/phy-exynos-mipi-video.c | 166 ++++++++++++++++++++++++++++--------
 1 file changed, 131 insertions(+), 35 deletions(-)

diff --git a/drivers/phy/phy-exynos-mipi-video.c b/drivers/phy/phy-exynos-mipi-video.c
index d4f5d8e..7ba0936 100644
--- a/drivers/phy/phy-exynos-mipi-video.c
+++ b/drivers/phy/phy-exynos-mipi-video.c
@@ -16,13 +16,14 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/of_device.h>
 #include <linux/phy/phy.h>
-#include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/spinlock.h>
 #include <linux/mfd/syscon.h>
 
 enum exynos_mipi_phy_id {
+	EXYNOS_MIPI_PHY_ID_NONE = -1,
 	EXYNOS_MIPI_PHY_ID_CSIS0,
 	EXYNOS_MIPI_PHY_ID_DSIM0,
 	EXYNOS_MIPI_PHY_ID_CSIS1,
@@ -30,57 +31,138 @@ enum exynos_mipi_phy_id {
 	EXYNOS_MIPI_PHYS_NUM
 };
 
-#define is_mipi_dsim_phy_id(id) \
-	((id) == EXYNOS_MIPI_PHY_ID_DSIM0 || (id) == EXYNOS_MIPI_PHY_ID_DSIM1)
+enum exynos_mipi_phy_regmap_id {
+	EXYNOS_MIPI_REGMAP_PMU,
+	EXYNOS_MIPI_REGMAPS_NUM
+};
+
+struct mipi_phy_device_desc
+{
+	int num_phys;
+	int num_regmaps;
+	const char *regmap_names[EXYNOS_MIPI_REGMAPS_NUM];
+	struct exynos_mipi_phy_desc {
+		enum exynos_mipi_phy_id	coupled_phy_id;
+		u32 enable_val;
+		unsigned int enable_reg;
+		enum exynos_mipi_phy_regmap_id enable_map;
+		u32 resetn_val;
+		unsigned int resetn_reg;
+		enum exynos_mipi_phy_regmap_id resetn_map;
+	} phys[EXYNOS_MIPI_PHYS_NUM];
+};
+
+static const struct mipi_phy_device_desc s5pv210_mipi_phy = {
+	.num_regmaps = 1,
+	.regmap_names = {"syscon"},
+	.num_phys = 4,
+	.phys = {
+		{
+			/* EXYNOS_MIPI_PHY_ID_CSIS0 */
+			.coupled_phy_id = EXYNOS_MIPI_PHY_ID_DSIM0,
+			.enable_val = EXYNOS4_MIPI_PHY_ENABLE,
+			.enable_reg = EXYNOS4_MIPI_PHY_CONTROL(0),
+			.enable_map = EXYNOS_MIPI_REGMAP_PMU,
+			.resetn_val = EXYNOS4_MIPI_PHY_SRESETN,
+			.resetn_reg = EXYNOS4_MIPI_PHY_CONTROL(0),
+			.resetn_map = EXYNOS_MIPI_REGMAP_PMU,
+		}, {
+			/* EXYNOS_MIPI_PHY_ID_DSIM0 */
+			.coupled_phy_id = EXYNOS_MIPI_PHY_ID_CSIS0,
+			.enable_val = EXYNOS4_MIPI_PHY_ENABLE,
+			.enable_reg = EXYNOS4_MIPI_PHY_CONTROL(0),
+			.enable_map = EXYNOS_MIPI_REGMAP_PMU,
+			.resetn_val = EXYNOS4_MIPI_PHY_MRESETN,
+			.resetn_reg = EXYNOS4_MIPI_PHY_CONTROL(0),
+			.resetn_map = EXYNOS_MIPI_REGMAP_PMU,
+		}, {
+			/* EXYNOS_MIPI_PHY_ID_CSIS1 */
+			.coupled_phy_id = EXYNOS_MIPI_PHY_ID_DSIM1,
+			.enable_val = EXYNOS4_MIPI_PHY_ENABLE,
+			.enable_reg = EXYNOS4_MIPI_PHY_CONTROL(1),
+			.enable_map = EXYNOS_MIPI_REGMAP_PMU,
+			.resetn_val = EXYNOS4_MIPI_PHY_SRESETN,
+			.resetn_reg = EXYNOS4_MIPI_PHY_CONTROL(1),
+			.resetn_map = EXYNOS_MIPI_REGMAP_PMU,
+		}, {
+			/* EXYNOS_MIPI_PHY_ID_DSIM1 */
+			.coupled_phy_id = EXYNOS_MIPI_PHY_ID_CSIS1,
+			.enable_val = EXYNOS4_MIPI_PHY_ENABLE,
+			.enable_reg = EXYNOS4_MIPI_PHY_CONTROL(1),
+			.enable_map = EXYNOS_MIPI_REGMAP_PMU,
+			.resetn_val = EXYNOS4_MIPI_PHY_MRESETN,
+			.resetn_reg = EXYNOS4_MIPI_PHY_CONTROL(1),
+			.resetn_map = EXYNOS_MIPI_REGMAP_PMU,
+		},
+	},
+};
+
 
 struct exynos_mipi_video_phy {
+	struct regmap *regmaps[EXYNOS_MIPI_REGMAPS_NUM];
+	int num_phys;
 	struct video_phy_desc {
 		struct phy *phy;
 		unsigned int index;
+		const struct exynos_mipi_phy_desc *data;
 	} phys[EXYNOS_MIPI_PHYS_NUM];
 	spinlock_t slock;
-	void __iomem *regs;
-	struct regmap *regmap;
 };
 
-static int __set_phy_state(struct exynos_mipi_video_phy *state,
-			enum exynos_mipi_phy_id id, unsigned int on)
+static inline int __is_running(const struct exynos_mipi_phy_desc *data,
+			struct exynos_mipi_video_phy *state)
 {
-	const unsigned int offset = EXYNOS4_MIPI_PHY_CONTROL(id / 2);
-	u32 val, reset;
+	u32 val;
+
+	regmap_read(state->regmaps[data->resetn_map], data->resetn_reg, &val);
+	return val & data->resetn_val;
+}
 
-	if (is_mipi_dsim_phy_id(id))
-		reset = EXYNOS4_MIPI_PHY_MRESETN;
-	else
-		reset = EXYNOS4_MIPI_PHY_SRESETN;
+static int __set_phy_state(const struct exynos_mipi_phy_desc *data,
+			   struct exynos_mipi_video_phy *state, unsigned int on)
+{
+	u32 val;
 
 	spin_lock(&state->slock);
 
-	regmap_read(state->regmap, offset, &val);
-	if (on)
-		val |= reset;
-	else
-		val &= ~reset;
-	regmap_write(state->regmap, offset, val);
-	if (on)
-		val |= EXYNOS4_MIPI_PHY_ENABLE;
-	else if (!(val & EXYNOS4_MIPI_PHY_RESET_MASK))
-		val &= ~EXYNOS4_MIPI_PHY_ENABLE;
-	regmap_write(state->regmap, offset, val);
+	/* disable in PMU sysreg */
+	if (!on && data->coupled_phy_id >= 0 &&
+	    !__is_running(state->phys[data->coupled_phy_id].data, state)) {
+		regmap_read(state->regmaps[data->enable_map], data->enable_reg,
+			    &val);
+		val &= ~data->enable_val;
+		regmap_write(state->regmaps[data->enable_map], data->enable_reg,
+			     val);
+	}
+
+	/* PHY reset */
+	regmap_read(state->regmaps[data->resetn_map], data->resetn_reg, &val);
+	val = on ? (val | data->resetn_val) : (val & ~data->resetn_val);
+	regmap_write(state->regmaps[data->resetn_map], data->resetn_reg, val);
+
+	/* enable in PMU sysreg */
+	if (on) {
+		regmap_read(state->regmaps[data->enable_map], data->enable_reg,
+			    &val);
+		val |= data->enable_val;
+		regmap_write(state->regmaps[data->enable_map], data->enable_reg,
+			     val);
+	}
 
 	spin_unlock(&state->slock);
+
 	return 0;
 }
 
 #define to_mipi_video_phy(desc) \
-	container_of((desc), struct exynos_mipi_video_phy, phys[(desc)->index]);
+	container_of((desc), struct exynos_mipi_video_phy, phys[(desc)->index])
 
 static int exynos_mipi_video_phy_power_on(struct phy *phy)
 {
 	struct video_phy_desc *phy_desc = phy_get_drvdata(phy);
 	struct exynos_mipi_video_phy *state = to_mipi_video_phy(phy_desc);
 
-	return __set_phy_state(state, phy_desc->index, 1);
+	return __set_phy_state(phy_desc->data, state, 1);
 }
 
 static int exynos_mipi_video_phy_power_off(struct phy *phy)
@@ -88,7 +170,7 @@ static int exynos_mipi_video_phy_power_off(struct phy *phy)
 	struct video_phy_desc *phy_desc = phy_get_drvdata(phy);
 	struct exynos_mipi_video_phy *state = to_mipi_video_phy(phy_desc);
 
-	return __set_phy_state(state, phy_desc->index, 0);
+	return __set_phy_state(phy_desc->data, state, 0);
 }
 
 static struct phy *exynos_mipi_video_phy_xlate(struct device *dev,
@@ -96,7 +178,7 @@ static struct phy *exynos_mipi_video_phy_xlate(struct device *dev,
 {
 	struct exynos_mipi_video_phy *state = dev_get_drvdata(dev);
 
-	if (WARN_ON(args->args[0] >= EXYNOS_MIPI_PHYS_NUM))
+	if (WARN_ON(args->args[0] >= state->num_phys))
 		return ERR_PTR(-ENODEV);
 
 	return state->phys[args->args[0]].phy;
@@ -110,23 +192,33 @@ static const struct phy_ops exynos_mipi_video_phy_ops = {
 
 static int exynos_mipi_video_phy_probe(struct platform_device *pdev)
 {
+	const struct mipi_phy_device_desc *phy_dev;
 	struct exynos_mipi_video_phy *state;
 	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
 	struct phy_provider *phy_provider;
 	unsigned int i;
 
+	phy_dev = of_device_get_match_data(dev);
+	if (!phy_dev)
+		return -ENODEV;
+
 	state = devm_kzalloc(dev, sizeof(*state), GFP_KERNEL);
 	if (!state)
 		return -ENOMEM;
 
-	state->regmap = syscon_regmap_lookup_by_phandle(dev->of_node, "syscon");
-	if (IS_ERR(state->regmap))
-		return PTR_ERR(state->regmap);
+	for (i = 0; i < phy_dev->num_regmaps; i++) {
+		state->regmaps[i] = syscon_regmap_lookup_by_phandle(np,
+						phy_dev->regmap_names[i]);
+		if (IS_ERR(state->regmaps[i]))
+			return PTR_ERR(state->regmaps[i]);
+	}
+	state->num_phys = phy_dev->num_phys;
+	spin_lock_init(&state->slock);
 
 	dev_set_drvdata(dev, state);
-	spin_lock_init(&state->slock);
 
-	for (i = 0; i < EXYNOS_MIPI_PHYS_NUM; i++) {
+	for (i = 0; i < state->num_phys; i++) {
 		struct phy *phy = devm_phy_create(dev, NULL,
 						  &exynos_mipi_video_phy_ops);
 		if (IS_ERR(phy)) {
@@ -136,6 +228,7 @@ static int exynos_mipi_video_phy_probe(struct platform_device *pdev)
 
 		state->phys[i].phy = phy;
 		state->phys[i].index = i;
+		state->phys[i].data = &phy_dev->phys[i];
 		phy_set_drvdata(phy, &state->phys[i]);
 	}
 
@@ -146,8 +239,11 @@ static int exynos_mipi_video_phy_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id exynos_mipi_video_phy_of_match[] = {
-	{ .compatible = "samsung,s5pv210-mipi-video-phy" },
-	{ },
+	{
+		.compatible = "samsung,s5pv210-mipi-video-phy",
+		.data = &s5pv210_mipi_phy,
+	},
+	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, exynos_mipi_video_phy_of_match);
 
-- 
1.9.2
