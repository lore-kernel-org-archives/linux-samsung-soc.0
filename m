From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH RFC 1/7] clk: samsung: Add enable/disable operation for
 PLL36XX clocks
Date: Mon, 24 Apr 2017 13:50:10 +0200
Message-ID: <CAJKOXPepqf0FoGb-Yv7yWBAmOdq_jBiEjScEsZLJHEU=nYd5wQ@mail.gmail.com>
References: <1492795191-31298-1-git-send-email-s.nawrocki@samsung.com>
 <CGME20170421172016epcas5p342c16e1219c1205a44a84eaa770ad5ac@epcas5p3.samsung.com>
 <1492795191-31298-2-git-send-email-s.nawrocki@samsung.com>
 <20170422152236.tbf4iuoadqrvoc2n@kozik-lap> <017b3ec8-c185-c29a-2944-12f519b461fe@samsung.com>
 <CAJKOXPdKRzC+f4mLCPhHKNuGS4=K-9CC_AKor0Etfu7Bxp-+iw@mail.gmail.com> <3232b6e5-05b6-2d91-07ef-e5473ee70889@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:57078 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1168445AbdDXLuO (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 24 Apr 2017 07:50:14 -0400
In-Reply-To: <3232b6e5-05b6-2d91-07ef-e5473ee70889@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com, Javier Martinez Canillas <javier@osg.samsung.com>, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>, Seung Woo Kim <sw0312.kim@samsung.com>, Inki Dae <inki.dae@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, linux-clk@vger.kernel.org

On Mon, Apr 24, 2017 at 1:35 PM, Sylwester Nawrocki
<s.nawrocki@samsung.com> wrote:
> (dropping unrelated addresses from Cc list)
>
> On 04/24/2017 01:18 PM, Krzysztof Kozlowski wrote:
>>
>> On Mon, Apr 24, 2017 at 1:12 PM, Sylwester Nawrocki
>> <s.nawrocki@samsung.com> wrote:
>>>
>>> On 04/22/2017 05:22 PM, Krzysztof Kozlowski wrote:
>>>>>
>>>>> @@ -354,10 +359,12 @@ static int samsung_pll36xx_set_rate(struct clk_hw
>>>>> *hw, unsigned long drate,
>>>>>         writel_relaxed(pll_con1, pll->con_reg + 4);
>>>>>
>>>>>         /* wait_lock_time */
>>>>> -       do {
>>>>> -               cpu_relax();
>>>>> -               tmp = readl_relaxed(pll->con_reg);
>>>>> -       } while (!(tmp & (1 << PLL36XX_LOCK_STAT_SHIFT)));
>>>
>>>
>>>
>>> I will add a comment here like:
>>> /* Wait until the PLL is locked if it is enabled. */
>>>
>>>>> +       if (pll_con0 & BIT(pll->enable_offs)) {
>>>>
>>>>
>>>>
>>>> Why this additional if() is needed?
>>>
>>>
>>>
>>> The PLL will never transition to a locked state if it is disabled,
>>> without
>>> this test we would end up with an indefinite loop below.
>>
>>
>> Hmmm... shouldn't this be split from this change? Or maybe this is
>> needed only because you added enable/disable for pl36xx and previously
>> this was not existing?
>
>
> Yes, it looks like previously the PLLs were always on after were enabled.
> I wouldn't be separating that part, as it's all logically dependent.
> Just the commit message might need some improvement.

Thanks for explanation.

Best regards,
Krzysztof
