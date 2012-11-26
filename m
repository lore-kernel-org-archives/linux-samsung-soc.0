From: Alexander Varnin <fenixk19@mail.ru>
Subject: [PATCH 2/2] ARM: S3C2443: Workaround for 2443 EXTINT error
Date: Mon, 26 Nov 2012 12:40:03 +0400
Message-ID: <1353919203-24798-2-git-send-email-fenixk19@mail.ru>
References: <1353919203-24798-1-git-send-email-fenixk19@mail.ru>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp17.mail.ru ([94.100.176.154]:51726 "EHLO smtp17.mail.ru"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753996Ab2KZIlY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 Nov 2012 03:41:24 -0500
In-Reply-To: <1353919203-24798-1-git-send-email-fenixk19@mail.ru>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, kgene@kernel.org, heiko@sntech.de
Cc: Alexander Varnin <fenixk19@mail.ru>

S3C2443 CPU has a problem with incorrect reading from EXTINTn
registers. So s3c_irqext_type function wrongly modifies them.
So add special check to s3c_irqext_type, to handle this case.

Signed-off-by: Alexander Varnin <fenixk19@mail.ru>
---
 arch/arm/plat-s3c24xx/irq.c |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/arch/arm/plat-s3c24xx/irq.c b/arch/arm/plat-s3c24xx/irq.c
index fe57bbb..bb36fc9 100644
--- a/arch/arm/plat-s3c24xx/irq.c
+++ b/arch/arm/plat-s3c24xx/irq.c
@@ -219,6 +219,21 @@ s3c_irqext_type(struct irq_data *data, unsigned int type)
 	}
 
 	value = __raw_readl(extint_reg);
+
+	if( (samsung_cpu_id & 0xfffff) == 0x43001) //Hack for 2443 error workaround
+	{
+	    int i;
+	    int fixed = 0;
+	    if(extint_reg == S3C24XX_EXTINT1 || extint_reg == S3C24XX_EXTINT2)
+		for(i=0; i<7;i++)
+		    fixed |= (((value >> ((7-i)*4+1)) & 7) | ((value >> ((7-i)*4-3)) & 8)) << i*4;
+	    else
+		for(i=0; i<7;i++)
+		    fixed |= ( (value >> (7-i)*4) & 0xf )  << i*4;
+	    fixed |= (((value>>1) & 7) | ((value<<3) & 8)) << 27;
+	    value = fixed;
+	}
+
 	value = (value & ~(7 << extint_offset)) | (newvalue << extint_offset);
 	__raw_writel(value, extint_reg);
 
-- 
1.7.2.5
