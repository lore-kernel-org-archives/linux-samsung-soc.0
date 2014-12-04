From: Tyler Baker <tyler.baker@linaro.org>
Subject: [PATCH] ARM: multi_v7_defconfig: enable MAX77686 PMIC drivers for exynos4412-prime based SoCs
Date: Thu,  4 Dec 2014 13:24:24 -0800
Message-ID: <1417728264-7268-1-git-send-email-tyler.baker@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f48.google.com ([209.85.220.48]:54473 "EHLO
	mail-pa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932911AbaLDVYy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 4 Dec 2014 16:24:54 -0500
Received: by mail-pa0-f48.google.com with SMTP id rd3so18771891pab.21
        for <linux-samsung-soc@vger.kernel.org>; Thu, 04 Dec 2014 13:24:54 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, Tyler Baker <tyler.baker@linaro.org>

This patch enables the MAX77686 PMIC drivers in the multi_v7_defconfig used
on exynos4412-prime family of SoCs [1]. The exynos4412-prime based boards
are producing the following runtime errors only on the multi_v7_defconfig [2]:

kern.err: deviceless supply vdd_arm not found, using dummy regulator
kern.err: exynos-cpufreq exynos-cpufreq: failed to set cpu voltage to 1287500
kern.err: cpufreq: __target_index: Failed to change cpu frequency: -22

I reviewed the exynos_defconfig, which does not produce these runtime
errors. It was obvious that the exynos_defconfig has the PMIC drivers
enabled, whereas the multi_v7_defconfig does not. This patch has been tested 
on a odroid-u2 and a odroid-u3 board. It has resolved the runtime errors.
Therefore, I purpose we enabled these drivers in the multi_v7_defconfig.

[1] http://www.hardkernel.com/main/products/prdt_info.php?g_code=G135270682824
[2] http://storage.armcloud.us/kernel-ci/mainline/v3.18-rc7-48-g7cc78f8/arm-multi_v7_defconfig/lab-tbaker-00/boot-exynos4412-odroidu3.html

Signed-off-by: Tyler Baker <tyler.baker@linaro.org>
---
 arch/arm/configs/multi_v7_defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 930bfcb..d789658 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -280,6 +280,7 @@ CONFIG_MFD_AS3722=y
 CONFIG_MFD_BCM590XX=y
 CONFIG_MFD_CROS_EC=y
 CONFIG_MFD_CROS_EC_SPI=y
+CONFIG_MFD_MAX77686=y
 CONFIG_MFD_MAX8907=y
 CONFIG_MFD_SEC_CORE=y
 CONFIG_MFD_STMPE=y
@@ -294,6 +295,7 @@ CONFIG_REGULATOR_GPIO=y
 CONFIG_MFD_SYSCON=y
 CONFIG_POWER_RESET_SYSCON=y
 CONFIG_REGULATOR_MAX8907=y
+CONFIG_REGULATOR_MAX77686=y
 CONFIG_REGULATOR_PALMAS=y
 CONFIG_REGULATOR_S2MPS11=y
 CONFIG_REGULATOR_S5M8767=y
@@ -399,6 +401,7 @@ CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_AS3722=y
 CONFIG_RTC_DRV_DS1307=y
 CONFIG_RTC_DRV_MAX8907=y
+CONFIG_RTC_DRV_MAX77686=y
 CONFIG_RTC_DRV_PALMAS=y
 CONFIG_RTC_DRV_TWL4030=y
 CONFIG_RTC_DRV_TPS6586X=y
@@ -433,6 +436,7 @@ CONFIG_NVEC_POWER=y
 CONFIG_NVEC_PAZ00=y
 CONFIG_QCOM_GSBI=y
 CONFIG_COMMON_CLK_QCOM=y
+CONFIG_COMMON_CLK_MAX77686=y
 CONFIG_APQ_MMCC_8084=y
 CONFIG_MSM_GCC_8660=y
 CONFIG_MSM_MMCC_8960=y
-- 
2.1.3
