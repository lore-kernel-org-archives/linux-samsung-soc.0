From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v5 10/13] clk: samsung: exynos5433: Add clocks for
 CMU_BUS{0|1|2} domains
Date: Thu, 05 Feb 2015 14:52:52 +0900
Message-ID: <54D30534.6070900@samsung.com>
References: <1422887047-30911-1-git-send-email-cw00.choi@samsung.com>
 <1422887047-30911-11-git-send-email-cw00.choi@samsung.com>
 <54D2184D.8020400@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <54D2184D.8020400@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: mturquette@linaro.org, tomasz.figa@gmail.com, kgene@kernel.org, pankaj.dubey@samsung.com, sangbae90.lee@samsung.com, inki.dae@samsung.com, chanho61.park@samsung.com, sw0312.kim@samsung.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Sylwester,

On 02/04/2015 10:02 PM, Sylwester Nawrocki wrote:
> Hi Chanwoo,
> 
> On 02/02/15 15:24, Chanwoo Choi wrote:
>> This patch adds the mux/divider/gate clocks for CMU_BUS{0|1|2} domains
>> which contain global data buses clocked at up the 400MHz. These blocks
>> transfer data between DRAM and various sub-blocks. These clock domains
>> also contain global peripheral buses clocked at 67/111/200/222/266/333/400
>> MHz and used for register accesses.
> 
>> +/*
>> + * Register offset definitions for CMU_BUS{0|1|2}
>> + */
>> +#define DIV_BUS				0x0600
>> +#define DIV_STAT_BUS			0x0700
>> +#define ENABLE_ACLK_BUS			0x0800
>> +#define ENABLE_PCLK_BUS			0x0900
>> +#define ENABLE_IP_BUS0			0x0b00
>> +#define ENABLE_IP_BUS1			0x0b04
>> +
>> +#define MUX_SEL_BUS2			0x0200	/* Only for CMU_BUS2 */
>> +#define MUX_ENABLE_BUS2			0x0300	/* Only for CMU_BUS2 */
>> +#define MUX_STAT_BUS2			0x0400	/* Only for CMU_BUS2 */
>> +
>> +/* list of all parent clock list */
>> +PNAME(mout_aclk_bus2_400_p)	= { "oscclk", "aclk_bus2_400", };
>> +
>> +#define CMU_BUS_COMMON_CLK_REGS	\
>> +	DIV_BUS,		\
>> +	DIV_STAT_BUS,		\
>> +	ENABLE_ACLK_BUS,	\
>> +	ENABLE_PCLK_BUS,	\
>> +	ENABLE_IP_BUS0,		\
>> +	ENABLE_IP_BUS1
>> +
>> +static unsigned long bus01_clk_regs[] __initdata = {
>> +	CMU_BUS_COMMON_CLK_REGS,
>> +};
>> +
>> +static unsigned long bus2_clk_regs[] __initdata = {
>> +	MUX_SEL_BUS2,
>> +	MUX_ENABLE_BUS2,
>> +	MUX_STAT_BUS2,
>> +	CMU_BUS_COMMON_CLK_REGS,
>> +};
>> +
>> +static struct samsung_div_clock bus0_div_clks[] __initdata = {
>> +	/* DIV_BUS0 */
>> +	DIV(CLK_DIV_PCLK_BUS_133, "div_pclk_bus0_133", "aclk_bus0_400",
>> +			DIV_BUS, 0, 3),
>> +};
>> +
>> +/* CMU_BUS0 clocks */
>> +static struct samsung_gate_clock bus0_gate_clks[] __initdata = {
>> +	/* ENABLE_ACLK_BUS0 */
>> +	GATE(CLK_ACLK_AHB2APB_BUSP, "aclk_ahb2apb_bus0p", "div_pclk_bus0_133",
>> +			ENABLE_ACLK_BUS, 4, CLK_IGNORE_UNUSED, 0),
>> +	GATE(CLK_ACLK_BUSNP_133, "aclk_bus0np_133", "div_pclk_bus0_133",
>> +			ENABLE_ACLK_BUS, 2, CLK_IGNORE_UNUSED, 0),
>> +	GATE(CLK_ACLK_BUSND_400, "aclk_bus0nd_400", "aclk_bus0_400",
>> +			ENABLE_ACLK_BUS, 0, CLK_IGNORE_UNUSED, 0),
>> +
>> +	/* ENABLE_PCLK_BUS0 */
>> +	GATE(CLK_PCLK_BUSSRVND_133, "pclk_bus0srvnd_133", "div_pclk_bus0_133",
>> +			ENABLE_PCLK_BUS, 2, 0, 0),
>> +	GATE(CLK_PCLK_PMU_BUS, "pclk_pmu_bus0", "div_pclk_bus0_133",
>> +			ENABLE_PCLK_BUS, 1, CLK_IGNORE_UNUSED, 0),
>> +	GATE(CLK_PCLK_SYSREG_BUS, "pclk_sysreg_bus0", "div_pclk_bus0_133",
>> +			ENABLE_PCLK_BUS, 0, CLK_IGNORE_UNUSED, 0),
>> +};
>> +
>> +/* CMU_BUS1 clocks */
>> +static struct samsung_div_clock bus1_div_clks[] __initdata = {
>> +	/* DIV_BUS1 */
>> +	DIV(CLK_DIV_PCLK_BUS_133, "div_pclk_bus1_133", "aclk_bus1_400",
>> +			DIV_BUS, 0, 3),
>> +};
>> +
>> +static struct samsung_gate_clock bus1_gate_clks[] __initdata = {
>> +	/* ENABLE_ACLK_BUS1 */
>> +	GATE(CLK_ACLK_AHB2APB_BUSP, "aclk_ahb2apb_bus1p", "div_pclk_bus1_133",
>> +			ENABLE_ACLK_BUS, 4, CLK_IGNORE_UNUSED, 0),
>> +	GATE(CLK_ACLK_BUSNP_133, "aclk_bus1np_133", "div_pclk_bus1_133",
>> +			ENABLE_ACLK_BUS, 2, CLK_IGNORE_UNUSED, 0),
>> +	GATE(CLK_ACLK_BUSND_400, "aclk_bus1nd_400", "aclk_bus1_400",
>> +			ENABLE_ACLK_BUS, 0, CLK_IGNORE_UNUSED, 0),
>> +
>> +	/* ENABLE_PCLK_BUS1 */
>> +	GATE(CLK_PCLK_BUSSRVND_133, "pclk_bus1srvnd_133", "div_pclk_bus1_133",
>> +			ENABLE_PCLK_BUS, 2, 0, 0),
>> +	GATE(CLK_PCLK_PMU_BUS, "pclk_pmu_bus1", "div_pclk_bus1_133",
>> +			ENABLE_PCLK_BUS, 1, CLK_IGNORE_UNUSED, 0),
>> +	GATE(CLK_PCLK_SYSREG_BUS, "pclk_sysreg_bus1", "div_pclk_bus1_133",
>> +			ENABLE_PCLK_BUS, 0, CLK_IGNORE_UNUSED, 0),
>> +};
>> +
>> +/* CMU_BUS2 clocks */
>> +static struct samsung_mux_clock bus2_mux_clks[] __initdata = {
>> +	/* MUX_SEL_BUS2 */
>> +	MUX(CLK_MOUT_ACLK_BUS2_400_USER, "mout_aclk_bus2_400_user",
>> +			mout_aclk_bus2_400_p, MUX_SEL_BUS2, 0, 1),
>> +};
>> +
>> +static struct samsung_div_clock bus2_div_clks[] __initdata = {
>> +	/* DIV_BUS2 */
>> +	DIV(CLK_DIV_PCLK_BUS_133, "div_pclk_bus2_133",
>> +			"mout_aclk_bus2_400_user", DIV_BUS, 0, 3),
>> +};
>> +
>> +static struct samsung_gate_clock bus2_gate_clks[] __initdata = {
>> +	/* ENABLE_ACLK_BUS2 */
>> +	GATE(CLK_ACLK_AHB2APB_BUSP, "aclk_ahb2apb_bus2p", "div_pclk_bus2_133",
>> +			ENABLE_ACLK_BUS, 3, CLK_IGNORE_UNUSED, 0),
>> +	GATE(CLK_ACLK_BUSNP_133, "aclk_bus2np_133", "div_pclk_bus2_133",
>> +			ENABLE_ACLK_BUS, 2, CLK_IGNORE_UNUSED, 0),
>> +	GATE(CLK_ACLK_BUS2BEND_400, "aclk_bus2bend_400",
>> +			"mout_aclk_bus2_400_user", ENABLE_ACLK_BUS,
>> +			1, CLK_IGNORE_UNUSED, 0),
>> +	GATE(CLK_ACLK_BUS2RTND_400, "aclk_bus2rtnd_400",
>> +			"mout_aclk_bus2_400_user", ENABLE_ACLK_BUS,
>> +			0, CLK_IGNORE_UNUSED, 0),
>> +
>> +	/* ENABLE_PCLK_BUS2 */
>> +	GATE(CLK_PCLK_BUSSRVND_133, "pclk_bus2srvnd_133", "div_pclk_bus2_133",
>> +			ENABLE_PCLK_BUS, 2, 0, 0),
>> +	GATE(CLK_PCLK_PMU_BUS, "pclk_pmu_bus2", "div_pclk_bus2_133",
>> +			ENABLE_PCLK_BUS, 1, CLK_IGNORE_UNUSED, 0),
>> +	GATE(CLK_PCLK_SYSREG_BUS, "pclk_sysreg_bus2", "div_pclk_bus2_133",
>> +			ENABLE_PCLK_BUS, 0, CLK_IGNORE_UNUSED, 0),
>> +};
>> +
>> +#define CMU_BUS_INFO_CLKS(id)						\
>> +	.div_clks		= bus##id##_div_clks,			\
>> +	.nr_div_clks		= ARRAY_SIZE(bus##id##_div_clks),	\
>> +	.gate_clks		= bus##id##_gate_clks,			\
>> +	.nr_gate_clks		= ARRAY_SIZE(bus##id##_gate_clks),	\
>> +	.nr_clk_ids		= BUSx_NR_CLK
>> +
>> +static struct samsung_cmu_info bus0_cmu_info __initdata = {
>> +	CMU_BUS_INFO_CLKS(0),
>> +	.clk_regs		= bus01_clk_regs,
>> +	.nr_clk_regs		= ARRAY_SIZE(bus01_clk_regs),
>> +};
>> +
>> +static struct samsung_cmu_info bus1_cmu_info __initdata = {
>> +	CMU_BUS_INFO_CLKS(1),
>> +	.clk_regs		= bus01_clk_regs,
>> +	.nr_clk_regs		= ARRAY_SIZE(bus01_clk_regs),
>> +};
>> +
>> +static struct samsung_cmu_info bus2_cmu_info __initdata = {
>> +	CMU_BUS_INFO_CLKS(2),
>> +	.mux_clks		= bus2_mux_clks,
>> +	.nr_mux_clks		= ARRAY_SIZE(bus2_mux_clks),
>> +	.clk_regs		= bus2_clk_regs,
>> +	.nr_clk_regs		= ARRAY_SIZE(bus2_clk_regs),
>> +};
>> +
>> +#define exynos5433_cmu_bus_init(id)					\
>> +static void __init exynos5433_cmu_bus##id##_init(struct device_node *np)\
>> +{									\
>> +	samsung_cmu_register_one(np, &bus##id##_cmu_info);		\
>> +}									\
>> +CLK_OF_DECLARE(exynos5433_cmu_bus##id,					\
>> +		"samsung,exynos5433-cmu-bus"#id,			\
>> +		exynos5433_cmu_bus##id##_init)
>> +
>> +exynos5433_cmu_bus_init(0);
>> +exynos5433_cmu_bus_init(1);
>> +exynos5433_cmu_bus_init(2);
> 
> I picked up all the exynos5433 patches, however I don't quite like
> how we re defining 3 almost identical sets of data for CMU_BUS0/1/2.

Thanks for your pickup. In case of CMU_BUS0/1/2, I think there is a update
to remain.

> 
> We already have the parent clocks to CMU_BUSn specified in DT, then
> we could list the CMU_BUSn output clock names using clock-output-names
> property.  We could also differentiate CMU_BUS instances with an OF
> alias id, which could be used to create the CMU_BUS internal divider
> clock names (div_pclk_bus{0,1,2}_133).
> 
> This would require new data structures to store the register bit fields
> for each clock, clk names would be filled from DT.  It likely wouldn't
> be much less code this way, if not more.  And we would need to handle
> various clock types somehow, thus this would imply changes in the common
> samsung clk code.  I guess it's worth to try something like this in
> future (for any new SoCs) though, because repeating data as is done
> above doesn't look like a pattern we'd like to stay with.

I agree your opinion completely. If you need to help or co-work,
I can help in a variety of ways (e.g., test, implementation, debugging or other ).

Best Regards,
Chanwoo Choi
