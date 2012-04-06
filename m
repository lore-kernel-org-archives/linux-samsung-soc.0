From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 2/4] ARM: Exynos4: fix regulator name for NURI board
Date: Fri, 06 Apr 2012 09:43:24 +0200
Message-ID: <1333698206-12348-3-git-send-email-m.szyprowski@samsung.com>
References: <1333698206-12348-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:43554 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752543Ab2DFHnf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 6 Apr 2012 03:43:35 -0400
Received: from euspt2 ([210.118.77.14]) by mailout4.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0M2100L3FS4PCG20@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 06 Apr 2012 08:43:37 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0M210071RS4IL1@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 06 Apr 2012 08:43:30 +0100 (BST)
In-reply-to: <1333698206-12348-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

Regulator names should not contain slash to avoid issues with debugfs.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos/mach-nuri.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-exynos/mach-nuri.c b/arch/arm/mach-exynos/mach-nuri.c
index b3966f0..88a3b5c3 100644
--- a/arch/arm/mach-exynos/mach-nuri.c
+++ b/arch/arm/mach-exynos/mach-nuri.c
@@ -572,7 +572,7 @@ static struct regulator_init_data __initdata max8997_ldo7_data = {
 
 static struct regulator_init_data __initdata max8997_ldo8_data = {
 	.constraints	= {
-		.name		= "VUSB/VDAC_3.3V_C210",
+		.name		= "VUSB+VDAC_3.3V_C210",
 		.min_uV		= 3300000,
 		.max_uV		= 3300000,
 		.valid_ops_mask	= REGULATOR_CHANGE_STATUS,
-- 
1.7.1.569.g6f426
