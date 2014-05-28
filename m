From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH v2 Resend 1/2] ARM: EXYNOS: Update secondary boot addr for secure mode
Date: Wed, 28 May 2014 09:43:01 +0530
Message-ID: <1401250382-24046-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f48.google.com ([209.85.220.48]:44642 "EHLO
	mail-pa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750774AbaE1EPY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 May 2014 00:15:24 -0400
Received: by mail-pa0-f48.google.com with SMTP id rd3so10253347pab.7
        for <linux-samsung-soc@vger.kernel.org>; Tue, 27 May 2014 21:15:24 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, tushar.behera@linaro.org, sachin.kamat@linaro.org, tomasz.figa@gmail.com

Almost all Exynos-series of SoCs that run in secure mode don't need
additional offset for every CPU, with Exynos4412 being the only
exception.

Tested on Origen-Quad (Exynos4412) and Arndale-Octa (Exynos5420).

While at it, fix the coding style (space around *).

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
 arch/arm/mach-exynos/firmware.c |    9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-exynos/firmware.c b/arch/arm/mach-exynos/firmware.c
index eb91d2350f8c..e8797bb78871 100644
--- a/arch/arm/mach-exynos/firmware.c
+++ b/arch/arm/mach-exynos/firmware.c
@@ -57,8 +57,13 @@ static int exynos_set_cpu_boot_addr(int cpu, unsigned long boot_addr)
 
 	boot_reg = sysram_ns_base_addr + 0x1c;
 
-	if (!soc_is_exynos4212() && !soc_is_exynos3250())
-		boot_reg += 4*cpu;
+	/*
+	 * Almost all Exynos-series of SoCs that run in secure mode don't need
+	 * additional offset for every CPU, with Exynos4412 being the only
+	 * exception.
+	 */
+	if (soc_is_exynos4412())
+		boot_reg += 4 * cpu;
 
 	__raw_writel(boot_addr, boot_reg);
 	return 0;
-- 
1.7.9.5
