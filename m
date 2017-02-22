From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH] i2c: exynos5: disable fifo-almost-empty irq signal when
 necessary
Date: Wed, 22 Feb 2017 10:07:45 +0100
Message-ID: <1487754465-10190-1-git-send-email-a.hajda@samsung.com>
References: <CGME20170222090808eucas1p28d2afb2a8752a0442f797983b8773ef2@eucas1p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:38877 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751347AbdBVJIM (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 22 Feb 2017 04:08:12 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>

Fifo-almost-empty irq signal should be disabled as soon as possible,
to avoid unnecessary interrupt storm. The best moment is when there is
no more data to feed fifo.
This patch fixes system stalls caused by IRQ storm.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/i2c/busses/i2c-exynos5.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-exynos5.c
index bea6071..2e11793 100644
--- a/drivers/i2c/busses/i2c-exynos5.c
+++ b/drivers/i2c/busses/i2c-exynos5.c
@@ -503,7 +503,13 @@ static irqreturn_t exynos5_i2c_irq(int irqno, void *dev_id)
 
 		len = i2c->variant->fifo_depth - fifo_level;
 		if (len > (i2c->msg->len - i2c->msg_ptr))
+		if (len > (i2c->msg->len - i2c->msg_ptr)) {
+			u32 int_en = readl(i2c->regs + HSI2C_INT_ENABLE);
+
+			int_en &= ~HSI2C_INT_TX_ALMOSTEMPTY_EN;
+			writel(int_en, i2c->regs + HSI2C_INT_ENABLE);
 			len = i2c->msg->len - i2c->msg_ptr;
+		}
 
 		while (len > 0) {
 			byte = i2c->msg->buf[i2c->msg_ptr++];
-- 
2.7.4
