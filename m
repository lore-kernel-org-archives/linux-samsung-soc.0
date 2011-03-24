From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH] ARM: EXYNOS4: IRQ flags for SMSC911X set as HIGH
Date: Thu, 24 Mar 2011 14:50:37 +0530
Message-ID: <1300958437-23247-1-git-send-email-tushar.behera@linaro.org>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:28298 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756338Ab1CXJdU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 24 Mar 2011 05:33:20 -0400
Received: from epmmp1 (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LIK00MDS2JGBG00@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 24 Mar 2011 18:33:16 +0900 (KST)
Received: from Linaro.sisodomain.com ([107.108.215.143])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPSA id <0LIK00BKZ2JCNQ@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 24 Mar 2011 18:33:16 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com

There is a mismatch in IRQ flag and irq_polarity settings for
SMSC911X. This results in a kernel warning.

IRQ flag is set to HIGH to match the irq_polarity.

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
Signed-off-by: Changhwan Youn <chaos.youn@samsung.com>
---
 arch/arm/mach-exynos4/mach-smdkc210.c |    2 +-
 arch/arm/mach-exynos4/mach-smdkv310.c |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-exynos4/mach-smdkc210.c b/arch/arm/mach-exynos4/mach-smdkc210.c
index 25a2568..5ad5e13 100644
--- a/arch/arm/mach-exynos4/mach-smdkc210.c
+++ b/arch/arm/mach-exynos4/mach-smdkc210.c
@@ -120,7 +120,7 @@ static struct resource smdkc210_smsc911x_resources[] = {
 	[1] = {
 		.start	= IRQ_EINT(5),
 		.end	= IRQ_EINT(5),
-		.flags	= IORESOURCE_IRQ | IRQF_TRIGGER_LOW,
+		.flags	= IORESOURCE_IRQ | IRQF_TRIGGER_HIGH,
 	},
 };
 
diff --git a/arch/arm/mach-exynos4/mach-smdkv310.c b/arch/arm/mach-exynos4/mach-smdkv310.c
index 88e0275..a44529d 100644
--- a/arch/arm/mach-exynos4/mach-smdkv310.c
+++ b/arch/arm/mach-exynos4/mach-smdkv310.c
@@ -122,7 +122,7 @@ static struct resource smdkv310_smsc911x_resources[] = {
 	[1] = {
 		.start	= IRQ_EINT(5),
 		.end	= IRQ_EINT(5),
-		.flags	= IORESOURCE_IRQ | IRQF_TRIGGER_LOW,
+		.flags	= IORESOURCE_IRQ | IRQF_TRIGGER_HIGH,
 	},
 };
 
-- 
1.7.1
