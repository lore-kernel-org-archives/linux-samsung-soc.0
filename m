From: Santosh Shukla <santosh.shukla@linaro.org>
Subject: [PATCH v2] ARM: Exynos : Fix build error with thumb2
Date: Mon, 26 May 2014 20:59:47 +0530
Message-ID: <1401118187-10844-1-git-send-email-santosh.shukla@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f51.google.com ([209.85.160.51]:56887 "EHLO
	mail-pb0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751984AbaEZPai (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 May 2014 11:30:38 -0400
Received: by mail-pb0-f51.google.com with SMTP id ma3so7904823pbc.10
        for <linux-samsung-soc@vger.kernel.org>; Mon, 26 May 2014 08:30:38 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: viresh.kumar@linaro.org, kgene.kim@samsung.com, thomas.abraham@linaro.org, t.figa@samsung.com, linux-samsung-soc@vger.kernel.org
Cc: linaro-kernel@lists.linaro.org, santosh shukla <santosh.shukla@linaro.org>

From: santosh shukla <santosh.shukla@linaro.org>

add non-global symbol .LLl2x0_regs_phys to avoid build break in thumb2 mode.

IIUC, arm assembler fail to load value of "global" variable
l2xo_regs_phys for thum2 mode and wrapping it in non-global symbol like
.Ll2x0_regs_phys solves the build break issue.

arch/arm/mach-exynos/sleep.S: Assembler messages:
arch/arm/mach-exynos/sleep.S:57: Error: invalid immediate for address
calculation (value = 0x00000004)

fix inspired from [1]

[1] : https://lkml.org/lkml/2010/3/31/235

Signed-off-by: santosh shukla <santosh.shukla@linaro.org>
---
 arch/arm/mach-exynos/sleep.S |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-exynos/sleep.S b/arch/arm/mach-exynos/sleep.S
index a2613e9..dc8c6b6 100644
--- a/arch/arm/mach-exynos/sleep.S
+++ b/arch/arm/mach-exynos/sleep.S
@@ -54,7 +54,7 @@ ENTRY(exynos_cpu_resume)
 	ldr	r1, =CPU_CORTEX_A9
 	cmp	r0, r1
 	bne	skip_l2_resume
-	adr	r0, l2x0_regs_phys
+	adr	r0, .Ll2x0_regs_phys
 	ldr	r0, [r0]
 	cmp	r0, #0
 	beq	skip_l2_resume
@@ -79,6 +79,8 @@ skip_l2_resume:
 	b	cpu_resume
 ENDPROC(exynos_cpu_resume)
 #ifdef CONFIG_CACHE_L2X0
+
+.Ll2x0_regs_phys:
 	.globl l2x0_regs_phys
 l2x0_regs_phys:
 	.long	0
-- 
1.7.9.5
