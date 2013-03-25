From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: [PATCH v5 2/7] irqchip: s3c24xx: fix comments on some camera interrupts
Date: Mon, 25 Mar 2013 22:27:55 +0100
Message-ID: <201303252227.55498.heiko@sntech.de>
References: <201303252226.21402.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:46957 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758935Ab3CYV1w (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 25 Mar 2013 17:27:52 -0400
In-Reply-To: <201303252226.21402.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Thomas Abraham <thomas.abraham@linaro.org>, Arnd Bergmann <arnd@arndb.de>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Might be confusing for people to read the code without having the
datasheet nearby.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/irqchip/irq-s3c24xx.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

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
1.7.10.4
