From: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Subject: [PATCH 08/14] i2c: exynos5: Add Kconfig dependencies
Date: Wed, 27 Aug 2014 15:15:40 +0530
Message-ID: <1409132740-1954-2-git-send-email-ch.naveen@samsung.com>
References: <1409132740-1954-1-git-send-email-ch.naveen@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:41764 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932834AbaH0JuH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Aug 2014 05:50:07 -0400
In-reply-to: <1409132740-1954-1-git-send-email-ch.naveen@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
Cc: naveenkrishna.ch@gmail.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, cpgs@samsung.com, broonie@kernel.org, Wolfram Sang <wsa@the-dreams.de>

The i2c-exynos5.c driver can be reused for the HSI2C controller
on Exynos7 SoCs from Samsung.

This patch adds the Kconfig dependency to choose i2c-exynos5.c
for CONFIG_ARCH_EXYNOS7.

Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa@the-dreams.de>
---
 drivers/i2c/busses/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 2ac87fa..bd18fa6 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -465,7 +465,7 @@ config I2C_EG20T
 
 config I2C_EXYNOS5
 	tristate "Exynos5 high-speed I2C driver"
-	depends on ARCH_EXYNOS5 && OF
+	depends on (ARCH_EXYNOS5 || ARCH_EXYNOS7) && OF
 	default y
 	help
 	  High-speed I2C controller on Exynos5 based Samsung SoCs.
-- 
1.7.9.5
