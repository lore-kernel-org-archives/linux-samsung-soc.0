From: Chen Gang <gang.chen@asianux.com>
Subject: [PATCH] ARM:s3c24xx: beautify code, data->hwirq is unsigned long
 which is always >= 0
Date: Tue, 26 Mar 2013 14:54:40 +0800
Message-ID: <51514630.6090906@asianux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from intranet.asianux.com ([58.214.24.6]:22292 "EHLO
	intranet.asianux.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753695Ab3CZGzN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Mar 2013 02:55:13 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: ben-linux@fluff.org, "kgene.kim@samsung.com" <kgene.kim@samsung.com>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org >>
	\"linux-samsung-soc@vger.kernel.org\"" <linux-samsung-soc@vger.kernel.org>


  data->hwirq is unsigned long which is always >= 0

Signed-off-by: Chen Gang <gang.chen@asianux.com>
---
 arch/arm/mach-s3c24xx/irq.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-s3c24xx/irq.c b/arch/arm/mach-s3c24xx/irq.c
index 5c9f8b7..143f57b 100644
--- a/arch/arm/mach-s3c24xx/irq.c
+++ b/arch/arm/mach-s3c24xx/irq.c
@@ -210,7 +210,7 @@ static int s3c_irqext0_type(struct irq_data *data, unsigned int type)
 	void __iomem *gpcon_reg;
 	unsigned long gpcon_offset, extint_offset;
 
-	if ((data->hwirq >= 0) && (data->hwirq <= 3)) {
+	if (data->hwirq <= 3) {
 		gpcon_reg = S3C2410_GPFCON;
 		extint_reg = S3C24XX_EXTINT0;
 		gpcon_offset = (data->hwirq) * 2;
-- 
1.7.7.6
