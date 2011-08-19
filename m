From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/2] ARM: Samsung: Add chained enrty/exit call to timer
 interrupt handler
Date: Fri, 19 Aug 2011 14:24:09 +0900
Message-ID: <000c01cc5e30$3aab2e80$b0018b80$%kim@samsung.com>
References: <1311659456-6659-1-git-send-email-m.szyprowski@samsung.com>
 <1311659456-6659-2-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:26901 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752054Ab1HSFYO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 19 Aug 2011 01:24:14 -0400
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LQ50017HTOBSGL0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 19 Aug 2011 14:24:12 +0900 (KST)
Received: from kgenekim (12-23-120-114.csky.net [12.23.120.114])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LQ500KA7TOA6V@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 19 Aug 2011 14:24:12 +0900 (KST)
In-reply-to: <1311659456-6659-2-git-send-email-m.szyprowski@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Marek Szyprowski' <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: 'Kyungmin Park' <kyungmin.park@samsung.com>, 'Angus Ainslie' <angus.ainslie@linaro.org>

Marek Szyprowski wrote:
> 
> This patch adds chained IRQ enter/exit functions to timer
> interrupt handler in order to function correctly on primary
> controllers with different methods of flow control.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/plat-samsung/irq-vic-timer.c |    5 +++++
>  1 files changed, 5 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/plat-samsung/irq-vic-timer.c
b/arch/arm/plat-samsung/irq-vic-
> timer.c
> index a607546..6df9e33 100644
> --- a/arch/arm/plat-samsung/irq-vic-timer.c
> +++ b/arch/arm/plat-samsung/irq-vic-timer.c
> @@ -22,9 +22,14 @@
>  #include <plat/irq-vic-timer.h>
>  #include <plat/regs-timer.h>
> 
> +#include <asm/mach/irq.h>
> +
>  static void s3c_irq_demux_vic_timer(unsigned int irq, struct irq_desc
*desc)
>  {
> +	struct irq_chip *chip = irq_get_chip(irq);
> +	chained_irq_enter(chip, desc);
>  	generic_handle_irq((int)desc->irq_data.handler_data);
> +	chained_irq_exit(chip, desc);
>  }
> 
>  /* We assume the IRQ_TIMER0..IRQ_TIMER4 range is continuous. */
> --
> 1.7.1.569.g6f426

OK, applied.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
