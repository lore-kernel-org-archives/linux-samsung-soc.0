From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 2/3] i2c: exynos5: implement bus recovery functionality
Date: Thu, 30 Nov 2017 15:30:06 +0100
Message-ID: <20171130143007.30258-3-a.hajda@samsung.com>
References: <20171130143007.30258-1-a.hajda@samsung.com>
        <CGME20171130143018eucas1p13bd2ce9263f9ac016ab3b779920b512e@eucas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:54700 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752524AbdK3OaW (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 30 Nov 2017 09:30:22 -0500
In-reply-to: <20171130143007.30258-1-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>, Andi Shyti <andi.shyti@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, "open list:I2C SUBSYSTEM" <linux-i2c@vger.kernel.org>, "moderated list:ARM/SAMSUNG EXYNOS
        ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>

In some circumstances I2C clients can be in abnormal state, to allow
recover them from it I2C master can pulse SCL line until SDA line
goes up and then generate STOP condition. Exynos driver does not have
possibility to manipulate I2C lines directly, but it can provide similar
functionality using manual commands. Replacing I2C adapter reset with
bus recovery significantly incereases I2C bus robustness in case of timeouts.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/i2c/busses/i2c-exynos5.c | 44 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 43 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-exynos5.c
index b02428498f6d..4ca43980e2ed 100644
--- a/drivers/i2c/busses/i2c-exynos5.c
+++ b/drivers/i2c/busses/i2c-exynos5.c
@@ -128,6 +128,10 @@
 #define HSI2C_TIMEOUT_EN			(1u << 31)
 #define HSI2C_TIMEOUT_MASK			0xff
 
+/* I2C_MANUAL_CMD register bits */
+#define HSI2C_CMD_READ_DATA			(1u << 4)
+#define HSI2C_CMD_SEND_STOP			(1u << 2)
+
 /* I2C_TRANS_STATUS register bits */
 #define HSI2C_MASTER_BUSY			(1u << 17)
 #define HSI2C_SLAVE_BUSY			(1u << 16)
@@ -613,6 +617,26 @@ static void exynos5_i2c_message_start(struct exynos5_i2c *i2c, int stop)
 	spin_unlock_irqrestore(&i2c->lock, flags);
 }
 
+void exynos5_i2c_recovery(struct exynos5_i2c *i2c)
+{
+	u32 val;
+
+	val = readl(i2c->regs + HSI2C_CTL) | HSI2C_RXCHON;
+	writel(val, i2c->regs + HSI2C_CTL);
+	val = readl(i2c->regs + HSI2C_CONF) & ~HSI2C_AUTO_MODE;
+	writel(val, i2c->regs + HSI2C_CONF);
+
+	writel(HSI2C_CMD_READ_DATA, i2c->regs + HSI2C_MANUAL_CMD);
+	exynos5_i2c_wait_bus_idle(i2c);
+	writel(HSI2C_CMD_SEND_STOP, i2c->regs + HSI2C_MANUAL_CMD);
+	exynos5_i2c_wait_bus_idle(i2c);
+
+	val = readl(i2c->regs + HSI2C_CTL) & ~HSI2C_RXCHON;
+	writel(val, i2c->regs + HSI2C_CTL);
+	val = readl(i2c->regs + HSI2C_CONF) | HSI2C_AUTO_MODE;
+	writel(val, i2c->regs + HSI2C_CONF);
+}
+
 static int exynos5_i2c_xfer_msg(struct exynos5_i2c *i2c,
 			      struct i2c_msg *msgs, int stop)
 {
@@ -642,7 +666,7 @@ static int exynos5_i2c_xfer_msg(struct exynos5_i2c *i2c,
 		ret = exynos5_i2c_wait_bus_idle(i2c);
 
 	if (ret < 0) {
-		exynos5_i2c_reset(i2c);
+		exynos5_i2c_recovery(i2c);
 		if (ret == -ETIMEDOUT)
 			dev_warn(i2c->dev, "%s timeout\n",
 				 (msgs->flags & I2C_M_RD) ? "rx" : "tx");
@@ -703,6 +727,23 @@ static const struct i2c_algorithm exynos5_i2c_algorithm = {
 	.functionality		= exynos5_i2c_func,
 };
 
+int exynos5_i2c_recover_bus(struct i2c_adapter *adap)
+{
+	struct exynos5_i2c *i2c = adap->algo_data;
+
+	i2c_lock_adapter(adap);
+	clk_enable(i2c->clk);
+	exynos5_i2c_recovery(i2c);
+	clk_disable(i2c->clk);
+	i2c_unlock_adapter(adap);
+
+	return 0;
+}
+
+static struct i2c_bus_recovery_info exynos5_i2c_recovery_info = {
+	.recover_bus = exynos5_i2c_recover_bus
+};
+
 static int exynos5_i2c_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -773,6 +814,7 @@ static int exynos5_i2c_probe(struct platform_device *pdev)
 		goto err_clk;
 
 	exynos5_i2c_reset(i2c);
+	i2c->adap.bus_recovery_info = &exynos5_i2c_recovery_info;
 
 	ret = i2c_add_adapter(&i2c->adap);
 	if (ret < 0)
-- 
2.15.0
