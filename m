From: Jingoo Han <jg1.han@samsung.com>
Subject: [PATCH] ARM: EXYNOS: add __cpuinit annotation to write_pen_release()
Date: Wed, 22 May 2013 16:20:24 +0900
Message-ID: <000201ce56bc$d399b770$7acd2650$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:58708 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752429Ab3EVHU0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 22 May 2013 03:20:26 -0400
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Jingoo Han <jg1.han@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

The variable __cpuinitdata pen_release is referenced by write_pen_release().
Also, write_pen_release() is called by exynos_secondary_init() which is
annotated with __cpuinit. Thus, __cpuinit should be added write_pen_release()
to fix section mismatch warning.

Fixed section mismatch warning as below:

  WARNING: vmlinux.o(.text.unlikely+0x1f4): Section mismatch in reference from the function write_pen_release() to the variable
.cpuinit.data:pen_release
  The function write_pen_release() references the variable __cpuinitdata pen_release.
  This is often because write_pen_release lacks a __cpuinitdata annotation or the annotation of pen_release is wrong.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 arch/arm/mach-exynos/platsmp.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-exynos/platsmp.c b/arch/arm/mach-exynos/platsmp.c
index a0e8ff7..9676af2 100644
--- a/arch/arm/mach-exynos/platsmp.c
+++ b/arch/arm/mach-exynos/platsmp.c
@@ -58,7 +58,7 @@ static inline void __iomem *cpu_boot_reg(int cpu)
  * observers, irrespective of whether they're taking part in coherency
  * or not.  This is necessary for the hotplug code to work reliably.
  */
-static void write_pen_release(int val)
+static void __cpuinit write_pen_release(int val)
 {
 	pen_release = val;
 	smp_wmb();
-- 
1.7.10.4
