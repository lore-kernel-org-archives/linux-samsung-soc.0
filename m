Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A89C8350A00;
	Tue, 21 Oct 2025 19:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761076082; cv=none; b=XDOf9fgKYqZgpyU1O1Q/OkmyiXVg7NHKDYS7+6S9q3SFkkEVCL4WnLXAduQrFm7lzdNVCYVgPOXdp3t8V1BUVGB6llKkX6m+kDcDqXwvxyvqpeVg9Psapz3j7UR/YDDWkOJQkDxG1Xadp2G9tmKWLVuRmEpZhB/APG3tP3Svpqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761076082; c=relaxed/simple;
	bh=pB7GSP7G4YxBhBhWUOMCD9Tej+czMSzqWpxdvGBf5Kw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jteTUeyzjtSY+t+6GElH0olq7+RqtOr5kbBw6uHeue0mZruojyqKTvW64m3nIGrhcw75DifkPrwGuXPbIJaXWFhydEsMZS44YlnQm2keM2KOUdX+G/o70jdF18Oew2F1DHmUvfkrXcGoWflyQ+y29pwX+MtppyJJ1clALt5p/Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gS8Bo8Eu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gS8Bo8Eu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E2ADC4CEF1;
	Tue, 21 Oct 2025 19:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761076082;
	bh=pB7GSP7G4YxBhBhWUOMCD9Tej+czMSzqWpxdvGBf5Kw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gS8Bo8EuS96pdQldVEpjTTTRKTI+mk3DvpKxim3Ev2CF+gZ46wo+gGbQVKFyQBpox
	 yLd5N3iWSS04CwnVCRVa+deEm+LgvK6pb2n3qLj+exyn1QXnmkr4hQJ8VCYDCIQLFO
	 m5qqgxq1/rgiB871umt/+GGztmbMsjcOSGJINw62VJRIEOAJJkkFLA+CXm0M9W1yzn
	 97UFo71YxCBO/k54rg1v3OCFJz7VJ1DCPiQKvz54ugJj+db5vx3xMUfsk07di0gUwn
	 6f+J5W+zMTf1oSaKfyiGdQWdZBWzsjvc1aKuD9euYmymfwOsWLyjVLkgctm+/rI92v
	 MtdDVPMdXpb+g==
Message-ID: <4383c2fb-5267-4b7b-90e9-6046c2686912@kernel.org>
Date: Tue, 21 Oct 2025 21:47:56 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] clk: samsung: gs101: Enable auto_clock_gate mode for
 each gs101 CMU
To: Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, kernel-team@android.com
References: <20251013-automatic-clocks-v1-0-72851ee00300@linaro.org>
 <20251013-automatic-clocks-v1-8-72851ee00300@linaro.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20251013-automatic-clocks-v1-8-72851ee00300@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/10/2025 22:51, Peter Griffin wrote:
> Enable auto clock mode, and define the additional fields which are used
> when this mode is enabled.
> 
> /sys/kernel/debug/clk/clk_summary now reports approximately 308 running
> clocks and 298 disabled clocks. Prior to this commit 586 clocks were
> running and 17 disabled. To ensure compatability with older DTs the

Typo

> resource size is checked and an error issued if the DT needs updating.

I fail to see how you keek it compatible. See further.

> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  drivers/clk/samsung/clk-gs101.c | 80 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 80 insertions(+)
> 
> diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-gs101.c
> index 70b26db9b95ad0b376d23f637c7683fbc8c8c600..baf41ae6c9e2480cb83531acf7eae190c6aff819 100644
> --- a/drivers/clk/samsung/clk-gs101.c
> +++ b/drivers/clk/samsung/clk-gs101.c
> @@ -9,6 +9,7 @@
>  #include <linux/clk-provider.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/of.h>
> +#include <linux/of_address.h>
>  #include <linux/platform_device.h>
>  
>  #include <dt-bindings/clock/google,gs101.h>
> @@ -17,6 +18,8 @@
>  #include "clk-exynos-arm64.h"
>  #include "clk-pll.h"
>  
> +int check_cmu_res_size(struct device_node *np);
> +
>  /* NOTE: Must be equal to the last clock ID increased by one */
>  #define CLKS_NR_TOP	(CLK_GOUT_CMU_TPU_UART + 1)
>  #define CLKS_NR_APM	(CLK_APM_PLL_DIV16_APM + 1)
> @@ -26,6 +29,10 @@
>  #define CLKS_NR_PERIC0	(CLK_GOUT_PERIC0_SYSREG_PERIC0_PCLK + 1)
>  #define CLKS_NR_PERIC1	(CLK_GOUT_PERIC1_SYSREG_PERIC1_PCLK + 1)
>  
> +#define GS101_GATE_DBG_OFFSET 0x4000
> +#define GS101_DRCG_EN_OFFSET  0x104
> +#define GS101_MEMCLK_OFFSET   0x108
> +
>  /* ---- CMU_TOP ------------------------------------------------------------- */
>  
>  /* Register Offset definitions for CMU_TOP (0x1e080000) */
> @@ -1433,6 +1440,9 @@ static const struct samsung_cmu_info top_cmu_info __initconst = {
>  	.nr_clk_ids		= CLKS_NR_TOP,
>  	.clk_regs		= cmu_top_clk_regs,
>  	.nr_clk_regs		= ARRAY_SIZE(cmu_top_clk_regs),
> +	.auto_clock_gate	= true,
> +	.gate_dbg_offset	= GS101_GATE_DBG_OFFSET,
> +	.option_offset		= CMU_CMU_TOP_CONTROLLER_OPTION,
>  };
>  
>  static void __init gs101_cmu_top_init(struct device_node *np)
> @@ -1900,6 +1910,11 @@ static const struct samsung_gate_clock apm_gate_clks[] __initconst = {
>  	     CLK_CON_GAT_GOUT_BLK_APM_UID_XIU_DP_APM_IPCLKPORT_ACLK, 21, CLK_IS_CRITICAL, 0),
>  };
>  
> +static const unsigned long dcrg_memclk_sysreg[] __initconst = {
> +	GS101_DRCG_EN_OFFSET,
> +	GS101_MEMCLK_OFFSET,
> +};
> +
>  static const struct samsung_cmu_info apm_cmu_info __initconst = {
>  	.mux_clks		= apm_mux_clks,
>  	.nr_mux_clks		= ARRAY_SIZE(apm_mux_clks),
> @@ -1912,6 +1927,12 @@ static const struct samsung_cmu_info apm_cmu_info __initconst = {
>  	.nr_clk_ids		= CLKS_NR_APM,
>  	.clk_regs		= apm_clk_regs,
>  	.nr_clk_regs		= ARRAY_SIZE(apm_clk_regs),
> +	.sysreg_clk_regs	= dcrg_memclk_sysreg,
> +	.nr_sysreg_clk_regs	= ARRAY_SIZE(dcrg_memclk_sysreg),
> +	.auto_clock_gate	= true,
> +	.gate_dbg_offset	= GS101_GATE_DBG_OFFSET,
> +	.drcg_offset		= GS101_DRCG_EN_OFFSET,
> +	.memclk_offset		= GS101_MEMCLK_OFFSET,
>  };
>  
>  /* ---- CMU_HSI0 ------------------------------------------------------------ */
> @@ -2375,7 +2396,14 @@ static const struct samsung_cmu_info hsi0_cmu_info __initconst = {
>  	.nr_clk_ids		= CLKS_NR_HSI0,
>  	.clk_regs		= hsi0_clk_regs,
>  	.nr_clk_regs		= ARRAY_SIZE(hsi0_clk_regs),
> +	.sysreg_clk_regs	= dcrg_memclk_sysreg,
> +	.nr_sysreg_clk_regs	= ARRAY_SIZE(dcrg_memclk_sysreg),
>  	.clk_name		= "bus",
> +	.auto_clock_gate        = true,
> +	.gate_dbg_offset        = GS101_GATE_DBG_OFFSET,
> +	.option_offset		= HSI0_CMU_HSI0_CONTROLLER_OPTION,
> +	.drcg_offset		= GS101_DRCG_EN_OFFSET,
> +	.memclk_offset		= GS101_MEMCLK_OFFSET,
>  };
>  
>  /* ---- CMU_HSI2 ------------------------------------------------------------ */
> @@ -2863,7 +2891,14 @@ static const struct samsung_cmu_info hsi2_cmu_info __initconst = {
>  	.nr_clk_ids		= CLKS_NR_HSI2,
>  	.clk_regs		= cmu_hsi2_clk_regs,
>  	.nr_clk_regs		= ARRAY_SIZE(cmu_hsi2_clk_regs),
> +	.sysreg_clk_regs	= dcrg_memclk_sysreg,
> +	.nr_sysreg_clk_regs	= ARRAY_SIZE(dcrg_memclk_sysreg),
>  	.clk_name		= "bus",
> +	.auto_clock_gate        = true,
> +	.gate_dbg_offset        = GS101_GATE_DBG_OFFSET,
> +	.option_offset		= HSI2_CMU_HSI2_CONTROLLER_OPTION,
> +	.drcg_offset		= GS101_DRCG_EN_OFFSET,
> +	.memclk_offset		= GS101_MEMCLK_OFFSET,
>  };
>  
>  /* ---- CMU_MISC ------------------------------------------------------------ */
> @@ -3423,11 +3458,37 @@ static const struct samsung_cmu_info misc_cmu_info __initconst = {
>  	.nr_clk_ids		= CLKS_NR_MISC,
>  	.clk_regs		= misc_clk_regs,
>  	.nr_clk_regs		= ARRAY_SIZE(misc_clk_regs),
> +	.sysreg_clk_regs	= dcrg_memclk_sysreg,
> +	.nr_sysreg_clk_regs	= ARRAY_SIZE(dcrg_memclk_sysreg),
>  	.clk_name		= "bus",
> +	.auto_clock_gate	= true,
> +	.gate_dbg_offset	= GS101_GATE_DBG_OFFSET,
> +	.option_offset		= MISC_CMU_MISC_CONTROLLER_OPTION,
> +	.drcg_offset		= GS101_DRCG_EN_OFFSET,
> +	.memclk_offset		= GS101_MEMCLK_OFFSET,
>  };
>  
> +/* for old DT compatbility with incorrect CMU size*/
> +int check_cmu_res_size(struct device_node *np)
> +{
> +	struct resource res;
> +	resource_size_t size;
> +
> +	if (of_address_to_resource(np, 0, &res))
> +		return -ENODEV;
> +
> +	size = resource_size(&res);
> +	if (size != 0x10000) {
> +		pr_warn("%pOF: resource to small. Please update your DT\n", np);
> +		return -ENODEV;
> +	}
> +	return 0;
> +}
> +
>  static void __init gs101_cmu_misc_init(struct device_node *np)
>  {
> +	if (check_cmu_res_size(np))
> +		return;

You will not register CMU on old DTB.

>  	exynos_arm64_register_cmu(NULL, np, &misc_cmu_info);
>  }
>  
> @@ -4010,6 +4071,10 @@ static const struct samsung_gate_clock peric0_gate_clks[] __initconst = {
>  	     21, 0, 0),
>  };
>  
> +static const unsigned long dcrg_sysreg[] __initconst = {
> +	GS101_DRCG_EN_OFFSET,
> +};
> +
>  static const struct samsung_cmu_info peric0_cmu_info __initconst = {
>  	.mux_clks		= peric0_mux_clks,
>  	.nr_mux_clks		= ARRAY_SIZE(peric0_mux_clks),
> @@ -4020,7 +4085,13 @@ static const struct samsung_cmu_info peric0_cmu_info __initconst = {
>  	.nr_clk_ids		= CLKS_NR_PERIC0,
>  	.clk_regs		= peric0_clk_regs,
>  	.nr_clk_regs		= ARRAY_SIZE(peric0_clk_regs),
> +	.sysreg_clk_regs	= dcrg_sysreg,
> +	.nr_sysreg_clk_regs	= ARRAY_SIZE(dcrg_sysreg),
>  	.clk_name		= "bus",
> +	.auto_clock_gate        = true,
> +	.gate_dbg_offset        = GS101_GATE_DBG_OFFSET,
> +	.option_offset		= PERIC0_CMU_PERIC0_CONTROLLER_OPTION,
> +	.drcg_offset		= GS101_DRCG_EN_OFFSET,
>  };
>  
>  /* ---- CMU_PERIC1 ---------------------------------------------------------- */
> @@ -4368,7 +4439,13 @@ static const struct samsung_cmu_info peric1_cmu_info __initconst = {
>  	.nr_clk_ids		= CLKS_NR_PERIC1,
>  	.clk_regs		= peric1_clk_regs,
>  	.nr_clk_regs		= ARRAY_SIZE(peric1_clk_regs),
> +	.sysreg_clk_regs	= dcrg_sysreg,
> +	.nr_sysreg_clk_regs	= ARRAY_SIZE(dcrg_sysreg),
>  	.clk_name		= "bus",
> +	.auto_clock_gate        = true,
> +	.gate_dbg_offset        = GS101_GATE_DBG_OFFSET,
> +	.option_offset		= PERIC1_CMU_PERIC1_CONTROLLER_OPTION,
> +	.drcg_offset		= GS101_DRCG_EN_OFFSET,
>  };
>  
>  /* ---- platform_driver ----------------------------------------------------- */
> @@ -4378,6 +4455,9 @@ static int __init gs101_cmu_probe(struct platform_device *pdev)
>  	const struct samsung_cmu_info *info;
>  	struct device *dev = &pdev->dev;
>  
> +	if (check_cmu_res_size(dev->of_node))
> +		return -ENODEV;

And here you will really bail out with error.

> +
>  	info = of_device_get_match_data(dev);
>  	exynos_arm64_register_cmu(dev, dev->of_node, info);
>  
> 


Best regards,
Krzysztof
