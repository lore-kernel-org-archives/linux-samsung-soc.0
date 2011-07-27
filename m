From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: S5P64X0: Replace irq_gc_ack() with irq_gc_ack_set_bit()
Date: Thu, 28 Jul 2011 08:51:22 +0900
Message-ID: <1311810682-28041-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:41373 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751435Ab1G1AEn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Jul 2011 20:04:43 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Kukjin Kim <kgene.kim@samsung.com>

According to 'replace irq_gc_ack() with {set,clr}_bit variants',
(commit: 659fb32d1b67476f4ade25e9ea0e2642a5b9c4b5), this should
be fixed.

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-s5p64x0/irq-eint.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-s5p64x0/irq-eint.c b/arch/arm/mach-s5p64x0/irq-eint.c
index 69ed454..fe7380f 100644
--- a/arch/arm/mach-s5p64x0/irq-eint.c
+++ b/arch/arm/mach-s5p64x0/irq-eint.c
@@ -129,7 +129,7 @@ static int s5p64x0_alloc_gc(void)
 	}
 
 	ct = gc->chip_types;
-	ct->chip.irq_ack = irq_gc_ack;
+	ct->chip.irq_ack = irq_gc_ack_set_bit;
 	ct->chip.irq_mask = irq_gc_mask_set_bit;
 	ct->chip.irq_unmask = irq_gc_mask_clr_bit;
 	ct->chip.irq_set_type = s5p64x0_irq_eint_set_type;
-- 
1.7.1
