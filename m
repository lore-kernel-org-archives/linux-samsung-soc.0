Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8FF2AF16
	for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Feb 2025 19:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739561436; cv=none; b=MJqP3t+bDTBvKwwaFgA9OQtYHfne/TCz9aQZPrQaz5zkZTrW5T7BuW74aTjHTIA1QImuPGzKZPvbYrcdLfNw02vubjJhB8Ln11z+XBZZndSOCF8R1fdGsjCimnPAZh72CpwbT1L9Yybn0j+Wuxf9giudnGsKKTJZ4ZAL0Sfwfdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739561436; c=relaxed/simple;
	bh=tll7QiChnR4Z0P6dJPFYh+IOg4XrPfzt7I/PhYn9m/g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=ZMx6qSNBFE/RvQwaangpNQVDNktJl3nCkPCDS2tGd61oygT3nk9fIb0KOISxYLk0Hdi9mHIU0ErpWCiuggvE5jsw9BgDm3Y5nII12IbFxjLpDCOl5DBw7IrJSOTf/txPsoceNW64Oj+i88kVpfghnDAHCWL47BXW38vQrKT00VM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=A2MuRTuu; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="A2MuRTuu"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250214193025euoutp0179edc30d4fb0a2d3a7b8c8b30f15136d~kKeZ27Srm2367723677euoutp01b
	for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Feb 2025 19:30:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250214193025euoutp0179edc30d4fb0a2d3a7b8c8b30f15136d~kKeZ27Srm2367723677euoutp01b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1739561425;
	bh=AQddq/dEL5k/xrRBPmEqe0CS+ih6MIApenU4d2OGycI=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=A2MuRTuu4ahRzTDk2HUlvMjCoBzKMD5HOQvu3EGRlgFiAZ2asAaeVwmLWzHQgec73
	 E+ugzYjYYL8r2VdxEwl6Ro024dhdVHpEzsez7b3LOsnPAXQFmd2DZeeUeGBrIHEdOH
	 8/f+aP+TbqmhNxdAP5gFfBRXtWko1lNBBtz9pKdU=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20250214193024eucas1p251af6a3ef901ef48f2d639fbfe9f6883~kKeYoxOjE1279312793eucas1p2B;
	Fri, 14 Feb 2025 19:30:24 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
	eusmges1new.samsung.com (EUCPMTA) with SMTP id AA.13.20821.0D99FA76; Fri, 14
	Feb 2025 19:30:24 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250214193023eucas1p26cdb1079f9847b3bfc9c897718206c97~kKeXUpHXX1280412804eucas1p2B;
	Fri, 14 Feb 2025 19:30:23 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
	eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250214193023eusmtrp1af21e5b448ee7388ba69db3fcf7dbcba~kKeXTzM_O1138611386eusmtrp1E;
	Fri, 14 Feb 2025 19:30:23 +0000 (GMT)
X-AuditID: cbfec7f2-b09c370000005155-2d-67af99d05b42
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
	eusmgms2.samsung.com (EUCPMTA) with SMTP id 4D.08.19654.EC99FA76; Fri, 14
	Feb 2025 19:30:22 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250214193020eusmtip1fb59377c383c77449d4cb499844b3263~kKeVQ3ahA0079000790eusmtip1A;
	Fri, 14 Feb 2025 19:30:20 +0000 (GMT)
Message-ID: <3c0b77e6-357d-453e-8b63-4757c3231bde@samsung.com>
Date: Fri, 14 Feb 2025 20:30:19 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/7] phy: exynos5-usbdrd: subscribe to orientation
 notifier if required
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, Vinod Koul
	<vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim
	Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus
	<tudor.ambarus@linaro.org>, Sam Protsenko <semen.protsenko@linaro.org>, Will
	McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>,
	kernel-team@android.com, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20241206-gs101-phy-lanes-orientation-phy-v4-6-f5961268b149@linaro.org>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrEKsWRmVeSWpSXmKPExsWy7djP87oXZq5PN+g/J23xYN42Nostrzaz
	WKzZe47JYv6Rc6wWO7aLWBxt/c9s8XLWPTaLTY+vsVpc3jWHzWLCqm8sFjPO72Oy2DDjH4vF
	/z072C3aG06xWRx+085q8bwPKPHpVpzFzjsnmC1WffrP6CDssW33NlaPBZtKPTat6mTzuHNt
	D5vH5iX1Hn1bVjF6fN4kF8AexWWTkpqTWZZapG+XwJXx+sF/1oILuhXPls1lbGBcrtLFyMkh
	IWAisflLE3sXIxeHkMAKRolfP1uYIJwvjBInPx9igXA+M0pMOH2ODabl1eKbjBCJ5YwSczre
	QVV9ZJTo+DCTHaSKV8BOYv+pX6wgNouAqsTCVdvZIOKCEidnPmEBsUUF5CXu35oBVi8skCDR
	df0V2CARgYtMErvfnAdbwSzQyyyx4cUpZpAqZgFxiVtP5jOB2GwChhJdb7vApnIKhEh0T77E
	AlEjL9G8dTYzSLOEwG5OiQO3lgI1cAA5LhKd30shfhCWeHV8CzuELSNxenIPC0R9O6PEgt/3
	mSCcCYwSDc9vMUJUWUvcOfeLDWQQs4CmxPpd+hBhR4lFmxqZIebzSdx4KwhxA5/EpG3TocK8
	Eh1tQhDVahKzjq+DW3vwwiXmCYxKs5DCZRaSL2ch+WYWwt4FjCyrGMVTS4tz01OLDfNSy/WK
	E3OLS/PS9ZLzczcxApPh6X/HP+1gnPvqo94hRiYOxkOMEhzMSiK8EtPWpAvxpiRWVqUW5ccX
	leakFh9ilOZgURLnXbS/NV1IID2xJDU7NbUgtQgmy8TBKdXANKOwxr9Ys/6+61++7YG9jT+9
	K11LDgWn1W4+fjXYsq6yvfk5u/LzRRpORQ1/XoX5l0/80OZ4693sORPit3160XBuWkvwQo4/
	TOIFkofDVl+40WYdmXTuuZKTapUje3oK97Xdu9ysD/A5CP58+kbo863of2q2vO+nRYn9k/Or
	9DlSlKOxcGKuysUPIX+cPGpSSy8K3n92tel2QfPRf6m7FTbuLbbS/sR8yGmN2A3OPzJTzFa9
	O/BAOfzSEc2bcp5H3i3lmlWuM2FBdfLiH1c3pHPUzeX9cfeP0UqztHorWX5OiQtqJvH5WjIr
	D5R0J8gsPCxou731qO/2Dk9PVofm+spHapLZbgt/ml2fpPpUiaU4I9FQi7moOBEAVDlLM/UD
	AAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrCIsWRmVeSWpSXmKPExsVy+t/xu7rnZ65PNzhgavFg3jY2iy2vNrNY
	rNl7jsli/pFzrBY7totYHG39z2zxctY9NotNj6+xWlzeNYfNYsKqbywWM87vY7LYMOMfi8X/
	PTvYLdobTrFZHH7TzmrxvA8o8elWnMXOOyeYLVZ9+s/oIOyxbfc2Vo8Fm0o9Nq3qZPO4c20P
	m8fmJfUefVtWMXp83iQXwB6lZ1OUX1qSqpCRX1xiqxRtaGGkZ2hpoWdkYqlnaGwea2VkqqRv
	Z5OSmpNZllqkb5egl/H6wX/Wggu6Fc+WzWVsYFyu0sXIySEhYCLxavFNxi5GLg4hgaWMEpM2
	rGeBSMhInJzWwAphC0v8udbFBlH0nlFi3ddOsASvgJ3E/lO/wGwWAVWJhau2s0HEBSVOznwC
	NkhUQF7i/q0Z7CC2sECCRNf1Vywgg0QELjNJLO/bxQriMAv0M0scPdTJDLHiI6PEpskNTCAt
	zALiEreezAez2QQMJbredoGt4BQIkeiefIkFosZMomtrFyOELS/RvHU28wRGoVlILpmFZNQs
	JC2zkLQsYGRZxSiSWlqcm55bbKRXnJhbXJqXrpecn7uJERj924793LKDceWrj3qHGJk4GA8x
	SnAwK4nwSkxbky7Em5JYWZValB9fVJqTWnyI0RQYHBOZpUST84HpJ68k3tDMwNTQxMzSwNTS
	zFhJnJftyvk0IYH0xJLU7NTUgtQimD4mDk6pBibOg4ynikIDExhallkKThWcMK360qMIh2+C
	9Q9jNn9qOLDgmbpbjVz4rN1nr+/x26gjy83dX3XLgenip7tf5U33tDzRLrfnnpcd4WvkfiFv
	fnIwY9HDc0tUJfpE1YRtXitpHg7/9bJOosPlIP+Mk85BV/PdWKb3J90QfPPPSbpt/5ELHBLe
	LNVcDErpZ1YsuRdx5IGcRCifQ6iGpM9i/yLbT2JTS3Ya72pbfKLy0cJJlx3tUzp3Scal+bE2
	GvyJuHT/U6SS+solt3QCVfZvz3s39aJ52SRexq4tags9pT/I305+w7Vzjdk6xiPH7C+utIot
	Zvzg39x8hf/Qw63fFcouTL6mbNPAHLAt7Ni5MCWW4oxEQy3mouJEACpowR2HAwAA
X-CMS-MailID: 20250214193023eucas1p26cdb1079f9847b3bfc9c897718206c97
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20241206163109eucas1p12aea3a9a6c404cd7c678009ea11aa5b3
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20241206163109eucas1p12aea3a9a6c404cd7c678009ea11aa5b3
References: <20241206-gs101-phy-lanes-orientation-phy-v4-0-f5961268b149@linaro.org>
	<CGME20241206163109eucas1p12aea3a9a6c404cd7c678009ea11aa5b3@eucas1p1.samsung.com>
	<20241206-gs101-phy-lanes-orientation-phy-v4-6-f5961268b149@linaro.org>

On 06.12.2024 17:31, André Draszik wrote:
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
>      echo auto > /sys/devices/.../11110000.usb/power/control
> Once done, things work as long as the UDC is not bound as otherwise it
> stays busy because it doesn't cancel / stop outstanding TRBs. For now
> we have to manually unbind the UDC in that case:
>       echo "" > sys/kernel/config/usb_gadget/.../UDC
>
> Note that if the orientation-switch property is missing from the DT,
> the code will behave as before this commit (meaning for gs101 it will
> work in SS mode in one orientation only). Other platforms are not
> affected either way.
>
> Signed-off-by: André Draszik <andre.draszik@linaro.org>
>
> ---
> v3:
> * drop init to -1 of phy_drd->orientation (Vinod)
> * avoid #ifdef and switch to normal conditional IS_ENABLED() for
>    CONFIG_TYPEC
>
> v2:
> * move #include typec_mux.h from parent patch into this one (Peter)
> ---
>   drivers/phy/samsung/Kconfig              |  1 +
>   drivers/phy/samsung/phy-exynos5-usbdrd.c | 56 ++++++++++++++++++++++++++++++++
>   2 files changed, 57 insertions(+)
>
> diff --git a/drivers/phy/samsung/Kconfig b/drivers/phy/samsung/Kconfig
> index f10afa3d7ff5..fc7bd1088576 100644
> --- a/drivers/phy/samsung/Kconfig
> +++ b/drivers/phy/samsung/Kconfig
> @@ -80,6 +80,7 @@ config PHY_EXYNOS5_USBDRD
>   	tristate "Exynos5 SoC series USB DRD PHY driver"
>   	depends on (ARCH_EXYNOS && OF) || COMPILE_TEST
>   	depends on HAS_IOMEM
> +	depends on TYPEC || (TYPEC=n && COMPILE_TEST)
>   	depends on USB_DWC3_EXYNOS
>   	select GENERIC_PHY
>   	select MFD_SYSCON

I've just noticed that the above disables Exynos DRD PHY driver in the 
default exynos_defconfig for arm 32bit. Enabling CONFIG_TYPEC is 
exynos_defconfig probably is the easiest way to fix this. I will send a 
patch then.

> diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> index 61e0de4b3d4b..8fc15847cfd8 100644
> --- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
> +++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> @@ -24,6 +24,7 @@
>   #include <linux/regulator/consumer.h>
>   #include <linux/soc/samsung/exynos-regs-pmu.h>
>   #include <linux/usb/typec.h>
> +#include <linux/usb/typec_mux.h>
>   
>   /* Exynos USB PHY registers */
>   #define EXYNOS5_FSEL_9MHZ6		0x0
> @@ -394,6 +395,7 @@ struct exynos5_usbdrd_phy_drvdata {
>    * @extrefclk: frequency select settings when using 'separate
>    *	       reference clocks' for SS and HS operations
>    * @regulators: regulators for phy
> + * @sw: TypeC orientation switch handle
>    * @orientation: TypeC connector orientation - normal or flipped
>    */
>   struct exynos5_usbdrd_phy {
> @@ -415,6 +417,7 @@ struct exynos5_usbdrd_phy {
>   	u32 extrefclk;
>   	struct regulator_bulk_data *regulators;
>   
> +	struct typec_switch_dev *sw;
>   	enum typec_orientation orientation;
>   };
>   
> @@ -1397,6 +1400,55 @@ static int exynos5_usbdrd_phy_clk_handle(struct exynos5_usbdrd_phy *phy_drd)
>   	return 0;
>   }
>   
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
> +	if (!IS_ENABLED(CONFIG_TYPEC))
> +		return 0;
> +
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
> +
>   static const struct exynos5_usbdrd_phy_config phy_cfg_exynos5[] = {
>   	{
>   		.id		= EXYNOS5_DRDPHY_UTMI,
> @@ -1786,6 +1838,10 @@ static int exynos5_usbdrd_phy_probe(struct platform_device *pdev)
>   	if (ret)
>   		return dev_err_probe(dev, ret, "failed to get regulators\n");
>   
> +	ret = exynos5_usbdrd_setup_notifiers(phy_drd);
> +	if (ret)
> +		return ret;
> +
>   	dev_vdbg(dev, "Creating usbdrd_phy phy\n");
>   
>   	for (i = 0; i < EXYNOS5_DRDPHYS_NUM; i++) {
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

