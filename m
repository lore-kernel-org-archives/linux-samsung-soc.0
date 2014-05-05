From: Chander Kashyap <chander.kashyap@linaro.org>
Subject: [Patch v4 2/5] cpuidle: config: Add ARCH_EXYNOS entry to select cpuidle-big-little driver
Date: Mon,  5 May 2014 14:57:17 +0530
Message-ID: <1399282040-8995-3-git-send-email-chander.kashyap@linaro.org>
References: <1399278444-8312-3-git-send-email-chander.kashyap@linaro.org>
 <1399282040-8995-1-git-send-email-chander.kashyap@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f49.google.com ([209.85.220.49]:45052 "EHLO
	mail-pa0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755899AbaEEJ1o (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 5 May 2014 05:27:44 -0400
Received: by mail-pa0-f49.google.com with SMTP id lj1so3692646pab.22
        for <linux-samsung-soc@vger.kernel.org>; Mon, 05 May 2014 02:27:43 -0700 (PDT)
In-Reply-To: <1399282040-8995-1-git-send-email-chander.kashyap@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: lorenzo.pieralisi@arm.com, daniel.lezcano@linaro.org, rjw@rjwysocki.net, kgene.kim@samsung.com, Chander Kashyap <chander.kashyap@linaro.org>, Chander Kashyap <k.chander@samsung.com>

Add support to select generic big-little cpuidle driver for Samsung Exynos
series SoC's. This is required for Exynos big-llittle SoC's eg, Exynos5420.

Signed-off-by: Chander Kashyap <chander.kashyap@linaro.org>
Signed-off-by: Chander Kashyap <k.chander@samsung.com>
---
Changes in v4:
	1. Typo fixed from SOC_EXYNOS5420 to ARCH_EXYNOS
	2. Commit message updated
Changes in v3: None
Changes in v2:
	1. Changed config macro from SOC_EXYNOS5420 to ARCH_EXYNOS
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
