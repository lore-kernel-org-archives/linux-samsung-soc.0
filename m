From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH v2 1/5] clk: samsung: add common clock framework support
 for Samsung platforms
Date: Mon, 5 Nov 2012 12:52:00 +0530
Message-ID: <CAJuYYwScWunaVsg=4whrt4gRZYOVBbvAwFhYmN2PCQS723B3og@mail.gmail.com>
References: <1349629855-4962-1-git-send-email-thomas.abraham@linaro.org>
	<1349629855-4962-2-git-send-email-thomas.abraham@linaro.org>
	<20121030163012.18780.19304@nucleus>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f174.google.com ([209.85.217.174]:36253 "EHLO
	mail-lb0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751681Ab2KEHWB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 5 Nov 2012 02:22:01 -0500
Received: by mail-lb0-f174.google.com with SMTP id n3so4000843lbo.19
        for <linux-samsung-soc@vger.kernel.org>; Sun, 04 Nov 2012 23:22:00 -0800 (PST)
In-Reply-To: <20121030163012.18780.19304@nucleus>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mike Turquette <mturquette@ti.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, t.figa@samsung.com, sylvester.nawrocki@gmail.com

Hi Mike,

Thanks for your review.

On 30 October 2012 22:00, Mike Turquette <mturquette@ti.com> wrote:
> Hi Thomas,
>
> Quoting Thomas Abraham (2012-10-07 10:10:51)
>> +/* determine the output clock speed of the pll */
>> +static unsigned long samsung_pll_clock_recalc_rate(struct clk_hw *hw,
>> +                               unsigned long parent_rate)
>> +{
>> +       struct samsung_pll_clock *clk_pll = to_clk_pll(hw);
>> +
>> +       if (clk_pll->get_rate)
>> +               return to_clk_pll(hw)->get_rate(parent_rate);
>
> Why the extra indirection?  Does your samsung_pll_clock abstract several
> different PLL implementations (with separate clock ops)?  If so, why not
> make a unique struct for each PLL type?

Yes, it abstracts several PLL types. There are multiple PLL types used
by Samsung SoC's and this clock type was supposed to abstract all the
types of PLL's. But yes, you are right. It is better to have a unique
implementation for each type of PLL. That way, multiple user's of a
PLL type need not be worried about setting up runtime callbacks for
clock operations.

>
>> +
>> +       return 0;
>> +}
>> +
>> +/* round operation not supported */
>> +static long samsung_pll_clock_round_rate(struct clk_hw *hw, unsigned long drate,
>> +                               unsigned long *prate)
>> +{
>> +       return samsung_pll_clock_recalc_rate(hw, *prate);
>
> Why is round_rate not supported?  How is returning the recalculated rate
> the right thing here?

The PLL does not include a divider for the rounding operation. So the
output of the PLL clock type is not something that can be divided
down. The parent clock of the PLL clock type is usually a low
frequency oscillator. Hence, the round rate operation has not been
implemented for the PLL clock type.

>
>> +/*
>> + * Allow platform specific implementations to attach set_rate and get_rate
>> + * callbacks for the pll type clock. Typical calling sequence..
>> + *
>> + * struct clk *clk = clk_get(NULL, "pll-clk-name");
>> + * samsung_pll_clk_set_cb(clk, pll_set_rate, pll_get_rate);
>> + */
>> +void __init samsung_pll_clk_set_cb(struct clk *clk,
>> +                       int (*set_rate)(unsigned long rate),
>> +                       unsigned long (*get_rate)(unsigned long rate))
>> +{
>> +       struct samsung_pll_clock *clk_pll;
>> +       struct clk_hw *hw = __clk_get_hw(clk);
>> +
>> +       clk_pll = to_clk_pll(hw);
>> +       clk_pll->set_rate = set_rate;
>> +       clk_pll->get_rate = get_rate;
>> +}
>
> This answers my questions above having different PLL types.  Why not
> just make seprate clk_hw structs for each PLL type instead of the extra
> layer of abstraction + runtime assignment of clk ops?

Ok. I will redo this in the next version of this patch.

Thanks,
Thomas.

>
> Regards,
> Mike
