From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 1/2] ARM: EXYNOS: Move G2D clock entries to
 clock-exynos4210.c file
Date: Fri, 13 Jul 2012 20:15:12 +0530
Message-ID: <CAK9yfHy9+jWtu0k0hoa9HKt+_ZGHDJMH1tT5_xoXd28k4s+rnw@mail.gmail.com>
References: <1337314071-15305-1-git-send-email-sachin.kamat@linaro.org>
	<1337314071-15305-2-git-send-email-sachin.kamat@linaro.org>
	<118701cd60fc$c06e6da0$414b48e0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vb0-f46.google.com ([209.85.212.46]:36157 "EHLO
	mail-vb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752158Ab2GMOpN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 13 Jul 2012 10:45:13 -0400
Received: by vbbff1 with SMTP id ff1so2309794vbb.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Jul 2012 07:45:12 -0700 (PDT)
In-Reply-To: <118701cd60fc$c06e6da0$414b48e0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, patches@linaro.org

On 13 July 2012 19:08, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Sachin Kamat wrote:
>>
>> G2D clock registers are different in Exynos4210 and Exynos4X12 SoCs.
>> Hence moving the SoC specific G2D clock entries from common clock file
>> (clock-exynos4.c) to Exynos4210 specific clock file (clock-exynos4210.c).
>>
> Yeah, I agree but there are small comments.
>
> [snip]
>
>> +static struct clksrc_clk exynos4_clk_mout_g2d0 = {
>
> In this case, 'exynos4210_clk_mout_g2d0' is clearer, it is static though.
>
>> +     .clk    = {
>> +             .name           = "mout_g2d0",
>> +     },
>> +     .sources = &exynos4_clkset_mout_g2d0,
>> +     .reg_src = { .reg = EXYNOS4_CLKSRC_IMAGE, .shift = 0, .size = 1 },
>> +};
>> +
>> +static struct clksrc_clk exynos4_clk_mout_g2d1 = {
>
> Same as above, exynos4210_clk_mout_g2d1.
>
>> +     .clk    = {
>> +             .name           = "mout_g2d1",
>> +     },
>> +     .sources = &exynos4_clkset_mout_g2d1,
>> +     .reg_src = { .reg = EXYNOS4_CLKSRC_IMAGE, .shift = 4, .size = 1 },
>> +};
>> +
>> +static struct clk *exynos4_clkset_mout_g2d_list[] = {
>
> Same, exynos4210_clkset_mout_g2d_list[]
>
>> +     [0] = &exynos4_clk_mout_g2d0.clk,
>
> exynos4210_clk_mout_g2d0.clk
>
>> +     [1] = &exynos4_clk_mout_g2d1.clk,
>
> exynos4210_clk_mout_g2d1.clk
>
>> +};
>> +
>> +static struct clksrc_sources exynos4_clkset_mout_g2d = {
>
> Same, exynos4210_clkset_mout_g2d
>
>> +     .sources        = exynos4_clkset_mout_g2d_list,
>
> exynos4210_clkset_mout_g2d_list
>
>> +     .nr_sources     = ARRAY_SIZE(exynos4_clkset_mout_g2d_list),
>
> exynos4210_clkset_mout_g2d_list
>
>> +};
>> +
>>  static int exynos4_clksrc_mask_lcd1_ctrl(struct clk *clk, int enable)
>>  {
>>       return s5p_gatectrl(EXYNOS4210_CLKSRC_MASK_LCD1, clk, enable);
>> @@ -74,6 +100,13 @@ static struct clksrc_clk clksrcs[] = {
>>               .sources = &exynos4_clkset_group,
>>               .reg_src = { .reg = EXYNOS4210_CLKSRC_LCD1, .shift =
>> 0, .size = 4 },
>>               .reg_div = { .reg = EXYNOS4210_CLKDIV_LCD1, .shift =
>> 0, .size = 4 },
>> +     }, {
>> +             .clk    = {
>> +                     .name           = "sclk_fimg2d",
>> +             },
>> +             .sources = &exynos4_clkset_mout_g2d,
>
> exynos4210_clkset_mout_g2d
>
> [snip]
>
> Could you please re-submit this after re-working on top of my
> next/devel-samsung.

Ok. I will update as per your suggestion and re-send.
Thanks for the review.

>
> Thanks.
>
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
>



-- 
With warm regards,
Sachin
