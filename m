From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 2/6] clk: exynos4: Remove unused function
Date: Tue, 16 Jul 2013 14:38:45 +0530
Message-ID: <CAK9yfHy6Lp=1C8CgviXp9s-F963UQcGpPUQFpJSu+qEW9_90Ug@mail.gmail.com>
References: <1373533334-5169-1-git-send-email-sachin.kamat@linaro.org>
	<1373533334-5169-3-git-send-email-sachin.kamat@linaro.org>
	<02d701ce81f6$532ab9d0$f9802d70$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f41.google.com ([209.85.219.41]:41723 "EHLO
	mail-oa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754858Ab3GPJIp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 16 Jul 2013 05:08:45 -0400
Received: by mail-oa0-f41.google.com with SMTP id n10so514299oag.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 16 Jul 2013 02:08:45 -0700 (PDT)
In-Reply-To: <02d701ce81f6$532ab9d0$f9802d70$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, mturquette@linaro.org, patches@linaro.org

On 16 July 2013 13:00, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Sachin Kamat wrote:
>>
>> Subsequent to the cleanup in commit 3c70348c7c ("ARM: EXYNOS:
>> Remove legacy timer initialization code"), this function has no more
>> users. Hence remove it.
>>
>> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
>> ---
>>  drivers/clk/samsung/clk-exynos4.c |   14 --------------
>>  1 file changed, 14 deletions(-)
>>
>> diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-
>> exynos4.c
>> index 18eadc4..75635eb 100644
>> --- a/drivers/clk/samsung/clk-exynos4.c
>> +++ b/drivers/clk/samsung/clk-exynos4.c
>> @@ -969,20 +969,6 @@ static void __init
>> exynos4_clk_register_finpll(unsigned long xom)
>>
>>  }
>>
>> -/*
>> - * This function allows non-dt platforms to specify the clock speed of
>> the
>> - * xxti and xusbxti clocks. These clocks are then registered with the
>> specified
>> - * clock speed.
>> - */
>> -void __init exynos4_clk_register_fixed_ext(unsigned long xxti_f,
>> -                                               unsigned long xusbxti_f)
>> -{
>> -     exynos4_fixed_rate_ext_clks[0].fixed_rate = xxti_f;
>> -     exynos4_fixed_rate_ext_clks[1].fixed_rate = xusbxti_f;
>> -     samsung_clk_register_fixed_rate(exynos4_fixed_rate_ext_clks,
>> -                     ARRAY_SIZE(exynos4_fixed_rate_ext_clks));
>> -}
>> -
>>  static __initdata struct of_device_id ext_clk_match[] = {
>>       { .compatible = "samsung,clock-xxti", .data = (void *)0, },
>>       { .compatible = "samsung,clock-xusbxti", .data = (void *)1, },
>> --
>> 1.7.9.5
>
> And need following?

This has been done (along with other cleanups) in the following patch:
http://www.spinics.net/lists/linux-samsung-soc/msg20284.html

>
> diff --git a/arch/arm/mach-exynos/common.h b/arch/arm/mach-exynos/common.h
> index 3e156bc..1037da0 100644
> --- a/arch/arm/mach-exynos/common.h
> +++ b/arch/arm/mach-exynos/common.h
> @@ -27,7 +27,6 @@ void exynos_init_late(void);
>
>  /* ToDo: remove these after migrating legacy exynos4 platforms to dt */
>  void exynos4_clk_init(struct device_node *np, int is_exynos4210, void
> __iomem *reg_base, unsigned long xom);
> -void exynos4_clk_register_fixed_ext(unsigned long, unsigned long);
>
>  void exynos_firmware_init(void);
>
> - Kukjin
>



-- 
With warm regards,
Sachin
