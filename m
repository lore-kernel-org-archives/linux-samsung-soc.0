From: Rob Herring <robh@kernel.org>
Subject: [PATCH] regulator: Convert to using %pOF instead of full_name
Date: Tue, 18 Jul 2017 16:43:26 -0500
Message-ID: <20170718214339.7774-46-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Sangbeom Kim <sbkim73@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Philipp Zabel <p.zabel@pengutronix.de>, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Now that we have a custom printf format specifier, convert users of
full_name to use %pOF instead. This is preparation to remove storing
of the full path string for each node.

Signed-off-by: Rob Herring <robh@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Sangbeom Kim <sbkim73@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-samsung-soc@vger.kernel.org
---
 drivers/regulator/core.c      | 4 ++--
 drivers/regulator/max1586.c   | 2 +-
 drivers/regulator/s5m8767.c   | 4 ++--
 drivers/reset/reset-socfpga.c | 4 ++--
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index e567fa54980b..d79ba9af9352 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -204,8 +204,8 @@ static struct device_node *of_get_regulator(struct device *dev, const char *supp
 	regnode = of_parse_phandle(dev->of_node, prop_name, 0);

 	if (!regnode) {
-		dev_dbg(dev, "Looking up %s property in node %s failed\n",
-				prop_name, dev->of_node->full_name);
+		dev_dbg(dev, "Looking up %s property in node %pOF failed\n",
+				prop_name, dev->of_node);
 		return NULL;
 	}
 	return regnode;
diff --git a/drivers/regulator/max1586.c b/drivers/regulator/max1586.c
index 6779c2b53674..66bbaa999433 100644
--- a/drivers/regulator/max1586.c
+++ b/drivers/regulator/max1586.c
@@ -169,7 +169,7 @@ static int of_get_max1586_platform_data(struct device *dev,

 	if (of_property_read_u32(np, "v3-gain",
 				 &pdata->v3_gain) < 0) {
-		dev_err(dev, "%s has no 'v3-gain' property\n", np->full_name);
+		dev_err(dev, "%pOF has no 'v3-gain' property\n", np);
 		return -EINVAL;
 	}

diff --git a/drivers/regulator/s5m8767.c b/drivers/regulator/s5m8767.c
index 383cd7533721..4836947e1521 100644
--- a/drivers/regulator/s5m8767.c
+++ b/drivers/regulator/s5m8767.c
@@ -590,8 +590,8 @@ static int s5m8767_pmic_dt_parse_pdata(struct platform_device *pdev,
 		if (of_property_read_u32(reg_np, "op_mode",
 				&rmode->mode)) {
 			dev_warn(iodev->dev,
-				"no op_mode property property at %s\n",
-				reg_np->full_name);
+				"no op_mode property property at %pOF\n",
+				reg_np);

 			rmode->mode = S5M8767_OPMODE_NORMAL_MODE;
 		}
diff --git a/drivers/reset/reset-socfpga.c b/drivers/reset/reset-socfpga.c
index 07224c019892..c60904ff40b8 100644
--- a/drivers/reset/reset-socfpga.c
+++ b/drivers/reset/reset-socfpga.c
@@ -109,8 +109,8 @@ static int socfpga_reset_probe(struct platform_device *pdev)
 	 * Do not continue, when we encounter an old DT.
 	 */
 	if (!of_find_property(pdev->dev.of_node, "#reset-cells", NULL)) {
-		dev_err(&pdev->dev, "%s missing #reset-cells property\n",
-			pdev->dev.of_node->full_name);
+		dev_err(&pdev->dev, "%pOF missing #reset-cells property\n",
+			pdev->dev.of_node);
 		return -EINVAL;
 	}

--
2.11.0
