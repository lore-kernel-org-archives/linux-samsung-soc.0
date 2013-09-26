From: Chander Kashyap <chander.kashyap@linaro.org>
Subject: Re: [PATCH] clk: samsung: fix cpll clock register offsets for
 exynos5420 SoC
Date: Thu, 26 Sep 2013 14:28:12 +0530
Message-ID: <CANuQgHHrPaEM0RJRivAarSU5y1V1F40YYtuPO8LA1FNAM6LEPw@mail.gmail.com>
References: <1380099864-32031-1-git-send-email-chander.kashyap@linaro.org>
	<02c601ceba75$24c763b0$6e562b10$@org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f171.google.com ([209.85.214.171]:35785 "EHLO
	mail-ob0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755847Ab3IZI6M (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 26 Sep 2013 04:58:12 -0400
Received: by mail-ob0-f171.google.com with SMTP id wm4so1523280obc.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Sep 2013 01:58:12 -0700 (PDT)
In-Reply-To: <02c601ceba75$24c763b0$6e562b10$@org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Mike Turquette <mturquette@linaro.org>, Thomas Abraham <thomas.abraham@linaro.org>, yadi.brar@samsung.com

On 26 September 2013 10:29, Kukjin Kim <kgene@kernel.org> wrote:
> Chander Kashyap wrote:
>>
>> Fixes cpll control and lock register offset values for Exynos5420 SoC.
>>
>> Signed-off-by: Chander Kashyap <chander.kashyap@linaro.org>
>
> Just nit in the subject,
> 'clk: exynos5420: ...' or 'clk/exynos5420: ...' would be nice...
>

Thanks for review.
I will re-post it.

> Acked-by: Kukjin Kim <kgene.kim@samsung.com>
>
> Thanks,
> Kukjin
>
>> ---
>>  drivers/clk/samsung/clk-exynos5420.c |    4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/clk/samsung/clk-exynos5420.c
>> b/drivers/clk/samsung/clk-exynos5420.c
>> index 86dfc64..892aac0 100644
>> --- a/drivers/clk/samsung/clk-exynos5420.c
>> +++ b/drivers/clk/samsung/clk-exynos5420.c
>> @@ -730,8 +730,8 @@ struct samsung_gate_clock exynos5420_gate_clks[]
>> __initdata = {
>>  struct __initdata samsung_pll_clock exynos5420_plls[nr_plls] = {
>>       [apll] = PLL(pll_2550, fout_apll, "fout_apll", "fin_pll", APLL_LOCK,
>>               APLL_CON0, NULL),
>> -     [cpll] = PLL(pll_2550, fout_mpll, "fout_mpll", "fin_pll", MPLL_LOCK,
>> -             MPLL_CON0, NULL),
>> +     [cpll] = PLL(pll_2550, fout_cpll, "fout_cpll", "fin_pll", CPLL_LOCK,
>> +             CPLL_CON0, NULL),
>>       [dpll] = PLL(pll_2550, fout_dpll, "fout_dpll", "fin_pll", DPLL_LOCK,
>>               DPLL_CON0, NULL),
>>       [epll] = PLL(pll_2650, fout_epll, "fout_epll", "fin_pll", EPLL_LOCK,
>> --
>> 1.7.9.5
>



-- 
with warm regards,
Chander Kashyap
