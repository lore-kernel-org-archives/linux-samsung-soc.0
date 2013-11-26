From: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Subject: [PATCH 1/2 v2] i2c: exynos5: add support for HSI2C on Exynos5260 SoC
Date: Tue, 26 Nov 2013 09:56:17 +0530
Message-ID: <1385439977-19077-1-git-send-email-ch.naveen@samsung.com>
References: <1385100726-32165-1-git-send-email-ch.naveen@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1385100726-32165-1-git-send-email-ch.naveen@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-i2c@vger.kernel.org
Cc: sjg@chromium.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, wsa@the-dreams.de, ben-linux@fluff.org, grant.likely@secretlab.ca, broonie@kernel.org, dianders@chromium.org, cpgs@samsung.com, t.figa@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

This patch adds new compatible to support HSI2C module on Exynos5260
HSI2C module on Exynos5260 needs to be reset during during initialization.

Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
---
Changes since v1:
Rebasing on linux-i2c for-next

 .../devicetree/bindings/i2c/i2c-exynos5.txt        |    6 +++-
 drivers/i2c/busses/i2c-exynos5.c                   |   31 ++++++++++++++++++--
 2 files changed, 34 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-exynos5.txt b/Documentation/devicetree/bindings/i2c/i2c-exynos5.txt
index 056732c..704ab92 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-exynos5.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-exynos5.txt
@@ -5,7 +5,11 @@ at various speeds ranging from 100khz to 3.4Mhz.
 
 Required properties:
   - compatible: value should be.
-      -> "samsung,exynos5-hsi2c", for i2c compatible with exynos5 hsi2c.
+	-> "samsung,exynos5-hsi2c", for i2c compatible with HSI2C available on
+				Exynos5250/5420 SoCs.
+	-> "samsung,exynos5260-hsi2c", for i2c compatible with HSI2C available
+				on Exynos5260 SoCs.
+
   - reg: physical base address of the controller and length of memory mapped
     region.
   - interrupts: interrupt number to the cpu.
diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-exynos5.c
index da39ff0..497ff91 100644
--- a/drivers/i2c/busses/i2c-exynos5.c
+++ b/drivers/i2c/busses/i2c-exynos5.c
@@ -184,14 +184,35 @@ struct exynos5_i2c {
 	 * 2. Fast speed upto 1Mbps
 	 */
 	int			speed_mode;
+
+	/* Version of HS-I2C Hardware */
+	unsigned int		version;
+};
+
+enum hsi2c_version {
+	EXYNOS_5,
+	EXYNOS_5260
 };
 
 static const struct of_device_id exynos5_i2c_match[] = {
-	{ .compatible = "samsung,exynos5-hsi2c" },
+	{
+		.compatible = "samsung,exynos5-hsi2c",
+		.data = (void *)EXYNOS_5 },
+	{
+		.compatible = "samsung,exynos5260-hsi2c",
+		.data = (void *)EXYNOS_5260 },
 	{},
 };
 MODULE_DEVICE_TABLE(of, exynos5_i2c_match);
 
+static inline unsigned int exynos5_i2c_get_version(struct platform_device *pdev)
+{
+	const struct of_device_id *match;
+
+	match = of_match_node(exynos5_i2c_match, pdev->dev.of_node);
+	return (unsigned int)match->data;
+}
+
 static void exynos5_i2c_clr_pend_irq(struct exynos5_i2c *i2c)
 {
 	writel(readl(i2c->regs + HSI2C_INT_STATUS),
@@ -692,7 +713,13 @@ static int exynos5_i2c_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_clk;
 
-	exynos5_i2c_init(i2c);
+	i2c->version = exynos5_i2c_get_version(pdev);
+
+	/* The HS-I2C core on Exynos5260 needs a reset to start with */
+	if (i2c->version == EXYNOS_5260)
+		exynos5_i2c_reset(i2c);
+	else
+		exynos5_i2c_init(i2c);
 
 	ret = i2c_add_adapter(&i2c->adap);
 	if (ret < 0) {
-- 
1.7.10.4
