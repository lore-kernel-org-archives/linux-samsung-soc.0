From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 4/4] ARM: Exynos4: Remove broken config values for touchscren
 for NURI board
Date: Fri, 06 Apr 2012 09:43:26 +0200
Message-ID: <1333698206-12348-5-git-send-email-m.szyprowski@samsung.com>
References: <1333698206-12348-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:43554 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753924Ab2DFHnf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 6 Apr 2012 03:43:35 -0400
Received: from euspt2 ([210.118.77.14]) by mailout4.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0M2100L3FS4PCG20@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 06 Apr 2012 08:43:37 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0M2100FHIS4I0S@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 06 Apr 2012 08:43:30 +0100 (BST)
In-reply-to: <1333698206-12348-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

The atmel_mxt_ts driver has been extended to support more 'configuration
objects' in commit 81c88a711 ("Input: atmel_mxt_ts - update object list"),
what broke the configuration values for NURI board. These values are
optional anyway, so remove them to get the driver working correctly.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos/mach-nuri.c |   42 --------------------------------------
 1 files changed, 0 insertions(+), 42 deletions(-)

diff --git a/arch/arm/mach-exynos/mach-nuri.c b/arch/arm/mach-exynos/mach-nuri.c
index d55298d..3009a86 100644
--- a/arch/arm/mach-exynos/mach-nuri.c
+++ b/arch/arm/mach-exynos/mach-nuri.c
@@ -308,49 +308,7 @@ static struct i2c_board_info i2c1_devs[] __initdata = {
 };
 
 /* TSP */
-static u8 mxt_init_vals[] = {
-	/* MXT_GEN_COMMAND(6) */
-	0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-	/* MXT_GEN_POWER(7) */
-	0x20, 0xff, 0x32,
-	/* MXT_GEN_ACQUIRE(8) */
-	0x0a, 0x00, 0x05, 0x00, 0x00, 0x00, 0x09, 0x23,
-	/* MXT_TOUCH_MULTI(9) */
-	0x00, 0x00, 0x00, 0x13, 0x0b, 0x00, 0x00, 0x00, 0x02, 0x00,
-	0x00, 0x01, 0x01, 0x0e, 0x0a, 0x0a, 0x0a, 0x0a, 0x00, 0x00,
-	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-	0x00,
-	/* MXT_TOUCH_KEYARRAY(15) */
-	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00,
-	0x00,
-	/* MXT_SPT_GPIOPWM(19) */
-	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-	0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-	/* MXT_PROCI_GRIPFACE(20) */
-	0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x50, 0x28, 0x04,
-	0x0f, 0x0a,
-	/* MXT_PROCG_NOISE(22) */
-	0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x23, 0x00,
-	0x00, 0x05, 0x0f, 0x19, 0x23, 0x2d, 0x03,
-	/* MXT_TOUCH_PROXIMITY(23) */
-	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-	0x00, 0x00, 0x00, 0x00, 0x00,
-	/* MXT_PROCI_ONETOUCH(24) */
-	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-	/* MXT_SPT_SELFTEST(25) */
-	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-	0x00, 0x00, 0x00, 0x00,
-	/* MXT_PROCI_TWOTOUCH(27) */
-	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-	/* MXT_SPT_CTECONFIG(28) */
-	0x00, 0x00, 0x02, 0x08, 0x10, 0x00,
-};
-
 static struct mxt_platform_data mxt_platform_data = {
-	.config			= mxt_init_vals,
-	.config_length		= ARRAY_SIZE(mxt_init_vals),
-
 	.x_line			= 18,
 	.y_line			= 11,
 	.x_size			= 1024,
-- 
1.7.1.569.g6f426
