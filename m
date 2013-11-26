From: Chander Kashyap <chander.kashyap@linaro.org>
Subject: Re: [PATCH v2] clk: exynos5420: fix cpll clock register offsets
Date: Tue, 26 Nov 2013 13:37:24 +0530
Message-ID: <CANuQgHEPxYZPPQsx9VgnGfaN=VetphEnoEp8YkCuyfnPLCKEZQ@mail.gmail.com>
References: <1380186395-28814-1-git-send-email-chander.kashyap@linaro.org>
	<CANuQgHFPB4C69C1sDFPVx6E8XjMhbqs-75R9xq1LP0=yO9C4zg@mail.gmail.com>
	<CANuQgHEMsNMyjvwoZ6we8dz-X+T0XdQYyYwCHGCPk0iuH8W=8A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f53.google.com ([209.85.219.53]:61329 "EHLO
	mail-oa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751796Ab3KZIHZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Nov 2013 03:07:25 -0500
Received: by mail-oa0-f53.google.com with SMTP id m1so5651184oag.12
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Nov 2013 00:07:24 -0800 (PST)
In-Reply-To: <CANuQgHEMsNMyjvwoZ6we8dz-X+T0XdQYyYwCHGCPk0iuH8W=8A@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
Cc: Mike Turquette <mturquette@linaro.org>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, yadi.brar@samsung.com, "t.figa@samsung.com" <t.figa@samsung.com>, Chander Kashyap <chander.kashyap@linaro.org>

Hi Mike,

On 22 October 2013 11:20, Chander Kashyap <chander.kashyap@linaro.org> wrote:
> On 16 October 2013 11:10, Chander Kashyap <chander.kashyap@linaro.org> wrote:
>> On 26 September 2013 14:36, Chander Kashyap <chander.kashyap@linaro.org> wrote:
>>> Fixes cpll control and lock register offset values for Exynos5420 SoC.
>>>
>>> Signed-off-by: Chander Kashyap <chander.kashyap@linaro.org>
>>> Acked-by: Kukjin Kim <kgene.kim@samsung.com>
>>> ---
>>> Changes Since v1:
>>>         - Fixed patch subject as per Kukgin suggestion.
>>>
>>>  drivers/clk/samsung/clk-exynos5420.c |    4 ++--
>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
>>> index 86dfc64..892aac0 100644
>>> --- a/drivers/clk/samsung/clk-exynos5420.c
>>> +++ b/drivers/clk/samsung/clk-exynos5420.c
>>> @@ -730,8 +730,8 @@ struct samsung_gate_clock exynos5420_gate_clks[] __initdata = {
>>>  struct __initdata samsung_pll_clock exynos5420_plls[nr_plls] = {
>>>         [apll] = PLL(pll_2550, fout_apll, "fout_apll", "fin_pll", APLL_LOCK,
>>>                 APLL_CON0, NULL),
>>> -       [cpll] = PLL(pll_2550, fout_mpll, "fout_mpll", "fin_pll", MPLL_LOCK,
>>> -               MPLL_CON0, NULL),
>>> +       [cpll] = PLL(pll_2550, fout_cpll, "fout_cpll", "fin_pll", CPLL_LOCK,
>>> +               CPLL_CON0, NULL),
>>>         [dpll] = PLL(pll_2550, fout_dpll, "fout_dpll", "fin_pll", DPLL_LOCK,
>>>                 DPLL_CON0, NULL),
>>>         [epll] = PLL(pll_2650, fout_epll, "fout_epll", "fin_pll", EPLL_LOCK,
>>> --
>>> 1.7.9.5
>>>
>>
>>
>> Mike, can you please take this patch.
>
> Can this patch be merged?

Any update on this patch ?

>
>>
>> --
>> with warm regards,
>> Chander Kashyap
>
>
>
> --
> with warm regards,
> Chander Kashyap



-- 
with warm regards,
Chander Kashyap
