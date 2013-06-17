From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH 2/2] ARM: exynos_defconfig: Enable RTC driver
Date: Mon, 17 Jun 2013 09:48:06 +0530
Message-ID: <1371442686-24999-3-git-send-email-tushar.behera@linaro.org>
References: <1371442686-24999-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f48.google.com ([209.85.220.48]:55256 "EHLO
	mail-pa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750937Ab3FQEdk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Jun 2013 00:33:40 -0400
Received: by mail-pa0-f48.google.com with SMTP id kp12so2425085pab.7
        for <linux-samsung-soc@vger.kernel.org>; Sun, 16 Jun 2013 21:33:40 -0700 (PDT)
In-Reply-To: <1371442686-24999-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, olof@lixom.net, patches@linaro.org

The issues reported in commit 522ccdb6fd0e ("ARM: dts: Disable the RTC
by default on exynos5") are no longer reproduced on EXYNOS5250 based
systems.

Hence it would be better to re-enable RTC support for EXYNOS5250.

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
 arch/arm/configs/exynos_defconfig |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index 9ab979a..ad7dfbb 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -105,6 +105,8 @@ CONFIG_MMC_SDHCI_S3C=y
 CONFIG_MMC_DW=y
 CONFIG_MMC_DW_IDMAC=y
 CONFIG_MMC_DW_EXYNOS=y
+CONFIG_RTC_CLASS=y
+CONFIG_RTC_DRV_S3C=y
 CONFIG_COMMON_CLK_MAX77686=y
 CONFIG_EXT2_FS=y
 CONFIG_EXT3_FS=y
-- 
1.7.9.5
