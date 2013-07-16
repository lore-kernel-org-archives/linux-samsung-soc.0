From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 1/6] clk: exynos4: Staticize local symbols
Date: Tue, 16 Jul 2013 14:38:05 +0530
Message-ID: <CAK9yfHziYb8AyD+FK9_aDpcM1Pxmg2nr30NvvTHZ62JiYKq9kg@mail.gmail.com>
References: <1373533334-5169-1-git-send-email-sachin.kamat@linaro.org>
	<1373533334-5169-2-git-send-email-sachin.kamat@linaro.org>
	<02d801ce81f6$e480fe80$ad82fb80$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f43.google.com ([209.85.219.43]:38336 "EHLO
	mail-oa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753900Ab3GPJIF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 16 Jul 2013 05:08:05 -0400
Received: by mail-oa0-f43.google.com with SMTP id i7so503162oag.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 16 Jul 2013 02:08:05 -0700 (PDT)
In-Reply-To: <02d801ce81f6$e480fe80$ad82fb80$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, mturquette@linaro.org, patches@linaro.org

On 16 July 2013 13:04, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Sachin Kamat wrote:
>>
>> Symbols referenced only in this file are made static.
>>
>> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
>> ---
>>  drivers/clk/samsung/clk-exynos4.c |   30 ++++++++++++++++--------------
>>  1 file changed, 16 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-
>> exynos4.c
>> index 1bdb882..18eadc4 100644
>> --- a/drivers/clk/samsung/clk-exynos4.c
>> +++ b/drivers/clk/samsung/clk-exynos4.c
>
> [...]
>
>> @@ -975,7 +975,7 @@ static void __init
>> exynos4_clk_register_finpll(unsigned long xom)
>>   * clock speed.
>>   */
>>  void __init exynos4_clk_register_fixed_ext(unsigned long xxti_f,
>> -                                             unsigned long xusbxti_f)
>> +                                               unsigned long xusbxti_f)
>
> Why?

Yes this is unrelated and should not have been there.

>
>>  {
>>       exynos4_fixed_rate_ext_clks[0].fixed_rate = xxti_f;
>>       exynos4_fixed_rate_ext_clks[1].fixed_rate = xusbxti_f;
>> @@ -990,7 +990,9 @@ static __initdata struct of_device_id ext_clk_match[]
>> = {
>>  };
>>
>>  /* register exynos4 clocks */
>> -void __init exynos4_clk_init(struct device_node *np, enum exynos4_soc
>> exynos4_soc, void __iomem *reg_base, unsigned long xom)
>> +static void __init exynos4_clk_init(struct device_node *np,
>> +                                 enum exynos4_soc exynos4_soc,
>> +                                 void __iomem *reg_base, unsigned long
> xom)
>>  {
>>       struct clk *apll, *mpll, *epll, *vpll;
>>
>> --
>> 1.7.9.5
>
> And don't we need following?

This has been done (along with other cleanups) in the following patch:
http://www.spinics.net/lists/linux-samsung-soc/msg20284.html

>
> diff --git a/arch/arm/mach-exynos/common.h b/arch/arm/mach-exynos/common.h
> index 3e156bc..3a34f1e 100644
> --- a/arch/arm/mach-exynos/common.h
> +++ b/arch/arm/mach-exynos/common.h
> @@ -26,7 +26,6 @@ void exynos5_restart(enum reboot_mode mode, const char
> *cmd);
>  void exynos_init_late(void);
>
>  /* ToDo: remove these after migrating legacy exynos4 platforms to dt */
> -void exynos4_clk_init(struct device_node *np, int is_exynos4210, void
> __iomem *reg_base, unsigned long xom);
>  void exynos4_clk_register_fixed_ext(unsigned long, unsigned long);
>
>  void exynos_firmware_init(void);
>
> - Kukjin
>



-- 
With warm regards,
Sachin
