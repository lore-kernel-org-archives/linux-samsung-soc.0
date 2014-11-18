From: Tyler Baker <tyler.baker@linaro.org>
Subject: [PATCH] ARM: multi_v7_defconfig: fix failure setting CPU voltage by enabling dependent I2C controller
Date: Tue, 18 Nov 2014 11:10:53 -0800
Message-ID: <1416337853-1558-1-git-send-email-tyler.baker@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f176.google.com ([209.85.192.176]:33553 "EHLO
	mail-pd0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755051AbaKRTLZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Nov 2014 14:11:25 -0500
Received: by mail-pd0-f176.google.com with SMTP id y10so4578543pdj.35
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Nov 2014 11:11:25 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Cc: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, Tyler Baker <tyler.baker@linaro.org>

This patch fixes a long standing issue introduced during the 3.16 merge window.
Shortly after the merge, exynos5250-based arndale boards began to produce the 
following errors:

kern.err kernel:  exynos-cpufreq exynos-cpufreq: failed to set cpu voltage
kern.err kernel:  cpufreq: __target_index: Failed to change cpu frequency: -22

Further analysis revealed that the S5M8767 voltage regulator used on the 
exynos5250-based arndale board utilizes the S3C2410 I2C controller. If the 
S3C2410 I2C controller driver is not enabled, the S5M8767 voltage regulator 
fails to probe. Therefore a dependency exists between these two drivers. 
In the exynos_defconfig both CONFIG_REGULATOR_S5M8767 and CONFIG_I2C_S3C2410 
options are enabled, and no errors are produced. However, in the 
multi_v7_defconfig only the CONFIG_REGULATOR_S5M8767 option is enabled and the 
errors are present. So let's enable the CONFIG_I2C_S3C2410 option in the 
multi_v7_defconfig to allow the S5M8767 voltage regulator to probe.

Signed-off-by: Tyler Baker <tyler.baker@linaro.org>
---
This issue was reported [1]. I've also confirmed this fix on two different 
arndale boards.

[1] https://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg38765.html

 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 3487046..9d7a32f 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -217,6 +217,7 @@ CONFIG_I2C_CADENCE=y
 CONFIG_I2C_DESIGNWARE_PLATFORM=y
 CONFIG_I2C_EXYNOS5=y
 CONFIG_I2C_MV64XXX=y
+CONFIG_I2C_S3C2410=y
 CONFIG_I2C_SIRF=y
 CONFIG_I2C_TEGRA=y
 CONFIG_I2C_ST=y
-- 
2.1.3
