From: Russell King <rmk+kernel@arm.linux.org.uk>
Subject: [PATCH 60/97] ARM: l2c: exynos: convert to generic l2c initialisation
 (and thereby fix it)
Date: Mon, 28 Apr 2014 20:31:18 +0100
Message-ID: <E1WerGo-0001Xo-Hr@rmk-PC.arm.linux.org.uk>
References: <20140428192419.GV26756@n2100.arm.linux.org.uk>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gw-1.arm.linux.org.uk ([78.32.30.217]:55745 "EHLO
	pandora.arm.linux.org.uk" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S933030AbaD1TbV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Apr 2014 15:31:21 -0400
In-Reply-To: <20140428192419.GV26756@n2100.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.ifradead.org
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

exynos was unconditionally calling the L2 cache initialisation from an
early_initcall.  This breaks multiplatform kernels.  Thankfully,
converting to generic l2c initialisation fixes this.

Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>
---
 arch/arm/mach-exynos/exynos.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-exynos/exynos.c b/arch/arm/mach-exynos/exynos.c
index fbfc29df3299..a763c0862da9 100644
--- a/arch/arm/mach-exynos/exynos.c
+++ b/arch/arm/mach-exynos/exynos.c
@@ -316,12 +316,6 @@ static int __init exynos_core_init(void)
 }
 core_initcall(exynos_core_init);
 
-static int __init exynos4_l2x0_cache_init(void)
-{
-	return l2x0_of_init(0x3c400001, 0xc20fffff);
-}
-early_initcall(exynos4_l2x0_cache_init);
-
 static void __init exynos_dt_machine_init(void)
 {
 	struct device_node *i2c_np;
@@ -387,6 +381,8 @@ static void __init exynos_reserve(void)
 DT_MACHINE_START(EXYNOS_DT, "SAMSUNG EXYNOS (Flattened Device Tree)")
 	/* Maintainer: Thomas Abraham <thomas.abraham@linaro.org> */
 	/* Maintainer: Kukjin Kim <kgene.kim@samsung.com> */
+	.l2c_aux_val	= 0x3c400001,
+	.l2c_aux_mask	= 0xc20fffff,
 	.smp		= smp_ops(exynos_smp_ops),
 	.map_io		= exynos_init_io,
 	.init_early	= exynos_firmware_init,
-- 
1.8.3.1
