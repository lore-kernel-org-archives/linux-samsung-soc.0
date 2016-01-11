From: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH -next] arm: Select GPIO_GENERIC_PLATFORM for CRAGG_6410
Date: Mon, 11 Jan 2016 09:00:49 -0800
Message-ID: <1452531649-14940-1-git-send-email-linux@roeck-us.net>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:46940 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932421AbcAKRAx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 Jan 2016 12:00:53 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, Linus Walleij <linus.walleij@linaro.org>

Since commit 0f4630f3720e ("gpio: generic: factor into gpio_chip struct"),
all users of struct bgpio_pdata depend on GPIO_GENERIC.

This results in the following build error.

arch/arm/mach-s3c64xx/mach-crag6410.c:270:3: warning:
	excess elements in struct initializer
arch/arm/mach-s3c64xx/mach-crag6410.c:270:3: warning:
	(near initialization for '(anonymous)')
arch/arm/mach-s3c64xx/mach-crag6410.c:271:2: error:
	invalid use of undefined type 'struct bgpio_pdata'

Fixes: 0f4630f3720e ("gpio: generic: factor into gpio_chip struct")
Cc: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
I don't know if this is the correct way to fix this problem.
If not, please consider this to be a bug report.

 arch/arm/mach-s3c64xx/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-s3c64xx/Kconfig b/arch/arm/mach-s3c64xx/Kconfig
index 7c0c420c3016..98d2aa9393f1 100644
--- a/arch/arm/mach-s3c64xx/Kconfig
+++ b/arch/arm/mach-s3c64xx/Kconfig
@@ -310,6 +310,7 @@ config MACH_WLF_CRAGG_6410
 	depends on I2C=y
 	select CPU_S3C6410
 	select LEDS_GPIO_REGISTER
+	select GPIO_GENERIC_PLATFORM
 	select S3C64XX_DEV_SPI0
 	select S3C64XX_SETUP_FB_24BPP
 	select S3C64XX_SETUP_I2C1
-- 
2.1.4
