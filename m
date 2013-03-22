From: Heiko =?utf-8?q?St=C3=BCbner?= <heiko@sntech.de>
Subject: [PATCH v4 3/5] irqchip: s3c24xx: fix irqlist of second s3c2416 controller
Date: Fri, 22 Mar 2013 18:45:30 +0100
Message-ID: <201303221845.30350.heiko@sntech.de>
References: <201303221843.37668.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:42529 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1422689Ab3CVRpk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 22 Mar 2013 13:45:40 -0400
In-Reply-To: <201303221843.37668.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Thomas Abraham <thomas.abraham@linaro.org>, Arnd Bergmann <arnd@arndb.de>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

The list in used was from the s3c2450, a close cousin of the s3c2416.
As it's not possible to distinguish between the s3c2416 and s3c2450
the additional interrupts of the s3c2450 will only be available thru
devicetree later.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/irqchip/irq-s3c24xx.c |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-s3c24xx.c b/drivers/irqchip/irq-s3c24xx.c
index 84afbc1..a565eb8 100644
--- a/drivers/irqchip/irq-s3c24xx.c
+++ b/drivers/irqchip/irq-s3c24xx.c
@@ -835,13 +835,12 @@ static struct s3c_irq_data init_s3c2416subint[32] = {
 
 static struct s3c_irq_data init_s3c2416_second[32] = {
 	{ .type = S3C_IRQTYPE_EDGE }, /* 2D */
-	{ .type = S3C_IRQTYPE_EDGE }, /* IIC1 */
+	{ .type = S3C_IRQTYPE_NONE }, /* reserved */
 	{ .type = S3C_IRQTYPE_NONE }, /* reserved */
 	{ .type = S3C_IRQTYPE_NONE }, /* reserved */
 	{ .type = S3C_IRQTYPE_EDGE }, /* PCM0 */
-	{ .type = S3C_IRQTYPE_EDGE }, /* PCM1 */
+	{ .type = S3C_IRQTYPE_NONE }, /* reserved */
 	{ .type = S3C_IRQTYPE_EDGE }, /* I2S0 */
-	{ .type = S3C_IRQTYPE_EDGE }, /* I2S1 */
 };
 
 void __init s3c2416_init_irq(void)
-- 
1.7.2.3
