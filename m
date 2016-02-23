From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH] ARM: plat-samsung: remove unused register definitions
Date: Tue, 23 Feb 2016 14:36:13 +0530
Message-ID: <1456218373-23658-1-git-send-email-pankaj.dubey@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:51554 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751644AbcBWJE4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Feb 2016 04:04:56 -0500
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0O2Z01W1MT86P7A0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 23 Feb 2016 18:04:54 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, k.kozlowski@samsung.com, thomas.ab@samsung.com, linux@arm.linux.org.uk, Pankaj Dubey <pankaj.dubey@samsung.com>

This patch removes S5P_VA_TWD and S3C_UART_OFFSET as it is no more used
by any platform which including this header file.

Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
---
 arch/arm/plat-samsung/include/plat/map-s5p.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm/plat-samsung/include/plat/map-s5p.h b/arch/arm/plat-samsung/include/plat/map-s5p.h
index e555769..b63aeeb 100644
--- a/arch/arm/plat-samsung/include/plat/map-s5p.h
+++ b/arch/arm/plat-samsung/include/plat/map-s5p.h
@@ -22,7 +22,6 @@
 #define S5P_VA_COREPERI_BASE	S3C_ADDR(0x02800000)
 #define S5P_VA_COREPERI(x)	(S5P_VA_COREPERI_BASE + (x))
 #define S5P_VA_SCU		S5P_VA_COREPERI(0x0)
-#define S5P_VA_TWD		S5P_VA_COREPERI(0x600)
 
 #define VA_VIC(x)		(S3C_VA_IRQ + ((x) * 0x10000))
 #define VA_VIC0			VA_VIC(0)
@@ -30,10 +29,6 @@
 #define VA_VIC2			VA_VIC(2)
 #define VA_VIC3			VA_VIC(3)
 
-#ifndef S3C_UART_OFFSET
-#define S3C_UART_OFFSET		(0x400)
-#endif
-
 #include <plat/map-s3c.h>
 
 #endif /* __ASM_PLAT_MAP_S5P_H */
-- 
2.4.5
