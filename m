From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/2] ARM: S3C24XX: Fix Demux error in UART3 irqs on S3C2443
 and S3C2416
Date: Wed, 17 Nov 2010 16:39:14 +0900
Message-ID: <00cc01cb862a$8a17e000$9e47a000$%kim@samsung.com>
References: <1289954843-27844-1-git-send-email-sbkim73@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:18630 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759709Ab0KQHiv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 17 Nov 2010 02:38:51 -0500
Received: from epmmp2 (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LC0007JVQKP1W90@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 17 Nov 2010 16:38:49 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LC000BWCQKPY6@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 17 Nov 2010 16:38:50 +0900 (KST)
In-reply-to: <1289954843-27844-1-git-send-email-sbkim73@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sangbeom Kim' <sbkim73@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, 'Abhilash Kesavan' <a.kesavan@samsung.com>

Sangbeom Kim wrote:
> 
> From: Abhilash Kesavan <a.kesavan@samsung.com>
> 
> IRQ_S3C2443_UART3 is being used as the base when it should actually
> be IRQ_S3C2443_RX3 on S3C2443 and S3C2416 for the UART3.
> 
> Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
> Signed-off-by: Sangbeom Kim <sbkim73@samsung.com>
> ---
>  arch/arm/mach-s3c2416/irq.c |    2 +-
>  arch/arm/mach-s3c2443/irq.c |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/mach-s3c2416/irq.c b/arch/arm/mach-s3c2416/irq.c
> index 084d121..7844857 100644
> --- a/arch/arm/mach-s3c2416/irq.c
> +++ b/arch/arm/mach-s3c2416/irq.c
> @@ -168,7 +168,7 @@ static struct irq_chip s3c2416_irq_dma = {
> 
>  static void s3c2416_irq_demux_uart3(unsigned int irq, struct irq_desc
*desc)
>  {
> -	s3c2416_irq_demux(IRQ_S3C2443_UART3, 3);
> +	s3c2416_irq_demux(IRQ_S3C2443_RX3, 3);
>  }
> 
>  #define INTMSK_UART3	(1UL << (IRQ_S3C2443_UART3 - IRQ_EINT0))
> diff --git a/arch/arm/mach-s3c2443/irq.c b/arch/arm/mach-s3c2443/irq.c
> index 0e0d693..df2b8db 100644
> --- a/arch/arm/mach-s3c2443/irq.c
> +++ b/arch/arm/mach-s3c2443/irq.c
> @@ -166,7 +166,7 @@ static struct irq_chip s3c2443_irq_dma = {
> 
>  static void s3c2443_irq_demux_uart3(unsigned int irq, struct irq_desc
*desc)
>  {
> -	s3c2443_irq_demux(IRQ_S3C2443_UART3, 3);
> +	s3c2443_irq_demux(IRQ_S3C2443_RX3, 3);
>  }
> 
>  #define INTMSK_UART3	(1UL << (IRQ_S3C2443_UART3 - IRQ_EINT0))
> --
Looks ok...will apply.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
