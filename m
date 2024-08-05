Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25DB142651;
	Mon,  5 Aug 2024 05:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722837059; cv=none; b=G5SOcwBYbXvqIonHcJVg8gFkGYucKc+sCtzd71C6Ml+EPBHeCrnmZbR0oPLRRiHr0pjeh/n1YywrJTp3J0mxxIW4le32tkWySp4QrhrQccRS5rp5iLIFehDR/zTHS3h1xrGU7GnSZUcSsyfHwa58UEgOEBt9SOSL1uZB1umH9YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722837059; c=relaxed/simple;
	bh=N1lgQnMncTp40fJVG/90nNqLvKcRVttYyUarBO6jUMo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FqbpKldasEJ+f1v7WQTzuRpIuKE6C/A3xDj5YTgnbqQ1DNzdBECTs/Fk3IY70QMPaNROIwejRvx1Fk0ibxhv5ms8omDZnRYluvQxyKky2piH8qsFJDdn3gwq8X0iZLmuc/dg031cvTMDjDyyZRAOwuQP9/YlT8zV9XTG4vY+EPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fnR4j8Js; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fnR4j8Js"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D37A8C32782;
	Mon,  5 Aug 2024 05:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722837058;
	bh=N1lgQnMncTp40fJVG/90nNqLvKcRVttYyUarBO6jUMo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fnR4j8JsvJ2oPmwghXaTZ+7DV9ST4y0csQhm2ozMLcFPIKgFvy58n2O/ofF7gJkI7
	 wxGvgNf2R9CMGWiXkDIPmXD3NMC7gy5dQ//yPBFxmn55IEYPsAo12dTluyLZXgFPT/
	 hSzgq4NdxYtKu6vZ+UtqHrIkgjUHgTRZRdQAe3SUNfPANRwYaVKhDZhZKzu6EBq2ZF
	 XODL09nGWoQU1dFM3kzpoTuH8WnD+iaDqviQ4MAnnweTFNFtf6m4YUC96dEWkk7v0p
	 SfT6LqA1yPDjRlgFQ+c7L3Cfos7z1RG/aaLjYWUCHDKCTOAFW51lFLLj6EyYPc46Ak
	 uTHWEVN7ScEQQ==
Message-ID: <3dcba527-05ff-4942-93c1-9f3d35619a56@kernel.org>
Date: Mon, 5 Aug 2024 07:50:48 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/13] clk: samsung: exynos7885: Add USB related clocks to
 CMU_FSYS
To: David Virag <virag.david003@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Sam Protsenko <semen.protsenko@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20240804215458.404085-1-virag.david003@gmail.com>
 <20240804215458.404085-10-virag.david003@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240804215458.404085-10-virag.david003@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/08/2024 23:53, David Virag wrote:
> Exynos7885 SoC has a DWC3 USB Controller with Exynos USB PHY which in
> theory supports USB3 SuperSpeed, but is only used as USB2 in all known
> devices.
> 
> These clocks are needed for everything related to USB.
> 
> While at it, also remove the CLK_SET_RATE_PARENT capability of
> CLK_MOUT_FSYS_USB30DRD_USER, since it's not actually needed.
> 
> Signed-off-by: David Virag <virag.david003@gmail.com>
> ---
>  drivers/clk/samsung/clk-exynos7885.c | 73 ++++++++++++++++++++++------
>  1 file changed, 59 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/clk/samsung/clk-exynos7885.c b/drivers/clk/samsung/clk-exynos7885.c
> index a0c9b7cc6942..637257a6f10e 100644
> --- a/drivers/clk/samsung/clk-exynos7885.c
> +++ b/drivers/clk/samsung/clk-exynos7885.c
> @@ -20,7 +20,7 @@
>  #define CLKS_NR_TOP			(CLK_MOUT_SHARED1_PLL + 1)
>  #define CLKS_NR_CORE			(CLK_GOUT_TREX_P_CORE_PCLK_P_CORE + 1)
>  #define CLKS_NR_PERI			(CLK_GOUT_WDT1_PCLK + 1)
> -#define CLKS_NR_FSYS			(CLK_MOUT_FSYS_USB30DRD_USER + 1)
> +#define CLKS_NR_FSYS			(CLK_FSYS_USB30DRD_REF_CLK + 1)
>  
>  /* ---- CMU_TOP ------------------------------------------------------------- */
>  
> @@ -686,38 +686,66 @@ static const struct samsung_cmu_info core_cmu_info __initconst = {
>  /* ---- CMU_FSYS ------------------------------------------------------------ */
>  
>  /* Register Offset definitions for CMU_FSYS (0x13400000) */
> -#define PLL_CON0_MUX_CLKCMU_FSYS_BUS_USER	0x0100
> -#define PLL_CON0_MUX_CLKCMU_FSYS_MMC_CARD_USER	0x0120
> -#define PLL_CON0_MUX_CLKCMU_FSYS_MMC_EMBD_USER	0x0140
> -#define PLL_CON0_MUX_CLKCMU_FSYS_MMC_SDIO_USER	0x0160
> -#define PLL_CON0_MUX_CLKCMU_FSYS_USB30DRD_USER	0x0180
> -#define CLK_CON_GAT_GOUT_FSYS_MMC_CARD_I_ACLK	0x2030
> -#define CLK_CON_GAT_GOUT_FSYS_MMC_CARD_SDCLKIN	0x2034
> -#define CLK_CON_GAT_GOUT_FSYS_MMC_EMBD_I_ACLK	0x2038
> -#define CLK_CON_GAT_GOUT_FSYS_MMC_EMBD_SDCLKIN	0x203c
> -#define CLK_CON_GAT_GOUT_FSYS_MMC_SDIO_I_ACLK	0x2040
> -#define CLK_CON_GAT_GOUT_FSYS_MMC_SDIO_SDCLKIN	0x2044
> +#define PLL_LOCKTIME_PLL_USB				0x0000
> +#define PLL_CON0_MUX_CLKCMU_FSYS_BUS_USER		0x0100
> +#define PLL_CON0_MUX_CLKCMU_FSYS_MMC_CARD_USER		0x0120
> +#define PLL_CON0_MUX_CLKCMU_FSYS_MMC_EMBD_USER		0x0140
> +#define PLL_CON0_MUX_CLKCMU_FSYS_MMC_SDIO_USER		0x0160
> +#define PLL_CON0_MUX_CLKCMU_FSYS_USB30DRD_USER		0x0180
> +#define PLL_CON0_PLL_USB				0x01a0
> +#define CLK_CON_GAT_CLK_FSYS_USB20PHY_CLKCORE		0x200c
> +#define CLK_CON_GAT_GOUT_FSYS_MMC_CARD_I_ACLK		0x2030
> +#define CLK_CON_GAT_GOUT_FSYS_MMC_CARD_SDCLKIN		0x2034
> +#define CLK_CON_GAT_GOUT_FSYS_MMC_EMBD_I_ACLK		0x2038
> +#define CLK_CON_GAT_GOUT_FSYS_MMC_EMBD_SDCLKIN		0x203c
> +#define CLK_CON_GAT_GOUT_FSYS_MMC_SDIO_I_ACLK		0x2040
> +#define CLK_CON_GAT_GOUT_FSYS_MMC_SDIO_SDCLKIN		0x2044
> +#define CLK_CON_GAT_GOUT_FSYS_USB30DRD_ACLK_20PHYCTRL	0x2068
> +#define CLK_CON_GAT_GOUT_FSYS_USB30DRD_ACLK_30PHYCTRL_0	0x206c
> +#define CLK_CON_GAT_GOUT_FSYS_USB30DRD_ACLK_30PHYCTRL_1	0x2070
> +#define CLK_CON_GAT_GOUT_FSYS_USB30DRD_BUS_CLK_EARLY	0x2074
> +#define CLK_CON_GAT_GOUT_FSYS_USB30DRD_REF_CLK		0x2078
>  
>  static const unsigned long fsys_clk_regs[] __initconst = {
> +	PLL_LOCKTIME_PLL_USB,
>  	PLL_CON0_MUX_CLKCMU_FSYS_BUS_USER,
>  	PLL_CON0_MUX_CLKCMU_FSYS_MMC_CARD_USER,
>  	PLL_CON0_MUX_CLKCMU_FSYS_MMC_EMBD_USER,
>  	PLL_CON0_MUX_CLKCMU_FSYS_MMC_SDIO_USER,
>  	PLL_CON0_MUX_CLKCMU_FSYS_USB30DRD_USER,
> +	PLL_CON0_PLL_USB,
> +	CLK_CON_GAT_CLK_FSYS_USB20PHY_CLKCORE,
>  	CLK_CON_GAT_GOUT_FSYS_MMC_CARD_I_ACLK,
>  	CLK_CON_GAT_GOUT_FSYS_MMC_CARD_SDCLKIN,
>  	CLK_CON_GAT_GOUT_FSYS_MMC_EMBD_I_ACLK,
>  	CLK_CON_GAT_GOUT_FSYS_MMC_EMBD_SDCLKIN,
>  	CLK_CON_GAT_GOUT_FSYS_MMC_SDIO_I_ACLK,
>  	CLK_CON_GAT_GOUT_FSYS_MMC_SDIO_SDCLKIN,
> +	CLK_CON_GAT_GOUT_FSYS_USB30DRD_ACLK_20PHYCTRL,
> +	CLK_CON_GAT_GOUT_FSYS_USB30DRD_ACLK_30PHYCTRL_0,
> +	CLK_CON_GAT_GOUT_FSYS_USB30DRD_ACLK_30PHYCTRL_1,
> +	CLK_CON_GAT_GOUT_FSYS_USB30DRD_BUS_CLK_EARLY,
> +	CLK_CON_GAT_GOUT_FSYS_USB30DRD_REF_CLK,
>  };
>  
> +static const struct samsung_pll_rate_table pll_usb_rate_table[] __initconst = {
> +	PLL_35XX_RATE(26 * MHZ, 50000000U, 400, 13, 4),
> +};
> +
> +static const struct samsung_pll_clock fsys_pll_clks[] __initconst = {
> +	PLL(pll_1418x, CLK_FOUT_USB_PLL, "fout_usb_pll", "oscclk",
> +	    PLL_LOCKTIME_PLL_USB, PLL_CON0_PLL_USB,
> +	    pll_usb_rate_table),
> +};
> +
> +

Just one blank line.

>  /* List of parent clocks for Muxes in CMU_FSYS */
>  PNAME(mout_fsys_bus_user_p)		= { "oscclk", "dout_fsys_bus" };
>  PNAME(mout_fsys_mmc_card_user_p)	= { "oscclk", "dout_fsys_mmc_card" };
>  PNAME(mout_fsys_mmc_embd_user_p)	= { "oscclk", "dout_fsys_mmc_embd" };
>  PNAME(mout_fsys_mmc_sdio_user_p)	= { "oscclk", "dout_fsys_mmc_sdio" };
>  PNAME(mout_fsys_usb30drd_user_p)	= { "oscclk", "dout_fsys_usb30drd" };
> +PNAME(mout_usb_pll_p)			= { "oscclk", "fout_usb_pll" };
>  
>  static const struct samsung_mux_clock fsys_mux_clks[] __initconst = {
>  	MUX(CLK_MOUT_FSYS_BUS_USER, "mout_fsys_bus_user", mout_fsys_bus_user_p,
> @@ -731,12 +759,16 @@ static const struct samsung_mux_clock fsys_mux_clks[] __initconst = {
>  	MUX_F(CLK_MOUT_FSYS_MMC_SDIO_USER, "mout_fsys_mmc_sdio_user",
>  	      mout_fsys_mmc_sdio_user_p, PLL_CON0_MUX_CLKCMU_FSYS_MMC_SDIO_USER,
>  	      4, 1, CLK_SET_RATE_PARENT, 0),
> -	MUX_F(CLK_MOUT_FSYS_USB30DRD_USER, "mout_fsys_usb30drd_user",
> +	MUX(CLK_MOUT_FSYS_USB30DRD_USER, "mout_fsys_usb30drd_user",
>  	      mout_fsys_usb30drd_user_p, PLL_CON0_MUX_CLKCMU_FSYS_USB30DRD_USER,
> -	      4, 1, CLK_SET_RATE_PARENT, 0),
> +	      4, 1),
> +	nMUX_F(CLK_MOUT_USB_PLL, "mout_usb_pll", mout_usb_pll_p,
> +	    PLL_CON0_PLL_USB, 4, 1, CLK_SET_RATE_PARENT, 0),
>  };
>  
>  static const struct samsung_gate_clock fsys_gate_clks[] __initconst = {
> +	GATE(CLK_FSYS_USB20PHY_CLKCORE, "clk_fsys_usb20phy_clkcore", "mout_usb_pll",
> +	     CLK_CON_GAT_CLK_FSYS_USB20PHY_CLKCORE, 21, CLK_SET_RATE_PARENT, 0),
>  	GATE(CLK_GOUT_MMC_CARD_ACLK, "gout_mmc_card_aclk", "mout_fsys_bus_user",
>  	     CLK_CON_GAT_GOUT_FSYS_MMC_CARD_I_ACLK, 21, 0, 0),
>  	GATE(CLK_GOUT_MMC_CARD_SDCLKIN, "gout_mmc_card_sdclkin",
> @@ -752,9 +784,22 @@ static const struct samsung_gate_clock fsys_gate_clks[] __initconst = {
>  	GATE(CLK_GOUT_MMC_SDIO_SDCLKIN, "gout_mmc_sdio_sdclkin",
>  	     "mout_fsys_mmc_sdio_user", CLK_CON_GAT_GOUT_FSYS_MMC_SDIO_SDCLKIN,
>  	     21, CLK_SET_RATE_PARENT, 0),
> +	GATE(CLK_FSYS_USB30DRD_ACLK_20PHYCTRL, "clk_fsys_usb30drd_aclk_20phyctrl",
> +	     "mout_fsys_bus_user", CLK_CON_GAT_GOUT_FSYS_USB30DRD_ACLK_20PHYCTRL, 21, 0, 0),
> +	GATE(CLK_FSYS_USB30DRD_ACLK_30PHYCTRL_0, "clk_fsys_usb30drd_aclk_30phyctrl_0",
> +	     "mout_fsys_bus_user", CLK_CON_GAT_GOUT_FSYS_USB30DRD_ACLK_30PHYCTRL_0, 21, 0, 0),
> +	GATE(CLK_FSYS_USB30DRD_ACLK_30PHYCTRL_1, "clk_fsys_usb30drd_aclk_30phyctrl_1",
> +	     "mout_fsys_bus_user", CLK_CON_GAT_GOUT_FSYS_USB30DRD_ACLK_30PHYCTRL_1, 21, 0, 0),
> +	GATE(CLK_FSYS_USB30DRD_BUS_CLK_EARLY, "clk_fsys_usb30drd_bus_clk_early",
> +	     "mout_fsys_bus_user", CLK_CON_GAT_GOUT_FSYS_USB30DRD_BUS_CLK_EARLY, 21, 0, 0),
> +	GATE(CLK_FSYS_USB30DRD_REF_CLK, "clk_fsys_usb30drd_ref_clk", "mout_fsys_usb30drd_user",
> +	     CLK_CON_GAT_GOUT_FSYS_USB30DRD_REF_CLK, 21, 0, 0),
> +

Drop blank line


Best regards,
Krzysztof

