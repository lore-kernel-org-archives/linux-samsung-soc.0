From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] i2c-s3c2410: Remove useless break code
Date: Thu, 23 Jun 2011 21:37:20 +0900
Message-ID: <1308832640-8311-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:54759 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758959Ab1FWMrF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 23 Jun 2011 08:47:05 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org
Cc: ben-linux@fluff.org, Jonghwan Choi <jhbird.choi@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

From: Jonghwan Choi <jhbird.choi@samsung.com>

Signed-off-by: Jonghwan Choi <jhbird.choi@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 drivers/i2c/busses/i2c-s3c2410.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
index 6c00c10..553b9cc 100644
--- a/drivers/i2c/busses/i2c-s3c2410.c
+++ b/drivers/i2c/busses/i2c-s3c2410.c
@@ -264,7 +264,6 @@ static int i2s_s3c_irq_nextbyte(struct s3c24xx_i2c *i2c, unsigned long iicstat)
 	case STATE_IDLE:
 		dev_err(i2c->dev, "%s: called in STATE_IDLE\n", __func__);
 		goto out;
-		break;
 
 	case STATE_STOP:
 		dev_err(i2c->dev, "%s: called in STATE_STOP\n", __func__);
-- 
1.7.1
