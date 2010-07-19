From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: [PATCH v3 4/7] ARM: S5P: Virtual Addresses for DMCx registers.
Date: Mon, 19 Jul 2010 14:31:20 +0900
Message-ID: <1279517483-22751-5-git-send-email-myungjoo.ham@samsung.com>
References: <1279517483-22751-1-git-send-email-myungjoo.ham@samsung.com>
 <1279517483-22751-2-git-send-email-myungjoo.ham@samsung.com>
 <1279517483-22751-3-git-send-email-myungjoo.ham@samsung.com>
 <1279517483-22751-4-git-send-email-myungjoo.ham@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:24217 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752745Ab0GSFba (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Jul 2010 01:31:30 -0400
Received: from epmmp2 (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L5S000TMI0BRA60@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 19 Jul 2010 14:31:23 +0900 (KST)
Received: from TNRNDGASPAPP1.tn.corp.samsungelectronics.net ([165.213.149.150])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L5S0082KI0BF4@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 19 Jul 2010 14:31:23 +0900 (KST)
In-reply-to: <1279517483-22751-4-git-send-email-myungjoo.ham@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: kyungmin.park@samsung.com, kgene.kim@samsung.com, myungjoo.ham@gmail.com, ben-linux@fluff.org, linux-samsung-soc@vger.kernel.org

	The CPUFREQ driver requires an access to DMCx registers.

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
