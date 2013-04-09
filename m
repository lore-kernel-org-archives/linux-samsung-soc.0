From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL] Samsung fixes-2 for v3.9
Date: Tue, 9 Apr 2013 17:34:30 +0200
Message-ID: <201304091734.30298.arnd@arndb.de>
References: <51643279.7050200@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.8]:58082 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934800Ab3DIPei (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 9 Apr 2013 11:34:38 -0400
In-Reply-To: <51643279.7050200@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Olof Johansson' <olof@lixom.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>

On Tuesday 09 April 2013, Kukjin Kim wrote:
> The following changes since commit 31880c37c11e28cb81c70757e38392b42e695dc6:

> ----------------------------------------------------------------
> Sylwester Nawrocki (2):
>        ARM: S3C24XX: Correct NR_IRQS definition for s3c2440
>        ARM: S3C24XX: Fix interrupt pending register offset of the EINT 
> controller


I got a conflict merging this into the for-next branch, which has earlier
patches. Please confirm that the resolution below is correct.

	Arnd

diff --cc arch/arm/mach-s3c24xx/irq.c
index 8296d94,d8ba9be..7f56a93
--- a/arch/arm/mach-s3c24xx/irq.c
+++ b/arch/arm/mach-s3c24xx/irq.c
@@@ -498,9 -500,10 +498,9 @@@ struct s3c_irq_intc *s3c24xx_init_intc(
                base = (void *)0xfd000000;
  
                intc->reg_mask = base + 0xa4;
-               intc->reg_pending = base + 0x08;
+               intc->reg_pending = base + 0xa8;
 -              irq_num = 20;
 +              irq_num = 24;
                irq_start = S3C2410_IRQ(32);
 -              irq_offset = 4;
                break;
        default:
                pr_err("irq: unsupported controller address\n");
