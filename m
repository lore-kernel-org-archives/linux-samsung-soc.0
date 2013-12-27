From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/1] ARM: exynos_defconfig: Fix a config option
Date: Fri, 27 Dec 2013 16:08:10 +0530
Message-ID: <1388140690-30668-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f44.google.com ([209.85.160.44]:37906 "EHLO
	mail-pb0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754465Ab3L0Kll (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 Dec 2013 05:41:41 -0500
Received: by mail-pb0-f44.google.com with SMTP id rq2so9122881pbb.31
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Dec 2013 02:41:41 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

CONFIG_MACH_EXYNOS4_DT does not exist. Use ARCH_EXYNOS4 instead.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/configs/exynos_defconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index dbe1f1c47bb0..dff01ecf78cc 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -10,8 +10,8 @@ CONFIG_PARTITION_ADVANCED=y
 CONFIG_ARCH_EXYNOS=y
 CONFIG_S3C_LOWLEVEL_UART_PORT=3
 CONFIG_S3C24XX_PWM=y
+CONFIG_ARCH_EXYNOS4=y
 CONFIG_ARCH_EXYNOS5=y
-CONFIG_MACH_EXYNOS4_DT=y
 CONFIG_SMP=y
 CONFIG_NR_CPUS=8
 CONFIG_PREEMPT=y
-- 
1.7.9.5
