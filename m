From: Heiko =?utf-8?q?St=C3=BCbner?= <heiko@sntech.de>
Subject: [PATCH v3 4/6] irqchip: s3c24xx: use irq_create_mapping for parent irqs
Date: Sun, 17 Mar 2013 14:07:17 +0100
Message-ID: <201303171407.17660.heiko@sntech.de>
References: <201303171404.06146.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:45172 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753472Ab3CQNHZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 17 Mar 2013 09:07:25 -0400
In-Reply-To: <201303171404.06146.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Thomas Abraham <thomas.abraham@linaro.org>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Getting the parent irq number thru irq_find_mapping will fail for non-legacy
irq_domains, as the mapping of the parent irq won't have been created.

As irq_create_mapping will just output an already mapped irq number if its
already mapped, this does also not influence the legacy mappings.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/irqchip/irq-s3c24xx.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/irqchip/irq-s3c24xx.c b/drivers/irqchip/irq-s3c24xx.c
index a565eb8..1eba289 100644
--- a/drivers/irqchip/irq-s3c24xx.c
+++ b/drivers/irqchip/irq-s3c24xx.c
@@ -429,7 +429,7 @@ static int s3c24xx_irq_map(struct irq_domain *h, unsigned int virq,
 		parent_irq_data->sub_bits |= (1UL << hw);
 
 		/* attach the demuxer to the parent irq */
-		irqno = irq_find_mapping(parent_intc->domain,
+		irqno = irq_create_mapping(parent_intc->domain,
 					 irq_data->parent_irq);
 		if (!irqno) {
 			pr_err("irq-s3c24xx: could not find mapping for parent irq %lu\n",
-- 
1.7.2.3
