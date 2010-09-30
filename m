From: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH] drivers: s3c2410-i2c: fix calculation of SDA line delay
Date: Thu, 30 Sep 2010 15:38:29 +0200
Message-ID: <1285853909-16056-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

S3C2440 style I2C controller uses PCLK to calculate the SDA line delay.
The driver wrongly assumed that this delay is calculated from the
frequency that the controller is operating on. This patch fixes this
issue.

Signed-off-by: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Signed-off-by: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

---

Hello,

I've checked all the user manuals I have and in all cases (S3C2440,
S3C6410, S5PC100, S5PC110 and S5PC210) the SDA line delay is calculated
from PCLK not the I2C operating frequency. This patch fixes problems
with I2C bus on Universal C210 board and LP3974 PMIC chip.

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
