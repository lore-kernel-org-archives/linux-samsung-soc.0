From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: S5P64X0: Fix iodesc array size for S5P6450
Date: Tue, 22 Mar 2011 13:11:26 +0900
Message-ID: <1300767086-14681-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:60915 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751411Ab1CVEk6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 22 Mar 2011 00:40:58 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Banajit Goswami <banajit.g@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

From: Banajit Goswami <banajit.g@samsung.com>

The array size parameter of iotable_init for S5P6450 is incorrect.
Fix this by passing the correct length of s5p6450_iodesc table.

Signed-off-by: Banajit Goswami <banajit.g@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-s5p64x0/cpu.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-s5p64x0/cpu.c b/arch/arm/mach-s5p64x0/cpu.c
index b8d02eb..a5c0095 100644
--- a/arch/arm/mach-s5p64x0/cpu.c
+++ b/arch/arm/mach-s5p64x0/cpu.c
@@ -119,7 +119,7 @@ void __init s5p6450_map_io(void)
 	s3c_adc_setname("s3c64xx-adc");
 
 	iotable_init(s5p64x0_iodesc, ARRAY_SIZE(s5p64x0_iodesc));
-	iotable_init(s5p6450_iodesc, ARRAY_SIZE(s5p6440_iodesc));
+	iotable_init(s5p6450_iodesc, ARRAY_SIZE(s5p6450_iodesc));
 }
 
 /*
-- 
1.7.1
