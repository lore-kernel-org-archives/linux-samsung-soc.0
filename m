From: Sachin Kamat <sachin.kamat@samsung.com>
Subject: [PATCH 1/1] i2c: Kconfig: Enable HSI2C for Exynos5 platform
Date: Wed, 25 Jun 2014 15:32:03 +0530
Message-ID: <1403690523-1863-1-git-send-email-sachin.kamat@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f173.google.com ([209.85.192.173]:54514 "EHLO
	mail-pd0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752444AbaFYKFW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Jun 2014 06:05:22 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-i2c@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, wsa@the-dreams.de, spk.linux@gmail.com, kgene.kim@samsung.com, Doug Anderson <dianders@chromium.org>

All Exynos5 platforms have HSI2C controllers and are needed by
various IPs connected to the boards based on these SoCs. Thus
select this by default for Exynos5 platforms.

Signed-off-by: Sachin Kamat <sachin.kamat@samsung.com>
Cc: Doug Anderson <dianders@chromium.org>
---
 drivers/i2c/busses/Kconfig |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 9f7d5859cf65..c7918cffe790 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -465,9 +465,9 @@ config I2C_EG20T
 config I2C_EXYNOS5
 	tristate "Exynos5 high-speed I2C driver"
 	depends on ARCH_EXYNOS5 && OF
+	default y
 	help
-	  Say Y here to include support for high-speed I2C controller in the
-	  Exynos5 based Samsung SoCs.
+	  High-speed I2C controller on Exynos5 based Samsung SoCs.
 
 config I2C_GPIO
 	tristate "GPIO-based bitbanging I2C"
-- 
1.7.9.5
