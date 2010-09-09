From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: S5PV310: Fix build error on GPIO map
Date: Thu,  9 Sep 2010 22:03:26 +0900
Message-ID: <1284037406-2219-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:38595 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753945Ab0IINWO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 9 Sep 2010 09:22:14 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Kukjin Kim <kgene.kim@samsung.com>

This patch fixes build error about GPIO address due to
conflict of commit 4d914705 and 813067ce.

- commit 4d914705: Fix on GPIO base addresses
- commit 813067ce: Moves initial map for merging S5P64X0

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-s5pv310/cpu.c              |    2 +-
 arch/arm/mach-s5pv310/include/mach/map.h |    1 -
 2 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-s5pv310/cpu.c b/arch/arm/mach-s5pv310/cpu.c
index 3b9c872..4add398 100644
--- a/arch/arm/mach-s5pv310/cpu.c
+++ b/arch/arm/mach-s5pv310/cpu.c
@@ -57,7 +57,7 @@ static struct map_desc s5pv310_iodesc[] __initdata = {
 		.type		= MT_DEVICE,
 	}, {
 		.virtual	= (unsigned long)S5P_VA_GPIO,
-		.pfn		= __phys_to_pfn(S5PV310_PA_GPIO),
+		.pfn		= __phys_to_pfn(S5PV310_PA_GPIO1),
 		.length		= SZ_4K,
 		.type		= MT_DEVICE,
 	}, {
diff --git a/arch/arm/mach-s5pv310/include/mach/map.h b/arch/arm/mach-s5pv310/include/mach/map.h
index 204f386..aff6d23 100644
--- a/arch/arm/mach-s5pv310/include/mach/map.h
+++ b/arch/arm/mach-s5pv310/include/mach/map.h
@@ -52,7 +52,6 @@
 #define S5PV310_PA_GPIO1		(0x11400000)
 #define S5PV310_PA_GPIO2		(0x11000000)
 #define S5PV310_PA_GPIO3		(0x03860000)
-#define S5P_PA_GPIO			S5PV310_PA_GPIO1
 
 #define S5PV310_PA_HSMMC(x)		(0x12510000 + ((x) * 0x10000))
 
-- 
1.6.2.5
