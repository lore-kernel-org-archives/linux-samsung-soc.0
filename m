From: Jaehoon Chung <jh80.chung@samsung.com>
Subject: Re: [PATCH] ARM: EXYNOS: add the definition for IRQ_DWMCI
Date: Thu, 19 Apr 2012 10:36:52 +0900
Message-ID: <4F8F6C34.1090308@samsung.com>
References: <4F8E400E.3000300@samsung.com> <4F8F5858.4060804@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:51592 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750943Ab2DSBhM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 Apr 2012 21:37:12 -0400
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M2P00JHKDSZBWE0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 19 Apr 2012 10:37:10 +0900 (KST)
Received: from [165.213.219.108] by mmp1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0M2P0067ADTY6J40@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 19 Apr 2012 10:37:10 +0900 (KST)
In-reply-to: <4F8F5858.4060804@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>

On 04/19/2012 09:12 AM, Kukjin Kim wrote:

> Jaehoon Chung wrote:
>> In dev-dwmci.c, IRQ_DWMCI is referenced.
>> But there is no defined anywhere.
>> This patch is added the missing definition for IRQ_DWMCI.
>>
>> Signed-off-by: Jaehoon Chung<jh80.chung@samsung.com>
>> Signed-off-by: Kyungmin Park<Kyungmin.park@samsung.com>
>> ---
>>   arch/arm/mach-exynos/include/mach/irqs.h |    1 +
>>   1 files changed, 1 insertions(+), 0 deletions(-)
>>
>> diff --git a/arch/arm/mach-exynos/include/mach/irqs.h b/arch/arm/mach-exynos/include/mach/irqs.h
>> index 1161675..ed2295f 100644
>> --- a/arch/arm/mach-exynos/include/mach/irqs.h
>> +++ b/arch/arm/mach-exynos/include/mach/irqs.h
>> @@ -201,6 +201,7 @@
>>   #define IRQ_HSMMC1            EXYNOS4_IRQ_HSMMC1
>>   #define IRQ_HSMMC2            EXYNOS4_IRQ_HSMMC2
>>   #define IRQ_HSMMC3            EXYNOS4_IRQ_HSMMC3
>> +#define IRQ_DWMCI            EXYNOS4_IRQ_DWMCI
> 
> Yeah, we need fix it but I have no idea need re-mapping. Just following can do it. If you're ok on following, let me pick this up.

If it's working, i don't care..I didn't see the DEFINE_RES_MEM/DEFINE_RES_IRQ.
But if we can use them, it's more readable.

Thanks,
Jaehoon Chung

> 
> ---
> diff --git a/arch/arm/mach-exynos/dev-dwmci.c b/arch/arm/mach-exynos/dev-dwmci.c
> index b025db4..c78daf2 100644
> --- a/arch/arm/mach-exynos/dev-dwmci.c
> +++ b/arch/arm/mach-exynos/dev-dwmci.c
> @@ -33,16 +31,8 @@ static int exynos4_dwmci_init(u32 slot_id, irq_handler_t handler, void *data)
>  }
> 
>  static struct resource exynos4_dwmci_resource[] = {
> -    [0] = {
> -        .start    = EXYNOS4_PA_DWMCI,
> -        .end    = EXYNOS4_PA_DWMCI + SZ_4K - 1,
> -        .flags    = IORESOURCE_MEM,
> -    },
> -    [1] = {
> -        .start    = IRQ_DWMCI,
> -        .end    = IRQ_DWMCI,
> -        .flags    = IORESOURCE_IRQ,
> -    }
> +    [0] = DEFINE_RES_MEM(EXYNOS4_PA_DWMCI, SZ_4K),
> +    [1] = DEFINE_RES_IRQ(EXYNOS4_IRQ_DWMCI),
>  };
> 
>  static struct dw_mci_board exynos4_dwci_pdata = {
