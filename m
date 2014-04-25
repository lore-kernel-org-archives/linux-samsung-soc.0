From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH v2 02/10] ARM: EXYNOS: Cleanup "mach-exynos/common.h" file
Date: Fri, 25 Apr 2014 21:32:38 +0900
Message-ID: <1398429166-5539-3-git-send-email-pankaj.dubey@samsung.com>
References: <1396425058-4012-1-git-send-email-pankaj.dubey@samsung.com>
 <1398429166-5539-1-git-send-email-pankaj.dubey@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:20365 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752664AbaDYMPD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Apr 2014 08:15:03 -0400
In-reply-to: <1398429166-5539-1-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, linux@arm.linux.org.uk, t.figa@samsung.com, chow.kim@samsung.com, yg1004.jang@samsung.com, vikas.sajjan@samsung.com, s.nawrocki@samsung.com, b.zolnierkie@samsung.com, Pankaj Dubey <pankaj.dubey@samsung.com>

Remove unused and unwanted declarations from "mach-exynos/common.h"

Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
---
 arch/arm/mach-exynos/common.h |    6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm/mach-exynos/common.h b/arch/arm/mach-exynos/common.h
index 9ef3f83..31c5964 100644
--- a/arch/arm/mach-exynos/common.h
+++ b/arch/arm/mach-exynos/common.h
@@ -15,14 +15,8 @@
 #include <linux/reboot.h>
 #include <linux/of.h>
 
-void mct_init(void __iomem *base, int irq_g0, int irq_l0, int irq_l1);
-
-struct map_desc;
-void exynos_init_io(void);
-void exynos_restart(enum reboot_mode mode, const char *cmd);
 void exynos_cpuidle_init(void);
 void exynos_cpufreq_init(void);
-void exynos_init_late(void);
 
 void exynos_firmware_init(void);
 
-- 
1.7.10.4
