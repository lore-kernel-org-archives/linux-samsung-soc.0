From: Ian Campbell <ijc@hellion.org.uk>
Subject: [PATCH] trivial: Fix typo "Crotex" in CONFIG_ARCH_EXYNOS3 help
Date: Sun, 14 Sep 2014 20:24:10 +0100
Message-ID: <1410722650-6428-1-git-send-email-ijc@hellion.org.uk>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp02.citrix.com ([66.165.176.63]:34389 "EHLO
	SMTP02.CITRIX.COM" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752652AbaINTYN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 14 Sep 2014 15:24:13 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Ian Campbell <ijc@hellion.org.uk>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, trivial@kernel.org

Signed-off-by: Ian Campbell <ijc@hellion.org.uk>
Cc: Russell King <linux@arm.linux.org.uk>
Cc: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: trivial@kernel.org
---
 arch/arm/mach-exynos/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index 8f9b66c..e201e0b 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -33,7 +33,7 @@ config ARCH_EXYNOS3
 	bool "SAMSUNG EXYNOS3"
 	select ARM_CPU_SUSPEND if PM
 	help
-	  Samsung EXYNOS3 (Crotex-A7) SoC based systems
+	  Samsung EXYNOS3 (Cortex-A7) SoC based systems
 
 config ARCH_EXYNOS4
 	bool "SAMSUNG EXYNOS4"
-- 
1.7.10.4
