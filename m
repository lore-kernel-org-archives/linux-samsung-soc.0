From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: SAMSUNG: fix to support for missing cpu specific map_io
Date: Tue, 30 Jul 2013 13:27:57 +0900
Message-ID: <190501ce8cdd$2abd6780$80383680$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:52169 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752515Ab3G3E17 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 30 Jul 2013 00:27:59 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MQQ0059IF2FUVF0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 30 Jul 2013 13:27:57 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: 'Kukjin Kim' <kgene@kernel.org>, 'Kukjin Kim' <kgene.kim@samsung.com>


Since commit 7ed76e08 (ARM: EXYNOS: Fix low level debug support)
map_io() is not needed for exynos5440 so need to fix to lookup
cpu which using map_io(). Without this, kernel boot log complains
'CPU EXYNOS5440 support not enabled' on exynos5440 and panic().

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/plat-samsung/init.c |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm/plat-samsung/init.c b/arch/arm/plat-samsung/init.c
index 3e5c461..50a3ea0 100644
--- a/arch/arm/plat-samsung/init.c
+++ b/arch/arm/plat-samsung/init.c
@@ -55,12 +55,13 @@ void __init s3c_init_cpu(unsigned long idcode,
 
 	printk("CPU %s (id 0x%08lx)\n", cpu->name, idcode);
 
-	if (cpu->map_io == NULL || cpu->init == NULL) {
+	if (cpu->init == NULL) {
 		printk(KERN_ERR "CPU %s support not enabled\n", cpu->name);
 		panic("Unsupported Samsung CPU");
 	}
 
-	cpu->map_io();
+	if (cpu->map_io)
+		cpu->map_io();
 }
 
 /* s3c24xx_init_clocks
-- 
1.7.10.4
