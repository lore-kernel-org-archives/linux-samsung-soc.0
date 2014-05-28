From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 1/1] clk: exynos5420: Staticize local variables
Date: Wed, 28 May 2014 16:48:03 +0530
Message-ID: <CAK9yfHxoYOgsd0P8Qb6_VdEmL4CSfLLAoir6knUTRZy7rnG84g@mail.gmail.com>
References: <1400673482-16287-1-git-send-email-sachin.kamat@linaro.org>
	<CAK9yfHwzAsJLfYfn_ZfyEx+jerntZOn3fBG682M08hN+DR+sCA@mail.gmail.com>
	<5385C230.8090006@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f178.google.com ([209.85.214.178]:58274 "EHLO
	mail-ob0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752230AbaE1LSE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 May 2014 07:18:04 -0400
Received: by mail-ob0-f178.google.com with SMTP id va2so10651728obc.23
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 May 2014 04:18:03 -0700 (PDT)
In-Reply-To: <5385C230.8090006@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Tomasz Figa <t.figa@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>

Hi Tomasz,

On 28 May 2014 16:32, Tomasz Figa <tomasz.figa@gmail.com> wrote:
> Hi Sachin,
>
> On 28.05.2014 10:01, Sachin Kamat wrote:
>> On 21 May 2014 17:28, Sachin Kamat <sachin.kamat@linaro.org> wrote:
>>> Local symbols are made static.
>>>
>>> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
>>> ---
>>>  drivers/clk/samsung/clk-exynos5420.c |   10 +++++-----
>>>  1 file changed, 5 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
>>> index 9d7d7eed03fd..41b507baf5d6 100644
>>> --- a/drivers/clk/samsung/clk-exynos5420.c
>>> +++ b/drivers/clk/samsung/clk-exynos5420.c
>>> @@ -474,7 +474,7 @@ static struct samsung_fixed_factor_clock
>>>         FFACTOR(0, "ff_dout_spll2", "mout_sclk_spll", 1, 2, 0),
>>>  };
>>>
>>> -struct samsung_mux_clock exynos5800_mux_clks[] __initdata = {
>>> +static struct samsung_mux_clock exynos5800_mux_clks[] __initdata = {
>>>         MUX(0, "mout_aclk400_isp", mout_group3_5800_p, SRC_TOP0, 0, 3),
>>>         MUX(0, "mout_aclk400_mscl", mout_group3_5800_p, SRC_TOP0, 4, 3),
>>>         MUX(0, "mout_aclk400_wcore", mout_group2_5800_p, SRC_TOP0, 16, 3),
>>> @@ -523,7 +523,7 @@ struct samsung_mux_clock exynos5800_mux_clks[] __initdata = {
>>>         MUX(0, "mout_fimd1", mout_group2_p, SRC_DISP10, 4, 3),
>>>  };
>>>
>>> -struct samsung_div_clock exynos5800_div_clks[] __initdata = {
>>> +static struct samsung_div_clock exynos5800_div_clks[] __initdata = {
>>>         DIV(0, "dout_aclk400_wcore", "mout_aclk400_wcore", DIV_TOP0, 16, 3),
>>>
>>>         DIV(0, "dout_aclk550_cam", "mout_aclk550_cam",
>>> @@ -539,14 +539,14 @@ struct samsung_div_clock exynos5800_div_clks[] __initdata = {
>>>         DIV(0, "dout_sclk_sw", "sclk_spll", DIV_TOP9, 24, 6),
>>>  };
>>>
>>> -struct samsung_gate_clock exynos5800_gate_clks[] __initdata = {
>>> +static struct samsung_gate_clock exynos5800_gate_clks[] __initdata = {
>>>         GATE(CLK_ACLK550_CAM, "aclk550_cam", "mout_user_aclk550_cam",
>>>                                 GATE_BUS_TOP, 24, 0, 0),
>>>         GATE(CLK_ACLK432_SCALER, "aclk432_scaler", "mout_user_aclk432_scaler",
>>>                                 GATE_BUS_TOP, 27, 0, 0),
>>>  };
>>>
>>> -struct samsung_mux_clock exynos5420_mux_clks[] __initdata = {
>>> +static struct samsung_mux_clock exynos5420_mux_clks[] __initdata = {
>>>         MUX(0, "sclk_bpll", mout_bpll_p, TOP_SPARE2, 0, 1),
>>>         MUX(0, "mout_aclk400_wcore_bpll", mout_aclk400_wcore_bpll_p,
>>>                                 TOP_SPARE2, 4, 1),
>>> @@ -576,7 +576,7 @@ struct samsung_mux_clock exynos5420_mux_clks[] __initdata = {
>>>         MUX(0, "mout_fimd1", mout_group3_p, SRC_DISP10, 4, 1),
>>>  };
>>>
>>> -struct samsung_div_clock exynos5420_div_clks[] __initdata = {
>>> +static struct samsung_div_clock exynos5420_div_clks[] __initdata = {
>>>         DIV(0, "dout_aclk400_wcore", "mout_aclk400_wcore_bpll",
>>>                         DIV_TOP0, 16, 3),
>>>  };
>>> --
>>
>> Mike,
>>
>> Tomasz is probably on vacation. Can you please take this patch?
>>
>
> Sorry for late reply. Yes, I'm on vacation right now until 9.06, so I'm
> going to be less active through this period of time.

No worries.

> As for this patch, I'm not sure if it will apply to Mike's tree, as it
> seems to depend on patches that went through Kukjin's tree. Since this
> isn't anything critical, I'd suggest deferring this for next release, so
> I can pick this patch up directly after 3.16-rc1 is released.
>
> In case you want to proceed with it now, feel free to add my Acked-by.

Thanks Tomasz.

Kukjin,

If you still can take it, please do so with Tomasz's ack. Else he will handle it
after the merge window.

-- 
With warm regards,
Sachin
