From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH] i2c: exynos5: rework HSI2C_MASTER_ST_LOSE state handling
Date: Fri, 26 Jan 2018 13:09:50 +0100
Message-ID: <20180126120950.9934-1-a.hajda@samsung.com>
References: <CGME20180126121001eucas1p2931738af133ad3e5bf1cd824058ba8d0@eucas1p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:45099 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751814AbeAZMKF (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 26 Jan 2018 07:10:05 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>, Andi Shyti <andi.shyti@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, "open list:I2C SUBSYSTEM" <linux-i2c@vger.kernel.org>, "moderated list:ARM/SAMSUNG EXYNOS
        ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>

HSI2C_MASTER_ST_LOSE state is not documented properly, extensive tests
show that hardware is usually able to recover from this state without
interrupting the transfer. Moreover documentation says that
such state can be caused by slave clock stretching, and should not be
treated as an error during transaction. The only place it indicates
an error is just before starting transaction. In such case bus recovery
procedure should be performed - master should pulse SCL line nine times
and then send STOP condition, it can be repeated until SDA goes high.
The procedure can be performed using manual commands HSI2C_CMD_READ_DATA
and HSI2C_CMD_SEND_STOP.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
Hi Wolfram,

This patch integrates and invalidates my previous patches [1][2].
I hope inline comments are sufficient.

[1]: i2c: exynos5: implement bus recovery functionality
[2]: i2c: exynos5: do not check TRANS_STATUS in case of Exynos7 variant

Regards
Andrzej

 drivers/i2c/busses/i2c-exynos5.c | 67 ++++++++++++++++++++++++++++++++++++----
 1 file changed, 61 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-exynos5.c
index b02428498f6d..8dcc36835a1a 100644
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
@@ -441,12 +445,6 @@ static irqreturn_t exynos5_i2c_irq(int irqno, void *dev_id)
 			i2c->state = -ETIMEDOUT;
 			goto stop;
 		}
-
-		trans_status = readl(i2c->regs + HSI2C_TRANS_STATUS);
-		if ((trans_status & HSI2C_MASTER_ST_MASK) == HSI2C_MASTER_ST_LOSE) {
-			i2c->state = -EAGAIN;
-			goto stop;
-		}
 	} else if (int_status & HSI2C_INT_I2C) {
 		trans_status = readl(i2c->regs + HSI2C_TRANS_STATUS);
 		if (trans_status & HSI2C_NO_DEV_ACK) {
@@ -544,6 +542,61 @@ static int exynos5_i2c_wait_bus_idle(struct exynos5_i2c *i2c)
 	return -EBUSY;
 }
 
+static void exynos5_i2c_bus_recover(struct exynos5_i2c *i2c)
+{
+	u32 val;
+
+	dev_dbg(i2c->dev, "%s: start\n", __func__);
+
+	val = readl(i2c->regs + HSI2C_CTL) | HSI2C_RXCHON;
+	writel(val, i2c->regs + HSI2C_CTL);
+	val = readl(i2c->regs + HSI2C_CONF) & ~HSI2C_AUTO_MODE;
+	writel(val, i2c->regs + HSI2C_CONF);
+
+	/*
+	 * Specification says master should send nine clock pulses. It can be
+	 * emulated by sending manual read command (nine pulses for read eight
+	 * bits + one pulse for NACK).
+	 */
+	writel(HSI2C_CMD_READ_DATA, i2c->regs + HSI2C_MANUAL_CMD);
+	exynos5_i2c_wait_bus_idle(i2c);
+	writel(HSI2C_CMD_SEND_STOP, i2c->regs + HSI2C_MANUAL_CMD);
+	exynos5_i2c_wait_bus_idle(i2c);
+
+	val = readl(i2c->regs + HSI2C_CTL) & ~HSI2C_RXCHON;
+	writel(val, i2c->regs + HSI2C_CTL);
+	val = readl(i2c->regs + HSI2C_CONF) | HSI2C_AUTO_MODE;
+	writel(val, i2c->regs + HSI2C_CONF);
+
+	dev_dbg(i2c->dev, "%s: end\n", __func__);
+}
+
+static void exynos5_i2c_bus_check(struct exynos5_i2c *i2c)
+{
+	unsigned long timeout;
+
+	if (i2c->variant->hw != HSI2C_EXYNOS7)
+		return;
+
+	/*
+	 * HSI2C_MASTER_ST_LOSE state in EXYNOS7 variant before transaction
+	 * indicates that bus is stuck (SDA is low). In such case bus recovery
+	 * can be performed.
+	 */
+	timeout = jiffies + msecs_to_jiffies(100);
+	for (;;) {
+		u32 st = readl(i2c->regs + HSI2C_TRANS_STATUS);
+
+		if ((st & HSI2C_MASTER_ST_MASK) != HSI2C_MASTER_ST_LOSE)
+			return;
+
+		if (time_is_before_jiffies(timeout))
+			return;
+
+		exynos5_i2c_bus_recover(i2c);
+	}
+}
+
 /*
  * exynos5_i2c_message_start: Configures the bus and starts the xfer
  * i2c: struct exynos5_i2c pointer for the current bus
@@ -598,6 +651,8 @@ static void exynos5_i2c_message_start(struct exynos5_i2c *i2c, int stop)
 	writel(fifo_ctl, i2c->regs + HSI2C_FIFO_CTL);
 	writel(i2c_ctl, i2c->regs + HSI2C_CTL);
 
+	exynos5_i2c_bus_check(i2c);
+
 	/*
 	 * Enable interrupts before starting the transfer so that we don't
 	 * miss any INT_I2C interrupts.
-- 
2.15.1
