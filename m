From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: EXYNOS: fix compilation error introduced due to common clock migration
Date: Wed, 27 Mar 2013 00:04:00 +0900
Message-ID: <1364310240-3394-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f47.google.com ([209.85.160.47]:41559 "EHLO
	mail-pb0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759426Ab3DDKcK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 4 Apr 2013 06:32:10 -0400
Received: by mail-pb0-f47.google.com with SMTP id rq13so1366521pbb.20
        for <linux-samsung-soc@vger.kernel.org>; Thu, 04 Apr 2013 03:32:09 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Thomas Abraham <thomas.ab@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

From: Thomas Abraham <thomas.ab@samsung.com>

The functions exynos4_clk_init and exynos4_clk_register_fixed_ext are
applicable only on Exynos4 non-dt platforms. But when building Exynos5
platforms without including Exynos4 platforms, the following errors
show up.

arch/arm/mach-exynos/built-in.o: In function `exynos_init_time':
arch/arm/mach-exynos/common.c:446: undefined reference to `exynos4_clk_init'
arch/arm/mach-exynos/common.c:447: undefined reference to `exynos4_clk_register_fixed_ext'

Fix this compilation errors by marking these calls as Exynos4 specific.

Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-exynos/common.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c
index 9cd857e..a8570bf 100644
--- a/arch/arm/mach-exynos/common.c
+++ b/arch/arm/mach-exynos/common.c
@@ -443,8 +443,10 @@ void __init exynos_init_time(void)
 #endif
 	} else {
 		/* todo: remove after migrating legacy E4 platforms to dt */
+#ifdef CONFIG_ARCH_EXYNOS4
 		exynos4_clk_init(NULL);
 		exynos4_clk_register_fixed_ext(xxti_f, xusbxti_f);
+#endif
 		mct_init();
 	}
 }
-- 
1.7.4.4
