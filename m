From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 1/2] i2c: exynos5: simplify clock frequency handling
Date: Fri, 24 Feb 2017 12:16:01 +0100
Message-ID: <1487934962-8703-1-git-send-email-a.hajda@samsung.com>
References: <CGME20170224111634eucas1p22340b3b86a835e90ce981a9d9d4dc64a@eucas1p2.samsung.com>
Return-path: <linux-i2c-owner@vger.kernel.org>
Sender: linux-i2c-owner@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

There is no need to keep separate settings for high and fast speed clock.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/i2c/busses/i2c-exynos5.c | 45 +++++++++++-----------------------------
 1 file changed, 12 insertions(+), 33 deletions(-)

diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-exynos5.c
index 04127b8..54df9e6 100644
--- a/drivers/i2c/busses/i2c-exynos5.c
+++ b/drivers/i2c/busses/i2c-exynos5.c
@@ -168,8 +168,6 @@
  */
 #define HSI2C_HS_TX_CLOCK	1000000
 #define HSI2C_FS_TX_CLOCK	100000
-#define HSI2C_HIGH_SPD		1
-#define HSI2C_FAST_SPD		0
 
 #define EXYNOS5_I2C_TIMEOUT (msecs_to_jiffies(1000))
 
@@ -200,15 +198,7 @@ struct exynos5_i2c {
 	int			trans_done;
 
 	/* Controller operating frequency */
-	unsigned int		fs_clock;
-	unsigned int		hs_clock;
-
-	/*
-	 * HSI2C Controller can operate in
-	 * 1. High speed upto 3.4Mbps
-	 * 2. Fast speed upto 1Mbps
-	 */
-	int			speed_mode;
+	unsigned int		op_clock;
 
 	/* Version of HS-I2C Hardware */
 	struct exynos_hsi2c_variant	*variant;
@@ -279,7 +269,7 @@ static void exynos5_i2c_clr_pend_irq(struct exynos5_i2c *i2c)
  * Returns 0 on success, -EINVAL if the cycle length cannot
  * be calculated.
  */
-static int exynos5_i2c_set_timing(struct exynos5_i2c *i2c, int mode)
+static int exynos5_i2c_set_timing(struct exynos5_i2c *i2c, bool hs_timings)
 {
 	u32 i2c_timing_s1;
 	u32 i2c_timing_s2;
@@ -292,8 +282,9 @@ static int exynos5_i2c_set_timing(struct exynos5_i2c *i2c, int mode)
 	unsigned int t_sr_release;
 	unsigned int t_ftl_cycle;
 	unsigned int clkin = clk_get_rate(i2c->clk);
-	unsigned int op_clk = (mode == HSI2C_HIGH_SPD) ?
-				i2c->hs_clock : i2c->fs_clock;
+	unsigned int op_clk = hs_timings ? i2c->op_clock :
+		(i2c->op_clock >= HSI2C_HS_TX_CLOCK) ? HSI2C_FS_TX_CLOCK :
+		i2c->op_clock;
 	int div, clk_cycle, temp;
 
 	/*
@@ -344,7 +335,7 @@ static int exynos5_i2c_set_timing(struct exynos5_i2c *i2c, int mode)
 		div, t_sr_release);
 	dev_dbg(i2c->dev, "tDATA_HD: %X\n", t_data_hd);
 
-	if (mode == HSI2C_HIGH_SPD) {
+	if (hs_timings) {
 		writel(i2c_timing_s1, i2c->regs + HSI2C_TIMING_HS1);
 		writel(i2c_timing_s2, i2c->regs + HSI2C_TIMING_HS2);
 		writel(i2c_timing_s3, i2c->regs + HSI2C_TIMING_HS3);
@@ -364,14 +355,14 @@ static int exynos5_hsi2c_clock_setup(struct exynos5_i2c *i2c)
 	 * Configure the Fast speed timing values
 	 * Even the High Speed mode initially starts with Fast mode
 	 */
-	if (exynos5_i2c_set_timing(i2c, HSI2C_FAST_SPD)) {
+	if (exynos5_i2c_set_timing(i2c, false)) {
 		dev_err(i2c->dev, "HSI2C FS Clock set up failed\n");
 		return -EINVAL;
 	}
 
 	/* configure the High speed timing values */
-	if (i2c->speed_mode == HSI2C_HIGH_SPD) {
-		if (exynos5_i2c_set_timing(i2c, HSI2C_HIGH_SPD)) {
+	if (i2c->op_clock >= HSI2C_HS_TX_CLOCK) {
+		if (exynos5_i2c_set_timing(i2c, true)) {
 			dev_err(i2c->dev, "HSI2C HS Clock set up failed\n");
 			return -EINVAL;
 		}
@@ -397,7 +388,7 @@ static void exynos5_i2c_init(struct exynos5_i2c *i2c)
 					i2c->regs + HSI2C_CTL);
 	writel(HSI2C_TRAILING_COUNT, i2c->regs + HSI2C_TRAILIG_CTL);
 
-	if (i2c->speed_mode == HSI2C_HIGH_SPD) {
+	if (i2c->op_clock >= HSI2C_HS_TX_CLOCK) {
 		writel(HSI2C_MASTER_ID(MASTER_ID(i2c->adap.nr)),
 					i2c->regs + HSI2C_ADDR);
 		i2c_conf |= HSI2C_HS_MODE;
@@ -734,26 +725,14 @@ static int exynos5_i2c_probe(struct platform_device *pdev)
 	struct device_node *np = pdev->dev.of_node;
 	struct exynos5_i2c *i2c;
 	struct resource *mem;
-	unsigned int op_clock;
 	int ret;
 
 	i2c = devm_kzalloc(&pdev->dev, sizeof(struct exynos5_i2c), GFP_KERNEL);
 	if (!i2c)
 		return -ENOMEM;
 
-	if (of_property_read_u32(np, "clock-frequency", &op_clock)) {
-		i2c->speed_mode = HSI2C_FAST_SPD;
-		i2c->fs_clock = HSI2C_FS_TX_CLOCK;
-	} else {
-		if (op_clock >= HSI2C_HS_TX_CLOCK) {
-			i2c->speed_mode = HSI2C_HIGH_SPD;
-			i2c->fs_clock = HSI2C_FS_TX_CLOCK;
-			i2c->hs_clock = op_clock;
-		} else {
-			i2c->speed_mode = HSI2C_FAST_SPD;
-			i2c->fs_clock = op_clock;
-		}
-	}
+	if (of_property_read_u32(np, "clock-frequency", &i2c->op_clock))
+		i2c->op_clock = HSI2C_FS_TX_CLOCK;
 
 	strlcpy(i2c->adap.name, "exynos5-i2c", sizeof(i2c->adap.name));
 	i2c->adap.owner   = THIS_MODULE;
-- 
2.7.4
