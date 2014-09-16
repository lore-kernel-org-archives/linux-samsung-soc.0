From: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Subject: [PATCH 2/2] i2c: exynos5: Add Kconfig dependencies
Date: Tue, 16 Sep 2014 15:03:18 +0530
Message-ID: <1410859998-29285-3-git-send-email-ch.naveen@samsung.com>
References: <1410859998-29285-1-git-send-email-ch.naveen@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1410859998-29285-1-git-send-email-ch.naveen@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-i2c@vger.kernel.org
Cc: naveenkrishna.ch@gmail.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, sjg@chromium.org, grundler@chromium.org, linux-kernel@vger.kernel.org, wsa@the-dreams.de, cpgs@samsung.com, devicetree@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

The i2c-exynos5.c driver can be reused for the HSI2C controller
on Exynos7 SoCs from Samsung.

This patch adds the Kconfig dependency to choose i2c-exynos5.c
for CONFIG_ARCH_EXYNOS7.

Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Cc: Wolfram Sang <wsa@the-dreams.de>
---
 drivers/i2c/busses/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 2ac87fa..1f3b9cb 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -465,7 +465,7 @@ config I2C_EG20T
 
 config I2C_EXYNOS5
 	tristate "Exynos5 high-speed I2C driver"
-	depends on ARCH_EXYNOS5 && OF
+	depends on ARCH_EXYNOS && OF
 	default y
 	help
 	  High-speed I2C controller on Exynos5 based Samsung SoCs.
-- 
1.7.9.5
