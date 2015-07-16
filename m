From: Laurent Navet <laurent.navet@gmail.com>
Subject: [PATCH] i2c: s3c2410: remove unused variable
Date: Thu, 16 Jul 2015 22:36:16 +0200
Message-ID: <1437078976-29145-1-git-send-email-laurent.navet@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f196.google.com ([209.85.212.196]:36478 "EHLO
	mail-wi0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751078AbbGPU2h (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 16 Jul 2015 16:28:37 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene@kernel.org, k.kozlowski@samsung.com, wsa@the-dreams.de
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Laurent Navet <laurent.navet@gmail.com>

ret is assigned zero and just used to return. remove it.
Found by using coccinelle.

Signed-off-by: Laurent Navet <laurent.navet@gmail.com>
---
 drivers/i2c/busses/i2c-s3c2410.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
index 50bfd8c..cf3c6c0 100644
--- a/drivers/i2c/busses/i2c-s3c2410.c
+++ b/drivers/i2c/busses/i2c-s3c2410.c
@@ -409,7 +409,6 @@ static int i2c_s3c_irq_nextbyte(struct s3c24xx_i2c *i2c, unsigned long iicstat)
 {
 	unsigned long tmp;
 	unsigned char byte;
-	int ret = 0;
 
 	switch (i2c->state) {
 
@@ -565,7 +564,7 @@ static int i2c_s3c_irq_nextbyte(struct s3c24xx_i2c *i2c, unsigned long iicstat)
 	tmp &= ~S3C2410_IICCON_IRQPEND;
 	writel(tmp, i2c->regs + S3C2410_IICCON);
  out:
-	return ret;
+	return 0;
 }
 
 /* s3c24xx_i2c_irq
-- 
2.1.4
