From: Chander Kashyap <chander.kashyap@linaro.org>
Subject: [PATCH] ARM: EXYNOS: update secondary startup code to use 24 bits of MPIDR
Date: Tue, 12 Feb 2013 11:02:11 +0530
Message-ID: <1360647131-18461-1-git-send-email-chander.kashyap@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f50.google.com ([74.125.83.50]:34149 "EHLO
	mail-ee0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750909Ab3BLFcg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Feb 2013 00:32:36 -0500
Received: by mail-ee0-f50.google.com with SMTP id e51so3797932eek.9
        for <linux-samsung-soc@vger.kernel.org>; Mon, 11 Feb 2013 21:32:35 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, lorenzo.pieralisi@arm.com, patches@linaro.org, linaro-dev@lists.linaro.org, Chander Kashyap <chander.kashyap@linaro.org>, Inderpal Singh <inderpal.singh@linaro.org>

Commit a0ae0240507... "ARM: kernel: add device tree init map function" started
using 24 LSBs of MPIDR to calculate the cpu_logical_map. Hence update the same
in exynos_secondary_startup code.

Signed-off-by: Chander Kashyap <chander.kashyap@linaro.org>
Signed-off-by: Inderpal Singh <inderpal.singh@linaro.org>
---
 arch/arm/mach-exynos/headsmp.S |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-exynos/headsmp.S b/arch/arm/mach-exynos/headsmp.S
index 5364d4b..5c1c24a 100644
--- a/arch/arm/mach-exynos/headsmp.S
+++ b/arch/arm/mach-exynos/headsmp.S
@@ -22,7 +22,7 @@
  */
 ENTRY(exynos4_secondary_startup)
 	mrc	p15, 0, r0, c0, c0, 5
-	and	r0, r0, #15
+	and	r0, r0, #0xffffff
 	adr	r4, 1f
 	ldmia	r4, {r5, r6}
 	sub	r4, r4, r5
-- 
1.7.9.5
