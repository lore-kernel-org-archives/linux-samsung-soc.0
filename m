From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH v3 09/12] ARM: EXYNOS: add support get_core_count() for EXYNOS5250
Date: Tue, 13 Mar 2012 08:30:40 -0700
Message-ID: <1331652643-12626-10-git-send-email-kgene.kim@samsung.com>
References: <1331652643-12626-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:37236 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755712Ab2CMPby (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 13 Mar 2012 11:31:54 -0400
Received: by mail-iy0-f174.google.com with SMTP id z16so910445iag.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Mar 2012 08:31:54 -0700 (PDT)
In-Reply-To: <1331652643-12626-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: arnd@arndb.de, olof@lixom.net, Kukjin Kim <kgene.kim@samsung.com>

The EXYNOS5250 has two Cortex-A15 cores and there's no
need to call scu_enable() in platform_smp_prepare_cpus().

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-exynos/platsmp.c |    9 ++++++---
 1 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-exynos/platsmp.c b/arch/arm/mach-exynos/platsmp.c
index 0f2035a..36c3984 100644
--- a/arch/arm/mach-exynos/platsmp.c
+++ b/arch/arm/mach-exynos/platsmp.c
@@ -166,7 +166,10 @@ void __init smp_init_cpus(void)
 	void __iomem *scu_base = scu_base_addr();
 	unsigned int i, ncores;
 
-	ncores = scu_base ? scu_get_core_count(scu_base) : 1;
+	if (soc_is_exynos5250())
+		ncores = 2;
+	else
+		ncores = scu_base ? scu_get_core_count(scu_base) : 1;
 
 	/* sanity check */
 	if (ncores > nr_cpu_ids) {
@@ -183,8 +186,8 @@ void __init smp_init_cpus(void)
 
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
