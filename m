From: Kyungmin Park <kyungmin.park@samsung.com>
Subject: Re: [PATCH] ARM: EXYNOS: Use non-secure MDMA1
Date: Wed, 29 Aug 2012 09:06:05 +0900
Message-ID: <CAH9JG2WSPyWMV3pUZANkQT9dbZOb83KsWzuh-x5YyibOvAh2oQ@mail.gmail.com>
References: <5886686.Vz6SVkoRWm@amdc1227>
	<503D5ABD.9040801@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f174.google.com ([209.85.216.174]:37968 "EHLO
	mail-qc0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750832Ab2H2AGG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 28 Aug 2012 20:06:06 -0400
Received: by qcro28 with SMTP id o28so3852150qcr.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Aug 2012 17:06:06 -0700 (PDT)
In-Reply-To: <503D5ABD.9040801@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Tomasz Figa <t.figa@samsung.com>, Boojin Kim <boojin.kim@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Marek Szyprowski <m.szyprowski@samsung.com>

On 8/29/12, Kukjin Kim <kgene.kim@samsung.com> wrote:
> On 08/28/12 04:08, Tomasz Figa wrote:
>> Using secure MDMA1 on TrustZone-enabled boards causes early boot crash,
>> so use non-secure instead.
>>
>> Signed-off-by: Tomasz Figa<t.figa@samsung.com>
>> Signed-off-by: Kyungmin Park<kyungmin.park@samsung.com>
>> ---
>>   arch/arm/mach-exynos/dma.c              | 2 +-
>>   arch/arm/mach-exynos/include/mach/map.h | 3 ++-
>>   2 files changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm/mach-exynos/dma.c b/arch/arm/mach-exynos/dma.c
>> index f60b66d..8858df5 100644
>> --- a/arch/arm/mach-exynos/dma.c
>> +++ b/arch/arm/mach-exynos/dma.c
>> @@ -261,7 +261,7 @@ static struct dma_pl330_platdata exynos_mdma1_pdata =
>> {
>>   };
>>
>>   static AMBA_AHB_DEVICE(exynos_mdma1,  "dma-pl330.2", 0x00041330,
>> -	EXYNOS4_PA_MDMA1, {EXYNOS4_IRQ_MDMA1},&exynos_mdma1_pdata);
>> +	EXYNOS4_PA_NS_MDMA1, {EXYNOS4_IRQ_MDMA1},&exynos_mdma1_pdata);
>>
>>   static int __init exynos_dma_init(void)
>>   {
>> diff --git a/arch/arm/mach-exynos/include/mach/map.h b/arch/arm/mach-
>> exynos/include/mach/map.h
>> index 51943f2..5df5910 100644
>> --- a/arch/arm/mach-exynos/include/mach/map.h
>> +++ b/arch/arm/mach-exynos/include/mach/map.h
>> @@ -89,7 +89,8 @@
>>   #define EXYNOS4_PA_L2CC			0x10502000
>>
>>   #define EXYNOS4_PA_MDMA0		0x10810000
>> -#define EXYNOS4_PA_MDMA1		0x12840000
>> +#define EXYNOS4_PA_S_MDMA1		0x12840000
>> +#define EXYNOS4_PA_NS_MDMA1		0x12850000
>>   #define EXYNOS4_PA_PDMA0		0x12680000
>>   #define EXYNOS4_PA_PDMA1		0x12690000
>>   #define EXYNOS5_PA_MDMA0		0x10800000
>
> Cc'ed Boojin Kim.
>
> Well, just fix the address is enough like exynos5 stuff? I don't have
> any idea why we need secure mdma and non-secure mdma both here...

Did you see the datasheet and your team codes?
>
> diff --git a/arch/arm/mach-exynos/include/mach/map.h
> b/arch/arm/mach-exynos/include/mach/map.h
> index c72b675..c941053 100644
> --- a/arch/arm/mach-exynos/include/mach/map.h
> +++ b/arch/arm/mach-exynos/include/mach/map.h
> @@ -89,7 +89,7 @@
>   #define EXYNOS4_PA_L2CC                        0x10502000
>
>   #define EXYNOS4_PA_MDMA0		0x10810000
> -#define EXYNOS4_PA_MDMA1		0x12840000
> +#define EXYNOS4_PA_MDMA1		0x12850000
>   #define EXYNOS4_PA_PDMA0		0x12680000
>   #define EXYNOS4_PA_PDMA1		0x12690000
>   #define EXYNOS5_PA_MDMA0		0x10800000
> --
>
> Thanks.
>
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>
