From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 1/2] ARM: EXYNOS: Update HSOTG PHY clock setting for Exynos4x12
Date: Thu, 24 May 2012 13:38:12 +0530
Message-ID: <CAK9yfHxQuYAZiooNphepbzWGQ9xC345tqbH2fZx+54c807r2KA@mail.gmail.com>
References: <1337677529-7325-1-git-send-email-sachin.kamat@linaro.org>
	<005b01cd397d$8d21cbf0$a76563d0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qa0-f46.google.com ([209.85.216.46]:35584 "EHLO
	mail-qa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753736Ab2EXIIN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 24 May 2012 04:08:13 -0400
Received: by qadb17 with SMTP id b17so3870183qad.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 24 May 2012 01:08:12 -0700 (PDT)
In-Reply-To: <005b01cd397d$8d21cbf0$a76563d0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, patches@linaro.org

On 24/05/2012, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Sachin Kamat wrote:
>>
>> Adds clock setting entries for Exynos4212 and Exynos4412 platforms.
>>
>> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
>> ---
>> Based on Kukjin Kim's v3.5-for-usb-2 branch.
>> ---
>>  arch/arm/mach-exynos/include/mach/regs-usb-phy.h |    5 ++
>>  arch/arm/mach-exynos/setup-usb-phy.c             |   47
> ++++++++++++++++-----
>>  arch/arm/plat-samsung/include/plat/cpu.h         |    4 ++
>>  3 files changed, 45 insertions(+), 11 deletions(-)
>>
>> diff --git a/arch/arm/mach-exynos/include/mach/regs-usb-phy.h
>> b/arch/arm/mach-exynos/include/mach/regs-usb-phy.h
>> index c337cf3..bab28d9 100644
>> --- a/arch/arm/mach-exynos/include/mach/regs-usb-phy.h
>> +++ b/arch/arm/mach-exynos/include/mach/regs-usb-phy.h
>> @@ -38,8 +38,13 @@
>>  #define CLKSEL_MASK			(0x3 << 0)
>>  #define CLKSEL_SHIFT			(0)
>>  #define CLKSEL_48M			(0x0 << 0)
>> +#define CLKSEL_9600K			(0x0 << 0)
>> +#define CLKSEL_10M			(0x1 << 0)
>>  #define CLKSEL_12M			(0x2 << 0)
>> +#define CLKSEL_19200K			(0x3 << 0)
>>  #define CLKSEL_24M			(0x3 << 0)
>> +#define CLKSEL_20M			(0x4 << 0)
>> +#define EXYNOS4X12_CLKSEL_24M		(0x5 << 0)
>>
>
> I would preferred following to avoid confusion. Of course, need to update
> regarding file accordingly.

Yes, that is correct. I will update and send the patch soon.

>
> @@ -35,11 +35,21 @@
>  #define PHY1_COMMON_ON_N		(1 << 7)
>  #define PHY0_COMMON_ON_N		(1 << 4)
>  #define PHY0_ID_PULLUP			(1 << 2)
> -#define CLKSEL_MASK			(0x3 << 0)
> -#define CLKSEL_SHIFT			(0)
> -#define CLKSEL_48M			(0x0 << 0)
> -#define CLKSEL_12M			(0x2 << 0)
> -#define CLKSEL_24M			(0x3 << 0)
> +
> +#define EXYNOS4_CLKSEL_SHIFT		(0)
> +
> +#define EXYNOS4210_CLKSEL_MASK		(0x3 << 0)
> +#define EXYNOS4210_CLKSEL_48M		(0x0 << 0)
> +#define EXYNOS4210_CLKSEL_12M		(0x2 << 0)
> +#define EXYNOS4210_CLKSEL_24M		(0x3 << 0)
> +
> +#define EXYNOS4X12_CLKSEL_MASK		(0x7 << 0)
> +#define EXYNOS4X12_CLKSEL_9600K		(0x0 << 0)
> +#define EXYNOS4X12_CLKSEL_10M		(0x1 << 0)
> +#define EXYNOS4X12_CLKSEL_12M		(0x2 << 0)
> +#define EXYNOS4X12_CLKSEL_19200K	(0x3 << 0)
> +#define EXYNOS4X12_CLKSEL_20M		(0x4 << 0)
> +#define EXYNOS4X12_CLKSEL_24M		(0x5 << 0)
>
>  #define EXYNOS4_RSTCON			EXYNOS4_HSOTG_PHYREG(0x08)
>  #define HOST_LINK_PORT_SWRST_MASK	(0xf << 6)
>
> [...]
>
> Thanks.
>
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
>
>


-- 
With warm regards,
Sachin
