From: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
Subject: [PATCH] ARM: EXYNOS: pmu: Make local function static
Date: Sat, 30 May 2015 15:58:35 +0900
Message-ID: <1432969115-19305-1-git-send-email-k.kozlowski.k@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f169.google.com ([209.85.192.169]:35006 "EHLO
	mail-pd0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750799AbbE3G6t (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 30 May 2015 02:58:49 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>

Function is not used outside of this unit, make it static.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
---
 arch/arm/mach-exynos/pmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-exynos/pmu.c b/arch/arm/mach-exynos/pmu.c
index e812c1c85624..8d5b0dcc618b 100644
--- a/arch/arm/mach-exynos/pmu.c
+++ b/arch/arm/mach-exynos/pmu.c
@@ -698,7 +698,7 @@ static void exynos_power_off(void)
 		;
 }
 
-void exynos5420_powerdown_conf(enum sys_powerdown mode)
+static void exynos5420_powerdown_conf(enum sys_powerdown mode)
 {
 	u32 this_cluster;
 
-- 
2.1.4
