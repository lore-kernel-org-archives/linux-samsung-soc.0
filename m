From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 9/9] ARM: EXYNOS: temporary fixup regarding get_core_count()
Date: Wed,  1 Feb 2012 00:39:14 +0900
Message-ID: <1328024354-4277-10-git-send-email-kgene.kim@samsung.com>
References: <1328024354-4277-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:38938 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754714Ab2AaPkG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 31 Jan 2012 10:40:06 -0500
Received: by mail-pw0-f46.google.com with SMTP id u11so258976pbd.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 31 Jan 2012 07:40:06 -0800 (PST)
In-Reply-To: <1328024354-4277-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: rmk+kernel@arm.linux.org.uk, arnd@arndb.de, olof@lixom.net, Kukjin Kim <kgene.kim@samsung.com>

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-exynos/platsmp.c |    9 ++++++---
 1 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-exynos/platsmp.c b/arch/arm/mach-exynos/platsmp.c
index 683aec7..dfb4630 100644
--- a/arch/arm/mach-exynos/platsmp.c
+++ b/arch/arm/mach-exynos/platsmp.c
@@ -165,7 +165,10 @@ void __init smp_init_cpus(void)
 	void __iomem *scu_base = scu_base_addr();
 	unsigned int i, ncores;
 
-	ncores = scu_base ? scu_get_core_count(scu_base) : 1;
+	if (soc_is_exynos5250())
+		ncores = 2;
+	else
+		ncores = scu_base ? scu_get_core_count(scu_base) : 1;
 
 	/* sanity check */
 	if (ncores > nr_cpu_ids) {
@@ -182,8 +185,8 @@ void __init smp_init_cpus(void)
 
 void __init platform_smp_prepare_cpus(unsigned int max_cpus)
 {
-
-	scu_enable(scu_base_addr());
+	if (!soc_is_exynos5250())
+		scu_enable(scu_base_addr());
 
 	/*
 	 * Write the address of secondary startup into the
-- 
1.7.4.4
