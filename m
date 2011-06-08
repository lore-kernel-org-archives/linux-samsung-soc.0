From: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Subject: [PATCH] ARM: EXYNOS4: Fix missing S5P_VA_AUDSS definition
Date: Wed, 08 Jun 2011 15:15:40 +0530
Message-ID: <1307526340-19910-1-git-send-email-ch.naveen@samsung.com>
References: <1303954372-18565-2-git-send-email-sbkim73@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:14301 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751289Ab1FHJtH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 8 Jun 2011 05:49:07 -0400
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LMG002JUTXDIFP0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 08 Jun 2011 18:49:05 +0900 (KST)
Received: from Hawshines.sisodomain.com (unknown [107.108.83.161])
 by mmp1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTPA id <0LMG005TZTXOO600@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 08 Jun 2011 18:49:04 +0900 (KST)
In-reply-to: <1303954372-18565-2-git-send-email-sbkim73@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com

This patch fixes the 'S5P_VA_AUDSS' missing definition
causing compilation break.

Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
---
 arch/arm/plat-s5p/include/plat/map-s5p.h |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arm/plat-s5p/include/plat/map-s5p.h b/arch/arm/plat-s5p/include/plat/map-s5p.h
index d973d39..daa4a44 100644
--- a/arch/arm/plat-s5p/include/plat/map-s5p.h
+++ b/arch/arm/plat-s5p/include/plat/map-s5p.h
@@ -40,6 +40,7 @@
 #define S5P_VA_GIC_DIST		S5P_VA_COREPERI(0x1000)
 
 #define S3C_VA_USB_HSPHY	S3C_ADDR(0x02900000)
+#define S5P_VA_AUDSS		S3C_ADDR(0x02A00000)
 
 #define VA_VIC(x)		(S3C_VA_IRQ + ((x) * 0x10000))
 #define VA_VIC0			VA_VIC(0)
-- 
1.7.2.3
