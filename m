From: Alim Akhtar <alim.akhtar@samsung.com>
Subject: Re: [PATCH 04/11] clk: samsung: exynos7: Corrects CMU_CCORE clocks
 names
Date: Tue, 08 Sep 2015 18:48:22 +0530
Message-ID: <55EEE01E.5040502@samsung.com>
References: <1441366637-28001-1-git-send-email-alim.akhtar@samsung.com>
 <1441366637-28001-5-git-send-email-alim.akhtar@samsung.com>
 <55EE8E82.8080800@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <55EE8E82.8080800@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: s.nawrocki@samsung.com, tomasz.figa@gmail.com, kgene@kernel.org, mturquette@baylibre.com, amit.daniel@samsung.com, gautam.vivek@samsung.com, sboyd@codeaurora.org, linux-clk@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello,

On 09/08/2015 01:00 PM, Krzysztof Kozlowski wrote:
> On 04.09.2015 20:37, Alim Akhtar wrote:
>> This patch rename CMU_CCROE clocks names to match with user manual.
>
> s/rename/renames/ (everywhere...)
> s/CCROE/CCORE/
>
>
>> And also adds missing gate clock for aclk_ccore_133.
>>
>> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
>> ---
>>   drivers/clk/samsung/clk-exynos7.c       |    8 ++++++--
>>   include/dt-bindings/clock/exynos7-clk.h |    3 ++-
>>   2 files changed, 8 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/clk/samsung/clk-exynos7.c b/drivers/clk/samsung/clk-exynos7.c
>> index ba84e9b..0eb0f57 100644
>> --- a/drivers/clk/samsung/clk-exynos7.c
>> +++ b/drivers/clk/samsung/clk-exynos7.c
>> @@ -31,6 +31,7 @@
>>   #define MUX_SEL_TOPC1		0x0204
>>   #define MUX_SEL_TOPC2		0x0208
>>   #define MUX_SEL_TOPC3		0x020C
>> +#define MUX_ENABLE_TOPC2	0x0308
>>   #define DIV_TOPC0		0x0600
>>   #define DIV_TOPC1		0x0604
>>   #define DIV_TOPC3		0x060C
>> @@ -167,6 +168,9 @@ static struct samsung_gate_clock topc_gate_clks[] __initdata = {
>>   		ENABLE_SCLK_TOPC1, 1, 0, 0),
>>   	GATE(SCLK_CC_PLL_A, "sclk_cc_pll_a", "dout_sclk_cc_pll",
>>   		ENABLE_SCLK_TOPC1, 0, 0, 0),
>> +
>> +	GATE(ACLK_CCORE_133, "aclk_ccore_133", "dout_aclk_ccore_133",
>> +		MUX_ENABLE_TOPC2, 4, 0, 0),
>
> Hmmm... Shouldn't this be CLK_ENABLE_ACLK_TOPC0 register? For other
> similar clock configurations (e.g. SCLK_I2S1) the gate at the end is
> controlled, not the mux parent.
Good catch, will re-spin, as suggested by you, will separate adding Gate 
and renaming clock names.
>
> Best regards,
> Krzysztof
>
>>   };
>>
>>   static struct samsung_pll_clock topc_pll_clks[] __initdata = {
>> @@ -544,7 +548,7 @@ CLK_OF_DECLARE(exynos7_clk_top1, "samsung,exynos7-clock-top1",
>>   /*
>>    * List of parent clocks for Muxes in CMU_CCORE
>>    */
>> -PNAME(mout_aclk_ccore_133_p)	= { "fin_pll", "dout_aclk_ccore_133" };
>> +PNAME(mout_aclk_ccore_133_user_p)	= { "fin_pll", "aclk_ccore_133" };
>>
>>   static unsigned long ccore_clk_regs[] __initdata = {
>>   	MUX_SEL_CCORE,
>> @@ -552,7 +556,7 @@ static unsigned long ccore_clk_regs[] __initdata = {
>>   };
>>
>>   static struct samsung_mux_clock ccore_mux_clks[] __initdata = {
>> -	MUX(0, "mout_aclk_ccore_133_user", mout_aclk_ccore_133_p,
>> +	MUX(0, "mout_aclk_ccore_133_user", mout_aclk_ccore_133_user_p,
>>   		MUX_SEL_CCORE, 1, 1),
>>   };
>>
>> diff --git a/include/dt-bindings/clock/exynos7-clk.h b/include/dt-bindings/clock/exynos7-clk.h
>> index b63eba6..2e01235 100644
>> --- a/include/dt-bindings/clock/exynos7-clk.h
>> +++ b/include/dt-bindings/clock/exynos7-clk.h
>> @@ -30,7 +30,8 @@
>>   #define SCLK_BUS0_PLL_A			17
>>   #define SCLK_CC_PLL_B			18
>>   #define SCLK_CC_PLL_A			19
>> -#define TOPC_NR_CLK			20
>> +#define ACLK_CCORE_133			20
>> +#define TOPC_NR_CLK			21
>>
>>   /* TOP0 */
>>   #define DOUT_ACLK_PERIC1		1
>>
>
>
