From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH] ARM: SAMSUNG: Fix typo in definition of
 VIDCON1_VSTATUS_FRONTPORCH value
Date: Wed, 07 Nov 2012 13:31:21 +0100
Message-ID: <1429686.vBaRDnu5Be@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:45917 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754921Ab2KGMb1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Nov 2012 07:31:27 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MD400FGXASCAQN0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 07 Nov 2012 21:31:25 +0900 (KST)
Received: from amdc1227.localnet ([106.116.147.199])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MD400B18ASB3RB0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 07 Nov 2012 21:31:25 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>

The correct value for VIDCON1_VSTATUS_FRONTPORCH is 3, not 0.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 include/video/samsung_fimd.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/video/samsung_fimd.h b/include/video/samsung_fimd.h
index 7ae6c07..263ed4b 100644
--- a/include/video/samsung_fimd.h
+++ b/include/video/samsung_fimd.h
@@ -82,7 +82,7 @@
 #define VIDCON1_VSTATUS_VSYNC			(0x0 << 13)
 #define VIDCON1_VSTATUS_BACKPORCH		(0x1 << 13)
 #define VIDCON1_VSTATUS_ACTIVE			(0x2 << 13)
-#define VIDCON1_VSTATUS_FRONTPORCH		(0x0 << 13)
+#define VIDCON1_VSTATUS_FRONTPORCH		(0x3 << 13)
 #define VIDCON1_VCLK_MASK			(0x3 << 9)
 #define VIDCON1_VCLK_HOLD			(0x0 << 9)
 #define VIDCON1_VCLK_RUN			(0x1 << 9)
-- 
1.8.0
