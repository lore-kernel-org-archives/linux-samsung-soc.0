From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: EXYNOS: fix CONFIG_DEBUG_LL
Date: Mon,  2 Apr 2012 12:13:57 -0700
Message-ID: <1333394037-19349-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f52.google.com ([209.85.210.52]:38648 "EHLO
	mail-pz0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751192Ab2DBTUX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Apr 2012 15:20:23 -0400
Received: by dake40 with SMTP id e40so2809534dak.11
        for <linux-samsung-soc@vger.kernel.org>; Mon, 02 Apr 2012 12:20:23 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Colin Cross <ccross@android.com>, Kukjin Kim <kgene.kim@samsung.com>

From: Colin Cross <ccross@android.com>

addruart cannot read from the physical address of the chipid
register, that will fail as soon as the mmu is turned on.
Fixing it to read from the physical or virtual address depending
on the mmu state also does not work, because there is a period
between head.S and exynos_map_io where the mmu is on, the uart
is mapped and used, but the chipid mapping is not yet present.

Fix addruart to use the ARM Main ID cp15 register to determine
if the core is Cortex A15 (EXYNOS5) or not (EXYNOS4).

Signed-off-by: Colin Cross <ccross@android.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-exynos/include/mach/debug-macro.S |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-exynos/include/mach/debug-macro.S b/arch/arm/mach-exynos/include/mach/debug-macro.S
index 6c857ff..e0c86ea 100644
--- a/arch/arm/mach-exynos/include/mach/debug-macro.S
+++ b/arch/arm/mach-exynos/include/mach/debug-macro.S
@@ -21,10 +21,9 @@
 	 */
 
 	.macro addruart, rp, rv, tmp
-		mov	\rp, #0x10000000
-		ldr	\rp, [\rp, #0x0]
-		and	\rp, \rp, #0xf00000
-		teq	\rp, #0x500000		@@ EXYNOS5
+		mrc	p15, 0, \tmp, c0, c0, 0
+		and	\tmp, \tmp, #0xf0
+		teq	\tmp, #0xf0		@@ A15
 		ldreq	\rp, =EXYNOS5_PA_UART
 		movne	\rp, #EXYNOS4_PA_UART	@@ EXYNOS4
 		ldr	\rv, =S3C_VA_UART
-- 
1.7.2.3
