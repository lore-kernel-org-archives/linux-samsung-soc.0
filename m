From: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Subject: [PATCH] ARM: config: update multi_v7_defconfig
Date: Tue, 15 Jul 2014 13:32:26 +0530
Message-ID: <1405411346-12471-1-git-send-email-ch.naveen@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:65391 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757363AbaGOIGB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Jul 2014 04:06:01 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N8Q003WVUHZD280@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 15 Jul 2014 17:05:59 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: dianders@chromium.org, olofj@chromium.org, cpgs@samsung.com

Enabled S3C24XX I2C driver and MAX77686 PMIC MFD and Voltage
regulator drivers used on Exynos5250 based Snow board.

Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
---
By enabling the symbols to compile S3C24XX I2C driver, MAX77686 PMIC
under MFD and REGULATOR.

http://arm-soc.lixom.net/bootlogs/next/next-20140711/snow-multi_v7_defconfig.html
The warnings by cpufreq on Snow board are fixed.

Booted and verified on  on Exynos5420 based Snow board

 arch/arm/configs/multi_v7_defconfig |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 5348364..1aaf91d 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -193,6 +193,7 @@ CONFIG_I2C_CADENCE=y
 CONFIG_I2C_DESIGNWARE_PLATFORM=y
 CONFIG_I2C_EXYNOS5=y
 CONFIG_I2C_MV64XXX=y
+CONFIG_I2C_S3C2410=y
 CONFIG_I2C_SIRF=y
 CONFIG_I2C_TEGRA=y
 CONFIG_SPI=y
@@ -231,6 +232,7 @@ CONFIG_MFD_AS3722=y
 CONFIG_MFD_BCM590XX=y
 CONFIG_MFD_CROS_EC=y
 CONFIG_MFD_CROS_EC_SPI=y
+CONFIG_MFD_MAX77686=y
 CONFIG_MFD_MAX8907=y
 CONFIG_MFD_SEC_CORE=y
 CONFIG_MFD_PALMAS=y
@@ -243,6 +245,7 @@ CONFIG_REGULATOR_AS3722=y
 CONFIG_REGULATOR_BCM590XX=y
 CONFIG_REGULATOR_GPIO=y
 CONFIG_REGULATOR_MAX8907=y
+CONFIG_REGULATOR_MAX77686=y
 CONFIG_REGULATOR_PALMAS=y
 CONFIG_REGULATOR_S2MPS11=y
 CONFIG_REGULATOR_S5M8767=y
-- 
1.7.9.5
