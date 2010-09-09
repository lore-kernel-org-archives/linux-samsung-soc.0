From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] ARM: Samsung: s5p-fimc: decrease IO registers memory region
 size
Date: Thu, 09 Sep 2010 04:22:36 +0200
Message-ID: <1283998956-15327-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:10933 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751117Ab0IICWw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 8 Sep 2010 22:22:52 -0400
Received: from eu_spt2 (mailout2.w1.samsung.com [210.118.77.12])
 by mailout2.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0L8G0056GJY2OT@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 09 Sep 2010 03:22:50 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0L8G00LV4JY1TC@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 09 Sep 2010 03:22:50 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: s.nawrocki@samsung.com, m.szyprowski@samsung.com, kyungmin.park@samsung.com, kgene.kim@samsung.com, ben-linux@fluff.org

From: Sylwester Nawrocki <s.nawrocki@samsung.com>

IO registers region size of all FIMC versions is less than 1kB so there
is no need to reserve 1M.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/plat-s5p/dev-fimc0.c |    2 +-
 arch/arm/plat-s5p/dev-fimc1.c |    2 +-
 arch/arm/plat-s5p/dev-fimc2.c |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/plat-s5p/dev-fimc0.c b/arch/arm/plat-s5p/dev-fimc0.c
index f9203fa..608770f 100644
--- a/arch/arm/plat-s5p/dev-fimc0.c
+++ b/arch/arm/plat-s5p/dev-fimc0.c
@@ -19,7 +19,7 @@
 static struct resource s5p_fimc0_resource[] = {
 	[0] = {
 		.start	= S5P_PA_FIMC0,
-		.end	= S5P_PA_FIMC0 + SZ_1M - 1,
+		.end	= S5P_PA_FIMC0 + SZ_4K - 1,
 		.flags	= IORESOURCE_MEM,
 	},
 	[1] = {
diff --git a/arch/arm/plat-s5p/dev-fimc1.c b/arch/arm/plat-s5p/dev-fimc1.c
index 7ed91a3..76e3a97 100644
--- a/arch/arm/plat-s5p/dev-fimc1.c
+++ b/arch/arm/plat-s5p/dev-fimc1.c
@@ -19,7 +19,7 @@
 static struct resource s5p_fimc1_resource[] = {
 	[0] = {
 		.start	= S5P_PA_FIMC1,
-		.end	= S5P_PA_FIMC1 + SZ_1M - 1,
+		.end	= S5P_PA_FIMC1 + SZ_4K - 1,
 		.flags	= IORESOURCE_MEM,
 	},
 	[1] = {
diff --git a/arch/arm/plat-s5p/dev-fimc2.c b/arch/arm/plat-s5p/dev-fimc2.c
index 5543d6373..24d2981 100644
--- a/arch/arm/plat-s5p/dev-fimc2.c
+++ b/arch/arm/plat-s5p/dev-fimc2.c
@@ -19,7 +19,7 @@
 static struct resource s5p_fimc2_resource[] = {
 	[0] = {
 		.start	= S5P_PA_FIMC2,
-		.end	= S5P_PA_FIMC2 + SZ_1M - 1,
+		.end	= S5P_PA_FIMC2 + SZ_4K - 1,
 		.flags	= IORESOURCE_MEM,
 	},
 	[1] = {
-- 
1.7.2.2
