From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: [PATCH v5 5/7] ARM: S5PV210: Access for DMCx registers
Date: Thu, 29 Jul 2010 19:25:43 +0900
Message-ID: <1280399145-22761-6-git-send-email-myungjoo.ham@samsung.com>
References: <1280399145-22761-1-git-send-email-myungjoo.ham@samsung.com>
 <1280399145-22761-2-git-send-email-myungjoo.ham@samsung.com>
 <1280399145-22761-3-git-send-email-myungjoo.ham@samsung.com>
 <1280399145-22761-4-git-send-email-myungjoo.ham@samsung.com>
 <1280399145-22761-5-git-send-email-myungjoo.ham@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:63027 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756607Ab0G2KZv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 29 Jul 2010 06:25:51 -0400
Received: from epmmp1 (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L6B00179EAXVD20@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 29 Jul 2010 19:25:45 +0900 (KST)
Received: from TNRNDGASPAPP1.tn.corp.samsungelectronics.net ([165.213.149.150])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L6B008T2EAXU5@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 29 Jul 2010 19:25:45 +0900 (KST)
In-reply-to: <1280399145-22761-5-git-send-email-myungjoo.ham@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: kyungmin.park@samsung.com, kgene.kim@samsung.com, myungjoo.ham@gmail.com, ben-linux@fluff.org, linux-samsung-soc@vger.kernel.org

	The CPUFREQ driver requires an access to DMCx registers. We
define physical addresses and mapping between physical and virtual
addresses of DMCx registers.

Signed-off-by: MyungJoo Ham <myungjoo.ham@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-s5pv210/cpu.c              |   12 +++++++++++-
 arch/arm/mach-s5pv210/include/mach/map.h |    4 ++++
 2 files changed, 15 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-s5pv210/cpu.c b/arch/arm/mach-s5pv210/cpu.c
index 77bf37d..82ca2d5 100644
--- a/arch/arm/mach-s5pv210/cpu.c
+++ b/arch/arm/mach-s5pv210/cpu.c
@@ -61,7 +61,17 @@ static struct map_desc s5pv210_iodesc[] __initdata = {
 		.pfn		= __phys_to_pfn(S5PV210_PA_SROMC),
 		.length		= SZ_4K,
 		.type		= MT_DEVICE,
-	}
+	}, {
+		.virtual	= (unsigned long)S5P_VA_DMC0,
+		.pfn		= __phys_to_pfn(S5PV210_PA_DMC0),
+		.length		= SZ_4K,
+		.type		= MT_DEVICE,
+	}, {
+		.virtual	= (unsigned long)S5P_VA_DMC1,
+		.pfn		= __phys_to_pfn(S5PV210_PA_DMC1),
+		.length		= SZ_4K,
+		.type		= MT_DEVICE,
+	},
 };
 
 static void s5pv210_idle(void)
diff --git a/arch/arm/mach-s5pv210/include/mach/map.h b/arch/arm/mach-s5pv210/include/mach/map.h
index 17687f0..daf6456 100644
--- a/arch/arm/mach-s5pv210/include/mach/map.h
+++ b/arch/arm/mach-s5pv210/include/mach/map.h
@@ -108,4 +108,8 @@
 #define SAMSUNG_PA_ADC		S5PV210_PA_ADC
 #define SAMSUNG_PA_KEYPAD	S5PV210_PA_KEYPAD
 
+/* DMC */
+#define S5PV210_PA_DMC0		(0xF0000000)
+#define S5PV210_PA_DMC1		(0xF1400000)
+
 #endif /* __ASM_ARCH_MAP_H */
-- 
1.6.3.3
