From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH] ARM: EXYNOS: add the definition for IRQ_DWMCI
Date: Wed, 25 Apr 2012 10:19:49 +0530
Message-ID: <4F97826D.6010404@linaro.org>
References: <4F8E400E.3000300@samsung.com> <4F8F5858.4060804@samsung.com> <4F8F6C34.1090308@samsung.com> <4F8F78EC.8030602@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:55189 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753232Ab2DYEt6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Apr 2012 00:49:58 -0400
Received: by pbbro12 with SMTP id ro12so962816pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Apr 2012 21:49:58 -0700 (PDT)
In-Reply-To: <4F8F78EC.8030602@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Jaehoon Chung <jh80.chung@samsung.com>, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>

On 04/19/2012 08:01 AM, Kukjin Kim wrote:
> Jaehoon Chung wroteh:
>> On 04/19/2012 09:12 AM, Kukjin Kim wrote:
>>
>>> Jaehoon Chung wrote:
>>>> In dev-dwmci.c, IRQ_DWMCI is referenced.
>>>> But there is no defined anywhere.
>>>> This patch is added the missing definition for IRQ_DWMCI.
>>>>
>>>> Signed-off-by: Jaehoon Chung<jh80.chung@samsung.com>
>>>> Signed-off-by: Kyungmin Park<Kyungmin.park@samsung.com>
>>>> ---
>>>>    arch/arm/mach-exynos/include/mach/irqs.h |    1 +
>>>>    1 files changed, 1 insertions(+), 0 deletions(-)
>>>>
>>>> diff --git a/arch/arm/mach-exynos/include/mach/irqs.h
>>>> b/arch/arm/mach-exynos/include/mach/irqs.h
>>>> index 1161675..ed2295f 100644
>>>> --- a/arch/arm/mach-exynos/include/mach/irqs.h
>>>> +++ b/arch/arm/mach-exynos/include/mach/irqs.h
>>>> @@ -201,6 +201,7 @@
>>>>    #define IRQ_HSMMC1            EXYNOS4_IRQ_HSMMC1
>>>>    #define IRQ_HSMMC2            EXYNOS4_IRQ_HSMMC2
>>>>    #define IRQ_HSMMC3            EXYNOS4_IRQ_HSMMC3
>>>> +#define IRQ_DWMCI            EXYNOS4_IRQ_DWMCI
>>>
>>> Yeah, we need fix it but I have no idea need re-mapping. Just
>>> following can do it. If you're ok on following, let me pick this up.
>>
>> If it's working, i don't care..I didn't see the
>> DEFINE_RES_MEM/DEFINE_RES_IRQ.
>> But if we can use them, it's more readable.
>>
> Yes, this should be working fine. And note, need inclusion of
> <linux/ioport.h> for DEFINE_RES_{MEM,IRQ}.
> 
We should not require explicit inclusion of <linux/ioport.h> here. The
definition of "struct resource {" and DEFINE_RES_{MEM,IRQ}" are in same
ioport.h file. Hence if "struct resource {" is accessible here,
"DEFINE_RES_{MEM,IRQ}" would also be accessible.

> If any problems, please let me know.
> 
> Thanks.
> 
> Best regards,
> Kgene.
> -- 
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
> -- 
> To unsubscribe from this list: send the line "unsubscribe
> linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


-- 
Tushar Behera
