From: Inderpal Singh <inderpal.singh@linaro.org>
Subject: [PATCH v3] arm: plat-samsung: check processor type before cache restoration in resume
Date: Wed, 27 Feb 2013 16:06:03 +0530
Message-ID: <1361961363-28412-1-git-send-email-inderpal.singh@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-da0-f44.google.com ([209.85.210.44]:57784 "EHLO
	mail-da0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751937Ab3B0KgX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Feb 2013 05:36:23 -0500
Received: by mail-da0-f44.google.com with SMTP id z20so237478dae.31
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Feb 2013 02:36:22 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: linux@arm.linux.org.uk, kgene.kim@samsung.com, patches@linaro.org

Only cortex-a9 based samsung platforms have l2x0 cache controller. Hence check
the same before restoring the cache in resume.

This is needed for single kernel image.

Signed-off-by: Inderpal Singh <inderpal.singh@linaro.org>
---
changes in v2:
        - check processor midr instead of checking all soc ids as
        suggested by Kukjin

changes in v3:
	- simplify by reading midr in assembly as per Russell

 arch/arm/plat-samsung/s5p-sleep.S |    9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/plat-samsung/s5p-sleep.S b/arch/arm/plat-samsung/s5p-sleep.S
index bdf6dad..6e15993 100644
--- a/arch/arm/plat-samsung/s5p-sleep.S
+++ b/arch/arm/plat-samsung/s5p-sleep.S
@@ -25,6 +25,9 @@
 #include <asm/asm-offsets.h>
 #include <asm/hardware/cache-l2x0.h>
 
+#define CPU_MASK	0xff0ffff0
+#define CPU_CORTEX_A9	0x410fc090
+
 /*
  *	 The following code is located into the .data section. This is to
  *	 allow l2x0_regs_phys to be accessed with a relative load while we
@@ -51,6 +54,12 @@
 
 ENTRY(s3c_cpu_resume)
 #ifdef CONFIG_CACHE_L2X0
+	mrc     p15, 0, r0, c0, c0, 0
+	ldr	r1, =CPU_MASK
+	and	r0, r0, r1
+	ldr	r1, =CPU_CORTEX_A9
+	cmp	r0, r1
+	bne	resume_l2on
 	adr	r0, l2x0_regs_phys
 	ldr	r0, [r0]
 	ldr	r1, [r0, #L2X0_R_PHY_BASE]
-- 
1.7.9.5
