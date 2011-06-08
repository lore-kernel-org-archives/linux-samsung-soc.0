From: Thomas Abraham <thomas.ab@samsung.com>
Subject: [PATCH] ARM: S5PV210: Fix build breakage due to renaming of
 S3C_VA_USB_HSPHY
Date: Wed, 08 Jun 2011 16:55:37 +0530
Message-ID: <1307532337-29348-1-git-send-email-thomas.ab@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:43600 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752782Ab1FHLQz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 8 Jun 2011 07:16:55 -0400
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LMG002BQY02IFS0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 08 Jun 2011 20:16:53 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LMG00ADTY02J8@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 08 Jun 2011 20:16:54 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com

Commit 8f1d169f999fea892c3fcbf5a79ae8525a477572
("ARM: EXYNOS4: Add usb host phy control") renamed S3C_VA_USB_HSPHY
to S5P_VA_USB_HSPHY in s5p-map.h file. Fix build for S5PV210 platform.

Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
---
 arch/arm/mach-s5pv210/cpu.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-s5pv210/cpu.c b/arch/arm/mach-s5pv210/cpu.c
index 61e6c24..b343582 100644
--- a/arch/arm/mach-s5pv210/cpu.c
+++ b/arch/arm/mach-s5pv210/cpu.c
@@ -91,7 +91,7 @@ static struct map_desc s5pv210_iodesc[] __initdata = {
 		.length		= SZ_4K,
 		.type		= MT_DEVICE,
 	}, {
-		.virtual	= (unsigned long)S3C_VA_USB_HSPHY,
+		.virtual	= (unsigned long)S5P_VA_USB_HSPHY,
 		.pfn		=__phys_to_pfn(S5PV210_PA_HSPHY),
 		.length		= SZ_4K,
 		.type		= MT_DEVICE,
-- 
1.6.6.rc2
