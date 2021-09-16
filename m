Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35239C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 16 Sep 2021 10:38:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1AA9060F70
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 16 Sep 2021 10:38:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236899AbhIPKkL (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 16 Sep 2021 06:40:11 -0400
Received: from smtpbg127.qq.com ([109.244.180.96]:37860 "EHLO smtpbg.qq.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235570AbhIPKkJ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 16 Sep 2021 06:40:09 -0400
X-QQ-mid: bizesmtp36t1631788681tok7ihe5
Received: from localhost.localdomain (unknown [180.113.36.229])
        by esmtp6.qq.com (ESMTP) with 
        id ; Thu, 16 Sep 2021 18:37:24 +0800 (CST)
X-QQ-SSF: 0100000000800020B000000A0000000
X-QQ-FEAT: 1J4SMhVdN4aJcLFYB1i5sJBt4BhFiHrQLJ8+T73NsnpwOLTQYmBp2k0Hb5f4p
        6EuUGxWRSt7Q/2HLtIdDxPyWKDzq4FV9Keez1f2ErgnB76uNiFdIdl3ZE9fYJXYPyrZND4+
        VjI2U+PSp0dvMM1hebi/8InhE0swG8UOtSlNiJlsfEQk8QEVuZfLJvqH8ByamMrV4CYJ+yC
        tJO/B78ixp9mko0icQ/8M3W3x/uYjdY8dAYgJ8f7dbd/ieQxCSg+tjUxnx75s+iK+JdoFaR
        qWOoDzC5098biAxL1hWNMa698r3saoA9HYK+TMzz5syH9xboNxTt05XgTZkhX56oe+dH/uq
        blR1dLK32sm02l5wpc=
X-QQ-GoodBg: 0
From:   Xiang wangx <wangxiang@cdjrlc.com>
To:     krzysztof.kozlowski@canonical.com
Cc:     linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xiang wangx <wangxiang@cdjrlc.com>
Subject: [PATCH] i2c: s3c2410: Delete unneeded variable: "ret"
Date:   Thu, 16 Sep 2021 18:37:18 +0800
Message-Id: <20210916103718.29956-1-wangxiang@cdjrlc.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgspam:qybgspam1
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

variable: "ret" defined but not used in function "i2c_s3c_irq_nextbyte"

Signed-off-by: Xiang wangx <wangxiang@cdjrlc.com>
---
 drivers/i2c/busses/i2c-s3c2410.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
index b49a1b170bb2..6df85b23156c 100644
--- a/drivers/i2c/busses/i2c-s3c2410.c
+++ b/drivers/i2c/busses/i2c-s3c2410.c
@@ -385,7 +385,6 @@ static int i2c_s3c_irq_nextbyte(struct s3c24xx_i2c *i2c, unsigned long iicstat)
 {
 	unsigned long tmp;
 	unsigned char byte;
-	int ret = 0;
 
 	switch (i2c->state) {
 
@@ -548,7 +547,7 @@ static int i2c_s3c_irq_nextbyte(struct s3c24xx_i2c *i2c, unsigned long iicstat)
 	tmp &= ~S3C2410_IICCON_IRQPEND;
 	writel(tmp, i2c->regs + S3C2410_IICCON);
  out:
-	return ret;
+	return 0;
 }
 
 /*
-- 
2.20.1

