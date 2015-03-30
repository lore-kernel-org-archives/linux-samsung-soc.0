From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH 1/2] drivers/rtc/rtc-s3c.c: Integrate Exynos3250 into S3C6410
Date: Mon, 30 Mar 2015 17:19:32 +0200
Message-ID: <1427728773-29065-2-git-send-email-k.kozlowski@samsung.com>
References: <1427728773-29065-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1427728773-29065-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Alessandro Zummo <a.zummo@towertech.it>, Chanwoo Choi <cw00.choi@samsung.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, rtc-linux@googlegroups.com, Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

There are now no differences between RTC on Exynos3250 and S3C6410.
Merge everything into one so duplicated code could be removed.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 drivers/rtc/rtc-s3c.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
index fb0c569765c6..5e162eaad277 100644
--- a/drivers/rtc/rtc-s3c.c
+++ b/drivers/rtc/rtc-s3c.c
@@ -774,18 +774,6 @@ static struct s3c_rtc_data const s3c6410_rtc_data = {
 	.disable		= s3c6410_rtc_disable,
 };
 
-static struct s3c_rtc_data const exynos3250_rtc_data = {
-	.max_user_freq		= 32768,
-	.needs_src_clk		= true,
-	.irq_handler		= s3c6410_rtc_irq,
-	.set_freq		= s3c6410_rtc_setfreq,
-	.enable_tick		= s3c6410_rtc_enable_tick,
-	.save_tick_cnt		= s3c6410_rtc_save_tick_cnt,
-	.restore_tick_cnt	= s3c6410_rtc_restore_tick_cnt,
-	.enable			= s3c24xx_rtc_enable,
-	.disable		= s3c6410_rtc_disable,
-};
-
 static const struct of_device_id s3c_rtc_dt_match[] = {
 	{
 		.compatible = "samsung,s3c2410-rtc",
@@ -801,7 +789,7 @@ static const struct of_device_id s3c_rtc_dt_match[] = {
 		.data = (void *)&s3c6410_rtc_data,
 	}, {
 		.compatible = "samsung,exynos3250-rtc",
-		.data = (void *)&exynos3250_rtc_data,
+		.data = (void *)&s3c6410_rtc_data,
 	},
 	{ /* sentinel */ },
 };
-- 
1.9.1
