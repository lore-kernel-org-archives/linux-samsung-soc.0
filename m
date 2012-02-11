From: Huisung Kang <hs1218.kang@samsung.com>
Subject: [PATCH] ARM: SAMSUNG: Additional code with standby mode
Date: Sat, 11 Feb 2012 11:50:00 +0900
Message-ID: <018001cce867$d93868d0$8ba93a70$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:26022 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752283Ab2BKCuC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 10 Feb 2012 21:50:02 -0500
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LZ70086XJVDVJ80@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 11 Feb 2012 11:50:01 +0900 (KST)
Received: from NOHS1218KAN01 ([12.23.118.150])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LZ700AZXJVCLP20@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Sat, 11 Feb 2012 11:50:01 +0900 (KST)
References: 
In-reply-to: 
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, dsfine.ha@samsung.com

From: Dongsoo Ha <dsfine.ha@samsung.com>

ADC device support standby mode that is activated
when TSSEL by '0' and STANBY by '1' bits are set in TSADCCON0
register. ADC operations are halt itself and hold TSDATXn(Yn)
values. It has been having power saving effect since it works.

Signed-off-by: Dongsoo Ha <dsfine.ha@samsung.com>
Signed-off-by: Huisung Kang <hs1218.kang@samsung.com>
---
 arch/arm/plat-samsung/adc.c |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/arch/arm/plat-samsung/adc.c b/arch/arm/plat-samsung/adc.c
index 10b32ea..e4e965c 100644
--- a/arch/arm/plat-samsung/adc.c
+++ b/arch/arm/plat-samsung/adc.c
@@ -104,6 +104,7 @@ static inline void s3c_adc_select(struct adc_device *adc,
 		con &= ~S3C2410_ADCCON_MUXMASK;
 	con &= ~S3C2410_ADCCON_STDBM;
 	con &= ~S3C2410_ADCCON_STARTMASK;
+	con |=  S3C2410_ADCCON_PRSCEN;
 
 	if (!client->is_ts) {
 		if (cpu == TYPE_ADCV3)
@@ -129,6 +130,7 @@ static void s3c_adc_dbgshow(struct adc_device *adc)
 static void s3c_adc_try(struct adc_device *adc)
 {
 	struct s3c_adc_client *next = adc->ts_pend;
+	unsigned int con = readl(adc->regs + S3C2410_ADCCON);
 
 	if (!next && !list_empty(&adc_pending)) {
 		next = list_first_entry(&adc_pending,
@@ -143,6 +145,10 @@ static void s3c_adc_try(struct adc_device *adc)
 		s3c_adc_select(adc, next);
 		s3c_adc_convert(adc);
 		s3c_adc_dbgshow(adc);
+	} else {
+		con &= ~S3C2410_ADCCON_PRSCEN;
+		con |=  S3C2410_ADCCON_STDBM;
+		writel(con, adc->regs + S3C2410_ADCCON);
 	}
 }
 
@@ -409,6 +415,7 @@ static int s3c_adc_probe(struct platform_device *pdev)
 	if (cpu == TYPE_ADCV2 || cpu == TYPE_ADCV3)
 		tmp |= S3C64XX_ADCCON_RESSEL;
 
+	tmp |= S3C2410_ADCCON_STDBM;
 	writel(tmp, adc->regs + S3C2410_ADCCON);
 
 	dev_info(dev, "attached adc driver\n");
-- 
1.7.1
