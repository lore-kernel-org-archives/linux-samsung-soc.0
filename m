From: Huisung Kang <hs1218.kang@samsung.com>
Subject: [PATCHv2] ARM: S5P: Can handle edge interrupt handler
Date: Sat, 11 Feb 2012 11:47:35 +0900
Message-ID: <017f01cce867$825f9740$871ec5c0$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:44448 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752283Ab2BKCrg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 10 Feb 2012 21:47:36 -0500
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LZ700FHAJRB4F70@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 11 Feb 2012 11:47:35 +0900 (KST)
Received: from NOHS1218KAN01 ([12.23.118.150])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LZ7008QRJRBUT80@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Sat, 11 Feb 2012 11:47:35 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, keyyoung.park@samsung.com

From: KeyYoung Park <keyyoung.park@samsung.com>

While wake up, if external interrupt uses handle_level_irq
as handle_irq (it actually uses edge type irq), That interrupt is missed.
So, if external uses edge type irq, it should use handle_edge_irq.

Signed-off-by: KeyYoung Park <keyyoung.park@samsung.com>
Signed-off-by: Huisung Kang <hs1218.kang@samsung.com>
---
 arch/arm/plat-s5p/irq-eint.c |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/arch/arm/plat-s5p/irq-eint.c b/arch/arm/plat-s5p/irq-eint.c
index c496b35..efdea58 100644
--- a/arch/arm/plat-s5p/irq-eint.c
+++ b/arch/arm/plat-s5p/irq-eint.c
@@ -115,6 +115,11 @@ static int s5p_irq_eint_set_type(struct irq_data *data, unsigned int type)
 	else
 		printk(KERN_ERR "No such irq number %d", offs);
 
+	if (type & IRQ_TYPE_EDGE_BOTH)
+		__irq_set_handler_locked(data->irq, handle_edge_irq);
+	else
+		__irq_set_handler_locked(data->irq, handle_level_irq);
+
 	return 0;
 }
 
-- 
1.7.1
