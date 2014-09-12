From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH] ARM: exynos_defconfig: Enable Maxim 77693 and I2C GPIO drivers
Date: Fri, 12 Sep 2014 14:03:54 +0200
Message-ID: <1410523434-10645-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:43546 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754395AbaILMEL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Sep 2014 08:04:11 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene.kim@samsung.com>, Sachin Kamat <sachin.kamat@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tushar Behera <tushar.behera@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>

The Exynos System-on-Chips have ~7 distinctive I2C IO ports (exact
number depends on chip). However some integrated circuits on board, also
using I2C protocol for communication, can be connected to the SoC by
other GPIO. Enabling the I2C GPIO driver allows using such additional
integrated circuits.

An example of such chip using I2C and connected over GPIO to SoC is
Maxim 77693 MUIC on Trats2 board. The regulator driver of Maxim
77693 offers charger and safeout LDO (necessary for USB OTG).

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 arch/arm/configs/exynos_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index fc7d1683bf67..6dd5252f73f4 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -71,6 +71,7 @@ CONFIG_I2C=y
 CONFIG_I2C_MUX=y
 CONFIG_I2C_ARB_GPIO_CHALLENGE=y
 CONFIG_I2C_EXYNOS5=y
+CONFIG_I2C_GPIO=y
 CONFIG_I2C_CROS_EC_TUNNEL=y
 CONFIG_SPI=y
 CONFIG_SPI_S3C64XX=y
@@ -88,6 +89,7 @@ CONFIG_MFD_CROS_EC=y
 CONFIG_MFD_CROS_EC_I2C=y
 CONFIG_MFD_CROS_EC_SPI=y
 CONFIG_MFD_MAX77686=y
+CONFIG_MFD_MAX77693=y
 CONFIG_MFD_MAX8997=y
 CONFIG_MFD_SEC_CORE=y
 CONFIG_MFD_TPS65090=y
@@ -96,6 +98,7 @@ CONFIG_REGULATOR_FIXED_VOLTAGE=y
 CONFIG_REGULATOR_GPIO=y
 CONFIG_REGULATOR_MAX8997=y
 CONFIG_REGULATOR_MAX77686=y
+CONFIG_REGULATOR_MAX77693=y
 CONFIG_REGULATOR_S2MPA01=y
 CONFIG_REGULATOR_S2MPS11=y
 CONFIG_REGULATOR_S5M8767=y
-- 
1.9.1
