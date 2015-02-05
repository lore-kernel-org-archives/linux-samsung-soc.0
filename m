From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [v3,1/9] clk: samsung: exynos5433: Add clocks for CMU_APOLLO domain
Date: Thu, 05 Feb 2015 10:56:54 +0100
Message-ID: <54D33E66.30909@samsung.com>
References: <1422922437-7414-2-git-send-email-cw00.choi@samsung.com>
 <54D31F67.1050701@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <54D31F67.1050701@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, mturquette@linaro.org
Cc: tomasz.figa@gmail.com, kgene@kernel.org, inki.dae@samsung.com, chanho61.park@samsung.com, sw0312.kim@samsung.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 05/02/15 08:44, Pankaj Dubey wrote:
>> +static struct samsung_gate_clock apollo_gate_clks[] __initdata = {

>> > +
>> > +	/* ENABLE_PCLK_APOLLO */
>> > +	GATE(CLK_PCLK_ASAPBMST_CSSYS_APOLLO, "pclk_asapbmst_cssys_apollo",
>> > +			"div_pclk_dbg_apollo", ENABLE_PCLK_APOLLO,
>> > +			2, CLK_IGNORE_UNUSED, 0),
>> > +	GATE(CLK_PCLK_PMU_APOLLO, "pclk_pmu_apollo", "div_pclk_apollo",
>> > +			ENABLE_PCLK_APOLLO, 1, CLK_IGNORE_UNUSED, 0),
>> > +	GATE(CLK_PCLK_SYSREG_APOLLO, "pclk_pmu_sysreg_apollo",
>
> Isn't "pclk_pmu_sysreg_apollo" be named as "pclk_sysreg_apollo" to match 
> with UM?

Sounds reasonable, Chanwoo, if you agree I'll squash following change
to this patch before sending upstream:

diff --git a/drivers/clk/samsung/clk-exynos5433.c
b/drivers/clk/samsung/clk-exynos5433.c
index 7a024cd..387e3e3 100644
--- a/drivers/clk/samsung/clk-exynos5433.c
+++ b/drivers/clk/samsung/clk-exynos5433.c
@@ -3656,7 +3656,7 @@ static struct samsung_gate_clock apollo_gate_clks[]
__initdata = {
                        2, CLK_IGNORE_UNUSED, 0),
        GATE(CLK_PCLK_PMU_APOLLO, "pclk_pmu_apollo", "div_pclk_apollo",
                        ENABLE_PCLK_APOLLO, 1, CLK_IGNORE_UNUSED, 0),
-       GATE(CLK_PCLK_SYSREG_APOLLO, "pclk_pmu_sysreg_apollo",
+       GATE(CLK_PCLK_SYSREG_APOLLO, "pclk_sysreg_apollo",
                        "div_pclk_apollo", ENABLE_PCLK_APOLLO,
                        0, CLK_IGNORE_UNUSED, 0),
--
Thanks,
Sylwester
