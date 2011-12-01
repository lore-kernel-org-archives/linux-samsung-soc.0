From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: [PATCH 1/4] ARM: EXYNOS4: Add DMC1, allow PPMU access for DMC.
Date: Thu, 01 Dec 2011 18:05:14 +0900
Message-ID: <1322730317-8171-2-git-send-email-myungjoo.ham@samsung.com>
References: <1322730317-8171-1-git-send-email-myungjoo.ham@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:46540 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751193Ab1LAJFR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 1 Dec 2011 04:05:17 -0500
In-reply-to: <1322730317-8171-1-git-send-email-myungjoo.ham@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, Kevin Hilman <khilman@ti.com>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, Kyungmin Park <kyungmin.park@samsung.com>, myungjoo.ham@gmail.com

- Add DMC1
- Enlarge address space for DMC from 4k to 64k so that PPMU registers
  may be accessed.

Signed-off-by: MyungJoo Ham <myungjoo.ham@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos/cpu.c              |    7 ++++++-
 arch/arm/mach-exynos/include/mach/map.h |    1 +
 2 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-exynos/cpu.c b/arch/arm/mach-exynos/cpu.c
index 90ec247..8bdcba9 100644
--- a/arch/arm/mach-exynos/cpu.c
+++ b/arch/arm/mach-exynos/cpu.c
@@ -108,7 +108,12 @@ static struct map_desc exynos4_iodesc[] __initdata = {
 	}, {
 		.virtual	= (unsigned long)S5P_VA_DMC0,
 		.pfn		= __phys_to_pfn(EXYNOS4_PA_DMC0),
-		.length		= SZ_4K,
+		.length		= SZ_64K,
+		.type		= MT_DEVICE,
+	}, {
+		.virtual	= (unsigned long)S5P_VA_DMC1,
+		.pfn		= __phys_to_pfn(EXYNOS4_PA_DMC1),
+		.length		= SZ_64K,
 		.type		= MT_DEVICE,
 	}, {
 		.virtual	= (unsigned long)S5P_VA_SROMC,
diff --git a/arch/arm/mach-exynos/include/mach/map.h b/arch/arm/mach-exynos/include/mach/map.h
index 058541d..870a980 100644
--- a/arch/arm/mach-exynos/include/mach/map.h
+++ b/arch/arm/mach-exynos/include/mach/map.h
@@ -57,6 +57,7 @@
 #define EXYNOS4_PA_KEYPAD		0x100A0000
 
 #define EXYNOS4_PA_DMC0			0x10400000
+#define EXYNOS4_PA_DMC1			0x10410000
 
 #define EXYNOS4_PA_COMBINER		0x10440000
 
-- 
1.7.4.1
