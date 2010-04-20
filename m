From: Yauhen Kharuzhy <yauhen.kharuzhy-NihHnkIkDZhBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH] i2c-s3c2410: Decrease delay after end of transaction
Date: Tue, 20 Apr 2010 13:53:19 +0300
Message-ID: <1271760799-30913-1-git-send-email-yauhen.kharuzhy@promwad.com>
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
Cc: Jean Delvare <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Yauhen Kharuzhy <yauhen.kharuzhy-NihHnkIkDZhBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

msleep(1) which has been used for delay after issuing a STOP condition
to bus cause very big delay (min 1/HZ s). This is makes bulk register
update in I2C devices (for instance video camera) very slowly.

Seems that this delay can be safely decreased to few tens of
microseconds.

Signed-off-by: Yauhen Kharuzhy <yauhen.kharuzhy-NihHnkIkDZhBDgjK7y7TUQ@public.gmane.org>
---
 drivers/i2c/busses/i2c-s3c2410.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
index d27072b..de20a4e 100644
--- a/drivers/i2c/busses/i2c-s3c2410.c
+++ b/drivers/i2c/busses/i2c-s3c2410.c
@@ -521,7 +521,7 @@ static int s3c24xx_i2c_doxfer(struct s3c24xx_i2c *i2c,
 
 	/* ensure the stop has been through the bus */
 
-	msleep(1);
+	udelay(50);
 
  out:
 	return ret;
-- 
1.6.6.1
