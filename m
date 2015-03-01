From: Abhilash Kesavan <a.kesavan@samsung.com>
Subject: [PATCH RESEND] ARM: EXYNOS: Remove ARCH_HAS_BANDGAP selection
Date: Sun,  1 Mar 2015 21:51:43 +0530
Message-ID: <1425226903-5164-1-git-send-email-a.kesavan@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f42.google.com ([209.85.220.42]:46165 "EHLO
	mail-pa0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751557AbbCAQVw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 1 Mar 2015 11:21:52 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, kgene@kernel.org
Cc: kesavan.abhilash@gmail.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Now that the samsung thermal driver dependency on ARCH_HAS_BANDGAP
has been removed, fix the arch code selection too.

Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
Reviewed-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Acked-by: Lukasz Majewski <l.majewski@samsung.com>
---
 arch/arm/mach-exynos/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index 603820e..a4abcae 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -9,7 +9,6 @@
 
 menuconfig ARCH_EXYNOS
 	bool "Samsung EXYNOS" if ARCH_MULTI_V7
-	select ARCH_HAS_BANDGAP
 	select ARCH_HAS_HOLES_MEMORYMODEL
 	select ARCH_REQUIRE_GPIOLIB
 	select ARM_AMBA
-- 
2.1.0
