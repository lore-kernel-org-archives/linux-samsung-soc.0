From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: S5P: Bug fix on external interrupt for S5P series
Date: Mon, 31 May 2010 16:18:29 +0900
Message-ID: <1275290309-5124-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:42608 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756395Ab0EaH0J (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 31 May 2010 03:26:09 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Boojin Kim <boojin.kim@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

From: Boojin Kim <boojin.kim@samsung.com>

This patch fixes bug on eint type set function, s5p_irq_eint_set_type().
In the IRQ_TYPE_EDGE_FALLING case, S5P_EXTINT_FALLEDGE is right
instead of S5P_EXTINT_RISEEDGE

Signed-off-by: Boojin Kim <boojin.kim@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/plat-s5p/irq-eint.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/plat-s5p/irq-eint.c b/arch/arm/plat-s5p/irq-eint.c
index e56c807..f36cd33 100644
--- a/arch/arm/plat-s5p/irq-eint.c
+++ b/arch/arm/plat-s5p/irq-eint.c
@@ -71,7 +71,7 @@ static int s5p_irq_eint_set_type(unsigned int irq, unsigned int type)
 		break;
 
 	case IRQ_TYPE_EDGE_FALLING:
-		newvalue = S5P_EXTINT_RISEEDGE;
+		newvalue = S5P_EXTINT_FALLEDGE;
 		break;
 
 	case IRQ_TYPE_EDGE_BOTH:
-- 
1.6.2.5
