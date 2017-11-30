From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 3/3] i2c: exynos5: do not check TRANS_STATUS in case of
 Exynos7 variant
Date: Thu, 30 Nov 2017 15:30:07 +0100
Message-ID: <20171130143007.30258-4-a.hajda@samsung.com>
References: <20171130143007.30258-1-a.hajda@samsung.com>
        <CGME20171130143018eucas1p1eba2c4f3361e0752cc53a25d217ce616@eucas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:36142 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752368AbdK3OaW (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 30 Nov 2017 09:30:22 -0500
In-reply-to: <20171130143007.30258-1-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>, Andi Shyti <andi.shyti@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, "open list:I2C SUBSYSTEM" <linux-i2c@vger.kernel.org>, "moderated list:ARM/SAMSUNG EXYNOS
        ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>

HSI2C_MASTER_ST_LOSE state is not documented properly, extensive tests
show that hardware is usually able to recover from this state without
interrupting the transfer. On the other side enforcing transfer repetition
in such case does not help in many situations, especially on busy systems
and causes -EAGAIN and -ETIMEOUT errors. Moreover documentation says that
such state can be caused by slave clock stretching, and should not be treated
as an error.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/i2c/busses/i2c-exynos5.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-exynos5.c
index 4ca43980e2ed..d579b45b3092 100644
--- a/drivers/i2c/busses/i2c-exynos5.c
+++ b/drivers/i2c/busses/i2c-exynos5.c
@@ -445,12 +445,6 @@ static irqreturn_t exynos5_i2c_irq(int irqno, void *dev_id)
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
-- 
2.15.0
