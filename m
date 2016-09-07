From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v2 4/7] clk: samsung: Add support for EPLL on exynos5410
Date: Wed, 07 Sep 2016 10:27:41 +0200
Message-ID: <a7316c24-2b57-7006-6564-fe25cbec252a@samsung.com>
References: <1473163496-17820-1-git-send-email-s.nawrocki@samsung.com>
 <CGME20160906120551epcas1p1296ff11fa56842df249f5b6520fe0ab8@epcas1p1.samsung.com>
 <1473163496-17820-5-git-send-email-s.nawrocki@samsung.com>
 <57CF942C.1030808@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <57CF942C.1030808@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc: b.zolnierkie@samsung.com, krzk@kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 09/07/2016 06:14 AM, Chanwoo Choi wrote:
> On 2016년 09월 06일 21:04, Sylwester Nawrocki wrote:
...
>> -static const struct samsung_pll_clock exynos5410_plls[nr_plls] __initconst = {
>> +static const struct samsung_pll_rate_table exynos5410_pll2550x_24mhz_tbl[] __initconst = {
>> +	PLL_36XX_RATE(400000000U, 200, 2, 2, 0),
> 
> In the Exynos5410's TRM, the EPLL PMS table has the 
> 'P' state is 3 instead of 2 when target is 400MHz as following:
> 
> 	PLL_36XX_RATE(400000000U, 200, 3, 2, 0),

Indeed, thanks for pointing out.

>> +	PLL_36XX_RATE(333000000U, 111, 2, 2, 0),
>> +	PLL_36XX_RATE(300000000U, 100, 2, 2, 0),
>> +	PLL_36XX_RATE(266000000U, 266, 3, 3, 0),
>> +	PLL_36XX_RATE(200000000U, 200, 3, 3, 0),
>> +	PLL_36XX_RATE(192000000U, 192, 3, 3, 0),
>> +	PLL_36XX_RATE(166000000U, 166, 3, 3, 0),
>> +	PLL_36XX_RATE(133000000U, 266, 3, 4, 0),
>> +	PLL_36XX_RATE(100000000U, 200, 3, 4, 0),
>> +	PLL_36XX_RATE(66000000U,  176, 2, 5, 0),
> 
> The all entry of EPLL PMS table has the zero(0) for 'K' value.
> How about using the PLL_35XX_RATE() which has the P,M,S entry without K entry?

Don't have a strong opinion on that, I'm inclined to stay with
PLL_36XX_RATE() though, to indicate the K value is valid for this
PLL type.

>> @@ -237,6 +258,7 @@ static void __init exynos5410_clk_init(struct device_node *np)
>>  {
>>  	struct samsung_clk_provider *ctx;
>>  	void __iomem *reg_base;
>> +	struct clk *xxti;
>>  
>>  	reg_base = of_iomap(np, 0);
>>  	if (!reg_base)
>> @@ -244,6 +266,10 @@ static void __init exynos5410_clk_init(struct device_node *np)
>>  
>>  	ctx = samsung_clk_init(np, reg_base, CLK_NR_CLKS);
>>  
>> +	xxti = of_clk_get(np, 0);
>> +	if (!IS_ERR(xxti) && clk_get_rate(xxti) == 24 * MHZ)
>> +		exynos5410_plls[epll].rate_table = exynos5410_pll2550x_24mhz_tbl;
>> +
> 
> I sent the patch to use the samsung_cmu_register_one()
> 
> and applied it[1]. I think that you need to rebase this patch on patch[1].
> [1] https://lkml.org/lkml/2016/9/1/602
> - Re: [PATCH 2/2] clk: samsung: exynos5410: Use samsung_cmu_register_one() to simplify code

Yes, I need to rebase onto latest tree.

>> +/* Maximum lock time can be 3000 * PDIV cycles */
>> +#define PLL2650X_LOCK_FACTOR		3000
>> +
>> +#define PLL2650X_M_MASK			0x3FF
> 
> 1FF instead of 0x3FF because the MDIV [24:16]?

Right, my bad, I'll correct this.

>> +#define PLL2650X_P_MASK			0x3F
>> +#define PLL2650X_S_MASK			0x7
>> +#define PLL2650X_K_MASK			0xFFFF
>> +#define PLL2650X_LOCK_STAT_MASK		0x1
>> +#define PLL2650X_M_SHIFT		16
>> +#define PLL2650X_P_SHIFT		8
>> +#define PLL2650X_S_SHIFT		0
>> +#define PLL2650X_K_SHIFT		0
>> +#define PLL2650X_LOCK_STAT_SHIFT	29
>> +#define PLL2650X_PLL_ENABLE_SHIFT	31
>> +
>> +static unsigned long samsung_pll2650x_recalc_rate(struct clk_hw *hw,
>> +				unsigned long parent_rate)
>> +{
>> +	struct samsung_clk_pll *pll = to_clk_pll(hw);
>> +	u64 fout = parent_rate;
>> +	u32 mdiv, pdiv, sdiv, pll_con0, pll_con1;
>> +	s16 kdiv;
>> +
>> +	pll_con0 = readl_relaxed(pll->con_reg);
>> +	mdiv = (pll_con0 >> PLL2650X_M_SHIFT) & PLL2650X_M_MASK;
>> +	pdiv = (pll_con0 >> PLL2650X_P_SHIFT) & PLL2650X_P_MASK;
>> +	sdiv = (pll_con0 >> PLL2650X_S_SHIFT) & PLL2650X_S_MASK;
>> +
>> +	pll_con1 = readl_relaxed(pll->con_reg + 4);
>> +	kdiv = (s16)((pll_con1 >> PLL2650X_K_SHIFT) & PLL2650X_K_MASK);
>> +
>> +	fout *= (mdiv << 16) + kdiv;
>> +	do_div(fout, (pdiv << sdiv));
>> +	fout >>= 16;
>> +
>> +	return (unsigned long)fout;
> 
> I got some confusion because the EPLL_CON1 register don't include
> the 'K' value. Instead, the name is 'DSM' which is PLL DSM(Delta-Sigma 
> Modulator).
> But, I knew that DSM means the 'K' value as your implementation.

Yes, the documentation seems incomplete, the K coefficient is used
in the PLL output frequency equations and I found that register
bit field used in some downstream kernel.
Perhaps this is corrected in newer User Manual version than
the "Preeliminary" I have.

> I have a question.
> When I check the calculation fomula as following:
> 	FFOUT = ((m+k/65536) x FFIN) / (p x 2^S);
> 
> So, pll2560x might shift the kdiv instead of mdiv.
> 	fout *= mdiv + (kdiv << 16);

First we multiply both sides of the equation by 65536 (2^16):

 65536 * FFOUT = 65536 * ((M + K/65536) x FFIN) / (P x 2^S);

That means M needs to be multiplied by 2^16, not K:

 65536 * FFOUT = (65536 * M + K) x FFIN) / (P x 2^S);

K is the "fractional" coefficient here, with least impact on FFOUT.
Finally we divide fout by 2^16 to reverse previous multiplication.

I tested this code with audio playback, if it had been incorrect
in such a way the sampling rate would certainly have been incorrect
and it would have been heard.

-- 
Thanks,
Sylwester
