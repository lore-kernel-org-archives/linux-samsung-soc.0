From: Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: [PATCH] ARM: Exynos: Fix build error with thumb2
Date: Mon, 16 Mar 2015 20:38:43 +0300
Message-ID: <55071523.7060309@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f178.google.com ([209.85.217.178]:35986 "EHLO
	mail-lb0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756086AbbCPRiq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 16 Mar 2015 13:38:46 -0400
Received: by lbcds1 with SMTP id ds1so36174031lbc.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Mar 2015 10:38:44 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, "linaro-kernel@lists.linaro.org" <linaro-kernel@lists.linaro.org>

Add non-global symbols to avoid build failure in thumb2 mode.

Exact the same issue and the fix as in [1]; just the variables are different.

[1] http://lists.linaro.org/pipermail/linaro-kernel/2014-June/015227.html

Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
---
  arch/arm/mach-exynos/sleep.S | 6 ++++--
  1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-exynos/sleep.S b/arch/arm/mach-exynos/sleep.S
index 31d2583..73f7fde 100644
--- a/arch/arm/mach-exynos/sleep.S
+++ b/arch/arm/mach-exynos/sleep.S
@@ -69,9 +69,9 @@ ENTRY(exynos_cpu_resume_ns)
  	cmp	r0, r1
  	bne	skip_cp15

-	adr	r0, cp15_save_power
+	adr	r0, .Lcp15_save_power
  	ldr	r1, [r0]
-	adr	r0, cp15_save_diag
+	adr	r0, .Lcp15_save_diag
  	ldr	r2, [r0]
  	mov	r0, #SMC_CMD_C15RESUME
  	dsb
@@ -118,9 +118,11 @@ skip_l2x0:
  skip_cp15:
  	b	cpu_resume
  ENDPROC(exynos_cpu_resume_ns)
+.Lcp15_save_diag:
  	.globl cp15_save_diag
  cp15_save_diag:
  	.long	0	@ cp15 diagnostic
+.Lcp15_save_power:
  	.globl cp15_save_power
  cp15_save_power:
  	.long	0	@ cp15 power control
-- 
1.9.1
