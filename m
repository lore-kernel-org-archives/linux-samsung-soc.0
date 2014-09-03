From: Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
Subject: Re: [PATCH 01/14] clk: samsung: add support for 145xx and 1460x PLLs
Date: Wed, 3 Sep 2014 13:07:15 +0530
Message-ID: <CAHfPSqCkzO5dgHTc73cDEAqAQCUJRxbeLPwp6h2s_QQ408kJZA@mail.gmail.com>
References: <1409132889-2080-1-git-send-email-ch.naveen@samsung.com> <53FDCAA5.1080302@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f178.google.com ([209.85.216.178]:65047 "EHLO
	mail-qc0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750833AbaICHhg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 3 Sep 2014 03:37:36 -0400
Received: by mail-qc0-f178.google.com with SMTP id x13so8112188qcv.37
        for <linux-samsung-soc@vger.kernel.org>; Wed, 03 Sep 2014 00:37:35 -0700 (PDT)
In-Reply-To: <53FDCAA5.1080302@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: Naveen Krishna Chatradhi <ch.naveen@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, cpgs@samsung.com, Mike Turquette <mturquette@linaro.org>, Thomas Abraham <thomas.ab@samsung.com>

Hi Tomasz,

On 27 August 2014 17:40, Tomasz Figa <t.figa@samsung.com> wrote:
> On 27.08.2014 11:48, Naveen Krishna Chatradhi wrote:
>> By registers bits and offsets the 145xx PLL is similar to
>> pll_type "pll_35xx". Also, 1460x PLL is similar to pll_type
>> "pll_46xx".
>>
>> Hence, reusing the functions defined for pll_35xx and pll_46xx
>> to support 145xx and 1460x PLLs respectively.
>
> [snip]
>
>> @@ -139,6 +140,7 @@ static const struct clk_ops samsung_pll3000_clk_ops = {
>>  #define PLL35XX_PDIV_SHIFT      (8)
>>  #define PLL35XX_SDIV_SHIFT      (0)
>>  #define PLL35XX_LOCK_STAT_SHIFT      (29)
>> +#define PLL145XX_ENABLE              BIT(31)
>
> The same bit is also present in PLL35XX.
>
>>
>>  static unsigned long samsung_pll35xx_recalc_rate(struct clk_hw *hw,
>>                               unsigned long parent_rate)
>> @@ -186,6 +188,10 @@ static int samsung_pll35xx_set_rate(struct clk_hw *hw, unsigned long drate,
>>
>>       tmp = __raw_readl(pll->con_reg);
>>
>> +     /* Enable PLL */
>> +     if (pll->type == (pll_1450x || pll_1451x || pll_1452x))
>> +             tmp |= PLL145XX_ENABLE;
>
> I believe that the need to enable the PLL is not really specific to
> pll_145xx. Any PLL which is initially disabled, should be enabled before
> trying to wait until it stabilizes.

Yes, all other PLL types would also need this. Since I was adding
support specifically for 145xx PLL, I put this in here. The 'if' check
can be removed and used for 45xx PLL as well.

>
>> +
>>       if (!(samsung_pll35xx_mp_change(rate, tmp))) {
>>               /* If only s change, change just s value only*/
>>               tmp &= ~(PLL35XX_SDIV_MASK << PLL35XX_SDIV_SHIFT);
>> @@ -196,8 +202,12 @@ static int samsung_pll35xx_set_rate(struct clk_hw *hw, unsigned long drate,
>>       }
>>
>>       /* Set PLL lock time. */
>> -     __raw_writel(rate->pdiv * PLL35XX_LOCK_FACTOR,
>> -                     pll->lock_reg);
>> +     if (pll->type == (pll_1450x || pll_1451x || pll_1452x))
>> +             __raw_writel(rate->pdiv * PLL145XX_LOCK_FACTOR,
>> +                             pll->lock_reg);
>
> If we already have lock_reg in pll, then maybe lock_factor could be
> added there too and this code simply parametrized?

Ok.

>
>> +     else
>> +             __raw_writel(rate->pdiv * PLL35XX_LOCK_FACTOR,
>> +                             pll->lock_reg);
>>
>>       /* Change PLL PMS values */
>>       tmp &= ~((PLL35XX_MDIV_MASK << PLL35XX_MDIV_SHIFT) |
>> @@ -356,7 +366,6 @@ static const struct clk_ops samsung_pll36xx_clk_min_ops = {
>>
>>  #define PLL45XX_ENABLE               BIT(31)
>>  #define PLL45XX_LOCKED               BIT(29)
>> -
>
> Stray change?

Yes. Fixed.

>
>>  static unsigned long samsung_pll45xx_recalc_rate(struct clk_hw *hw,
>>                               unsigned long parent_rate)
>>  {
>
> [snip]
>
>> @@ -573,14 +588,23 @@ static int samsung_pll46xx_set_rate(struct clk_hw *hw, unsigned long drate,
>>               lock = 0xffff;
>>
>>       /* Set PLL PMS and VSEL values. */
>> -     con0 &= ~((PLL46XX_MDIV_MASK << PLL46XX_MDIV_SHIFT) |
>> +     if (pll->type == pll_1460x) {
>> +             con0 &= ~((PLL46XX_MDIV_MASK << PLL46XX_MDIV_SHIFT) |
>
> Shouldn't PLL1460X_MDIV_MASK be used here instead?

Ok. Fixed.

Thanks.

>
> Best regards,
> Tomasz

-- 
Shine bright,
(: Nav )
