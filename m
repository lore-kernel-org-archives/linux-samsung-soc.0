From: Arvind Yadav <arvind.yadav.cs@gmail.com>
Subject: [PATCH 2/3] irqchip/s3c24xx:  pr_err() strings should end with newlines
Date: Mon, 13 Nov 2017 19:23:48 +0530
Message-ID: <c5960c9504b5817c8af947342105f01779a8c8b9.1510580710.git.arvind.yadav.cs@gmail.com>
References: <cover.1510580710.git.arvind.yadav.cs@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pg0-f67.google.com ([74.125.83.67]:44813 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752707AbdKMNyw (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 13 Nov 2017 08:54:52 -0500
In-Reply-To: <cover.1510580710.git.arvind.yadav.cs@gmail.com>
In-Reply-To: <cover.1510580710.git.arvind.yadav.cs@gmail.com>
References: <cover.1510580710.git.arvind.yadav.cs@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, kgene@kernel.org, krzk@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

pr_err() messages should end with a new-line to avoid other messages
being concatenated.

Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
---
 drivers/irqchip/irq-s3c24xx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-s3c24xx.c b/drivers/irqchip/irq-s3c24xx.c
index c25ce5a..ec0e6a8 100644
--- a/drivers/irqchip/irq-s3c24xx.c
+++ b/drivers/irqchip/irq-s3c24xx.c
@@ -156,7 +156,7 @@ static int s3c_irq_type(struct irq_data *data, unsigned int type)
 		irq_set_handler(data->irq, handle_level_irq);
 		break;
 	default:
-		pr_err("No such irq type %d", type);
+		pr_err("No such irq type %d\n", type);
 		return -EINVAL;
 	}
 
@@ -204,7 +204,7 @@ static int s3c_irqext_type_set(void __iomem *gpcon_reg,
 			break;
 
 		default:
-			pr_err("No such irq type %d", type);
+			pr_err("No such irq type %d\n", type);
 			return -EINVAL;
 	}
 
-- 
1.9.1
