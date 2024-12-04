Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559941F8923;
	Wed,  4 Dec 2024 14:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733321438; cv=none; b=EPNnU7uNHnr/utnI8iwW4EUYyCQiRIG9VJqOMIUqq6hQ7ddgakifd4UdoIOppiTAnqRMUDEW62awx4RsndcpzU1XAdQf3wsZXXgmofF7Fd50XYQyID/XnP3G4BuHtLNbywYQIY6n0C8H3ePsxDpHt+UpL7GfsNKw418cT9LYNy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733321438; c=relaxed/simple;
	bh=YYSDsgbu4kMtRDP07uuP9pCt0culwplV4KoPxA6I3hI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dPBpR9ffUnK+C7+bYsaxbQxIQFQT4XFgjS5JJFFEeQT9S7rYHjlUVtYHSdkVl+mHow/ub2E7SNwaDo/v6jvuJwdRzhoCkbHB6dzn+BY3AJJ1VLQyoToBoHYfR8zZ5cU92+sQr5Rds3s4KebK9vy0pvQf4ZhQDiYUOGJC8N6aQRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H/lWxIYj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H/lWxIYj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27C5CC4CECD;
	Wed,  4 Dec 2024 14:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733321437;
	bh=YYSDsgbu4kMtRDP07uuP9pCt0culwplV4KoPxA6I3hI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H/lWxIYjb/XMOitGejfbUCVwTnb0OQSj1sa+6z8o3yOf4vflWP64boaCLJocOV4Ua
	 nWsNmJVSmkzqfwRHMOn67u+rRQFvBClGDfQ/Z1xKOdG+O1PzGPCXaoReoDJzuY1pes
	 3wdqP2Nox7ZMZg6TyUIWi7RRSKoA31J3sf0D1MGdije5K/uCQmqCFd9zOCs4VmwH2u
	 NPKaS/BiZG333RDBeSLQ6fVxw9IL0Rqx/C9HPxQnY7YrGy+V73ArLNIb3S/ljP4U/k
	 MyDtgIJr1GYIQSxcgORFPh7DH+JyjoEPRMucX+x1IT3LSVl3ZRjeAiHIjtHA3gwAVH
	 010T6iI30fqhg==
Date: Wed, 4 Dec 2024 19:40:34 +0530
From: Vinod Koul <vkoul@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	Will McVicker <willmcvicker@google.com>,
	Roy Luo <royluo@google.com>, kernel-team@android.com,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 8/9] phy: exynos5-usbdrd: subscribe to orientation
 notifier if required
Message-ID: <Z1Bi2gRJefYy1tyo@vaman>
References: <20241127-gs101-phy-lanes-orientation-phy-v1-0-1b7fce24960b@linaro.org>
 <20241127-gs101-phy-lanes-orientation-phy-v1-8-1b7fce24960b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241127-gs101-phy-lanes-orientation-phy-v1-8-1b7fce24960b@linaro.org>

On 27-11-24, 10:58, André Draszik wrote:
> gs101's SS phy needs to be configured differently based on the
> connector orientation, as the SS link can only be established if the
> mux is configured correctly.
> 
> The code to handle programming of the mux is in place already, this commit
> now adds the missing pieces to subscribe to the Type-C orientation
> switch event.
> 
> Note that for this all to work we rely on the USB controller
> re-initialising us. It should invoke our .exit() upon cable unplug, and
> during cable plug we'll receive the orientation event after which we
> expect our .init() to be called.
> 
> Above reinitialisation happens if the DWC3 controller can enter runtime
> suspend automatically. For the DWC3 driver, this is an opt-in:
>     echo auto > /sys/devices/.../11110000.usb/power/control
> Once done, things work as long as the UDC is not bound as otherwise it
> stays busy because it doesn't cancel / stop outstanding TRBs. For now
> we have to manually unbind the UDC in that case:
>      echo "" > sys/kernel/config/usb_gadget/.../UDC
> 
> Signed-off-by: André Draszik <andre.draszik@linaro.org>
> ---
>  drivers/phy/samsung/Kconfig              |  1 +
>  drivers/phy/samsung/phy-exynos5-usbdrd.c | 60 ++++++++++++++++++++++++++++++++
>  2 files changed, 61 insertions(+)
> 
> diff --git a/drivers/phy/samsung/Kconfig b/drivers/phy/samsung/Kconfig
> index f10afa3d7ff5..fc7bd1088576 100644
> --- a/drivers/phy/samsung/Kconfig
> +++ b/drivers/phy/samsung/Kconfig
> @@ -80,6 +80,7 @@ config PHY_EXYNOS5_USBDRD
>  	tristate "Exynos5 SoC series USB DRD PHY driver"
>  	depends on (ARCH_EXYNOS && OF) || COMPILE_TEST
>  	depends on HAS_IOMEM
> +	depends on TYPEC || (TYPEC=n && COMPILE_TEST)
>  	depends on USB_DWC3_EXYNOS
>  	select GENERIC_PHY
>  	select MFD_SYSCON
> diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> index 1a34e9b4618a..2010d25ee817 100644
> --- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
> +++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> @@ -394,6 +394,7 @@ struct exynos5_usbdrd_phy_drvdata {
>   * @extrefclk: frequency select settings when using 'separate
>   *	       reference clocks' for SS and HS operations
>   * @regulators: regulators for phy
> + * @sw: TypeC orientation switch handle
>   * @orientation: TypeC connector orientation - normal or flipped
>   */
>  struct exynos5_usbdrd_phy {
> @@ -415,6 +416,7 @@ struct exynos5_usbdrd_phy {
>  	u32 extrefclk;
>  	struct regulator_bulk_data *regulators;
>  
> +	struct typec_switch_dev *sw;
>  	enum typec_orientation orientation;
>  };
>  
> @@ -1400,6 +1402,60 @@ static int exynos5_usbdrd_phy_clk_handle(struct exynos5_usbdrd_phy *phy_drd)
>  	return 0;
>  }
>  
> +#if IS_ENABLED(CONFIG_TYPEC)
> +static int exynos5_usbdrd_orien_sw_set(struct typec_switch_dev *sw,
> +				       enum typec_orientation orientation)
> +{
> +	struct exynos5_usbdrd_phy *phy_drd = typec_switch_get_drvdata(sw);
> +
> +	scoped_guard(mutex, &phy_drd->phy_mutex)
> +		phy_drd->orientation = orientation;
> +
> +	return 0;
> +}
> +
> +static void exynos5_usbdrd_orien_switch_unregister(void *data)
> +{
> +	struct exynos5_usbdrd_phy *phy_drd = data;
> +
> +	typec_switch_unregister(phy_drd->sw);
> +}
> +
> +static int exynos5_usbdrd_setup_notifiers(struct exynos5_usbdrd_phy *phy_drd)
> +{
> +	int ret;
> +
> +	phy_drd->orientation = (enum typec_orientation)-1;

Should this be TYPEC_ORIENTATION_NONE?

> +	if (device_property_present(phy_drd->dev, "orientation-switch")) {
> +		struct typec_switch_desc sw_desc = { };
> +
> +		sw_desc.drvdata = phy_drd;
> +		sw_desc.fwnode = dev_fwnode(phy_drd->dev);
> +		sw_desc.set = exynos5_usbdrd_orien_sw_set;
> +
> +		phy_drd->sw = typec_switch_register(phy_drd->dev, &sw_desc);
> +		if (IS_ERR(phy_drd->sw))
> +			return dev_err_probe(phy_drd->dev,
> +					     PTR_ERR(phy_drd->sw),
> +					     "Failed to register TypeC orientation switch\n");
> +
> +		ret = devm_add_action_or_reset(phy_drd->dev,
> +					       exynos5_usbdrd_orien_switch_unregister,
> +					       phy_drd);
> +		if (ret)
> +			return dev_err_probe(phy_drd->dev, ret,
> +					     "Failed to register TypeC orientation devm action\n");
> +	}
> +
> +	return 0;
> +}
> +#else /* CONFIG_TYPEC */
> +static int exynos5_usbdrd_setup_notifiers(struct exynos5_usbdrd_phy *phy_drd)
> +{
> +	return 0;
> +}
> +#endif /* CONFIG_TYPEC */
> +
>  static const struct exynos5_usbdrd_phy_config phy_cfg_exynos5[] = {
>  	{
>  		.id		= EXYNOS5_DRDPHY_UTMI,
> @@ -1789,6 +1845,10 @@ static int exynos5_usbdrd_phy_probe(struct platform_device *pdev)
>  	if (ret)
>  		return dev_err_probe(dev, ret, "failed to get regulators\n");
>  
> +	ret = exynos5_usbdrd_setup_notifiers(phy_drd);
> +	if (ret)
> +		return ret;
> +
>  	dev_vdbg(dev, "Creating usbdrd_phy phy\n");
>  
>  	for (i = 0; i < EXYNOS5_DRDPHYS_NUM; i++) {
> 
> -- 
> 2.47.0.338.g60cca15819-goog

-- 
~Vinod
