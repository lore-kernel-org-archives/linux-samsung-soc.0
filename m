From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH] clocksource: exynos_mct: remove unwanted header file inclusion
Date: Fri, 10 Jan 2014 09:33:45 +0900
Message-ID: <1389314025-2890-1-git-send-email-pankaj.dubey@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:11779 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756028AbaAJAS4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 9 Jan 2014 19:18:56 -0500
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MZ500DQDSVIL4B0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 10 Jan 2014 09:18:54 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, thomas.ab@samsung.com, Pankaj Dubey <pankaj.dubey@samsung.com>

remove unwanted header file inclusion "asm/mach/time.h" from exynos_mct.c

Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
---
 drivers/clocksource/exynos_mct.c |    2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
index 48f76bc..ed49b25 100644
--- a/drivers/clocksource/exynos_mct.c
+++ b/drivers/clocksource/exynos_mct.c
@@ -25,8 +25,6 @@
 #include <linux/of_address.h>
 #include <linux/clocksource.h>
 
-#include <asm/mach/time.h>
-
 #define EXYNOS4_MCTREG(x)		(x)
 #define EXYNOS4_MCT_G_CNT_L		EXYNOS4_MCTREG(0x100)
 #define EXYNOS4_MCT_G_CNT_U		EXYNOS4_MCTREG(0x104)
-- 
1.7.10.4
