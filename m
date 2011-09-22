From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] ARM: Samsung: gpio-interrupts: fix incorrect loop iterator
 usage
Date: Thu, 22 Sep 2011 17:05:18 +0200
Message-ID: <1316703918-12247-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:8546 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753216Ab1IVPF0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 Sep 2011 11:05:26 -0400
Received: from euspt2 (mailout2.w1.samsung.com [210.118.77.12])
 by mailout2.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LRX00JDCJ91CK@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 22 Sep 2011 16:05:25 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LRX003ASJ90RR@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 22 Sep 2011 16:05:25 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

Loop iterator value after terminating list_for_each_entry() is not NULL.
This patch fixes incorrect iterator usage in GPIO interrupt code for
Samsung S5P platforms.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/plat-s5p/irq-gpioint.c |    9 +++++----
 1 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/arm/plat-s5p/irq-gpioint.c b/arch/arm/plat-s5p/irq-gpioint.c
index 0455519..a566523 100644
--- a/arch/arm/plat-s5p/irq-gpioint.c
+++ b/arch/arm/plat-s5p/irq-gpioint.c
@@ -114,17 +114,18 @@ static __init int s5p_gpioint_add(struct samsung_gpio_chip *chip)
 {
 	static int used_gpioint_groups = 0;
 	int group = chip->group;
-	struct s5p_gpioint_bank *bank = NULL;
+	struct s5p_gpioint_bank *b, *bank = NULL;
 	struct irq_chip_generic *gc;
 	struct irq_chip_type *ct;
 
 	if (used_gpioint_groups >= S5P_GPIOINT_GROUP_COUNT)
 		return -ENOMEM;
 
-	list_for_each_entry(bank, &banks, list) {
-		if (group >= bank->start &&
-		    group < bank->start + bank->nr_groups)
+	list_for_each_entry(b, &banks, list) {
+		if (group >= b->start && group < b->start + b->nr_groups) {
+			bank = b;
 			break;
+		}
 	}
 	if (!bank)
 		return -EINVAL;
-- 
1.7.1.569.g6f426
