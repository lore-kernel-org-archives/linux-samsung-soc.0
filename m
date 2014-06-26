From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH RESEND] ARM: EXYNOS: Do not calculate boot address twice
Date: Thu, 26 Jun 2014 13:46:03 +0200
Message-ID: <1403783163-28638-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:12566 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757039AbaFZLqL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 26 Jun 2014 07:46:11 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Sachin Kamat <sachin.kamat@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

Commit b3205dea8fbf ("ARM: EXYNOS: Map SYSRAM through generic DT
bindings") introduced local variable boot_reg where boot address from
cpu_boot_reg() call is stored. Re-use it instead calling cpu_boot_reg()
again.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 arch/arm/mach-exynos/platsmp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-exynos/platsmp.c b/arch/arm/mach-exynos/platsmp.c
index 1c8d31e39520..55ed2e6729c5 100644
--- a/arch/arm/mach-exynos/platsmp.c
+++ b/arch/arm/mach-exynos/platsmp.c
@@ -155,7 +155,7 @@ static int exynos_boot_secondary(unsigned int cpu, struct task_struct *idle)
 				ret = PTR_ERR(boot_reg);
 				goto fail;
 			}
-			__raw_writel(boot_addr, cpu_boot_reg(phys_cpu));
+			__raw_writel(boot_addr, boot_reg);
 		}
 
 		call_firmware_op(cpu_boot, phys_cpu);
@@ -242,7 +242,7 @@ static void __init exynos_smp_prepare_cpus(unsigned int max_cpus)
 
 			if (IS_ERR(boot_reg))
 				break;
-			__raw_writel(boot_addr, cpu_boot_reg(phys_cpu));
+			__raw_writel(boot_addr, boot_reg);
 		}
 	}
 }
-- 
1.9.1
