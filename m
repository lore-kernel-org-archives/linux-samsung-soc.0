From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH 2/2] i2c: s3c2410: Use SET_NOIRQ_SYSTEM_SLEEP_PM_OPS instead
 of open-coded
Date: Thu, 14 Apr 2016 09:08:55 +0800
Message-ID: <1460596135.6630.2.camel@ingics.com>
References: <1460596084.6630.1.camel@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-i2c-owner@vger.kernel.org>
In-Reply-To: <1460596084.6630.1.camel@ingics.com>
Sender: linux-i2c-owner@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Use SET_NOIRQ_SYSTEM_SLEEP_PM_OPS to simplify the code.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/i2c/busses/i2c-s3c2410.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
index 362a6de..1bc7563 100644
--- a/drivers/i2c/busses/i2c-s3c2410.c
+++ b/drivers/i2c/busses/i2c-s3c2410.c
@@ -1316,14 +1316,8 @@ static int s3c24xx_i2c_resume_noirq(struct device *dev)
 
 #ifdef CONFIG_PM
 static const struct dev_pm_ops s3c24xx_i2c_dev_pm_ops = {
-#ifdef CONFIG_PM_SLEEP
-	.suspend_noirq = s3c24xx_i2c_suspend_noirq,
-	.resume_noirq = s3c24xx_i2c_resume_noirq,
-	.freeze_noirq = s3c24xx_i2c_suspend_noirq,
-	.thaw_noirq = s3c24xx_i2c_resume_noirq,
-	.poweroff_noirq = s3c24xx_i2c_suspend_noirq,
-	.restore_noirq = s3c24xx_i2c_resume_noirq,
-#endif
+	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(s3c24xx_i2c_suspend_noirq,
+				      s3c24xx_i2c_resume_noirq)
 };
 
 #define S3C24XX_DEV_PM_OPS (&s3c24xx_i2c_dev_pm_ops)
-- 
2.5.0
