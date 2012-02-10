From: Huisung Kang <hs1218.kang@samsung.com>
Subject: [PATCH] ARM: SAMSUNG: Add over sampling preventing code
Date: Fri, 10 Feb 2012 21:22:58 +0900
Message-ID: <017001cce7ee$b97cac50$2c7604f0$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:62420 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754694Ab2BJMXP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 10 Feb 2012 07:23:15 -0500
Received: from epcpsbgm1.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LZ6006JEFQ91OV0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 10 Feb 2012 21:23:13 +0900 (KST)
Received: from NOHS1218KAN01 ([12.23.118.150])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LZ600GFMFQAWQ80@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Fri, 10 Feb 2012 21:22:58 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, dsfine.ha@samsung.com

From: Dongsoo Ha <dsfine.ha@samsung.com>

Multiple calling adc by other device have happend over sampling.
It can be TS(TouchScreen), in the issue, while the adc is approaching.
This commit is preventing code for over sampling.

Signed-off-by: Dongsoo Ha <dsfine.ha@samsung.com>
Signed-off-by: Huisung Kang <hs1218.kang@samsung.com>
---
 arch/arm/plat-samsung/adc.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/arch/arm/plat-samsung/adc.c b/arch/arm/plat-samsung/adc.c
index 33ecd0c..10b32ea 100644
--- a/arch/arm/plat-samsung/adc.c
+++ b/arch/arm/plat-samsung/adc.c
@@ -297,7 +297,8 @@ static irqreturn_t s3c_adc_irq(int irq, void *pw)
 	data1 = readl(adc->regs + S3C2410_ADCDAT1);
 	adc_dbg(adc, "read %d: 0x%04x, 0x%04x\n", client->nr_samples, data0, data1);
 
-	client->nr_samples--;
+	if (client->nr_samples > 0)
+		client->nr_samples--;
 
 	if (cpu == TYPE_ADCV1 || cpu == TYPE_ADCV11) {
 		data0 &= 0x3ff;
-- 
1.7.1
