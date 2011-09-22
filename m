From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] GPIO: Samsung: fix GPIO interrupt registration for Exynos4 SoCs
Date: Thu, 22 Sep 2011 17:04:48 +0200
Message-ID: <1316703888-11986-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:51011 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753216Ab1IVPFB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 Sep 2011 11:05:01 -0400
Received: from euspt2 ([210.118.77.14]) by mailout4.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0LRX000I7J8BRX50@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 22 Sep 2011 16:04:59 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LRX0016ZJ8A0Y@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 22 Sep 2011 16:04:59 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Angus Ainslie <angus.ainslie@linaro.org>, Grant Likely <grant.likely@secretlab.ca>

Commit 1b39d5f2cc introduced new common gpio driver for all Samsung GPIO
SoCs. The new driver doesn't correctly register GPIO interrupts on
Samsung Exynos4 SoCs. This is caused by a typo in define name. This
patch fixes this issue.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/gpio/gpio-samsung.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/gpio/gpio-samsung.c b/drivers/gpio/gpio-samsung.c
index be13580..cdffb0c 100644
--- a/drivers/gpio/gpio-samsung.c
+++ b/drivers/gpio/gpio-samsung.c
@@ -2461,7 +2461,7 @@ static __init int samsung_gpiolib_init(void)
 		}
 		samsung_gpiolib_add_4bit_chips(exynos4_gpios_3, nr_chips, S5P_VA_GPIO3);
 
-#if defined(CONFIG_SOC_EXYNOS4210) && defined(CONFIG_S5P_GPIO_INT)
+#if defined(CONFIG_CPU_EXYNOS4210) && defined(CONFIG_S5P_GPIO_INT)
 		s5p_register_gpioint_bank(IRQ_GPIO_XA, 0, IRQ_GPIO1_NR_GROUPS);
 		s5p_register_gpioint_bank(IRQ_GPIO_XB, IRQ_GPIO1_NR_GROUPS, IRQ_GPIO2_NR_GROUPS);
 #endif
-- 
1.7.1.569.g6f426
