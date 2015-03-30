From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [RFC PATCH v3 2/2] clk: exynos5420: Make sure MDMA0 clock is
 enabled during suspend
Date: Mon, 30 Mar 2015 18:16:49 +0200
Message-ID: <551976F1.1000605@collabora.co.uk>
References: <1427730803-28635-1-git-send-email-javier.martinez@collabora.co.uk>	<1427730803-28635-3-git-send-email-javier.martinez@collabora.co.uk> <CA+Ln22FBpuzR06qCsVc7SXtLX2mhf901vDE5D-mT1+ijZ2G3sg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:43253 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752777AbbC3QQz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Mar 2015 12:16:55 -0400
In-Reply-To: <CA+Ln22FBpuzR06qCsVc7SXtLX2mhf901vDE5D-mT1+ijZ2G3sg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Mike Turquette <mturquette@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Kukjin Kim <kgene@kernel.org>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kevin Hilman <khilman@linaro.org>, Tyler Baker <tyler.baker@linaro.org>, Abhilash Kesavan <kesavan.abhilash@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>

Hello Tomasz,

Thanks a lot for your feedback.

On 03/30/2015 06:07 PM, Tomasz Figa wrote:
> Hi Javier,
> 
> Please see my comments inline.
> 
> 2015-03-31 0:53 GMT+09:00 Javier Martinez Canillas
> <javier.martinez@collabora.co.uk>:
> [snip]
>> diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
>> index 07d666cc6a29..2d39b629144a 100644
>> --- a/drivers/clk/samsung/clk-exynos5420.c
>> +++ b/drivers/clk/samsung/clk-exynos5420.c
>> @@ -151,6 +151,7 @@ enum exynos5x_plls {
>>
>>  static void __iomem *reg_base;
>>  static enum exynos5x_soc exynos5x_soc;
>> +struct samsung_clk_provider *ctx;
> 
> static
>

Ok.
 
>>
>>  #ifdef CONFIG_PM_SLEEP
>>  static struct samsung_clk_reg_dump *exynos5x_save;
>> @@ -275,8 +276,18 @@ static const struct samsung_clk_reg_dump exynos5420_set_clksrc[] = {
>>         { .offset = GATE_IP_PERIC,              .value = 0xffffffff, },
>>  };
>>
>> +/*
>> + * list of clocks that have to be kept enabled during suspend/resume cycle.
>> + */
>> +static unsigned int exynos5x_clk_suspend[] = {
> 
> static const
>

Ok.
 
>> +       CLK_MDMA0,
>> +};
>> +
>>  static int exynos5420_clk_suspend(void)
>>  {
>> +       int i;
>> +       struct clk *clk;
>> +
>>         samsung_clk_save(reg_base, exynos5x_save,
>>                                 ARRAY_SIZE(exynos5x_clk_regs));
>>
>> @@ -287,11 +298,24 @@ static int exynos5420_clk_suspend(void)
>>         samsung_clk_restore(reg_base, exynos5420_set_clksrc,
>>                                 ARRAY_SIZE(exynos5420_set_clksrc));
>>
>> +       for (i = 0; i < ARRAY_SIZE(exynos5x_clk_suspend); i++) {
>> +               clk = samsung_clk_lookup(ctx, exynos5x_clk_suspend[i]);
> 
> If look-up speed is important here, maybe all the relevant clocks
> could be looked up once at initialization time and just prepared and
> enabled here?
>

Yes, I'll do that indeed.

In fact, I was wondering if we should let this clock be disabled at
all. I noticed that the rockchip clk drivers do something similar
and prepare / enable a list of clocks at init time [0,1].

Unfortunately I don't fully understand why this clock needs to be
enabled. It would be good if someone at Samsung can explain in
more detail what the real problem really is.
 
> Best regards,
> Tomasz
>

Best regards,
Javier

[0]: http://lxr.free-electrons.com/source/drivers/clk/rockchip/clk.c#L320
[1]: http://lxr.free-electrons.com/source/drivers/clk/rockchip/clk-rk3288.c#L874
