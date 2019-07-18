From: Lukasz Luba <l.luba@partner.samsung.com>
Subject: Re: [PATCH v1 13/50] clk: samsung: add DPLL rate table in
 Exynos5420
Date: Thu, 18 Jul 2019 08:01:16 +0200
Message-ID: <8d361a79-4147-e613-5b05-faf8efcef434@partner.samsung.com>
References: <20190715124417.4787-1-l.luba@partner.samsung.com>
        <CGME20190715124444eucas1p2683c9896e8be45d6a0cd4afeb681a2ea@eucas1p2.samsung.com>
        <20190715124417.4787-14-l.luba@partner.samsung.com>
        <9095a5be-3002-93c6-9d08-92eb84f5c103@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <9095a5be-3002-93c6-9d08-92eb84f5c103@samsung.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc: mturquette@baylibre.com, sboyd@kernel.org, b.zolnierkie@samsung.com, krzk@kernel.org, kgene@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, kyungmin.park@samsung.com, a.hajda@samsung.com, m.szyprowski@samsung.com, s.nawrocki@samsung.com, myungjoo.ham@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Hi Chanwoo,

On 7/16/19 11:31 AM, Chanwoo Choi wrote:
> Hi,
> 
> Also, you better to merge patch13/patch15/patch16 to one patch
> in order to add the PLL table for DPLL/MPLL/SPLL.
OK
> 
> And I have a question. Are there any use-case to change
> the PLL frequency for DPLL/MPLL/SPLL?
Yes, when you set a PLL frequency i.e. DPLL to 1200MHz (from 600MHz)
you can attach a child to it which is running with 400, 300, 150 MHz
and these frequencies are set only on this child clock divider
(/3, /4, /8 - 3bit div) (and there is no set parent rate and
reprogramming the master PLL). While 600MHz cannot satisfy 400MHz
and 300MHz OPPs at the same time.
If the child cannot change the PLL, because it could affect other
children of this PLL and cause misalignment in their frequency after
their dividers, it is better to stick with a rule: pin children to the
PLL with frequency rate which could be divided without a rest and gives
all OPPs rates of all children. This PLL rate could be calculated by
hand, finding least common multiple, keeping in mind clock dividers
width (i.e. 3bit).

That's why I am changing the PLLs' rates and connect children to them
also aligning OPPs to the values which are possible after DIV (3bit).

Regards,
Lukasz

> 
> On 19. 7. 15. 오후 9:43, Lukasz Luba wrote:
>> The DPLL has fixed frequency left by the bootloader and it is not possible
>> to change it. With this patch the DPLL gets rate table the same for the
>> whole  PLL family (similar as APLL, KPLL according to RM) so the frequency
>> might be changed to one of the values defined there.
>> It is needed for further patches which change the DPLL frequency to feed
>> the clocks with proper base.
>> It also sets CLK_IS_CRITICAL for SCLK_DPLL due to some drivers which could
>> disable master clock, which is then populated higher and tries to disable
>> PLL, which casues system crash. The flag is needed for this kind of use
>> cases.
>>
>> Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
>> ---
>>   drivers/clk/samsung/clk-exynos5420.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
>> index 7f8221527633..2395b02ce8c5 100644
>> --- a/drivers/clk/samsung/clk-exynos5420.c
>> +++ b/drivers/clk/samsung/clk-exynos5420.c
>> @@ -694,7 +694,8 @@ static const struct samsung_mux_clock exynos5x_mux_clks[] __initconst = {
>>   	MUX(0, "mout_sclk_rpll", mout_rpll_p, SRC_TOP6, 16, 1),
>>   	MUX_F(CLK_MOUT_EPLL, "mout_sclk_epll", mout_epll_p, SRC_TOP6, 20, 1,
>>   			CLK_SET_RATE_PARENT, 0),
>> -	MUX(0, "mout_sclk_dpll", mout_dpll_p, SRC_TOP6, 24, 1),
>> +	MUX_F(CLK_MOUT_SCLK_DPLL, "mout_sclk_dpll", mout_dpll_p,
>> +			SRC_TOP6, 24, 1, CLK_IS_CRITICAL, 0),
>>   	MUX(0, "mout_sclk_cpll", mout_cpll_p, SRC_TOP6, 28, 1),
>>   
>>   	MUX(CLK_MOUT_SW_ACLK400_ISP, "mout_sw_aclk400_isp",
>> @@ -1514,6 +1515,7 @@ static void __init exynos5x_clk_init(struct device_node *np,
>>   
>>   	if (_get_rate("fin_pll") == 24 * MHZ) {
>>   		exynos5x_plls[apll].rate_table = exynos5420_pll2550x_24mhz_tbl;
>> +		exynos5x_plls[dpll].rate_table = exynos5420_pll2550x_24mhz_tbl;
>>   		exynos5x_plls[epll].rate_table = exynos5420_epll_24mhz_tbl;
>>   		exynos5x_plls[kpll].rate_table = exynos5420_pll2550x_24mhz_tbl;
>>   	}
>>
> 
> 
