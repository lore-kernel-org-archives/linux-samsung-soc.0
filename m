From: Heiko =?utf-8?q?St=C3=BCbner?= <heiko@sntech.de>
Subject: [PATCH v3 2/6] irqchip: s3c24xx: fix comments on some camera interrupts
Date: Sun, 17 Mar 2013 14:05:58 +0100
Message-ID: <201303171405.58570.heiko@sntech.de>
References: <201303171404.06146.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:45126 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756244Ab3CQNGH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 17 Mar 2013 09:06:07 -0400
In-Reply-To: <201303171404.06146.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Thomas Abraham <thomas.abraham@linaro.org>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Might be confusing for people to read the code without having the
datasheet nearby.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/irqchip/irq-s3c24xx.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-s3c24xx.c b/drivers/irqchip/irq-s3c24xx.c
index 5c9f8b7..84afbc1 100644
--- a/drivers/irqchip/irq-s3c24xx.c
+++ b/drivers/irqchip/irq-s3c24xx.c
@@ -916,8 +916,8 @@ static struct s3c_irq_data init_s3c2440subint[32] = {
 	{ .type = S3C_IRQTYPE_LEVEL, .parent_irq = 15 }, /* UART2-ERR */
 	{ .type = S3C_IRQTYPE_EDGE, .parent_irq = 31 }, /* TC */
 	{ .type = S3C_IRQTYPE_EDGE, .parent_irq = 31 }, /* ADC */
-	{ .type = S3C_IRQTYPE_LEVEL, .parent_irq = 6 }, /* TC */
-	{ .type = S3C_IRQTYPE_LEVEL, .parent_irq = 6 }, /* ADC */
+	{ .type = S3C_IRQTYPE_LEVEL, .parent_irq = 6 }, /* CAM_C */
+	{ .type = S3C_IRQTYPE_LEVEL, .parent_irq = 6 }, /* CAM_P */
 	{ .type = S3C_IRQTYPE_LEVEL, .parent_irq = 9 }, /* WDT */
 	{ .type = S3C_IRQTYPE_LEVEL, .parent_irq = 9 }, /* AC97 */
 };
@@ -991,8 +991,8 @@ static struct s3c_irq_data init_s3c2442subint[32] = {
 	{ .type = S3C_IRQTYPE_LEVEL, .parent_irq = 15 }, /* UART2-ERR */
 	{ .type = S3C_IRQTYPE_EDGE, .parent_irq = 31 }, /* TC */
 	{ .type = S3C_IRQTYPE_EDGE, .parent_irq = 31 }, /* ADC */
-	{ .type = S3C_IRQTYPE_LEVEL, .parent_irq = 6 }, /* TC */
-	{ .type = S3C_IRQTYPE_LEVEL, .parent_irq = 6 }, /* ADC */
+	{ .type = S3C_IRQTYPE_LEVEL, .parent_irq = 6 }, /* CAM_C */
+	{ .type = S3C_IRQTYPE_LEVEL, .parent_irq = 6 }, /* CAM_P */
 };
 
 void __init s3c2442_init_irq(void)
-- 
1.7.2.3
