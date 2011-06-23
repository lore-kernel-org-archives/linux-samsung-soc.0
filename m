From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] i2c-s3c2410: Fix typo 'i2s' -> 'i2c'
Date: Thu, 23 Jun 2011 21:37:33 +0900
Message-ID: <1308832653-8375-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:54756 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754028Ab1FWMrE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 23 Jun 2011 08:47:04 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org
Cc: ben-linux@fluff.org, Huisung Kang <hs1218.kang@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

From: Huisung Kang <hs1218.kang@samsung.com>

Signed-off-by: Huisung Kang <hs1218.kang@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 drivers/i2c/busses/i2c-s3c2410.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
index 553b9cc..f84a63c 100644
--- a/drivers/i2c/busses/i2c-s3c2410.c
+++ b/drivers/i2c/busses/i2c-s3c2410.c
@@ -248,12 +248,12 @@ static inline int is_msgend(struct s3c24xx_i2c *i2c)
 	return i2c->msg_ptr >= i2c->msg->len;
 }
 
-/* i2s_s3c_irq_nextbyte
+/* i2c_s3c_irq_nextbyte
  *
  * process an interrupt and work out what to do
  */
 
-static int i2s_s3c_irq_nextbyte(struct s3c24xx_i2c *i2c, unsigned long iicstat)
+static int i2c_s3c_irq_nextbyte(struct s3c24xx_i2c *i2c, unsigned long iicstat)
 {
 	unsigned long tmp;
 	unsigned char byte;
@@ -443,7 +443,7 @@ static irqreturn_t s3c24xx_i2c_irq(int irqno, void *dev_id)
 	/* pretty much this leaves us with the fact that we've
 	 * transmitted or received whatever byte we last sent */
 
-	i2s_s3c_irq_nextbyte(i2c, status);
+	i2c_s3c_irq_nextbyte(i2c, status);
 
  out:
 	return IRQ_HANDLED;
-- 
1.7.1
