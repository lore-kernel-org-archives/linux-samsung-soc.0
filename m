From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [RFC 2/2] clk: samsung: add exynos5250 composite clock for hdmi
Date: Mon, 20 May 2013 11:57:03 -0700 (PDT)
Message-ID: <5956307.B4Gm3xbmhh@flatron>
References: <1369059428-26820-1-git-send-email-rahul.sharma@samsung.com> <1369059428-26820-3-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f49.google.com ([74.125.83.49]:57144 "EHLO
	mail-ee0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755850Ab3ETS5H (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 20 May 2013 14:57:07 -0400
Received: by mail-ee0-f49.google.com with SMTP id d17so4117733eek.8
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 May 2013 11:57:04 -0700 (PDT)
In-Reply-To: <1369059428-26820-3-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <rahul.sharma@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, inki.dae@samsung.com, s.nawrocki@samsung.com, thomas.abraham@linaro.org, joshi@samsung.com, r.sh.open@gmail.com

Hi Rahul,

On Monday 20 of May 2013 19:47:08 Rahul Sharma wrote:
> HDMI driver needs to change the parent of sclk_hdmi clock to
> sclk_pixel or to sclk_hdmiphy, depends on the status of hdmiphy.
> sclk_hdmi which is gate clock doesn't support the set_parent
> operation.

Wouldn't it be better to simply allow calling clk_set_parent() on gate 
clocks and propagate parent change to nearest mux, just like it is done 
with clk_set_rate()?

It wouldn't require any SoC-specific composite clocks and keep the nice 
property of the clock tree, which is built from basic, generic clock 
blocks that nicely correspond to blocks shown in the documentation.

We had discussed this already at SRPOL and got to the conclusion that it's 
a step backwards, making the clock driver more complex, because each 
composite block would have to be described using a structure with many 
fields. In addition there are many special cases, for which the composite 
scheme wouldn't work anyway and they would end up with simple clocks 
attached after the composite block, defeating the purpose of your patch.

Best regards,
Tomasz

> This patch adds sclk_hdmi as a composite clock which is a
> combination of mux clock and gate clock. Being a composite
> clock, above clock supports both set_parent and enable/disable
> functionality. Therefore hdmi driver need not be modified
> different S0Cs. This will handled inside CCF.
> 
> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos5250.c |   20 +++++++++++++++++---
>  1 file changed, 17 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/samsung/clk-exynos5250.c
> b/drivers/clk/samsung/clk-exynos5250.c index 5c97e75..0c9e37a 100644
> --- a/drivers/clk/samsung/clk-exynos5250.c
> +++ b/drivers/clk/samsung/clk-exynos5250.c
> @@ -231,7 +231,6 @@ struct samsung_mux_clock exynos5250_mux_clks[]
> __initdata = { MUX(none, "mout_fimd1", mout_group1_p, SRC_DISP1_0, 0,
> 4),
>  	MUX(none, "mout_mipi1", mout_group1_p, SRC_DISP1_0, 12, 4),
>  	MUX(none, "mout_dp", mout_group1_p, SRC_DISP1_0, 16, 4),
> -	MUX(none, "mout_hdmi", mout_hdmi_p, SRC_DISP1_0, 20, 1),
>  	MUX(none, "mout_audio0", mout_audio0_p, SRC_MAU, 0, 4),
>  	MUX(none, "mout_mmc0", mout_group1_p, SRC_FSYS, 0, 4),
>  	MUX(none, "mout_mmc1", mout_group1_p, SRC_FSYS, 4, 4),
> @@ -416,8 +415,6 @@ struct samsung_gate_clock exynos5250_gate_clks[]
> __initdata = { SRC_MASK_DISP1_0, 12, CLK_SET_RATE_PARENT, 0),
>  	GATE(sclk_dp, "sclk_dp", "div_dp",
>  			SRC_MASK_DISP1_0, 16, CLK_SET_RATE_PARENT, 0),
> -	GATE(sclk_hdmi, "sclk_hdmi", "mout_hdmi",
> -			SRC_MASK_DISP1_0, 20, 0, 0),
>  	GATE(sclk_audio0, "sclk_audio0", "div_audio0",
>  			SRC_MASK_MAU, 0, CLK_SET_RATE_PARENT, 0),
>  	GATE(sclk_mmc0, "sclk_mmc0", "div_mmc_pre0",
> @@ -464,6 +461,21 @@ struct samsung_gate_clock exynos5250_gate_clks[]
> __initdata = { GATE(hdmi, "hdmi", "aclk200", GATE_IP_DISP1, 6, 0, 0),
>  };
> 
> +struct samsung_composite_clock exynos5250_composite_clks[] __initdata =
> { +	{
> +		.id = sclk_hdmi,
> +		.name = "sclk_hdmi",
> +		.parent_names = mout_hdmi_p,
> +		.num_parents = ARRAY_SIZE(mout_hdmi_p),
> +		.mux_clk = MUX(none, NULL, mout_hdmi_p, SRC_DISP1_0, 20,
> +				1),
> +		.gate_clk = GATE(none, NULL, NULL, SRC_MASK_DISP1_0, 20,
> +				0, 0),
> +		.composition_flags = SAMSUNG_CLK_TYPE_GATE |
> +			SAMSUNG_CLK_TYPE_MUX,
> +	},
> +};
> +
>  static __initdata struct of_device_id ext_clk_match[] = {
>  	{ .compatible = "samsung,clock-xxti", .data = (void *)0, },
>  	{ },
> @@ -515,6 +527,8 @@ void __init exynos5250_clk_init(struct device_node
> *np) ARRAY_SIZE(exynos5250_div_clks));
>  	samsung_clk_register_gate(exynos5250_gate_clks,
>  			ARRAY_SIZE(exynos5250_gate_clks));
> +	samsung_clk_register_composite(exynos5250_composite_clks,
> +			ARRAY_SIZE(exynos5250_composite_clks));
> 
>  	pr_info("Exynos5250: clock setup completed, armclk=%ld\n",
>  			_get_rate("armclk"));
