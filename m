From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH] ARM: EXYNOS: Fix incorrect help text
Date: Tue, 28 Aug 2012 13:37:54 +0530
Message-ID: <1346141274-5244-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:40674 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751334Ab2H1IKR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 28 Aug 2012 04:10:17 -0400
Received: by dady13 with SMTP id y13so3137538dad.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Aug 2012 01:10:17 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

Changed Exynos4 -> Exynos5.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/mach-exynos/Kconfig |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index b5b4c8c..9369ff7 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -418,8 +418,8 @@ config MACH_EXYNOS5_DT
 	select USE_OF
 	select ARM_AMBA
 	help
-	  Machine support for Samsung Exynos4 machine with device tree enabled.
-	  Select this if a fdt blob is available for the EXYNOS4 SoC based board.
+	  Machine support for Samsung Exynos5 machine with device tree enabled.
+	  Select this if a fdt blob is available for the EXYNOS5 SoC based board.
 
 if ARCH_EXYNOS4
 
-- 
1.7.4.1
