From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH 1/2] ARM: EXYNOS: Add secure firmware support for Exynos5420
Date: Mon, 19 May 2014 16:39:16 +0530
Message-ID: <1400497757-18991-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f47.google.com ([209.85.220.47]:41604 "EHLO
	mail-pa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754075AbaESLLU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 May 2014 07:11:20 -0400
Received: by mail-pa0-f47.google.com with SMTP id lf10so5608047pab.6
        for <linux-samsung-soc@vger.kernel.org>; Mon, 19 May 2014 04:11:20 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, Sachin Kamat <sachin.kamat@linaro.org>

From: Sachin Kamat <sachin.kamat@linaro.org>

Updated secondary boot register offset for Exynos5420 in case of
secure booting.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---

The patches are based on top of next-20140519. With these two patches applied,
we can get all A15 cores booting up on Arndale-Octa board.

 arch/arm/mach-exynos/firmware.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-exynos/firmware.c b/arch/arm/mach-exynos/firmware.c
index 739bdc8..5e0902e 100644
--- a/arch/arm/mach-exynos/firmware.c
+++ b/arch/arm/mach-exynos/firmware.c
@@ -50,7 +50,7 @@ static int exynos_set_cpu_boot_addr(int cpu, unsigned long boot_addr)
 
 	boot_reg = sysram_ns_base_addr + 0x1c;
 
-	if (!soc_is_exynos4212())
+	if (!soc_is_exynos4212() && !soc_is_exynos5420())
 		boot_reg += 4*cpu;
 
 	__raw_writel(boot_addr, boot_reg);
-- 
1.7.9.5
