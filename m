From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: Re: [PATCH 1/3] irqchip: exynos-combiner: call handle_bad_irq directly
Date: Fri, 10 Jan 2014 11:38:58 +0900
Message-ID: <52CF5D42.4000404@samsung.com>
References: <1389321142-4073-1-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:39509 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751745AbaAJCYE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 9 Jan 2014 21:24:04 -0500
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MZ50083CYO2BXB0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 10 Jan 2014 11:24:02 +0900 (KST)
In-reply-to: <1389321142-4073-1-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tglx@linutronix.de, kgene.kim@samsung.com, catalin.marinas@arm.com, thomas.ab@samsung.com

On 01/10/2014 11:32 AM, Pankaj Dubey wrote:
> This patch is inspired from following commit
>   aec0095653: (irqchip: gic: Call handle_bad_irq() directly)
>
> Also this will help in removing unwanted inclusion
> of header file "asm/mach/irq.h"
>
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
This is single patch only. By mistake sent as Patch[1/3].
> ---
>   drivers/irqchip/exynos-combiner.c |    3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/irqchip/exynos-combiner.c b/drivers/irqchip/exynos-combiner.c
> index 40e6440..f8636a6 100644
> --- a/drivers/irqchip/exynos-combiner.c
> +++ b/drivers/irqchip/exynos-combiner.c
> @@ -17,7 +17,6 @@
>   #include <linux/irqchip/chained_irq.h>
>   #include <linux/of_address.h>
>   #include <linux/of_irq.h>
> -#include <asm/mach/irq.h>
>   
>   #include "irqchip.h"
>   
> @@ -81,7 +80,7 @@ static void combiner_handle_cascade_irq(unsigned int irq, struct irq_desc *desc)
>   	cascade_irq = irq_find_mapping(combiner_irq_domain, combiner_irq);
>   
>   	if (unlikely(!cascade_irq))
> -		do_bad_IRQ(irq, desc);
> +		handle_bad_irq(irq, desc);
>   	else
>   		generic_handle_irq(cascade_irq);
>   
