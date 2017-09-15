From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v2] clk: samsung: exynos4: Enable VPLL and EPLL clocks
 for suspend/resume cycle
Date: Fri, 15 Sep 2017 19:13:47 +0900
Message-ID: <59BBA7DB.3060901@samsung.com>
References: <CGME20170915094209eucas1p1c959442cce50aea9553e4b73a36ab8a0@eucas1p1.samsung.com>
        <1505468516-3324-1-git-send-email-m.szyprowski@samsung.com>
        <59BBA70F.2040507@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <stable-owner@vger.kernel.org>
In-reply-to: <59BBA70F.2040507@samsung.com>
Sender: stable-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, stable@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 2017년 09월 15일 19:10, Chanwoo Choi wrote:
> Hi Marek,
> 
> On 2017년 09월 15일 18:41, Marek Szyprowski wrote:
>> Commit 6edfa11cb396 ("clk: samsung: Add enable/disable operation for
>> PLL36XX clocks") added enable/disable operations to PLL clocks. Prior that
>> VPLL and EPPL clocks were always enabled because the enable bit was never
>> touched. Those clocks have to be enabled during suspend/resume cycle,
>> because otherwise board fails to enter sleep mode. This patch enables them
>> unconditionally before entering system suspend state. System restore
>> function will set them to the previous state saved in the register cache
>> done before that unconditional enable.
>>
>> Fixes: 6edfa11cb396 ("clk: samsung: Add enable/disable operation for PLL36XX clocks")
>> CC: stable@vger.kernel.org # v4.13
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> ---
>> Changelog:
>> v2:
>> - wait until PLL is properly locked
>> ---
>>  drivers/clk/samsung/clk-exynos4.c | 15 +++++++++++++++
>>  1 file changed, 15 insertions(+)
>>
>> diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-exynos4.c
>> index e40b77583c47..d8d3cb67b402 100644
>> --- a/drivers/clk/samsung/clk-exynos4.c
>> +++ b/drivers/clk/samsung/clk-exynos4.c
>> @@ -294,6 +294,18 @@ enum exynos4_plls {
>>  #define PLL_ENABLED	(1 << 31)
>>  #define PLL_LOCKED	(1 << 29)
>>  
>> +static void exynos4_clk_enable_pll(u32 reg)
>> +{
>> +	u32 pll_con = readl(reg_base + reg);
>> +	pll_con |= PLL_ENABLED;
>> +	writel(pll_con, reg_base + reg);
>> +
>> +	while (!(pll_con & PLL_LOCKED)) {
>> +		cpu_relax();
>> +		pll_con = readl(reg_base + reg);
>> +	}
>> +}
>> +
>>  static void exynos4_clk_wait_for_pll(u32 reg)
>>  {
>>  	u32 pll_con;
>> @@ -315,6 +327,9 @@ static int exynos4_clk_suspend(void)
>>  	samsung_clk_save(reg_base, exynos4_save_pll,
>>  				ARRAY_SIZE(exynos4_clk_pll_regs));
>>  
>> +	exynos4_clk_enable_pll(EPLL_CON0);
>> +	exynos4_clk_enable_pll(VPLL_CON0);
>> +
> 
> To support runtime pm for Exynos5433 on your patch[1],
> You get the clock from device-tree and enable the clock
> on the suspend function (exynos5433_cmu_suspend) as following:
> 
> [1] [PATCH v9 3/5] clk: samsung: exynos5433: Add support for runtime PM
> - https://patchwork.kernel.org/patch/9911753/
> ------------
> static int exynos5433_cmu_suspend(struct device *dev)                                                          
> {                                                                                                              
> 	struct exynos5433_cmu_data *data = dev_get_drvdata(dev);                                               
> 	int i;                                                                                                 
>                                                                                                             
> 	samsung_clk_save(data->ctx->reg_base, data->clk_save,                                                  
> 				data->nr_clk_save);                                                                   
> 
> 	for (i = 0; i < data->nr_pclks; i++)                                                                   
> 		clk_prepare_enable(data->pclks[i]);                                                            
> 
> 	samsung_clk_restore(data->ctx->reg_base, data->clk_suspend,                                            
> 				data->nr_clk_suspend);                                                             
> 
> 	return 0;
> }
> ------------
> 
> IMHO, I think that you better to get the PLL clock from device-tree
> instead of adding the duplicate code for enabling PLL(EPLL_CON0/VPLL_CON0).
> But, Maybe many -EPROBE_DEFER happen on device driver
> if using the 'platform_driver' method instead of CLK_OF_DECLARE macro.
> 
> I'm not sure what is more important on below:
> - Remove the duplicate code
> - Prevent the -EPROBE_DEFER
> 
> Anyway, I will follow Sylwester's opinion.

Ah, it is my mistake. the clk-exynos4.c have to use the CLK_OF_DECLARE macro
in order to support the timer using CLK_MCT.

Please ignore my comment. Feel free to add my reviewed-by tag
Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>


ditto.

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
