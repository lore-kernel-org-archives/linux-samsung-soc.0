Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361401C5D6E;
	Thu, 27 Feb 2025 05:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740635783; cv=none; b=BBOEsmc15D+pEXaZO1A7IFTE+wQp/fCVDQtZcUv/k6jskpx847fVyb9p/jBeCU5laFCrHrsZqjlrjqVSAfgv88gxuxu4R5jJ56yB/b2enZBkwRvo1ptEbD6QpIcyVBcQXOZh3m6tIGN0MGZEXA6gksTkGd/r02hsvTvNl+q+Y90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740635783; c=relaxed/simple;
	bh=Qs9KlJ2e3nsU7Zdb+mxSOy0BPAa0JMo2sv/AdzdVSww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U7+jTVxi4tMIwCXTVc6+YflOnSfHeVC5APeYQxqe2hn23DMXXt5Zc8CyZQo6KqDaAPVxDL/3BCOFEEDpOYyy2RsHEuE4nou9G1qo24dGhavwgK193+64ug9hTwie7L+kvUH40k8lW6SzqrdbWzEZoMSM7o/4CAxKBNFDPeobP/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W2bnllZQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W2bnllZQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6C31C4CEDD;
	Thu, 27 Feb 2025 05:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740635782;
	bh=Qs9KlJ2e3nsU7Zdb+mxSOy0BPAa0JMo2sv/AdzdVSww=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W2bnllZQv48CZI9ThMiGQAP/KEvinCY9XJE+zMx6WpY54EUp8pBZa9gICGPovWZB6
	 ofX2cm9UwYn5TeNXRHIBqLvEVKHfBZzeO5aqAJCV6HfXF+V2ZvpPtTz3Jwvwl1mm1g
	 oPUmuXlGRlf/b+NEJiGOpl8BzunbG16GEyFH//aDJIgyZ2OF+HD56fW1G4JaPl57Fp
	 EC+ck1XIiYVEKGwoko39TJ999jdQepDp39ikB+qRnIy4FVS5ZLuiWwdoAj8Fcu7smp
	 IQth4DKd2pDrxKGzGyQttW1PLrxMsIsA98iEOGjA/Fmdnpzo6KORiM1ZFDVpYT86HD
	 aets8RZZaQ8RQ==
Date: Thu, 27 Feb 2025 11:26:17 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH] phy: exynos5-usbdrd: Fix broken USB on Exynos5422 (TYPEC
 dependency)
Message-ID: <Z7/+gXVFVzGadc4z@vaman>
References: <20250215094122.60535-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250215094122.60535-1-krzysztof.kozlowski@linaro.org>

Hi Krzysztof,

On 15-02-25, 10:41, Krzysztof Kozlowski wrote:

Can you revise the title to "phy: exynos5-usbdrd: dont depend on type-c"
or something relevenant which describes the change rather than the
Fix something!

> Older Exynos designs, like Exynos5422, do not have USB Type-C and the
> USB DRD PHY does not really depend on Type-C for these devices at all.
> Incorrectly added dependency on CONFIG_TYPEC caused this driver to be
> missing for exynos_defconfig and as result Exynos5422-based boards like
> Hardkernel Odroid HC1 failed to probe USB.
> 
> Drop incorrect dependency and rely on module to be reachable by the
> compiler.

Changelog lgtm

> 
> Reported-by: Krzysztof Kozlowski <krzk@kernel.org>
> Closes: https://krzk.eu/#/builders/21/builds/6139
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Closes: https://lore.kernel.org/all/3c0b77e6-357d-453e-8b63-4757c3231bde@samsung.com/
> Fixes: 09dc674295a3 ("phy: exynos5-usbdrd: subscribe to orientation notifier if required")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Patch for issue in linux-next
> ---
>  drivers/phy/samsung/Kconfig              | 1 -
>  drivers/phy/samsung/phy-exynos5-usbdrd.c | 2 +-
>  2 files changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/phy/samsung/Kconfig b/drivers/phy/samsung/Kconfig
> index 7fba571c0e2b..e2330b0894d6 100644
> --- a/drivers/phy/samsung/Kconfig
> +++ b/drivers/phy/samsung/Kconfig
> @@ -81,7 +81,6 @@ config PHY_EXYNOS5_USBDRD
>  	tristate "Exynos5 SoC series USB DRD PHY driver"
>  	depends on (ARCH_EXYNOS && OF) || COMPILE_TEST
>  	depends on HAS_IOMEM
> -	depends on TYPEC || (TYPEC=n && COMPILE_TEST)

So how would this dependency be sorted..?

>  	depends on USB_DWC3_EXYNOS
>  	select GENERIC_PHY
>  	select MFD_SYSCON
> diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> index ff2436f11d68..e8a9fef22107 100644
> --- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
> +++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> @@ -1456,7 +1456,7 @@ static int exynos5_usbdrd_setup_notifiers(struct exynos5_usbdrd_phy *phy_drd)
>  {
>  	int ret;
>  
> -	if (!IS_ENABLED(CONFIG_TYPEC))
> +	if (!IS_REACHABLE(CONFIG_TYPEC))
>  		return 0;
>  
>  	if (device_property_present(phy_drd->dev, "orientation-switch")) {
> -- 
> 2.43.0

-- 
~Vinod
