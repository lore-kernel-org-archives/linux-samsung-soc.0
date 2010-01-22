From: Maurus Cuelenaere <mcuelenaere@gmail.com>
Subject: [PATCH] ARM: SAMSUNG: Fix null pointer dereference in ADC driver
Date: Fri, 22 Jan 2010 23:29:16 +0100
Message-ID: <b2e8f9f71001221429l5ea24cd8j3046e7a24546320a@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f227.google.com ([209.85.218.227]:56431 "EHLO
	mail-bw0-f227.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752402Ab0AVW3i (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 22 Jan 2010 17:29:38 -0500
Received: by bwz27 with SMTP id 27so1509605bwz.21
        for <linux-samsung-soc@vger.kernel.org>; Fri, 22 Jan 2010 14:29:37 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>

ARM: SAMSUNG: Fix null pointer dereference in ADC driver

Use struct adc_device instead of relying on client (which could be
NULL) when checking for SoC type.

Signed-off-by: Maurus Cuelenaere <mcuelenaere@gmail.com>
---
 arch/arm/plat-samsung/adc.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/plat-samsung/adc.c b/arch/arm/plat-samsung/adc.c
index 120b790..c7659b7 100644
--- a/arch/arm/plat-samsung/adc.c
+++ b/arch/arm/plat-samsung/adc.c
@@ -295,7 +295,7 @@ static irqreturn_t s3c_adc_irq(int irq, void *pw)
 	}

 exit:
-	if (platform_get_device_id(client->pdev)->driver_data == TYPE_S3C64XX) {
+	if (platform_get_device_id(adc->pdev)->driver_data == TYPE_S3C64XX) {
 		/* Clear ADC interrupt */
 		writel(0, adc->regs + S3C64XX_ADCCLRINT);
 	}
-- 
1.6.6.1
