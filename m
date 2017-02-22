From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v2] i2c: exynos5: fix arbitration lost handling
Date: Wed, 22 Feb 2017 12:04:34 +0100
Message-ID: <1487761474-11547-1-git-send-email-a.hajda@samsung.com>
References: <CGME20170222110438eucas1p2329ece7afd9e22ba185da64ccf4b2981@eucas1p2.samsung.com>
Return-path: <linux-i2c-owner@vger.kernel.org>
Sender: linux-i2c-owner@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Andi Shyti <andi.shyti@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

In case of arbitration lost adequate interrupt sometimes is not signaled.
As a result transfer timeouts and is not retried, as it should. To avoid
such cases code is added to check transaction status in case of every
interrupt.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
Hi Wolfram,

I have postponed this patch because I was looking for better solution,
but it seems that this patch together with 'disable fifo-almost-empty...'
patch solves the issue of arbitration lost completely.
The patch has been adjusted according to your comment.

Regards
Andrzej

v2:
- replaced switch with if clause,
- commit message fits 75 chars limit.

 drivers/i2c/busses/i2c-exynos5.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-exynos5.c
index 00e81e3..cbd93ce 100644
--- a/drivers/i2c/busses/i2c-exynos5.c
+++ b/drivers/i2c/busses/i2c-exynos5.c
@@ -130,12 +130,32 @@
 /* I2C_TRANS_STATUS register bits */
 #define HSI2C_MASTER_BUSY			(1u << 17)
 #define HSI2C_SLAVE_BUSY			(1u << 16)
+
+/* I2C_TRANS_STATUS register bits for Exynos5 variant */
 #define HSI2C_TIMEOUT_AUTO			(1u << 4)
 #define HSI2C_NO_DEV				(1u << 3)
 #define HSI2C_NO_DEV_ACK			(1u << 2)
 #define HSI2C_TRANS_ABORT			(1u << 1)
 #define HSI2C_TRANS_DONE			(1u << 0)
 
+/* I2C_TRANS_STATUS register bits for Exynos7 variant */
+#define HSI2C_MASTER_ST_MASK			0xf
+#define HSI2C_MASTER_ST_IDLE			0x0
+#define HSI2C_MASTER_ST_START			0x1
+#define HSI2C_MASTER_ST_RESTART			0x2
+#define HSI2C_MASTER_ST_STOP			0x3
+#define HSI2C_MASTER_ST_MASTER_ID		0x4
+#define HSI2C_MASTER_ST_ADDR0			0x5
+#define HSI2C_MASTER_ST_ADDR1			0x6
+#define HSI2C_MASTER_ST_ADDR2			0x7
+#define HSI2C_MASTER_ST_ADDR_SR			0x8
+#define HSI2C_MASTER_ST_READ			0x9
+#define HSI2C_MASTER_ST_WRITE			0xa
+#define HSI2C_MASTER_ST_NO_ACK			0xb
+#define HSI2C_MASTER_ST_LOSE			0xc
+#define HSI2C_MASTER_ST_WAIT			0xd
+#define HSI2C_MASTER_ST_WAIT_CMD		0xe
+
 /* I2C_ADDR register bits */
 #define HSI2C_SLV_ADDR_SLV(x)			((x & 0x3ff) << 0)
 #define HSI2C_SLV_ADDR_MAS(x)			((x & 0x3ff) << 10)
@@ -437,6 +457,7 @@ static irqreturn_t exynos5_i2c_irq(int irqno, void *dev_id)
 
 	int_status = readl(i2c->regs + HSI2C_INT_STATUS);
 	writel(int_status, i2c->regs + HSI2C_INT_STATUS);
+	trans_status = readl(i2c->regs + HSI2C_TRANS_STATUS);
 
 	/* handle interrupt related to the transfer status */
 	if (i2c->variant->hw == HSI2C_EXYNOS7) {
@@ -460,8 +481,12 @@ static irqreturn_t exynos5_i2c_irq(int irqno, void *dev_id)
 			i2c->state = -ETIMEDOUT;
 			goto stop;
 		}
+
+		if ((trans_status & HSI2C_MASTER_ST_MASK) == HSI2C_MASTER_ST_LOSE) {
+			i2c->state = -EAGAIN;
+			goto stop;
+		}
 	} else if (int_status & HSI2C_INT_I2C) {
-		trans_status = readl(i2c->regs + HSI2C_TRANS_STATUS);
 		if (trans_status & HSI2C_NO_DEV_ACK) {
 			dev_dbg(i2c->dev, "No ACK from device\n");
 			i2c->state = -ENXIO;
-- 
2.7.4
