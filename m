From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 2/2] ARM: S3C24XX: Fix UART3 submask on S3C2416 and S3C2443
Date: Wed, 17 Nov 2010 16:38:33 +0900
Message-ID: <00cb01cb862a$71c0f2d0$5542d870$%kim@samsung.com>
References: <1289954868-27876-1-git-send-email-sbkim73@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:41362 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753746Ab0KQHiL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 17 Nov 2010 02:38:11 -0500
Received: from epmmp1 (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LC000KWFQJLI740@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 17 Nov 2010 16:38:09 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LC000BNAQJKTU@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 17 Nov 2010 16:38:08 +0900 (KST)
In-reply-to: <1289954868-27876-1-git-send-email-sbkim73@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sangbeom Kim' <sbkim73@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, 'Abhilash Kesavan' <a.kesavan@samsung.com>

Sangbeom Kim wrote:
> 
> From: Abhilash Kesavan <a.kesavan@samsung.com>
> 
> The UART3 submask should be 0x7 (SUBSRCPND[26:24]).
> 
> Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
> Signed-off-by: Sangbeom Kim <sbkim73@samsung.com>
> ---
>  arch/arm/mach-s3c2416/irq.c |    3 +--
>  arch/arm/mach-s3c2443/irq.c |    3 +--
>  2 files changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/mach-s3c2416/irq.c b/arch/arm/mach-s3c2416/irq.c
> index 7844857..00174da 100644
> --- a/arch/arm/mach-s3c2416/irq.c
> +++ b/arch/arm/mach-s3c2416/irq.c
> @@ -172,8 +172,7 @@ static void s3c2416_irq_demux_uart3(unsigned int irq,
> struct irq_desc *desc)
>  }
> 
>  #define INTMSK_UART3	(1UL << (IRQ_S3C2443_UART3 - IRQ_EINT0))
> -#define SUBMSK_UART3	(0xf << (IRQ_S3C2443_RX3 - S3C2410_IRQSUB(0)))
> -
> +#define SUBMSK_UART3	(0x7 << (IRQ_S3C2443_RX3 - S3C2410_IRQSUB(0)))
> 
>  static void s3c2416_irq_uart3_mask(unsigned int irqno)
>  {
> diff --git a/arch/arm/mach-s3c2443/irq.c b/arch/arm/mach-s3c2443/irq.c
> index df2b8db..8934247 100644
> --- a/arch/arm/mach-s3c2443/irq.c
> +++ b/arch/arm/mach-s3c2443/irq.c
> @@ -170,8 +170,7 @@ static void s3c2443_irq_demux_uart3(unsigned int irq,
> struct irq_desc *desc)
>  }
> 
>  #define INTMSK_UART3	(1UL << (IRQ_S3C2443_UART3 - IRQ_EINT0))
> -#define SUBMSK_UART3	(0xf << (IRQ_S3C2443_RX3 - S3C2410_IRQSUB(0)))
> -
> +#define SUBMSK_UART3	(0x7 << (IRQ_S3C2443_RX3 - S3C2410_IRQSUB(0)))
> 
>  static void s3c2443_irq_uart3_mask(unsigned int irqno)
>  {
> --

Ok...will apply.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
