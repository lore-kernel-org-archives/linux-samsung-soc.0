From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: [PATCH v3 1/6] ARM: EXYNOS4: Increase NR_IRQS for devices with more
 IRQs
Date: Thu, 30 Jun 2011 17:15:24 +0900
Message-ID: <1309421729-11172-2-git-send-email-myungjoo.ham@samsung.com>
References: <1309421729-11172-1-git-send-email-myungjoo.ham@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:54785 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758640Ab1F3IPd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 30 Jun 2011 04:15:33 -0400
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LNL00FDGG8OUVK0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 30 Jun 2011 17:15:29 +0900 (KST)
Received: from TNRNDGASPAPP1.tn.corp.samsungelectronics.net ([165.213.149.150])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LNL00H32G9TNU@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 30 Jun 2011 17:15:29 +0900 (KST)
In-reply-to: <1309421729-11172-1-git-send-email-myungjoo.ham@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Changhwan Youn <chaos.youn@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, myungjoo.ham@gmail.com, tushar.behera@linaro.org

MAX8997/17042, which are used by Exynos4-NURI, use additional IRQ
numbers after GPIO's IRQs. The patch creates some room for those
devices.

Signed-off-by: MyungJoo Ham <myungjoo.ham@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos4/include/mach/irqs.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-exynos4/include/mach/irqs.h b/arch/arm/mach-exynos4/include/mach/irqs.h
index 31f6bed..51b5db5 100644
--- a/arch/arm/mach-exynos4/include/mach/irqs.h
+++ b/arch/arm/mach-exynos4/include/mach/irqs.h
@@ -154,6 +154,6 @@
 #define IRQ_GPIO_END		(S5P_GPIOINT_BASE + S5P_GPIOINT_COUNT)
 
 /* Set the default NR_IRQS */
-#define NR_IRQS			(IRQ_GPIO_END)
+#define NR_IRQS			(IRQ_GPIO_END + 64)
 
 #endif /* __ASM_ARCH_IRQS_H */
-- 
1.7.4.1
