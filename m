From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 0/2] Chained irq fixes
Date: Wed, 27 Jul 2011 12:13:19 +0200
Message-ID: <1311761601-1570-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:59045 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754036Ab1G0KNj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Jul 2011 06:13:39 -0400
Received: from eu_spt1 ([210.118.77.14]) by mailout4.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0LOZ002EMLQPV270@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 27 Jul 2011 11:13:37 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LOZ00CO5LQO0F@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 27 Jul 2011 11:13:37 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Angus Ainslie <angus.ainslie@linaro.org>

Hello,

It looks that the chained IRQ enter/exit functions are missing in more
places. This short patch series fixes all chained irq usage on Exynos4
platform. 

Best regards
Marek Szyprowski
Samsung Poland R&D Center


Summary:

Marek Szyprowski (2):
  ARM: Exynos4: add required chained_irq_enter/exit to eint code
  ARM: S5P: add required chained_irq_enter/exit to gpio-int code

 arch/arm/mach-exynos4/irq-eint.c |    7 +++++++
 arch/arm/plat-s5p/irq-gpioint.c  |    6 ++++++
 2 files changed, 13 insertions(+), 0 deletions(-)

-- 
1.7.1.569.g6f426
