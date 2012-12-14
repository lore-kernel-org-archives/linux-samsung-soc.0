From: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Subject: [PATCH 2/2] i2c-s3c2410: Add GPIO based bus arbitration functionality
Date: Fri, 14 Dec 2012 11:20:54 +0530
Message-ID: <1355464254-12768-3-git-send-email-ch.naveen@samsung.com>
References: <1355464254-12768-1-git-send-email-ch.naveen@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:63188 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753959Ab2LNFvW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 14 Dec 2012 00:51:22 -0500
In-reply-to: <1355464254-12768-1-git-send-email-ch.naveen@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: w.sang@pengutronix.de, khali@linux-fr.org, ben-linux@fluff.org, grant.likely@secretlab.ca, devicetree-discuss@lists.ozlabs.org, sjg@chromium.org, grundler@chromium.org, naveen@chromium.org, broonie@opensource.wolfsonmicro.com

Makes use of the generic fucntions in of_i2c.c to parse arbitration
timing information and GPIOs for arbitration.

Also uses devm_gpio_request() instead of gpio_request() and
removes the gpio_free() calls

Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
---
 drivers/i2c/busses/i2c-s3c2410.c |   79 +++++++++++++++++++++++---------------
 1 file changed, 47 insertions(+), 32 deletions(-)

diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
index e93e7d6..d055cf8 100644
--- a/drivers/i2c/busses/i2c-s3c2410.c
+++ b/drivers/i2c/busses/i2c-s3c2410.c
@@ -855,54 +855,61 @@ static inline void s3c24xx_i2c_deregister_cpufreq(struct s3c24xx_i2c *i2c)
 #endif
 
 #ifdef CONFIG_OF
-static int s3c24xx_i2c_parse_dt_gpio(struct s3c24xx_i2c *i2c)
+static int of_i2c_parse_gpio(struct device *dev, const char *name,
+		int gpios[], size_t count, bool required)
 {
-	int idx, gpio, ret;
-
-	if (i2c->quirks & QUIRK_NO_GPIO)
-		return 0;
+	struct device_node *dn = dev->of_node;
+	int idx, gpio;
 
-	for (idx = 0; idx < 2; idx++) {
-		gpio = of_get_gpio(i2c->dev->of_node, idx);
+	for (idx = 0; idx < count; idx++) {
+		gpio = of_get_named_gpio(dn, name, idx);
 		if (!gpio_is_valid(gpio)) {
-			dev_err(i2c->dev, "invalid gpio[%d]: %d\n", idx, gpio);
-			goto free_gpio;
+			dev_dbg(dev, "invalid gpio[%d]: %d\n", idx, gpio);
+			if (idx || required) {
+				dev_err(dev, "invalid gpio[%d]: %d\n",
+					idx, gpio);
+			}
+			return -EINVAL;
 		}
-		i2c->gpios[idx] = gpio;
+		gpios[idx] = gpio;
 
-		ret = gpio_request(gpio, "i2c-bus");
-		if (ret) {
-			dev_err(i2c->dev, "gpio [%d] request failed\n", gpio);
-			goto free_gpio;
+		if (devm_gpio_request(dev, gpio, "i2c-bus")) {
+			dev_err(dev, "gpio [%d] request failed\n", gpio);
+			return -EINVAL;
 		}
 	}
 	return 0;
-
-free_gpio:
-	while (--idx >= 0)
-		gpio_free(i2c->gpios[idx]);
-	return -EINVAL;
 }
 
-static void s3c24xx_i2c_dt_gpio_free(struct s3c24xx_i2c *i2c)
+static int s3c24xx_i2c_parse_dt_gpio(struct s3c24xx_i2c *i2c)
 {
-	unsigned int idx;
+	int ret = 0;
 
 	if (i2c->quirks & QUIRK_NO_GPIO)
-		return;
+		goto out;
+
+	if (of_i2c_parse_gpio(i2c->dev, "gpios", i2c->gpios, 2, true)) {
+		ret = -EINVAL;
+		goto out;
+	}
 
-	for (idx = 0; idx < 2; idx++)
-		gpio_free(i2c->gpios[idx]);
+	if (i2c->adap.gpio_arbit) {
+		if (!of_i2c_parse_gpio(i2c->dev, "bus-arbitration-gpios",
+			i2c->adap.gpio_arbit->arb_gpios, I2C_ARB_GPIO_COUNT,
+			false)) {
+			dev_warn(i2c->dev, "GPIO-based arbitration enabled");
+		} else
+			ret = -EINVAL;
+	}
+
+ out:
+	return ret;
 }
 #else
 static int s3c24xx_i2c_parse_dt_gpio(struct s3c24xx_i2c *i2c)
 {
 	return 0;
 }
-
-static void s3c24xx_i2c_dt_gpio_free(struct s3c24xx_i2c *i2c)
-{
-}
 #endif
 
 /* s3c24xx_i2c_init
@@ -981,6 +988,7 @@ static int s3c24xx_i2c_probe(struct platform_device *pdev)
 {
 	struct s3c24xx_i2c *i2c;
 	struct s3c2410_platform_i2c *pdata = NULL;
+	struct i2c_gpio_arbit *arbit = NULL;
 	struct resource *res;
 	int ret;
 
@@ -1004,11 +1012,21 @@ static int s3c24xx_i2c_probe(struct platform_device *pdev)
 		goto err_noclk;
 	}
 
+	arbit = devm_kzalloc(&pdev->dev, sizeof(*arbit), GFP_KERNEL);
+	if (!arbit) {
+		ret = -ENOMEM;
+		goto err_noclk;
+	}
+
 	i2c->quirks = s3c24xx_get_device_quirks(pdev);
 	if (pdata)
 		memcpy(i2c->pdata, pdata, sizeof(*pdata));
-	else
+	else {
 		s3c24xx_i2c_parse_dt(pdev->dev.of_node, i2c);
+		/* Arbitration parameters */
+		i2c->adap.gpio_arbit = of_get_arbitrator_info(
+					pdev->dev.of_node, arbit);
+	}
 
 	strlcpy(i2c->adap.name, "s3c2410-i2c", sizeof(i2c->adap.name));
 	i2c->adap.owner   = THIS_MODULE;
@@ -1158,9 +1176,6 @@ static int s3c24xx_i2c_remove(struct platform_device *pdev)
 	clk_disable_unprepare(i2c->clk);
 	clk_put(i2c->clk);
 
-	if (pdev->dev.of_node && IS_ERR(i2c->pctrl))
-		s3c24xx_i2c_dt_gpio_free(i2c);
-
 	return 0;
 }
 
-- 
1.7.9.5
