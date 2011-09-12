From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH] ARM: EXYNOS4: convert boot_params to atag_offset
Date: Mon, 12 Sep 2011 10:09:09 +0530
Message-ID: <1315802349-3892-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f42.google.com ([209.85.210.42]:48009 "EHLO
	mail-pz0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751137Ab1ILEmv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Sep 2011 00:42:51 -0400
Received: by pzk37 with SMTP id 37so6244795pzk.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 11 Sep 2011 21:42:49 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, linaro-dev@lists.linaro.org, patches@linaro.org, Nicolas Pitre <nicolas.pitre@linaro.org>

Based on "ARM: introduce atag_offset to replace boot_params"
by Nicolas Pitre (2bb9839e312ed55a6d5824ffa6077ce3d7d63b1e).

Since boot_params variable is deleted from machine_desc, the variable
is modified in the newer board files.

CC: Nicolas Pitre <nicolas.pitre@linaro.org>
Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
This is required when Kukjin's for-next branch is merged with
Russell's devel-stable branch.

Nicolas's patchset already has changes for other EXYNSO4 based boards.

 arch/arm/mach-exynos4/mach-origen.c   |    2 +-
 arch/arm/mach-exynos4/mach-smdk4212.c |    2 +-
 arch/arm/mach-exynos4/mach-smdkv310.c |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-exynos4/mach-origen.c b/arch/arm/mach-exynos4/mach-origen.c
index ed59f86..b5f6f38 100644
--- a/arch/arm/mach-exynos4/mach-origen.c
+++ b/arch/arm/mach-exynos4/mach-origen.c
@@ -100,7 +100,7 @@ static void __init origen_machine_init(void)
 
 MACHINE_START(ORIGEN, "ORIGEN")
 	/* Maintainer: JeongHyeon Kim <jhkim@insignal.co.kr> */
-	.boot_params	= S5P_PA_SDRAM + 0x100,
+	.atag_offset	= 0x100,
 	.init_irq	= exynos4_init_irq,
 	.map_io		= origen_map_io,
 	.init_machine	= origen_machine_init,
diff --git a/arch/arm/mach-exynos4/mach-smdk4212.c b/arch/arm/mach-exynos4/mach-smdk4212.c
index 3479a93..8c41ae1 100644
--- a/arch/arm/mach-exynos4/mach-smdk4212.c
+++ b/arch/arm/mach-exynos4/mach-smdk4212.c
@@ -284,7 +284,7 @@ static void __init smdk4212_machine_init(void)
 
 MACHINE_START(SMDK4212, "SMDK4212")
 	/* Maintainer: Kukjin Kim <kgene.kim@samsung.com> */
-	.boot_params	= S5P_PA_SDRAM + 0x100,
+	.atag_offset	= 0x100,
 	.init_irq	= exynos4_init_irq,
 	.map_io		= smdk4212_map_io,
 	.init_machine	= smdk4212_machine_init,
diff --git a/arch/arm/mach-exynos4/mach-smdkv310.c b/arch/arm/mach-exynos4/mach-smdkv310.c
index 57cf632..7ce4d8b 100644
--- a/arch/arm/mach-exynos4/mach-smdkv310.c
+++ b/arch/arm/mach-exynos4/mach-smdkv310.c
@@ -344,7 +344,7 @@ MACHINE_END
 
 MACHINE_START(SMDKC210, "SMDKC210")
 	/* Maintainer: Kukjin Kim <kgene.kim@samsung.com> */
-	.boot_params	= S5P_PA_SDRAM + 0x100,
+	.atag_offset	= 0x100,
 	.init_irq	= exynos4_init_irq,
 	.map_io		= smdkv310_map_io,
 	.init_machine	= smdkv310_machine_init,
-- 
1.7.4.1
