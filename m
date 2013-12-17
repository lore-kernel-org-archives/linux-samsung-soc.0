From: kgene@kernel.org
Subject: [PATCH 11/11] PM / devfreq: use inclusion <mach/map.h> instead of
 <plat/map-s5p.h>
Date: Tue, 17 Dec 2013 20:53:13 +0900
Message-ID: <116901cefb1e$90f4b530$b2de1f90$@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:64974 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753171Ab3LQLxP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 17 Dec 2013 06:53:15 -0500
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MXY001H690Q2550@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 17 Dec 2013 20:53:14 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: myungjoo.ham@samsung.com

From: Kukjin Kim <kgene.kim@samsung.com>

This fixes follwoing warning:
In file included from drivers/devfreq/exynos/exynos4_bus.h:15:0,
                 from drivers/devfreq/exynos/exynos4_bus.c:35:
arch/arm/mach-exynos/include/mach/map.h:22:0: warning: "S3C_UART_OFFSET"
redefined [enabled by default]
In file included from drivers/devfreq/exynos/exynos4_bus.c:33:0:
arch/arm/plat-samsung/include/plat/map-s5p.h:57:0: note: this is the
location of the previous definition

Cc: MyungJoo Ham <myungjoo.ham@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 drivers/devfreq/exynos/exynos4_bus.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/devfreq/exynos/exynos4_bus.c
b/drivers/devfreq/exynos/exynos4_bus.c
index 16eb406..1ab8cdd 100644
--- a/drivers/devfreq/exynos/exynos4_bus.c
+++ b/drivers/devfreq/exynos/exynos4_bus.c
@@ -30,7 +30,7 @@
 extern unsigned int exynos_result_of_asv;
 #endif
 
-#include <plat/map-s5p.h>
+#include <mach/map.h>
 
 #include "exynos4_bus.h"
 
-- 
1.7.10.4
