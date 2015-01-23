From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v3 01/12] clk: samsung: exynos5433: Add clocks using common
 clock framework
Date: Fri, 23 Jan 2015 18:40:48 +0100
Message-ID: <54C287A0.50407@samsung.com>
References: <1421821618-8627-1-git-send-email-cw00.choi@samsung.com>
 <1421821618-8627-2-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1421821618-8627-2-git-send-email-cw00.choi@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: tomasz.figa@gmail.com, mturquette@linaro.org, kgene@kernel.org, pankaj.dubey@samsung.com, inki.dae@samsung.com, chanho61.park@samsung.com, sw0312.kim@samsung.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 21/01/15 07:26, Chanwoo Choi wrote:
> +/* list of all parent clock list */

> +PNAME(mout_bus_pll_user_p)	= { "fin_pll", "sclk_bus_pll", };
...
> +
> +static struct samsung_mux_clock top_mux_clks[] __initdata = {

> +	MUX(CLK_MOUT_BUS_PLL_USER, "mout_bus_pll_user", mout_bus_pll_user_p,
> +			MUX_SEL_TOP1, 0, 1),
...
> +};
> +
> +static struct samsung_div_clock top_div_clks[] __initdata = {
...
> +	/* DIV_TOP3 */
> +	DIV(CLK_DIV_ACLK_IMEM_SSSX_266, "div_aclk_imem_sssx_266",
> +			"mout_bus_pll_user", DIV_TOP3, 24, 3),

Shouldn't "fin_pll" be renamed to "oscclk" ? In the documentation
the root clock (from XXTI input pin) seems to be referred as OSCCLK.
And I can't see "fin_pll" clock registered anywhere. Shouldn't there
be a "fixed-rate-clock" as a parent of at least CMU_TOP? e.g.

xxti: xxti {
	compatible = "fixed-clock";
	#clock-cells = <0>;
	clock-output-names = "oscclk";
	clock-frequency = <24000000>;
};

&cmu_top {
	clocks = <&xxti>;
};

--
Regards,
Sylwester
