From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: [PATCH v5 4/7] ARM: S5P: Virtual Addresses for DMCx registers.
Date: Thu, 29 Jul 2010 19:25:42 +0900
Message-ID: <1280399145-22761-5-git-send-email-myungjoo.ham@samsung.com>
References: <1280399145-22761-1-git-send-email-myungjoo.ham@samsung.com>
 <1280399145-22761-2-git-send-email-myungjoo.ham@samsung.com>
 <1280399145-22761-3-git-send-email-myungjoo.ham@samsung.com>
 <1280399145-22761-4-git-send-email-myungjoo.ham@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:63027 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756378Ab0G2KZu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 29 Jul 2010 06:25:50 -0400
Received: from epmmp1 (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L6B00179EAXVD20@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 29 Jul 2010 19:25:45 +0900 (KST)
Received: from TNRNDGASPAPP1.tn.corp.samsungelectronics.net ([165.213.149.150])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L6B008T2EAXU5@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 29 Jul 2010 19:25:45 +0900 (KST)
In-reply-to: <1280399145-22761-4-git-send-email-myungjoo.ham@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: kyungmin.park@samsung.com, kgene.kim@samsung.com, myungjoo.ham@gmail.com, ben-linux@fluff.org, linux-samsung-soc@vger.kernel.org

	The CPUFREQ driver requires an access to DMCx registers. We
define virtual addresses of DMCx registers.

Signed-off-by: MyungJoo Ham <myungjoo.ham@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/plat-s5p/include/plat/map-s5p.h |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/arch/arm/plat-s5p/include/plat/map-s5p.h b/arch/arm/plat-s5p/include/plat/map-s5p.h
index 1482852..bd803f1 100644
--- a/arch/arm/plat-s5p/include/plat/map-s5p.h
+++ b/arch/arm/plat-s5p/include/plat/map-s5p.h
@@ -31,4 +31,7 @@
 #define VA_VIC2			VA_VIC(2)
 #define VA_VIC3			VA_VIC(3)
 
+#define S5P_VA_DMC0		S3C_ADDR(0x00a00000)
+#define S5P_VA_DMC1		S3C_ADDR(0x00b00000)
+
 #endif /* __ASM_PLAT_MAP_S5P_H */
-- 
1.6.3.3
