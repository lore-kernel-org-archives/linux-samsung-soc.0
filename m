From: Axel Lin <axel.lin@gmail.com>
Subject: [PATCH 1/2] ARM: exynos4: Fix build error due to 'gic_bank_offset'
 undeclared
Date: Thu, 01 Dec 2011 23:24:30 +0800
Message-ID: <1322753070.11611.0.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qw0-f53.google.com ([209.85.216.53]:45352 "EHLO
	mail-qw0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752660Ab1LAPYl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 1 Dec 2011 10:24:41 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Marc Zyngier <marc.zyngier@arm.com>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Fix below build error:
  CC      arch/arm/mach-exynos/cpu.o
arch/arm/mach-exynos/cpu.c: In function 'exynos4_init_irq':
arch/arm/mach-exynos/cpu.c:245: error: 'gic_bank_offset' undeclared (first use in this function)
arch/arm/mach-exynos/cpu.c:245: error: (Each undeclared identifier is reported only once
arch/arm/mach-exynos/cpu.c:245: error: for each function it appears in.)
arch/arm/mach-exynos/cpu.c:243: warning: unused variable 'bank_offset'
make[1]: *** [arch/arm/mach-exynos/cpu.o] Error 1
make: *** [arch/arm/mach-exynos] Error 2

Signed-off-by: Axel Lin <axel.lin@gmail.com>
---
 arch/arm/mach-exynos/cpu.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-exynos/cpu.c b/arch/arm/mach-exynos/cpu.c
index fed62f4..c7cb462 100644
--- a/arch/arm/mach-exynos/cpu.c
+++ b/arch/arm/mach-exynos/cpu.c
@@ -240,7 +240,7 @@ static const struct of_device_id exynos4_dt_irq_match[] = {
 void __init exynos4_init_irq(void)
 {
 	int irq;
-	unsigned int bank_offset;
+	unsigned int gic_bank_offset;
 
 	gic_bank_offset = soc_is_exynos4412() ? 0x4000 : 0x8000;
 
-- 
1.7.5.4
