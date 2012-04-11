From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH] ARM: EXYNOS: Fix Kconfig dependencies for device tree enabled machine files
Date: Wed, 11 Apr 2012 17:19:24 +0530
Message-ID: <1334144964-3282-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f52.google.com ([209.85.210.52]:34600 "EHLO
	mail-pz0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753317Ab2DKL5v (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 Apr 2012 07:57:51 -0400
Received: by dake40 with SMTP id e40so1104286dak.11
        for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Apr 2012 04:57:51 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

Add config dependency for Exynos4 and Exynos5 device tree enabled machine
files on config options ARCH_EXYNOS4 and ARCH_EXYNOS5 respectively.
Enabling machine support without proper ARCH support enabled is incorrect.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/mach-exynos/Kconfig |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index 801c738..2c35fd4 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -370,6 +370,7 @@ comment "Flattened Device Tree based board for EXYNOS SoCs"
 
 config MACH_EXYNOS4_DT
 	bool "Samsung Exynos4 Machine using device tree"
+	depends on ARCH_EXYNOS4
 	select CPU_EXYNOS4210
 	select USE_OF
 	select ARM_AMBA
@@ -382,6 +383,7 @@ config MACH_EXYNOS4_DT
 
 config MACH_EXYNOS5_DT
 	bool "SAMSUNG EXYNOS5 Machine using device tree"
+	depends on ARCH_EXYNOS5
 	select SOC_EXYNOS5250
 	select USE_OF
 	select ARM_AMBA
-- 
1.7.4.1
