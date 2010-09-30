From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH RESEND] drivers: s3c2410-i2c: fix calculation of SDA line delay
Date: Thu, 30 Sep 2010 15:54:46 +0200
Message-ID: <1285854886-21459-1-git-send-email-m.szyprowski@samsung.com>
References: <1285853909-16056-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:54032 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756129Ab0I3N4T (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 30 Sep 2010 09:56:19 -0400
In-reply-to: <1285853909-16056-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, ben-linux@fluff.org, myungjoo.ham@samsung.com

From: MyungJoo Ham <myungjoo.ham@samsung.com>

S3C2440 style I2C controller uses PCLK to calculate the SDA line delay.
The driver wrongly assumed that this delay is calculated from the
frequency that the controller is operating on. This patch fixes this
issue.

Signed-off-by: MyungJoo Ham <myungjoo.ham@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

---

Hello,

I've checked all the user manuals I have and in all cases (S3C2440,
S3C6410, S5PC100, S5PC110 and S5PC210) the SDA line delay is calculated
from PCLK not the I2C operating frequency. This patch fixes problems
with I2C bus on Universal C210 board and LP3974 PMIC chip.

This is a resend of the previous patch with the correct authorship. I've
lost the information about the original author while rebasing and
resolving conflicts in my kernel tree. I'm sorry for the confusion. 

Best regards
--
Marek Szyprowski
Samsung Poland R&D Center

---
 drivers/i2c/busses/i2c-s3c2410.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
index 72902e0..bf831bf 100644
--- a/drivers/i2c/busses/i2c-s3c2410.c
+++ b/drivers/i2c/busses/i2c-s3c2410.c
@@ -662,8 +662,8 @@ static int s3c24xx_i2c_clockrate(struct s3c24xx_i2c *i2c, unsigned int *got)
 		unsigned long sda_delay;
 
 		if (pdata->sda_delay) {
-			sda_delay = (freq / 1000) * pdata->sda_delay;
-			sda_delay /= 1000000;
+			sda_delay = clkin * pdata->sda_delay;
+			sda_delay = DIV_ROUND_UP(sda_delay, 1000000);
 			sda_delay = DIV_ROUND_UP(sda_delay, 5);
 			if (sda_delay > 3)
 				sda_delay = 3;
-- 
1.7.1.569.g6f426
