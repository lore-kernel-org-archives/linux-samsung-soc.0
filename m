From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH] rtc: rtc-s3c: Remove one superfluous rtc_valid_tm() check
Date: Thu, 02 Apr 2015 16:31:56 +0200
Message-ID: <1427985116-20314-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>, linux-samsung-soc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>, rtc-linux@googlegroups.com, linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

The s3c_rtc_gettime() returns already result of rtc_valid_tm() on
obtained time so get rid of another call to rtc_valid_tm().

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 drivers/rtc/rtc-s3c.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
index 1d3a4c58fec4..a0f832362199 100644
--- a/drivers/rtc/rtc-s3c.c
+++ b/drivers/rtc/rtc-s3c.c
@@ -497,9 +497,7 @@ static int s3c_rtc_probe(struct platform_device *pdev)
 	device_init_wakeup(&pdev->dev, 1);
 
 	/* Check RTC Time */
-	s3c_rtc_gettime(&pdev->dev, &rtc_tm);
-
-	if (rtc_valid_tm(&rtc_tm)) {
+	if (s3c_rtc_gettime(&pdev->dev, &rtc_tm)) {
 		rtc_tm.tm_year	= 100;
 		rtc_tm.tm_mon	= 0;
 		rtc_tm.tm_mday	= 1;
-- 
1.9.1
