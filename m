From: Sangsu Park <sangsu4u.park@samsung.com>
Subject: [PATCH] ARM: EXYNOS: Remove wrong I2S0 clock from peril clock
Date: Fri, 28 Sep 2012 19:39:49 +0900
Message-ID: <003501cd9d65$9611d060$c2357120$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:64419 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753011Ab2I1Kjv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 28 Sep 2012 06:39:51 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MB2008WA2YCFB01@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 28 Sep 2012 19:39:50 +0900 (KST)
Received: from DOSANGSU4UP02 ([12.23.118.226])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MB200IP12YDJTA0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 28 Sep 2012 19:39:49 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Remove I2S0 clock from peril since peril doesn't have I2S0 clock for EXYNOS4.
Audio Subsystem block has I2S0 clk.

Signed-off-by: sangsu <sangsu@sangsu-P560.(none)>
---
 arch/arm/mach-exynos/clock-exynos4.c |    5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm/mach-exynos/clock-exynos4.c
b/arch/arm/mach-exynos/clock-exynos4.c
index 6a45c9a..fa8a134 100644
--- a/arch/arm/mach-exynos/clock-exynos4.c
+++ b/arch/arm/mach-exynos/clock-exynos4.c
@@ -613,11 +613,6 @@ static struct clk exynos4_init_clocks_off[] = {
 		.ctrlbit	= (1 << 18),
 	}, {
 		.name		= "iis",
-		.devname	= "samsung-i2s.0",
-		.enable		= exynos4_clk_ip_peril_ctrl,
-		.ctrlbit	= (1 << 19),
-	}, {
-		.name		= "iis",
 		.devname	= "samsung-i2s.1",
 		.enable		= exynos4_clk_ip_peril_ctrl,
 		.ctrlbit	= (1 << 20),
-- 
1.7.9.5
