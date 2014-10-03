From: Wolfram Sang <wsa@the-dreams.de>
Subject: [PATCH] i2c: exynos5: use proper errno for timeout
Date: Fri,  3 Oct 2014 13:57:14 +0200
Message-ID: <1412337438-8223-1-git-send-email-wsa@the-dreams.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:38820 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751454AbaJCL4v (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 3 Oct 2014 07:56:51 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa@the-dreams.de>, naveenkrishna.ch@gmail.com, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org

Signed-off-by: Wolfram Sang <wsa@the-dreams.de>
---
 drivers/i2c/busses/i2c-exynos5.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-exynos5.c
index 81e6263cd7da..271533d564ec 100644
--- a/drivers/i2c/busses/i2c-exynos5.c
+++ b/drivers/i2c/busses/i2c-exynos5.c
@@ -457,7 +457,7 @@ static irqreturn_t exynos5_i2c_irq(int irqno, void *dev_id)
 			goto stop;
 		} else if (int_status & HSI2C_INT_TIMEOUT) {
 			dev_dbg(i2c->dev, "Accessing device timed out\n");
-			i2c->state = -EAGAIN;
+			i2c->state = -ETIMEDOUT;
 			goto stop;
 		}
 	} else if (int_status & HSI2C_INT_I2C) {
@@ -476,7 +476,7 @@ static irqreturn_t exynos5_i2c_irq(int irqno, void *dev_id)
 			goto stop;
 		} else if (trans_status & HSI2C_TIMEOUT_AUTO) {
 			dev_dbg(i2c->dev, "Accessing device timed out\n");
-			i2c->state = -EAGAIN;
+			i2c->state = -ETIMEDOUT;
 			goto stop;
 		} else if (trans_status & HSI2C_TRANS_DONE) {
 			i2c->trans_done = 1;
-- 
2.0.0
