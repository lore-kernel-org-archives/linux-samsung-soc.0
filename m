From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 2/2] ARM: multi_v7_defconfig: Enable missing drivers for
 supported Exynos boards
Date: Thu, 30 Nov 2017 10:10:04 +0100
Message-ID: <20171130091004.22971-2-m.szyprowski@samsung.com>
References: <20171130091004.22971-1-m.szyprowski@samsung.com>
        <CGME20171130091009eucas1p195871b12e598293afca3c74861b8c5ac@eucas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:34029 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751815AbdK3JKM (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 30 Nov 2017 04:10:12 -0500
In-reply-to: <20171130091004.22971-1-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Enable following drivers for recently merged devices:
- CEC and S5P CEC driver for all Exynos4 and Exynos5 boards with HDMI
- Sii9234 DRM HDMI-MHL bridge for Trats2
- dedicated Odroid ASoC machine driver for Odroid XU3/XU4

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/configs/multi_v7_defconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 61509c4b769f..833892568d31 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -557,6 +557,7 @@ CONFIG_REGULATOR_VEXPRESS=y
 CONFIG_REGULATOR_WM8994=m
 CONFIG_MEDIA_SUPPORT=m
 CONFIG_MEDIA_CAMERA_SUPPORT=y
+CONFIG_MEDIA_CEC_SUPPORT=y
 CONFIG_MEDIA_CONTROLLER=y
 CONFIG_VIDEO_V4L2_SUBDEV_API=y
 CONFIG_MEDIA_USB_SUPPORT=y
@@ -582,6 +583,8 @@ CONFIG_VIDEO_STI_DELTA=m
 CONFIG_VIDEO_RENESAS_JPU=m
 CONFIG_VIDEO_RENESAS_VSP1=m
 CONFIG_V4L_TEST_DRIVERS=y
+CONFIG_CEC_PLATFORM_DRIVERS=y
+CONFIG_VIDEO_SAMSUNG_S5P_CEC=m
 # CONFIG_MEDIA_SUBDRV_AUTOSELECT is not set
 CONFIG_VIDEO_ADV7180=m
 CONFIG_VIDEO_ML86V7667=m
@@ -613,6 +616,7 @@ CONFIG_DRM_TEGRA=y
 CONFIG_DRM_PANEL_SAMSUNG_LD9040=m
 CONFIG_DRM_PANEL_SAMSUNG_S6E8AA0=m
 CONFIG_DRM_PANEL_SIMPLE=y
+CONFIG_DRM_SII9234=m
 CONFIG_DRM_STI=m
 CONFIG_DRM_VC4=y
 CONFIG_FB_ARMCLCD=y
@@ -651,6 +655,7 @@ CONFIG_SND_SOC_SAMSUNG=m
 CONFIG_SND_SOC_SAMSUNG_SMDK_WM8994=m
 CONFIG_SND_SOC_SMDK_WM8994_PCM=m
 CONFIG_SND_SOC_SNOW=m
+CONFIG_SND_SOC_ODROID=m
 CONFIG_SND_SOC_SH4_FSI=m
 CONFIG_SND_SOC_RCAR=m
 CONFIG_SND_SIMPLE_SCU_CARD=m
-- 
2.15.0
