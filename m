From: Chander Kashyap <chander.kashyap@linaro.org>
Subject: [Patch v3 2/5] cpuidle: config: Add ARCH_EXYNOS entry to select cpuidle-big-little driver
Date: Mon,  5 May 2014 13:57:21 +0530
Message-ID: <1399278444-8312-3-git-send-email-chander.kashyap@linaro.org>
References: <1398245154-18771-1-git-send-email-chander.kashyap@linaro.org>
 <1399278444-8312-1-git-send-email-chander.kashyap@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f172.google.com ([209.85.223.172]:42073 "EHLO
	mail-ie0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755059AbaEEI1r (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 5 May 2014 04:27:47 -0400
Received: by mail-ie0-f172.google.com with SMTP id as1so7852888iec.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 05 May 2014 01:27:47 -0700 (PDT)
In-Reply-To: <1399278444-8312-1-git-send-email-chander.kashyap@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: lorenzo.pieralisi@arm.com, daniel.lezcano@linaro.org, rjw@rjwysocki.net, kgene.kim@samsung.com, Chander Kashyap <chander.kashyap@linaro.org>, Chander Kashyap <k.chander@samsung.com>

Exynos5420 is a big-little SoC from Samsung. It has 4 A15 and 4 A7 cores.
In order to use generic cpuidle-big-little driver, this patch adds Exynos5420
specific check to initialize generic cpuidle driver.

Signed-off-by: Chander Kashyap <chander.kashyap@linaro.org>
Signed-off-by: Chander Kashyap <k.chander@samsung.com>
---
Changes in v3: None
Changes in v2:
	1. Changed config macro from SOC_EXYNOS5420 to SOC_EXYNOS5420
 drivers/cpuidle/Kconfig.arm |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpuidle/Kconfig.arm b/drivers/cpuidle/Kconfig.arm
index 97ccc31..d9596e7 100644
--- a/drivers/cpuidle/Kconfig.arm
+++ b/drivers/cpuidle/Kconfig.arm
@@ -4,7 +4,7 @@
 
 config ARM_BIG_LITTLE_CPUIDLE
 	bool "Support for ARM big.LITTLE processors"
-	depends on ARCH_VEXPRESS_TC2_PM
+	depends on ARCH_VEXPRESS_TC2_PM || ARCH_EXYNOS
 	select ARM_CPU_SUSPEND
 	select CPU_IDLE_MULTIPLE_DRIVERS
 	help
-- 
1.7.9.5
