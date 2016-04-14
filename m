From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH 1/2] i2c: exynos5: Use SET_NOIRQ_SYSTEM_SLEEP_PM_OPS instead
 of open-coded
Date: Thu, 14 Apr 2016 09:08:04 +0800
Message-ID: <1460596084.6630.1.camel@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-i2c-owner@vger.kernel.org>
Sender: linux-i2c-owner@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Use SET_NOIRQ_SYSTEM_SLEEP_PM_OPS to simplify the code.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/i2c/busses/i2c-exynos5.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-exynos5.c
index b29c750..8710052 100644
--- a/drivers/i2c/busses/i2c-exynos5.c
+++ b/drivers/i2c/busses/i2c-exynos5.c
@@ -847,14 +847,8 @@ static int exynos5_i2c_resume_noirq(struct device *dev)
 #endif
 
 static const struct dev_pm_ops exynos5_i2c_dev_pm_ops = {
-#ifdef CONFIG_PM_SLEEP
-	.suspend_noirq = exynos5_i2c_suspend_noirq,
-	.resume_noirq = exynos5_i2c_resume_noirq,
-	.freeze_noirq = exynos5_i2c_suspend_noirq,
-	.thaw_noirq = exynos5_i2c_resume_noirq,
-	.poweroff_noirq = exynos5_i2c_suspend_noirq,
-	.restore_noirq = exynos5_i2c_resume_noirq,
-#endif
+	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(exynos5_i2c_suspend_noirq,
+				      exynos5_i2c_resume_noirq)
 };
 
 static struct platform_driver exynos5_i2c_driver = {
-- 
2.5.0
