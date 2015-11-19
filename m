From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] ARM: exynos_defconfig: add drivers for Exynos4210 Universal
 C210 board
Date: Thu, 19 Nov 2015 12:52:15 +0100
Message-ID: <1447933935-3091-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:58275 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754269AbbKSLw7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 19 Nov 2015 06:52:59 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NY2006JJ90AWMB0@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 19 Nov 2015 11:52:58 +0000 (GMT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

This patch enables drivers needed to get Exynos 4210 Universal C210 board
working: MAX8998 MFD and regulators, GPIO-based bit-bang SPI, Exynos DRM
FIMD parallel output and Samsung LD9040 RGB panel.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/configs/exynos_defconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index bb2d1f7..b3f9c75 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -90,6 +90,7 @@ CONFIG_I2C_ARB_GPIO_CHALLENGE=y
 CONFIG_I2C_GPIO=y
 CONFIG_I2C_CROS_EC_TUNNEL=y
 CONFIG_SPI=y
+CONFIG_SPI_GPIO=y
 CONFIG_SPI_S3C64XX=y
 CONFIG_DEBUG_GPIO=y
 CONFIG_POWER_SUPPLY=y
@@ -117,6 +118,7 @@ CONFIG_MFD_MAX14577=y
 CONFIG_MFD_MAX77686=y
 CONFIG_MFD_MAX77693=y
 CONFIG_MFD_MAX8997=y
+CONFIG_MFD_MAX8998=y
 CONFIG_MFD_SEC_CORE=y
 CONFIG_MFD_TPS65090=y
 CONFIG_REGULATOR=y
@@ -124,6 +126,7 @@ CONFIG_REGULATOR_FIXED_VOLTAGE=y
 CONFIG_REGULATOR_GPIO=y
 CONFIG_REGULATOR_MAX14577=y
 CONFIG_REGULATOR_MAX8997=y
+CONFIG_REGULATOR_MAX8998=y
 CONFIG_REGULATOR_MAX77686=y
 CONFIG_REGULATOR_MAX77693=y
 CONFIG_REGULATOR_MAX77802=y
@@ -142,8 +145,10 @@ CONFIG_DRM_EXYNOS=y
 CONFIG_DRM_EXYNOS_FIMD=y
 CONFIG_DRM_EXYNOS_DSI=y
 CONFIG_DRM_EXYNOS_MIXER=y
+CONFIG_DRM_EXYNOS_DPI=y
 CONFIG_DRM_EXYNOS_HDMI=y
 CONFIG_DRM_PANEL_SIMPLE=y
+CONFIG_DRM_PANEL_SAMSUNG_LD9040=y
 CONFIG_DRM_PANEL_SAMSUNG_S6E8AA0=y
 CONFIG_EXYNOS_VIDEO=y
 CONFIG_EXYNOS_MIPI_DSI=y
-- 
1.9.2
