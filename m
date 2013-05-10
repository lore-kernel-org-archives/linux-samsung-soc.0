From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH] ARM: EXYNOS: Update defconfig for Arndale and Origen board
Date: Fri, 10 May 2013 12:19:59 +0530
Message-ID: <1368168599-28507-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f47.google.com ([209.85.220.47]:43252 "EHLO
	mail-pa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750893Ab3EJHDM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 10 May 2013 03:03:12 -0400
Received: by mail-pa0-f47.google.com with SMTP id kl13so2708288pab.34
        for <linux-samsung-soc@vger.kernel.org>; Fri, 10 May 2013 00:03:12 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, olof@lixom.net, dianders@chromium.org, patches@linaro.org

It updates following drivers for EXYNOS based DT platform.

* S5M8767 driver
* MAX8997 driver
* MMC SDHCI driver

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---

This patch is based on Olof's following patch.
"[PATCH] ARM: exynos: defconfig update"
https://lkml.org/lkml/2013/5/9/455

 arch/arm/configs/exynos_defconfig |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index 469b5cc..eeae7bb 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -70,11 +70,15 @@ CONFIG_DEBUG_GPIO=y
 CONFIG_MFD_CROS_EC=y
 CONFIG_MFD_CROS_EC_I2C=y
 CONFIG_MFD_MAX77686=y
+CONFIG_MFD_MAX8997=y
+CONFIG_MFD_SEC_CORE=y
 CONFIG_MFD_TPS65090=y
 CONFIG_REGULATOR=y
 CONFIG_REGULATOR_FIXED_VOLTAGE=y
 CONFIG_REGULATOR_GPIO=y
+CONFIG_REGULATOR_MAX8997=y
 CONFIG_REGULATOR_MAX77686=y
+CONFIG_REGULATOR_S5M8767=y
 CONFIG_REGULATOR_TPS65090=y
 CONFIG_FB=y
 CONFIG_FB_MODE_HELPERS=y
@@ -96,6 +100,8 @@ CONFIG_USB_PHY=y
 CONFIG_SAMSUNG_USB2PHY=y
 CONFIG_SAMSUNG_USB3PHY=y
 CONFIG_MMC=y
+CONFIG_MMC_SDHCI=y
+CONFIG_MMC_SDHCI_S3C=y
 CONFIG_MMC_DW=y
 CONFIG_MMC_DW_IDMAC=y
 CONFIG_MMC_DW_EXYNOS=y
-- 
1.7.9.5
