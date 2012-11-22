From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH] ARM: S3C2443: SPI clock channel setup is fixed
Date: Thu, 22 Nov 2012 17:22:41 +0900
Message-ID: <0f6d01cdc88a$8a0c5b00$9e251100$@org>
References: <50AAAABE.8090607@mail.ru> <0c8901cdc714$a567f7a0$f037e6e0$@org>
 <50ADDACE.9090709@mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:57355 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753668Ab2KVSdy convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 Nov 2012 13:33:54 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MDV00BSZR8GU7M0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 22 Nov 2012 17:22:41 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MDV007GCR9SL120@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 22 Nov 2012 17:22:41 +0900 (KST)
In-reply-to: <50ADDACE.9090709@mail.ru>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Alexander Varnin' <fenixk19@mail.ru>, 'Kukjin Kim' <kgene@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org

Alexander Varnin
> 
> I also want to point, that irq resource in arch/arm/plat-samsung/devs.c
> for s3c2410-spi driver on S3C2443 points to wrong IRQ (SPI0 instead of

Sounds that you cannot use platform_device in plat-samsung/devs.c for SPI on S3C2443. Yes, could be...

> SPI1). I've solved it with board specific code, but it is not most
> correct way, i think.
> 
Hmm, if provided platform_device is in plat-samsung/devs.c cannot support, we can do as you said temporarily but we know it's wrong way because the value depends on SoC not board. 

How about following?

8<--------------------------------
diff --git a/arch/arm/mach-s3c24xx/s3c2443.c b/arch/arm/mach-s3c24xx/s3c2443.c
index 165b6a6..22eead3 100644
--- a/arch/arm/mach-s3c24xx/s3c2443.c
+++ b/arch/arm/mach-s3c24xx/s3c2443.c
@@ -82,6 +82,10 @@ int __init s3c2443_init(void)
 	s3c_device_wdt.resource[1].start = IRQ_S3C2443_WDT;
 	s3c_device_wdt.resource[1].end   = IRQ_S3C2443_WDT;

+	/* change SPI IRQ number */
+	s3c_device_spi0.resource[1].start = IRQ_SPI1;
+	s3c_device_spi0.resource[1].end = IRQ_SPI1;
+
 	return device_register(&s3c2443_dev);
 }
8<--------------------------------

K-Gene <kgene@kernel.org>
