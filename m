From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH] i2c: exynos5: fix arbitration lost handling
Date: Thu, 05 Jan 2017 13:06:53 +0100
Message-ID: <1483618013-10721-1-git-send-email-a.hajda@samsung.com>
References: <CGME20170105120727eucas1p2b9452792b7d13d551974305b478a26e2@eucas1p2.samsung.com>
Return-path: <linux-i2c-owner@vger.kernel.org>
Sender: linux-i2c-owner@vger.kernel.org
To: linux-i2c@vger.kernel.org
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Wolfram Sang <wsa@the-dreams.de>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

In case of arbitration lost adequate interrupt sometimes is not signaled. As
a result transfer timeouts and is not retried, as it should. To avoid such
cases code is added to check transaction status in case of every interrupt.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
Hi,

I am not I2C specialist, this patch is a result of debugging issues
with SiI8620 MHL driver on TM2 device. I guess the main problem is
with SiI8620 chip, but exynos5 i2c is also guilty - with i2c-gpio driver
it works correctly - there is only one arbitration lost at 1st transaction
(which is properly handled - transfer is repeated succesfully). In case
of exynos5 there are much more arbitration losts. Lowering bus speed
decreases frequency of losts but do not eliminate them.
Any help/hint, what could cause such issues?

I guess increasing adap.retries should also decrease fail probability,
currently for exynos5 it is set to 3.

Regards
Andrzej
---
 drivers/i2c/busses/i2c-exynos5.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-exynos5.c
index bea6071..a01c1ae 100644
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
@@ -460,8 +481,13 @@ static irqreturn_t exynos5_i2c_irq(int irqno, void *dev_id)
 			i2c->state = -ETIMEDOUT;
 			goto stop;
 		}
+
+		switch (trans_status & HSI2C_MASTER_ST_MASK) {
+		case HSI2C_MASTER_ST_LOSE:
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
