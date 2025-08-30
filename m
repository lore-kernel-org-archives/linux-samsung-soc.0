Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF80320B7ED;
	Sat, 30 Aug 2025 09:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756545403; cv=none; b=gLapjJeQEpjmArIWynzuZeCm2MtWagbePoFkg4+DXkor1Fp6X5qJhPLAKEhNAC4iBCRIWXX4g94Q05L0lI0avX66hwLlVQ8khoc6CXoPaTbltepBkcU2aacKorhNu5kIybazLFg81BZqCaj9p/N+fHE1H8qeB3kGi+/0WRMk71c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756545403; c=relaxed/simple;
	bh=Hi6ffWKrxrALgFq3VtBQbENk8AuueEtf9y+gH8NC3Xw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rExWhgfQkijVVyefShYGeBrGdr5gLL5rfJ5KzkdDILCQq1x2thgRm6mW0FOitJ3F9OKkq4gXjaumgOJXdUvVMY532MeR09tQZiOwC7mFRv/+G2ucwXWu3RrlKBTkhSbSUp8ttfYZvLFjst/QLEDYlhpidrUP7eTDWvbeXuF2zKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Il1ejRMO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Il1ejRMO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32E1FC4CEEB;
	Sat, 30 Aug 2025 09:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756545402;
	bh=Hi6ffWKrxrALgFq3VtBQbENk8AuueEtf9y+gH8NC3Xw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Il1ejRMOSMwAJPHZTR6+O7R66MmNB/OUP98v0puVCH7ezc5nmHP4Hkm+dhCfbruGG
	 iY4Bvw0MniR+ogC3quGWR3PHp6bIwR4N/fPmI+mvSTmzvWg0LOnnx9y/66xWrvZ9L5
	 OY/iTN4UZqIzrPJ8sjLJXn1bj08zUIJ/kqzBi1+dloZZiyyVzHToRx93UqNqUoJm33
	 CzVFWev/mBxmkVleSrCBeg/RySzOMSyoFARHBnaxOrQM1pqMQAjQG7nVDh8l9+Sppk
	 v4/BwCWRi13yJzSJcXIta8RfpYm0VwUhoOOlRDMWgsM5jDY4VOYM3oviekJzjdn297
	 33KYFPJo9x+gA==
Message-ID: <96bced8e-7e47-4db9-9674-be1f3138d608@kernel.org>
Date: Sat, 30 Aug 2025 11:16:37 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] clk: samsung: exynos990: Fix PLL mux regs, add
 DPU/CMUREF
To: Denzeel Oliva <wachiturroxd150@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250825-cmu-top-v4-0-71d783680529@gmail.com>
 <20250825-cmu-top-v4-4-71d783680529@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250825-cmu-top-v4-4-71d783680529@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/08/2025 07:51, Denzeel Oliva wrote:
> Switch PLL muxes to PLL_CON0 to correct parent selection and
> clock rates. Add DPU_BUS and CMUREF mux/div and their register
> hooks and parents.
> 
> Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
> ---
>  drivers/clk/samsung/clk-exynos990.c | 97 ++++++++++++++++++++++++-------------
>  1 file changed, 63 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/clk/samsung/clk-exynos990.c b/drivers/clk/samsung/clk-exynos990.c
> index 9fcdad7cc..d1135708c 100644
> --- a/drivers/clk/samsung/clk-exynos990.c
> +++ b/drivers/clk/samsung/clk-exynos990.c
> @@ -45,6 +45,7 @@
>  #define PLL_CON3_PLL_SHARED3				0x024c
>  #define PLL_CON0_PLL_SHARED4				0x0280
>  #define PLL_CON3_PLL_SHARED4				0x028c
> +#define CLK_CON_MUX_CLKCMU_DPU_BUS			0x1000
>  #define CLK_CON_MUX_MUX_CLKCMU_APM_BUS			0x1004
>  #define CLK_CON_MUX_MUX_CLKCMU_AUD_CPU			0x1008
>  #define CLK_CON_MUX_MUX_CLKCMU_BUS0_BUS			0x100c
> @@ -103,6 +104,8 @@
>  #define CLK_CON_MUX_MUX_CLKCMU_SSP_BUS			0x10e0
>  #define CLK_CON_MUX_MUX_CLKCMU_TNR_BUS			0x10e4
>  #define CLK_CON_MUX_MUX_CLKCMU_VRA_BUS			0x10e8
> +#define CLK_CON_MUX_MUX_CLK_CMU_CMUREF			0x10f0
> +#define CLK_CON_MUX_MUX_CMU_CMUREF			0x10f4
>  #define CLK_CON_DIV_CLKCMU_APM_BUS			0x1800
>  #define CLK_CON_DIV_CLKCMU_AUD_CPU			0x1804
>  #define CLK_CON_DIV_CLKCMU_BUS0_BUS			0x1808
> @@ -162,6 +165,7 @@
>  #define CLK_CON_DIV_CLKCMU_VRA_BUS			0x18e0
>  #define CLK_CON_DIV_DIV_CLKCMU_DPU			0x18e8
>  #define CLK_CON_DIV_DIV_CLKCMU_DPU_ALT			0x18ec
> +#define CLK_CON_DIV_DIV_CLK_CMU_CMUREF			0x18f0
>  #define CLK_CON_DIV_PLL_SHARED0_DIV2			0x18f4
>  #define CLK_CON_DIV_PLL_SHARED0_DIV3			0x18f8
>  #define CLK_CON_DIV_PLL_SHARED0_DIV4			0x18fc
> @@ -239,13 +243,21 @@ static const unsigned long top_clk_regs[] __initconst = {
>  	PLL_LOCKTIME_PLL_SHARED2,
>  	PLL_LOCKTIME_PLL_SHARED3,
>  	PLL_LOCKTIME_PLL_SHARED4,
> +	PLL_CON0_PLL_G3D,
>  	PLL_CON3_PLL_G3D,
> +	PLL_CON0_PLL_MMC,
>  	PLL_CON3_PLL_MMC,
> +	PLL_CON0_PLL_SHARED0,
>  	PLL_CON3_PLL_SHARED0,
> +	PLL_CON0_PLL_SHARED1,
>  	PLL_CON3_PLL_SHARED1,
> +	PLL_CON0_PLL_SHARED2,
>  	PLL_CON3_PLL_SHARED2,
> +	PLL_CON0_PLL_SHARED3,
>  	PLL_CON3_PLL_SHARED3,
> +	PLL_CON0_PLL_SHARED4,
>  	PLL_CON3_PLL_SHARED4,
> +	CLK_CON_MUX_CLKCMU_DPU_BUS,
>  	CLK_CON_MUX_MUX_CLKCMU_APM_BUS,
>  	CLK_CON_MUX_MUX_CLKCMU_AUD_CPU,
>  	CLK_CON_MUX_MUX_CLKCMU_BUS0_BUS,
> @@ -304,6 +316,8 @@ static const unsigned long top_clk_regs[] __initconst = {
>  	CLK_CON_MUX_MUX_CLKCMU_SSP_BUS,
>  	CLK_CON_MUX_MUX_CLKCMU_TNR_BUS,
>  	CLK_CON_MUX_MUX_CLKCMU_VRA_BUS,
> +	CLK_CON_MUX_MUX_CLK_CMU_CMUREF,
> +	CLK_CON_MUX_MUX_CMU_CMUREF,
>  	CLK_CON_DIV_CLKCMU_APM_BUS,
>  	CLK_CON_DIV_CLKCMU_AUD_CPU,
>  	CLK_CON_DIV_CLKCMU_BUS0_BUS,
> @@ -363,6 +377,7 @@ static const unsigned long top_clk_regs[] __initconst = {
>  	CLK_CON_DIV_CLKCMU_VRA_BUS,
>  	CLK_CON_DIV_DIV_CLKCMU_DPU,
>  	CLK_CON_DIV_DIV_CLKCMU_DPU_ALT,
> +	CLK_CON_DIV_DIV_CLK_CMU_CMUREF,
>  	CLK_CON_DIV_PLL_SHARED0_DIV2,
>  	CLK_CON_DIV_PLL_SHARED0_DIV3,
>  	CLK_CON_DIV_PLL_SHARED0_DIV4,
> @@ -458,6 +473,8 @@ PNAME(mout_pll_shared3_p)		= { "oscclk", "fout_shared3_pll" };
>  PNAME(mout_pll_shared4_p)		= { "oscclk", "fout_shared4_pll" };
>  PNAME(mout_pll_mmc_p)			= { "oscclk", "fout_mmc_pll" };
>  PNAME(mout_pll_g3d_p)			= { "oscclk", "fout_g3d_pll" };
> +PNAME(mout_cmu_dpu_bus_p)		= { "dout_cmu_dpu",
> +					    "dout_cmu_dpu_alt" };
>  PNAME(mout_cmu_apm_bus_p)		= { "dout_cmu_shared0_div2",
>  					    "dout_cmu_shared2_div2" };
>  PNAME(mout_cmu_aud_cpu_p)		= { "dout_cmu_shared0_div2",
> @@ -507,7 +524,7 @@ PNAME(mout_cmu_cpucl0_switch_p)		= { "fout_shared4_pll",
>  					    "dout_cmu_shared0_div2",
>  					    "fout_shared2_pll",
>  					    "dout_cmu_shared0_div4" };
> -PNAME(mout_cmu_cpucl1_switch_p)	= { "fout_shared4_pll",
> +PNAME(mout_cmu_cpucl1_switch_p)		= { "fout_shared4_pll",


I don't understand this change.

>  					    "dout_cmu_shared0_div2",
>  					    "fout_shared2_pll",
>  					    "dout_cmu_shared0_div4" };
> @@ -577,7 +594,7 @@ PNAME(mout_cmu_hsi1_bus_p)		= { "dout_cmu_shared0_div3",
>  					    "dout_cmu_shared4_div3",
>  					    "dout_cmu_shared2_div2",
>  					    "fout_mmc_pll", "oscclk", "oscclk" };
> -PNAME(mout_cmu_hsi1_mmc_card_p)	= { "oscclk", "fout_shared2_pll",
> +PNAME(mout_cmu_hsi1_mmc_card_p)		= { "oscclk", "fout_shared2_pll",

Neither this, looks like you changed nothing here.

>  					    "fout_mmc_pll",
>  					    "dout_cmu_shared0_div4" };
>  PNAME(mout_cmu_hsi1_pcie_p)		= { "oscclk", "fout_shared2_pll" };
> @@ -672,6 +689,12 @@ PNAME(mout_cmu_vra_bus_p)		= { "dout_cmu_shared0_div3",
>  					    "dout_cmu_shared4_div2",
>  					    "dout_cmu_shared0_div4",
>  					    "dout_cmu_shared4_div3" };
> +PNAME(mout_cmu_cmuref_p)		= { "oscclk",
> +					    "dout_cmu_clk_cmuref" };
> +PNAME(mout_cmu_clk_cmuref_p)		= { "dout_cmu_shared0_div4",
> +					    "dout_cmu_shared1_div4",
> +					    "dout_cmu_shared2_div2",
> +					    "oscclk" };
>  
>  /*
>   * Register name to clock name mangling strategy used in this file
> @@ -689,19 +712,21 @@ PNAME(mout_cmu_vra_bus_p)		= { "dout_cmu_shared0_div3",
>  
>  static const struct samsung_mux_clock top_mux_clks[] __initconst = {
>  	MUX(CLK_MOUT_PLL_SHARED0, "mout_pll_shared0", mout_pll_shared0_p,
> -	    PLL_CON3_PLL_SHARED0, 4, 1),
> +	    PLL_CON0_PLL_SHARED0, 4, 1),
>  	MUX(CLK_MOUT_PLL_SHARED1, "mout_pll_shared1", mout_pll_shared1_p,
> -	    PLL_CON3_PLL_SHARED1, 4, 1),
> +	    PLL_CON0_PLL_SHARED1, 4, 1),
>  	MUX(CLK_MOUT_PLL_SHARED2, "mout_pll_shared2", mout_pll_shared2_p,
> -	    PLL_CON3_PLL_SHARED2, 4, 1),
> +	    PLL_CON0_PLL_SHARED2, 4, 1),
>  	MUX(CLK_MOUT_PLL_SHARED3, "mout_pll_shared3", mout_pll_shared3_p,
> -	    PLL_CON3_PLL_SHARED3, 4, 1),
> +	    PLL_CON0_PLL_SHARED3, 4, 1),

This looks like fix, so shuold be sent separately with Fixes tag.

>  	MUX(CLK_MOUT_PLL_SHARED4, "mout_pll_shared4", mout_pll_shared4_p,
>  	    PLL_CON0_PLL_SHARED4, 4, 1),
>  	MUX(CLK_MOUT_PLL_MMC, "mout_pll_mmc", mout_pll_mmc_p,
>  	    PLL_CON0_PLL_MMC, 4, 1),
>  	MUX(CLK_MOUT_PLL_G3D, "mout_pll_g3d", mout_pll_g3d_p,
>  	    PLL_CON0_PLL_G3D, 4, 1),
> +	MUX(CLK_MOUT_CMU_DPU_BUS, "mout_cmu_dpu_bus",
> +	    mout_cmu_dpu_bus_p, CLK_CON_MUX_CLKCMU_DPU_BUS, 0, 1),
>  	MUX(CLK_MOUT_CMU_APM_BUS, "mout_cmu_apm_bus",
>  	    mout_cmu_apm_bus_p, CLK_CON_MUX_MUX_CLKCMU_APM_BUS, 0, 1),
>  	MUX(CLK_MOUT_CMU_AUD_CPU, "mout_cmu_aud_cpu",
> @@ -830,37 +855,13 @@ static const struct samsung_mux_clock top_mux_clks[] __initconst = {
>  	    mout_cmu_tnr_bus_p, CLK_CON_MUX_MUX_CLKCMU_TNR_BUS, 0, 3),
>  	MUX(CLK_MOUT_CMU_VRA_BUS, "mout_cmu_vra_bus",
>  	    mout_cmu_vra_bus_p, CLK_CON_MUX_MUX_CLKCMU_VRA_BUS, 0, 2),
> +	MUX(CLK_MOUT_CMU_CMUREF, "mout_cmu_cmuref",
> +	    mout_cmu_cmuref_p, CLK_CON_MUX_MUX_CMU_CMUREF, 0, 1),
> +	MUX(CLK_MOUT_CMU_CLK_CMUREF, "mout_cmu_clk_cmuref",
> +	    mout_cmu_clk_cmuref_p, CLK_CON_MUX_MUX_CLK_CMU_CMUREF, 0, 2),
>  };
>  
>  static const struct samsung_div_clock top_div_clks[] __initconst = {
> -	/* SHARED0 region*/
> -	DIV(CLK_DOUT_CMU_SHARED0_DIV2, "dout_cmu_shared0_div2", "mout_pll_shared0",
> -	    CLK_CON_DIV_PLL_SHARED0_DIV2, 0, 1),
> -	DIV(CLK_DOUT_CMU_SHARED0_DIV3, "dout_cmu_shared0_div3", "mout_pll_shared0",
> -	    CLK_CON_DIV_PLL_SHARED0_DIV3, 0, 2),
> -	DIV(CLK_DOUT_CMU_SHARED0_DIV4, "dout_cmu_shared0_div4", "dout_cmu_shared0_div2",
> -	    CLK_CON_DIV_PLL_SHARED0_DIV4, 0, 1),

And this is not really explained in the commit msg.

> -
> -	/* SHARED1 region*/
> -	DIV(CLK_DOUT_CMU_SHARED1_DIV2, "dout_cmu_shared1_div2", "mout_pll_shared1",
> -	    CLK_CON_DIV_PLL_SHARED1_DIV2, 0, 1),
> -	DIV(CLK_DOUT_CMU_SHARED1_DIV3, "dout_cmu_shared1_div3", "mout_pll_shared1",
> -	    CLK_CON_DIV_PLL_SHARED1_DIV3, 0, 2),
> -	DIV(CLK_DOUT_CMU_SHARED1_DIV4, "dout_cmu_shared1_div4", "dout_cmu_shared1_div2",
> -	    CLK_CON_DIV_PLL_SHARED1_DIV4, 0, 1),
> -
> -	/* SHARED2 region */
> -	DIV(CLK_DOUT_CMU_SHARED2_DIV2, "dout_cmu_shared2_div2", "mout_pll_shared2",
> -	    CLK_CON_DIV_PLL_SHARED2_DIV2, 0, 1),
> -
> -	/* SHARED4 region*/
> -	DIV(CLK_DOUT_CMU_SHARED4_DIV2, "dout_cmu_shared4_div2", "mout_pll_shared4",
> -	    CLK_CON_DIV_PLL_SHARED4_DIV2, 0, 1),
> -	DIV(CLK_DOUT_CMU_SHARED4_DIV3, "dout_cmu_shared4_div3", "mout_pll_shared4",
> -	    CLK_CON_DIV_PLL_SHARED4_DIV3, 0, 2),
> -	DIV(CLK_DOUT_CMU_SHARED4_DIV4, "dout_cmu_shared4_div4", "mout_pll_shared4",
> -	    CLK_CON_DIV_PLL_SHARED4_DIV4, 0, 1),
> -
>  	DIV(CLK_DOUT_CMU_APM_BUS, "dout_cmu_apm_bus", "gout_cmu_apm_bus",
>  	    CLK_CON_DIV_CLKCMU_APM_BUS, 0, 2),
>  	DIV(CLK_DOUT_CMU_AUD_CPU, "dout_cmu_aud_cpu", "gout_cmu_aud_cpu",
> @@ -974,6 +975,34 @@ static const struct samsung_div_clock top_div_clks[] __initconst = {
>  	    CLK_CON_DIV_CLKCMU_VRA_BUS, 0, 4),
>  	DIV(CLK_DOUT_CMU_DPU, "dout_cmu_dpu", "gout_cmu_dpu",
>  	    CLK_CON_DIV_DIV_CLKCMU_DPU, 0, 3),
> +	DIV(CLK_DOUT_CMU_DPU_ALT, "dout_cmu_dpu_alt", "gout_cmu_dpu_bus",
> +	    CLK_CON_DIV_DIV_CLKCMU_DPU_ALT, 0, 4),
> +	DIV(CLK_DOUT_CMU_CLK_CMUREF, "dout_cmu_clk_cmuref", "mout_cmu_clk_cmuref",
> +	    CLK_CON_DIV_DIV_CLK_CMU_CMUREF, 0, 2),


Best regards,
Krzysztof
