From: Alim Akhtar <alim.akhtar@gmail.com>
Subject: Re: [PATCH 1/4] clk: samsung: exynos7: Update CMU TOPC block clock
Date: Tue, 25 Aug 2015 21:29:55 +0530
Message-ID: <CAGOxZ529RXyph5rB6Rcc3CsyZSavK1_M7Cjm1SW8a1GDLM-9zA@mail.gmail.com>
References: <1440414356-1805-1-git-send-email-alim.akhtar@samsung.com>
 <1440414356-1805-2-git-send-email-alim.akhtar@samsung.com> <55DC12FE.80009@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-io0-f171.google.com ([209.85.223.171]:36439 "EHLO
	mail-io0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755879AbbHYQAg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 25 Aug 2015 12:00:36 -0400
Received: by iodv127 with SMTP id v127so191719846iod.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 25 Aug 2015 09:00:35 -0700 (PDT)
In-Reply-To: <55DC12FE.80009@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, kgene <kgene@kernel.org>, mturquette@baylibre.com, "amit.daniel@samsung.com" <amit.daniel@samsung.com>

Hello Krzysztof,

On Tue, Aug 25, 2015 at 12:32 PM, Krzysztof Kozlowski
<k.kozlowski@samsung.com> wrote:
> On 24.08.2015 20:05, Alim Akhtar wrote:
>> This patch fixes some of the bit field and
>> update the TOPC block clock as per the latest UM.
>
> Description is not entirely correct. The "ENABLE_ACLK_TOPC1" register
> was present already both in driver and in first user manual. That means
> it was just forgotten to be saved/restored during sleep. There is no
> update for manual because manual did not change anything.
>
> The same for widths of bit fields - the 0.00 manual specifies them as 4
> bit wide. Where is the change from latest UM?
>
Thanks for your review, will update the commit message and remove
ENABLE_ACLK_TOPC1 for now.
> Please describe the change as it is - clock driver was bogus and has to
> be fixed :) .
>

> Best regards,
> Krzysztof
>
>>
>> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
>> ---
>>  drivers/clk/samsung/clk-exynos7.c |   15 ++++++++-------
>>  1 file changed, 8 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/clk/samsung/clk-exynos7.c b/drivers/clk/samsung/clk-exynos7.c
>> index 03d36e8..cbf1bd2 100644
>> --- a/drivers/clk/samsung/clk-exynos7.c
>> +++ b/drivers/clk/samsung/clk-exynos7.c
>> @@ -87,6 +87,7 @@ static unsigned long topc_clk_regs[] __initdata = {
>>       DIV_TOPC0,
>>       DIV_TOPC1,
>>       DIV_TOPC3,
>> +     ENABLE_ACLK_TOPC1,
>>  };
>>
>>  static struct samsung_mux_clock topc_mux_clks[] __initdata = {
>> @@ -104,9 +105,9 @@ static struct samsung_mux_clock topc_mux_clks[] __initdata = {
>>       MUX(0, "mout_sclk_mfc_pll_cmuc", mout_sclk_mfc_pll_cmuc_p,
>>               MUX_SEL_TOPC0, 28, 1),
>>
>> +     MUX(0, "mout_aud_pll_ctrl", mout_aud_pll_ctrl_p, MUX_SEL_TOPC1, 0, 1),
>>       MUX(0, "mout_sclk_bus0_pll_out", mout_sclk_bus0_pll_out_p,
>>               MUX_SEL_TOPC1, 16, 1),
>> -     MUX(0, "mout_aud_pll_ctrl", mout_aud_pll_ctrl_p, MUX_SEL_TOPC1, 0, 1),
>>
>>       MUX(0, "mout_aclk_ccore_133", mout_topc_group2, MUX_SEL_TOPC2, 4, 2),
>>
>> @@ -116,7 +117,7 @@ static struct samsung_mux_clock topc_mux_clks[] __initdata = {
>>
>>  static struct samsung_div_clock topc_div_clks[] __initdata = {
>>       DIV(DOUT_ACLK_CCORE_133, "dout_aclk_ccore_133", "mout_aclk_ccore_133",
>> -             DIV_TOPC0, 4, 4),
>> +             DIV_TOPC0, 4, 5),
>>
>>       DIV(DOUT_ACLK_MSCL_532, "dout_aclk_mscl_532", "mout_aclk_mscl_532",
>>               DIV_TOPC1, 20, 4),
>> @@ -124,15 +125,15 @@ static struct samsung_div_clock topc_div_clks[] __initdata = {
>>               DIV_TOPC1, 24, 4),
>>
>>       DIV(DOUT_SCLK_BUS0_PLL, "dout_sclk_bus0_pll", "mout_sclk_bus0_pll_out",
>> -             DIV_TOPC3, 0, 3),
>> +             DIV_TOPC3, 0, 4),
>>       DIV(DOUT_SCLK_BUS1_PLL, "dout_sclk_bus1_pll", "mout_bus1_pll_ctrl",
>> -             DIV_TOPC3, 8, 3),
>> +             DIV_TOPC3, 8, 4),
>>       DIV(DOUT_SCLK_CC_PLL, "dout_sclk_cc_pll", "mout_cc_pll_ctrl",
>> -             DIV_TOPC3, 12, 3),
>> +             DIV_TOPC3, 12, 4),
>>       DIV(DOUT_SCLK_MFC_PLL, "dout_sclk_mfc_pll", "mout_mfc_pll_ctrl",
>> -             DIV_TOPC3, 16, 3),
>> +             DIV_TOPC3, 16, 4),
>>       DIV(DOUT_SCLK_AUD_PLL, "dout_sclk_aud_pll", "mout_aud_pll_ctrl",
>> -             DIV_TOPC3, 28, 3),
>> +             DIV_TOPC3, 28, 4),
>>  };
>>
>>  static struct samsung_pll_rate_table pll1460x_24mhz_tbl[] __initdata = {
>>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Regards,
Alim
