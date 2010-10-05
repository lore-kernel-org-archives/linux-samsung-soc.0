From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: S5P64X0: FIX typo in the ADC device name
Date: Tue,  5 Oct 2010 22:14:40 +0900
Message-ID: <1286284480-1236-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:49496 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752794Ab0JENYV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Oct 2010 09:24:21 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Naveen Krishna Ch <ch.naveen@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

From: Naveen Krishna Ch <ch.naveen@samsung.com>

Fix the touch screen device name from s3c64x0-adc to s3c64xx-adc.

Signed-off-by: Naveen Krishna Ch <ch.naveen@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-s5p64x0/cpu.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-s5p64x0/cpu.c b/arch/arm/mach-s5p64x0/cpu.c
index fb90a30..0a2d88a 100644
--- a/arch/arm/mach-s5p64x0/cpu.c
+++ b/arch/arm/mach-s5p64x0/cpu.c
@@ -106,7 +106,7 @@ static void s5p64x0_idle(void)
 void __init s5p6440_map_io(void)
 {
 	/* initialize any device information early */
-	s3c_adc_setname("s3c64x0-adc");
+	s3c_adc_setname("s3c64xx-adc");
 
 	iotable_init(s5p64x0_iodesc, ARRAY_SIZE(s5p64x0_iodesc));
 	iotable_init(s5p6440_iodesc, ARRAY_SIZE(s5p6440_iodesc));
@@ -115,7 +115,7 @@ void __init s5p6440_map_io(void)
 void __init s5p6450_map_io(void)
 {
 	/* initialize any device information early */
-	s3c_adc_setname("s3c64x0-adc");
+	s3c_adc_setname("s3c64xx-adc");
 
 	iotable_init(s5p64x0_iodesc, ARRAY_SIZE(s5p64x0_iodesc));
 	iotable_init(s5p6450_iodesc, ARRAY_SIZE(s5p6440_iodesc));
-- 
1.6.2.5
