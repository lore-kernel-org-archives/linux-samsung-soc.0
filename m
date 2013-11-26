From: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Subject: [PATCH 2/2 v2] i2c: exynos5: configure fifo_depth based on HSI2C
 module version
Date: Tue, 26 Nov 2013 09:56:39 +0530
Message-ID: <1385439999-19123-1-git-send-email-ch.naveen@samsung.com>
References: <1385100851-32254-1-git-send-email-ch.naveen@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:47518 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751980Ab3KZEZY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 25 Nov 2013 23:25:24 -0500
In-reply-to: <1385100851-32254-1-git-send-email-ch.naveen@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-i2c@vger.kernel.org
Cc: sjg@chromium.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, wsa@the-dreams.de, ben-linux@fluff.org, grant.likely@secretlab.ca, broonie@kernel.org, dianders@chromium.org, cpgs@samsung.com, t.figa@samsung.com

fifo_depth of the HSI2C is not constant
Exynos5420 and Exynos5250 supports fifo_depth of 64bytes
Exynos5260 supports fifo_depth of 16bytes

This patch configures the fifo_depth based on HSI2C modules version.

Signed-off-by: Naveen Krishna Chatradhi <ich.naveen@samsung.com>
[For finding out the difference and initial contribution]
Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
---
Changes since v1:
Added missed out Signed-off-by line for initial contribution
Also rebasing on linux-i2c for-next

 drivers/i2c/busses/i2c-exynos5.c |   29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-exynos5.c
index 497ff91..a3fdcd8 100644
--- a/drivers/i2c/busses/i2c-exynos5.c
+++ b/drivers/i2c/busses/i2c-exynos5.c
@@ -77,12 +77,6 @@
 #define HSI2C_RXFIFO_TRIGGER_LEVEL(x)		((x) << 4)
 #define HSI2C_TXFIFO_TRIGGER_LEVEL(x)		((x) << 16)
 
-/* As per user manual FIFO max depth is 64bytes */
-#define HSI2C_FIFO_MAX				0x40
-/* default trigger levels for Tx and Rx FIFOs */
-#define HSI2C_DEF_TXFIFO_LVL			(HSI2C_FIFO_MAX - 0x30)
-#define HSI2C_DEF_RXFIFO_LVL			(HSI2C_FIFO_MAX - 0x10)
-
 /* I2C_TRAILING_CTL Register bits */
 #define HSI2C_TRAILING_COUNT			(0xf)
 
@@ -187,6 +181,9 @@ struct exynos5_i2c {
 
 	/* Version of HS-I2C Hardware */
 	unsigned int		version;
+
+	/* FIFO depth */
+	unsigned int		fifo_depth;
 };
 
 enum hsi2c_version {
@@ -437,7 +434,7 @@ static irqreturn_t exynos5_i2c_irq(int irqno, void *dev_id)
 		fifo_status = readl(i2c->regs + HSI2C_FIFO_STATUS);
 		fifo_level = HSI2C_TX_FIFO_LVL(fifo_status);
 
-		len = HSI2C_FIFO_MAX - fifo_level;
+		len = i2c->fifo_depth - fifo_level;
 		if (len > (i2c->msg->len - i2c->msg_ptr))
 			len = i2c->msg->len - i2c->msg_ptr;
 
@@ -505,6 +502,7 @@ static void exynos5_i2c_message_start(struct exynos5_i2c *i2c, int stop)
 	u32 i2c_auto_conf = 0;
 	u32 fifo_ctl;
 	unsigned long flags;
+	unsigned short trig_lvl;
 
 	i2c_ctl = readl(i2c->regs + HSI2C_CTL);
 	i2c_ctl &= ~(HSI2C_TXCHON | HSI2C_RXCHON);
@@ -515,13 +513,19 @@ static void exynos5_i2c_message_start(struct exynos5_i2c *i2c, int stop)
 
 		i2c_auto_conf = HSI2C_READ_WRITE;
 
-		fifo_ctl |= HSI2C_RXFIFO_TRIGGER_LEVEL(HSI2C_DEF_TXFIFO_LVL);
+		trig_lvl = (i2c->msg->len > i2c->fifo_depth) ?
+			(i2c->fifo_depth * 3/4) : i2c->msg->len;
+		fifo_ctl |= HSI2C_RXFIFO_TRIGGER_LEVEL(trig_lvl);
+
 		int_en |= (HSI2C_INT_RX_ALMOSTFULL_EN |
 			HSI2C_INT_TRAILING_EN);
 	} else {
 		i2c_ctl |= HSI2C_TXCHON;
 
-		fifo_ctl |= HSI2C_TXFIFO_TRIGGER_LEVEL(HSI2C_DEF_RXFIFO_LVL);
+		trig_lvl = (i2c->msg->len > i2c->fifo_depth) ?
+			(i2c->fifo_depth * 1/4) : i2c->msg->len;
+		fifo_ctl |= HSI2C_TXFIFO_TRIGGER_LEVEL(trig_lvl);
+
 		int_en |= HSI2C_INT_TX_ALMOSTEMPTY_EN;
 	}
 
@@ -716,10 +720,13 @@ static int exynos5_i2c_probe(struct platform_device *pdev)
 	i2c->version = exynos5_i2c_get_version(pdev);
 
 	/* The HS-I2C core on Exynos5260 needs a reset to start with */
-	if (i2c->version == EXYNOS_5260)
+	if (i2c->version == EXYNOS_5260) {
+		i2c->fifo_depth = 16;
 		exynos5_i2c_reset(i2c);
-	else
+	} else {
+		i2c->fifo_depth = 64;
 		exynos5_i2c_init(i2c);
+	}
 
 	ret = i2c_add_adapter(&i2c->adap);
 	if (ret < 0) {
-- 
1.7.10.4
