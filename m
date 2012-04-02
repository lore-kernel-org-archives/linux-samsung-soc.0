From: Il Han <corone.il.han@gmail.com>
Subject: [PATCH] mach-exynos: fix ISO C90 warning.
Date: Mon,  2 Apr 2012 20:55:32 +0900
Message-ID: <1333367732-28014-1-git-send-email-corone.il.han@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f52.google.com ([209.85.210.52]:33165 "EHLO
	mail-pz0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752255Ab2DBMAq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Apr 2012 08:00:46 -0400
Received: by dake40 with SMTP id e40so2357035dak.11
        for <linux-samsung-soc@vger.kernel.org>; Mon, 02 Apr 2012 05:00:46 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Il Han <corone.il.han@gmail.com>

ISO C90 forbids mixed declarations and code.
Fix it.

Signed-off-by: Il Han <corone.il.han@gmail.com>
---
 arch/arm/mach-exynos/common.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c
index e6cc50e..8614aab 100644
--- a/arch/arm/mach-exynos/common.c
+++ b/arch/arm/mach-exynos/common.c
@@ -583,10 +583,11 @@ core_initcall(exynos_core_init);
 #ifdef CONFIG_CACHE_L2X0
 static int __init exynos4_l2x0_cache_init(void)
 {
+	int ret;
+
 	if (soc_is_exynos5250())
 		return 0;
 
-	int ret;
 	ret = l2x0_of_init(L2_AUX_VAL, L2_AUX_MASK);
 	if (!ret) {
 		l2x0_regs_phys = virt_to_phys(&l2x0_saved_regs);
-- 
1.7.4.1
