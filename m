From: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 4/4] i2c-s3c2410: do not special case HDMIPHY stuck bus
 detection
Date: Thu, 15 Nov 2012 17:43:33 +0530
Message-ID: <1352981613-2098-5-git-send-email-ch.naveen@samsung.com>
References: <1352981613-2098-1-git-send-email-ch.naveen@samsung.com>
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1352981613-2098-1-git-send-email-ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org, w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, naveenkrishna.ch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

From: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Commit "i2c-s3c2410: Add HDMIPHY quirk for S3C2440" added support for
HDMIPHY with some special handling in s3c24xx_i2c_set_master:

"due to unknown reason (probably HW bug in HDMIPHY and/or the controller)
a transfer fails to finish. The controller hangs after sending the last
byte, the workaround for this bug is resetting the controller after each
transfer"

The "unknown reason" was that the proper sequence for generating a STOP
condition wasn't being followed as per the datasheet. Since this is fixed
by "PATCH: i2c-s3c2410: do not generate STOP for QUIRK_HDMIPHY buses",
remove the special handling.

Signed-off-by: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Signed-off-by: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 drivers/i2c/busses/i2c-s3c2410.c |   16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
index 362a307..c76ca7c 100644
--- a/drivers/i2c/busses/i2c-s3c2410.c
+++ b/drivers/i2c/busses/i2c-s3c2410.c
@@ -531,13 +531,6 @@ static int s3c24xx_i2c_set_master(struct s3c24xx_i2c *i2c)
 	unsigned long iicstat;
 	int timeout = 400;
 
-	/* the timeout for HDMIPHY is reduced to 10 ms because
-	 * the hangup is expected to happen, so waiting 400 ms
-	 * causes only unnecessary system hangup
-	 */
-	if (i2c->quirks & QUIRK_HDMIPHY)
-		timeout = 10;
-
 	while (timeout-- > 0) {
 		iicstat = readl(i2c->regs + S3C2410_IICSTAT);
 
@@ -547,15 +540,6 @@ static int s3c24xx_i2c_set_master(struct s3c24xx_i2c *i2c)
 		msleep(1);
 	}
 
-	/* hang-up of bus dedicated for HDMIPHY occurred, resetting */
-	if (i2c->quirks & QUIRK_HDMIPHY) {
-		writel(0, i2c->regs + S3C2410_IICCON);
-		writel(0, i2c->regs + S3C2410_IICSTAT);
-		writel(0, i2c->regs + S3C2410_IICDS);
-
-		return 0;
-	}
-
 	return -ETIMEDOUT;
 }
 
-- 
1.7.9.5
