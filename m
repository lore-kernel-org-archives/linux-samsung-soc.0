From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH] mfd: sec-core: Remove unused s2mpu02-rtc and s2mpu02-clk
 children
Date: Fri, 30 Oct 2015 16:51:21 +0900
Message-ID: <1446191481-21214-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:44199 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758651AbbJ3Hvb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 30 Oct 2015 03:51:31 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sangbeom Kim <sbkim73@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Lee Jones <lee.jones@linaro.org>, Chanwoo Choi <cw00.choi@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org

The commit 54e8827d5f0e ("mfd: sec-core: Add support for S2MPU02
device") added new MFD child devices for S2MPU02: RTC and clock
provider (the clock provider with new compatible). However support for
these devices was not added to existing drivers (rtc-s5m, clk-s2mps11).
New drivers were not submitted neither.

This means that the name of children devices is completely unused. The
"samsung,s2mpu02-clk" compatible remains undocumented so it is unclear
what is provided by that compatible.

Clean up this by removing unused child devices and undocumented
compatible.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

---

I don't think that removing the "samsung,s2mpu02-clk" compatible would
be considered as ABI break because:
1. Kernel did not document it as ABI.
2. Kernel did not provide any kind of feature for that compatible. It
   was totally ignored.
---
 drivers/mfd/sec-core.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
index 2626fc0b5b8c..989076d6cb83 100644
--- a/drivers/mfd/sec-core.c
+++ b/drivers/mfd/sec-core.c
@@ -103,12 +103,9 @@ static const struct mfd_cell s2mpa01_devs[] = {
 };
 
 static const struct mfd_cell s2mpu02_devs[] = {
-	{ .name = "s2mpu02-pmic", },
-	{ .name = "s2mpu02-rtc", },
 	{
-		.name = "s2mpu02-clk",
-		.of_compatible = "samsung,s2mpu02-clk",
-	}
+		.name = "s2mpu02-pmic",
+	},
 };
 
 #ifdef CONFIG_OF
-- 
1.9.1
