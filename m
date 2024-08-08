Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61500183CCB;
	Thu,  8 Aug 2024 09:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723109968; cv=none; b=EJP122RdF9DUdWpD/yIjo4LvRq3/PGAfay+qFeGltvJA3bwySIKX8k6tueznxxvqHyJlpQDWCHF/RC5gE8/lpL4VPu8nXqK9/iJ5sU0nhKFGtI7N1t14rsozZEo9EMAxlRg+L8yKx+NRFn7urRmN3b51pqr+s9+aiOx04eYi9iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723109968; c=relaxed/simple;
	bh=S6uVSWM0fVB47Wnkpa/QXKdTn2ezvJoHADvHg7pwr8M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S9p+Oo66p6+aO60kMXirmbmauXFQr/WE84AZRRNlXmiwrxHJas7ISe0XHK8iRgSlYtfNoeWPz9n9JaGtniz0KG8In6J/Fi/BZ8KbJmY8p1UaFWb/eKa+eCCZwkZDgJp7dD76Wm+MZdGmwkYLfNVOvFXfqJIPw91cTVXXGxwhO2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n6c2bDlX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n6c2bDlX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 334FFC32782;
	Thu,  8 Aug 2024 09:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723109967;
	bh=S6uVSWM0fVB47Wnkpa/QXKdTn2ezvJoHADvHg7pwr8M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=n6c2bDlXBPhXJqlwY+K4UPv6A+2oJ5MZfqt+SaFXmwdqruBUsysc/9yb6NPrj7Shv
	 Jz+nsD5Zb5hIRC1QmwiqFOoQtX8e7OnR3iLwIXRdOoFIl1PPSX/fnMp38Znk+jJWX6
	 RQzsrJBhZcdo9L3rSj9MNDCFLM3e/NUNdHlXglhiZ32+eMWuXgIkf7GRukuLjGfUmp
	 kQgQKVStrEaBGQrRdb6JmEsPtQ4px/jKAGDszyQMCeL1Ll5bysZdQLVzLQkboJnUHu
	 UF41qevTtbQVNBG7ckGAPFQOeogqoHnfxq6kf1JZOljRTnPBShk03IK799A4CS/r/3
	 Utcf+lddang5w==
Message-ID: <d79d4eb3-0328-4164-a72a-ff0b6e84d5cc@kernel.org>
Date: Thu, 8 Aug 2024 11:39:19 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] clk: samsung: clk-pll: Add support for pll_1418x
To: David Virag <virag.david003@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20240806121157.479212-1-virag.david003@gmail.com>
 <20240806121157.479212-7-virag.david003@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240806121157.479212-7-virag.david003@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/08/2024 14:11, David Virag wrote:
> pll1418x is used in Exynos7885 SoC for USB PHY clock.
> Operation-wise it is very similar to pll0822x, except that MDIV is only
> 9 bits wide instead of 10, and we use the CON1 register in the PLL
> macro's "con" parameter instead of CON3 like this:
> 
> 	PLL(pll_1418x, CLK_FOUT_USB_PLL, "fout_usb_pll", "oscclk",
> 	    PLL_LOCKTIME_PLL_USB, PLL_CON0_PLL_USB,
> 	    pll_usb_rate_table),
> 
> Technically the PLL should work fine with pll0822x code if the PLL
> tables are correct, but it's more "correct" to actually update the mask.
> 
> Signed-off-by: David Virag <virag.david003@gmail.com>
> ---
>  drivers/clk/samsung/clk-pll.c | 20 ++++++++++++++++----
>  drivers/clk/samsung/clk-pll.h |  1 +
>  2 files changed, 17 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
> index 4be879ab917e..c61a2810737c 100644
> --- a/drivers/clk/samsung/clk-pll.c
> +++ b/drivers/clk/samsung/clk-pll.c
> @@ -430,6 +430,9 @@ static const struct clk_ops samsung_pll36xx_clk_min_ops = {
>  #define PLL0822X_LOCK_STAT_SHIFT	(29)
>  #define PLL0822X_ENABLE_SHIFT		(31)
>  
> +/* PLL1418x is similar to PLL0822x, except that MDIV is one bit smaller */
> +#define PLL1418X_MDIV_MASK		(0x1FF)
> +
>  static unsigned long samsung_pll0822x_recalc_rate(struct clk_hw *hw,
>  						  unsigned long parent_rate)
>  {
> @@ -438,7 +441,10 @@ static unsigned long samsung_pll0822x_recalc_rate(struct clk_hw *hw,
>  	u64 fvco = parent_rate;
>  
>  	pll_con3 = readl_relaxed(pll->con_reg);
> -	mdiv = (pll_con3 >> PLL0822X_MDIV_SHIFT) & PLL0822X_MDIV_MASK;
> +	if (pll->type != pll_1418x)
> +		mdiv = (pll_con3 >> PLL0822X_MDIV_SHIFT) & PLL0822X_MDIV_MASK;
> +	else
> +		mdiv = (pll_con3 >> PLL0822X_MDIV_SHIFT) & PLL1418X_MDIV_MASK;
>  	pdiv = (pll_con3 >> PLL0822X_PDIV_SHIFT) & PLL0822X_PDIV_MASK;
>  	sdiv = (pll_con3 >> PLL0822X_SDIV_SHIFT) & PLL0822X_SDIV_MASK;
>  
> @@ -468,9 +474,14 @@ static int samsung_pll0822x_set_rate(struct clk_hw *hw, unsigned long drate,
>  
>  	/* Change PLL PMS values */
>  	pll_con3 = readl_relaxed(pll->con_reg);
> -	pll_con3 &= ~((PLL0822X_MDIV_MASK << PLL0822X_MDIV_SHIFT) |
> -			(PLL0822X_PDIV_MASK << PLL0822X_PDIV_SHIFT) |
> -			(PLL0822X_SDIV_MASK << PLL0822X_SDIV_SHIFT));
> +	if (pll->type != pll_1418x)
> +		pll_con3 &= ~((PLL0822X_MDIV_MASK << PLL0822X_MDIV_SHIFT) |
> +				(PLL0822X_PDIV_MASK << PLL0822X_PDIV_SHIFT) |
> +				(PLL0822X_SDIV_MASK << PLL0822X_SDIV_SHIFT));

I think this part could be simpler. If I read it correctly, only mdiv
mask is different, so create local variable mdiv_mask and set it in
if-else block accordingly to the type. Then here you have
non-conditional code:
pll_con3 &= ~((mdiv_mask << PLL0822X_MDIV_SHIFT) |



Best regards,
Krzysztof

