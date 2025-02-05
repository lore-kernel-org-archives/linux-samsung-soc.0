Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C37920370C;
	Wed,  5 Feb 2025 08:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738745609; cv=none; b=cdc2eOnZhy/V9E1C5lxy+tsKmI1tYxK/8zpR02K9DTHAFMaP2V6rFT2MXucJMHMW/ZLU6BRsS9nmxPW9hTzqEJ46LT88rl6NIQHv4tK/4Eq5oHkhbdiFqdylesFyG90Wk9D6RaHXUPVZ8MbKGqU6TqvB05MrVu/YOG7CrxtLP3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738745609; c=relaxed/simple;
	bh=Mx/hiLYA8u5CZDU8ZLhxLsxACP2y++BBtVO3RiUnK6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gbGPnqCf6Y+gqvbyBl1ynNHgnyPc4j8yrJnb3F4nRZ6yhuUUHSKq/GupiHPO1fGrbpFb452a/UuHNFxGxzrDbVurpbDs2Qt9VOAux4hzPkaJcuOCOqBexPALdXQ5D3RTvd5Kn8O4KzKfg7pelaN1VAcYMbphc8qGMLbYCkJmKZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kTz1zKwH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kTz1zKwH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFFEDC4CED1;
	Wed,  5 Feb 2025 08:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738745608;
	bh=Mx/hiLYA8u5CZDU8ZLhxLsxACP2y++BBtVO3RiUnK6U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kTz1zKwHNJxYnZ+oyxTOsYZQb/B8+nxN/2/NsZL73VZrQ/JqLeMWYB/gQJhOqfelY
	 /bWec1gzKioMF8lfqfMvbXxXDwRaJToqfGKZnyp32/mVa2y96IT9oHHCcLNRmosjVl
	 wQOd0K+331SR9zyx7KF8aNPy/wScoXQ0L4Js2LTIibmvecM4tS+MsGvzIC7CrklEtn
	 gZbzX17jvDSbnHh0ke59sm5PBTRsD5UOWtDZS0RWK8aNOYZcZmKgAEvAa8gpQYglSe
	 TRFuIsKw354zOot0DxAsd3SboMuNaczDUJKrfvUbjcssLUP7GRaheCUj0yvpe3PBqm
	 C+GMZgv7XezzA==
Date: Wed, 5 Feb 2025 09:53:25 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Vivek Gautam <gautam.vivek@samsung.com>, Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Sergey Lisov <sleirsgoevy@gmail.com>, linux-phy@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/4] phy: exynos5-usbdrd: fix MPLL_MULTIPLIER and
 SSC_REFCLKSEL masks in refclk
Message-ID: <20250205-nice-amiable-lynx-a616b0@krzk-bin>
References: <20250204-exynos7870-usbphy-v1-0-f30a9857efeb@disroot.org>
 <20250204-exynos7870-usbphy-v1-1-f30a9857efeb@disroot.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250204-exynos7870-usbphy-v1-1-f30a9857efeb@disroot.org>

On Tue, Feb 04, 2025 at 02:10:12AM +0530, Kaustabh Chakraborty wrote:
> In exynos5_usbdrd_{pipe3,utmi}_set_refclk(), the masks
> PHYCLKRST_MPLL_MULTIPLIER_MASK and PHYCLKRST_SSC_REFCLKSEL_MASK are not
> inverted when applied to the register values. Fix it.
> 
> Fixes: 59025887fb08 ("phy: Add new Exynos5 USB 3.0 PHY driver")

Missing Cc-stable and this should be sent separately.

> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  drivers/phy/samsung/phy-exynos5-usbdrd.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> index c421b495eb0fe4396d76f8c9d7c198ad7cd08869..4a108fdab118c0edd76bd88dc9dbf6a498e064b3 100644
> --- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
> +++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> @@ -488,9 +488,9 @@ exynos5_usbdrd_pipe3_set_refclk(struct phy_usb_instance *inst)
>  	reg |=	PHYCLKRST_REFCLKSEL_EXT_REFCLK;
>  
>  	/* FSEL settings corresponding to reference clock */
> -	reg &= ~PHYCLKRST_FSEL_PIPE_MASK |
> -		PHYCLKRST_MPLL_MULTIPLIER_MASK |
> -		PHYCLKRST_SSC_REFCLKSEL_MASK;
> +	reg &= ~(PHYCLKRST_FSEL_PIPE_MASK |
> +		 PHYCLKRST_MPLL_MULTIPLIER_MASK |
> +		 PHYCLKRST_SSC_REFCLKSEL_MASK);
>  	switch (phy_drd->extrefclk) {
>  	case EXYNOS5_FSEL_50MHZ:
>  		reg |= (PHYCLKRST_MPLL_MULTIPLIER_50M_REF |
> @@ -532,9 +532,9 @@ exynos5_usbdrd_utmi_set_refclk(struct phy_usb_instance *inst)
>  	reg &= ~PHYCLKRST_REFCLKSEL_MASK;
>  	reg |=	PHYCLKRST_REFCLKSEL_EXT_REFCLK;
>  
> -	reg &= ~PHYCLKRST_FSEL_UTMI_MASK |
> -		PHYCLKRST_MPLL_MULTIPLIER_MASK |
> -		PHYCLKRST_SSC_REFCLKSEL_MASK;
> +	reg &= ~(PHYCLKRST_FSEL_UTMI_MASK |
> +		 PHYCLKRST_MPLL_MULTIPLIER_MASK |
> +		 PHYCLKRST_SSC_REFCLKSEL_MASK);
>  	reg |= PHYCLKRST_FSEL(phy_drd->extrefclk);

This part does not set MPLL_MULTIPLIER and SSC_REFCLKSEL fields later,
but I also assume intention was to clear the fields.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

