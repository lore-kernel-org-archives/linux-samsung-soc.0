From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH V4 RESEND 3/6] ARM: S5P64X0: Set s3c_device_fb name
Date: Fri, 09 Sep 2011 14:01:38 -0400
Message-ID: <1315591301-17166-4-git-send-email-ajaykumar.rs@samsung.com>
References: <1315591301-17166-1-git-send-email-ajaykumar.rs@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:12720 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933743Ab1IIMBy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 9 Sep 2011 08:01:54 -0400
Received: from epcpsbgm1.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LR900NCX82W4DS0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 09 Sep 2011 21:01:53 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.106])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LR900IDU82TO1@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 09 Sep 2011 21:01:53 +0900 (KST)
In-reply-to: <1315591301-17166-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, jg1.han@samsung.com, m.szyprowski@samsung.com

Set s3c_device_fb name as "s5p64x0-fb" for S5P6440 and S5P6450.

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
1.7.0.4
