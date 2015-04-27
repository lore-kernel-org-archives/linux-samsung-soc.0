From: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
Subject: [PATCH 1/2] genirq: MSI: Constify irq_domain_ops
Date: Mon, 27 Apr 2015 21:54:23 +0900
Message-ID: <1430139264-4362-1-git-send-email-k.kozlowski.k@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Kukjin Kim <kgene@kernel.org>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org

The irq_domain_ops are not modified. The irqdomain core code accepts
pointer to a const data.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
---
 kernel/irq/msi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/irq/msi.c b/kernel/irq/msi.c
index 474de5cb394d..7bf1f1bbb7fa 100644
--- a/kernel/irq/msi.c
+++ b/kernel/irq/msi.c
@@ -124,7 +124,7 @@ static void msi_domain_free(struct irq_domain *domain, unsigned int virq,
 	irq_domain_free_irqs_top(domain, virq, nr_irqs);
 }
 
-static struct irq_domain_ops msi_domain_ops = {
+static const struct irq_domain_ops msi_domain_ops = {
 	.alloc		= msi_domain_alloc,
 	.free		= msi_domain_free,
 	.activate	= msi_domain_activate,
-- 
2.1.0
