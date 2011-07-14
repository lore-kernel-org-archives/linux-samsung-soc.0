From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH 3/6] ARM: S5P64X0: Set s3c_device_fb name
Date: Thu, 14 Jul 2011 09:27:13 -0400
Message-ID: <1310650036-28836-4-git-send-email-ajaykumar.rs@samsung.com>
References: <1310650036-28836-1-git-send-email-ajaykumar.rs@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:15490 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753907Ab1GNHhx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 14 Jul 2011 03:37:53 -0400
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LOB0034ABUT6MH0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 14 Jul 2011 16:37:52 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.106])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LOB00FOKBUT2D@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 14 Jul 2011 16:37:52 +0900 (KST)
In-reply-to: <1310650036-28836-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, lethal@linux-sh.org, jg1.han@samsung.com

For S5P6440 and S5P6450:
Set s3c_device_fb name as "s5p64x0-fb", so that "s5p64x0-fb"
type driver_data is used in s3c-fb driver.

Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
---
 arch/arm/mach-s5p64x0/cpu.c |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s5p64x0/cpu.c b/arch/arm/mach-s5p64x0/cpu.c
index a5c0095..617da3b 100644
--- a/arch/arm/mach-s5p64x0/cpu.c
+++ b/arch/arm/mach-s5p64x0/cpu.c
@@ -38,6 +38,7 @@
 #include <plat/s5p6440.h>
 #include <plat/s5p6450.h>
 #include <plat/adc-core.h>
+#include <plat/fb-core.h>
 
 /* Initial IO mappings */
 
@@ -108,6 +109,7 @@ void __init s5p6440_map_io(void)
 {
 	/* initialize any device information early */
 	s3c_adc_setname("s3c64xx-adc");
+	s3c_fb_setname("s5p64x0-fb");
 
 	iotable_init(s5p64x0_iodesc, ARRAY_SIZE(s5p64x0_iodesc));
 	iotable_init(s5p6440_iodesc, ARRAY_SIZE(s5p6440_iodesc));
@@ -117,6 +119,7 @@ void __init s5p6450_map_io(void)
 {
 	/* initialize any device information early */
 	s3c_adc_setname("s3c64xx-adc");
+	s3c_fb_setname("s5p64x0-fb");
 
 	iotable_init(s5p64x0_iodesc, ARRAY_SIZE(s5p64x0_iodesc));
 	iotable_init(s5p6450_iodesc, ARRAY_SIZE(s5p6450_iodesc));
-- 
1.7.1
