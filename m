From: Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH 5/7] ARM: exynos_defconfig: Normalize exynos defconfig
Date: Mon, 19 Oct 2015 11:33:53 +0530
Message-ID: <1445234635-3950-6-git-send-email-alim.akhtar@samsung.com>
References: <1445234635-3950-1-git-send-email-alim.akhtar@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:37169 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751987AbbJSGQl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Oct 2015 02:16:41 -0400
In-reply-to: <1445234635-3950-1-git-send-email-alim.akhtar@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene@kernel.org, k.kozlowski@samsung.com, javier@osg.samsung.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org

make savedefconfig result in some difference, lets normalize the
defconfig.

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
---
 arch/arm/configs/exynos_defconfig |    8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index 1ff2bfa2e183..3349713e6c63 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -99,10 +99,8 @@ CONFIG_SENSORS_LM90=y
 CONFIG_SENSORS_NTC_THERMISTOR=y
 CONFIG_SENSORS_PWM_FAN=y
 CONFIG_SENSORS_INA2XX=y
-CONFIG_THERMAL=y
 CONFIG_CPU_THERMAL=y
 CONFIG_THERMAL_EMULATION=y
-CONFIG_EXYNOS_THERMAL=y
 CONFIG_WATCHDOG=y
 CONFIG_S3C2410_WATCHDOG=y
 CONFIG_MFD_CROS_EC=y
@@ -127,14 +125,14 @@ CONFIG_REGULATOR_S2MPS11=y
 CONFIG_REGULATOR_S5M8767=y
 CONFIG_REGULATOR_TPS65090=y
 CONFIG_DRM=y
-CONFIG_DRM_NXP_PTN3460=y
-CONFIG_DRM_PARADE_PS8622=y
 CONFIG_DRM_EXYNOS=y
 CONFIG_DRM_EXYNOS_FIMD=y
 CONFIG_DRM_EXYNOS_DSI=y
 CONFIG_DRM_EXYNOS_HDMI=y
 CONFIG_DRM_PANEL_SIMPLE=y
 CONFIG_DRM_PANEL_SAMSUNG_S6E8AA0=y
+CONFIG_DRM_NXP_PTN3460=y
+CONFIG_DRM_PARADE_PS8622=y
 CONFIG_FB_SIMPLE=y
 CONFIG_EXYNOS_VIDEO=y
 CONFIG_EXYNOS_MIPI_DSI=y
@@ -175,7 +173,6 @@ CONFIG_RTC_DRV_S5M=y
 CONFIG_RTC_DRV_S3C=y
 CONFIG_DMADEVICES=y
 CONFIG_PL330_DMA=y
-CONFIG_CHROME_PLATFORMS=y
 CONFIG_CROS_EC_CHARDEV=y
 CONFIG_COMMON_CLK_MAX77686=y
 CONFIG_COMMON_CLK_MAX77802=y
@@ -190,7 +187,6 @@ CONFIG_PWM_SAMSUNG=y
 CONFIG_PHY_EXYNOS5250_SATA=y
 CONFIG_EXT2_FS=y
 CONFIG_EXT3_FS=y
-CONFIG_EXT4_FS=y
 CONFIG_MSDOS_FS=y
 CONFIG_VFAT_FS=y
 CONFIG_TMPFS=y
-- 
1.7.10.4
