From: Jeongtae Park <jtp.park@samsung.com>
Subject: [PATCH] ARM: EXYNOS4: Fix smsc9215 irq polarity configuration of SMDKV310
Date: Tue, 15 Mar 2011 15:17:58 +0900
Message-ID: <1300169878-4793-1-git-send-email-jtp.park@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:47475 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750937Ab1COGp4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Mar 2011 02:45:56 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, Jeongtae Park <jtp.park@samsung.com>

This patch fixes smsc9215 irq ploarity configuration of SMDKV310.
We can change type of EINT(5) as HIGH, but it's better to change
IRQ output of smsc9215 as an active low because smsc's IRQ line
has been pull-up.

Signed-off-by: Jeongtae Park <jtp.park@samsung.com>
---
 arch/arm/mach-exynos4/mach-smdkv310.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-exynos4/mach-smdkv310.c b/arch/arm/mach-exynos4/mach-smdkv310.c
index 07860a5..a422f88 100644
--- a/arch/arm/mach-exynos4/mach-smdkv310.c
+++ b/arch/arm/mach-exynos4/mach-smdkv310.c
@@ -125,7 +125,7 @@ static struct resource smdkv310_smsc911x_resources[] = {
 };
 
 static struct smsc911x_platform_config smsc9215_config = {
-	.irq_polarity	= SMSC911X_IRQ_POLARITY_ACTIVE_HIGH,
+	.irq_polarity	= SMSC911X_IRQ_POLARITY_ACTIVE_LOW,
 	.irq_type	= SMSC911X_IRQ_TYPE_PUSH_PULL,
 	.flags		= SMSC911X_USE_16BIT | SMSC911X_FORCE_INTERNAL_PHY,
 	.phy_interface	= PHY_INTERFACE_MODE_MII,
-- 
1.7.1
