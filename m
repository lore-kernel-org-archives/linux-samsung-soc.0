From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: [PATCH v2 1/5] ARM: Samsung SoC: added hclk/pclk info to s3c_freq for
 s5pv210 cpu-freq
Date: Fri, 16 Jul 2010 17:01:13 +0900
Message-ID: <1279267277-6804-2-git-send-email-myungjoo.ham@samsung.com>
References: <1279267277-6804-1-git-send-email-myungjoo.ham@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:18235 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S935877Ab0GPIBh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 16 Jul 2010 04:01:37 -0400
Received: from epmmp2 (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L5N00MTV4Y5R670@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 16 Jul 2010 17:01:17 +0900 (KST)
Received: from TNRNDGASPAPP1.tn.corp.samsungelectronics.net ([165.213.149.150])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L5N00EHU4Y5Z5@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 16 Jul 2010 17:01:17 +0900 (KST)
In-reply-to: <1279267277-6804-1-git-send-email-myungjoo.ham@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: kyungmin.park@samsung.com, kgene.kim@samsung.com, myungjoo.ham@gmail.com, ben-linux@fluff.org, linux-samsung-soc@vger.kernel.org

S5PV210 requires msys/dsys info as well; thus, we've included those at
struct s3c_freq, which is used by CPUFREQ of S5PV210.

Signed-off-by: MyungJoo Ham <myungjoo.ham@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/plat-samsung/include/plat/cpu-freq.h |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/arch/arm/plat-samsung/include/plat/cpu-freq.h b/arch/arm/plat-samsung/include/plat/cpu-freq.h
index 80c4a80..9e97df7 100644
--- a/arch/arm/plat-samsung/include/plat/cpu-freq.h
+++ b/arch/arm/plat-samsung/include/plat/cpu-freq.h
@@ -38,6 +38,12 @@ struct s3c_freq {
 	unsigned long	hclk_tns;	/* in 10ths of ns */
 	unsigned long	hclk;
 	unsigned long	pclk;
+#ifdef CONFIG_ARCH_S5PV210
+	unsigned long	hclk_msys;
+	unsigned long	pclk_msys;
+	unsigned long	hclk_dsys;
+	unsigned long	pclk_dsys;
+#endif
 };
 
 /**
-- 
1.6.3.3
