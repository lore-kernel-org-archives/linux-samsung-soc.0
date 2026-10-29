Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793262476;
	b=R5v0m1BwRZqGfiuNB+Rg8Z9XGxEiJYwezbX94fWCnh1jdVn5v1eENMnlTyKg3dQlMTZX
	 8zvjYKkByhHWNtHb1izS5aFun+/Pr4h8Z0YDYmkczE4dhUACTdyQRxFEhq2LqkyZJGgRx
	 i1GkRNEoeOqJqcHtnBK0xIIeILbHdpGwwh6V8ZHTwgahlAwybvLV1juwtTSjw/yyf62B2
	 c+BBE2RS5z4RuaDNbhlJwjiB90nKpadplVwb6LUMMDXgBzjCKrW7GvBhCMgQVqaKuDf8X
	 3VW6jEgYkT/gO06kS/fD5eHghT4muuWKQNbR2Wbl9qSDq0R9nFnQYpuFmaUUlFKXFjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793262476;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 Content-Language:From:In-Reply-To:Content-Transfer-Encoding:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=gtkThhp7HAR2Inex6AHRIVWwfpvzSe5F6c2HI/CDFLI=;
	b=k5i7vkyA3Bkz4to4DMjST1PcmzDW2izUn+XRXfwhWlLdvogKQfhrm7lTxp51XyUS9+qi
	 F/UujglKJpPAVbAJVs+0GnzsBDUi+5WIaVB/T7sx6PlQD1EAzO1HjY4UlbRHYPWl3oCVL
	 sbybwi+aTaWATMYUuvBkAKbxmHL0JiFcqlQWDj5Lo+n5Pq6m0j1kmY++iiHUylOmT1sjz
	 LbJ7B7BLMA0NxocvEmcuy3MFaU+OVbkaaVxfDyyAuT3mbAEvwdFFo+Dfxtym4+kqmmqmw
	 bjtABFeGIi1mk6zOU8SDBHzhD+R9lgzHjVBEYELg12F2wjJdFBlT4DFDojSuJuQ6A+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=FIGBN9fR;
	arc=none smtp.remote-ip=210.118.77.12
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC8E606A31C
	for <linux-samsung-soc@vger.kernel.org>; Thu, 29 Oct 2026 08:27:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CC8E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=FIGBN9fR
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261029082752euoutp02b153504851bd374c081be24711fc3fd9~i8ret-PaT2653526535euoutp02U
	for <linux-samsung-soc@vger.kernel.org>; Thu, 29 Oct 2026 08:27:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261029082752euoutp02b153504851bd374c081be24711fc3fd9~i8ret-PaT2653526535euoutp02U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793262472;
	bh=gtkThhp7HAR2Inex6AHRIVWwfpvzSe5F6c2HI/CDFLI=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=FIGBN9fReDJodzfMzBXaOENYqA6b4tTsue6GFNMj62QZ5y3M+Nw4b3DLcC0qOklA2
	 IZcAIk+OEP4qtBJ4ZqoEKPvu5V8q1vWtmxRYj63v60IHrWc8EWtrQFjuh209vGUaE2
	 mbLDKIybckrKXXv1l/Uex5TI7ki9ZhULmmnTFtd0=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261029082751eucas1p2453c151aaaaf4dc156fecaa44b339ef2~i8reQdPDF1008610086eucas1p2d;
	Thu, 29 Oct 2026 08:27:51 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261029082750eusmtip168d8b64350b4dc54d7804c97473cdeee~i8rdAMflV3276632766eusmtip1K;
	Thu, 29 Oct 2026 08:27:50 +0000 (GMT)
Message-ID: <fa68308d-07f5-4a62-9e18-a306a5751e43@samsung.com>
Date: Thu, 29 Oct 2026 09:27:49 +0100
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 1/3] drm/bridge: analogix_dp: deassert DP_PHY_PD on
 power-on for exynos
To: tb@a-marquet.fr, Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
	Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
	<jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli
	<luca.ceresoli@bootlin.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Jingoo Han <jingoohan1@gmail.com>, Inki Dae
	<inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin
	Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar
	<alim.akhtar@samsung.com>, Douglas Anderson <dianders@chromium.org>, Jessica
	Zhang <jesszhan0024@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	Lukas Timmermann <linux@timmermann.space>, Henrik Grimler
	<henrik@grimler.se>, Hendrik Noack <hendrik-noack@gmx.de>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20261027-drm-misc-next-manta-auxbus-v1-1-3a45c3cf531d@a-marquet.fr>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20261029082751eucas1p2453c151aaaaf4dc156fecaa44b339ef2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261027120921eucas1p2af4aec7a911cbb07018a91fcf82a8c32
X-EPHeader: CA
X-CMS-RootMailID: 20261027120921eucas1p2af4aec7a911cbb07018a91fcf82a8c32
References: <20261027-drm-misc-next-manta-auxbus-v1-0-3a45c3cf531d@a-marquet.fr>
	<CGME20261027120921eucas1p2af4aec7a911cbb07018a91fcf82a8c32@eucas1p2.samsung.com>
	<20261027-drm-misc-next-manta-auxbus-v1-1-3a45c3cf531d@a-marquet.fr>

On 27.10.2026 13:01, Alexandre Marquet via B4 Relay wrote:
> From: Alexandre Marquet <tb@a-marquet.fr>
>
> On exynos platforms at least, calling
> analogix_dp_set_analog_power_down() to power on (with enable=false) CH0
> to CH3 or the AUX bus currently produces no effect, unless the function
> is first called to power on everything (by setting block to POWER_ALL or
> ANALOG_TOTAL). The reason for this is that DP_PHY_PD being asserted
> (which is its default state) renders every other register bit
> ineffective.
>
> This is particularly an issue for AUX bus initialization, that tends to
> happen before anything else (e.g., to request EDID), and thus, before
> anything has any chance to request a power on of the whole analog
> section of the chip.
>
> This commit allows analogix_dp_set_analog_power_down() to power on any
> block, by deasserting DP_PHY_PD if needed.
>
> Signed-off-by: Alexandre Marquet <tb@a-marquet.fr>

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

Snow, Peach-Pit and Peach-Pi Chromebooks work fine with this change.

> ---
>  drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
> index c1344a3f013a..9f634d4e4793 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
> @@ -256,6 +256,19 @@ void analogix_dp_set_analog_power_down(struct analogix_dp_device *dp,
>  	if (dp->plat_data && analogix_dp_is_rockchip(dp->plat_data->dev_type))
>  		phy_pd_addr = ANALOGIX_DP_PD;
>  
> +	reg = readl(dp->reg_base + phy_pd_addr);
> +
> +	if (dp->plat_data && (dp->plat_data->dev_type == EXYNOS_DP)) {
> +		/* On exynos, register AUX_PD and CH[0-3]_PD have no effect if
> +		 * DP_PHY_PD is asserted. So, when powering any of them up, we
> +		 * need to deassert DP_PHY_PD first.
> +		 */
> +		if (!enable && (reg & DP_PHY_PD)) {
> +			reg &= ~DP_PHY_PD;
> +			reg |= AUX_PD | CH0_PD | CH1_PD | CH2_PD | CH3_PD;
> +		}
> +	}
> +
>  	switch (block) {
>  	case AUX_BLOCK:
>  		if (dp->plat_data && analogix_dp_is_rockchip(dp->plat_data->dev_type))
> @@ -263,7 +276,6 @@ void analogix_dp_set_analog_power_down(struct analogix_dp_device *dp,
>  		else
>  			mask = AUX_PD;
>  
> -		reg = readl(dp->reg_base + phy_pd_addr);
>  		if (enable)
>  			reg |= mask;
>  		else
> @@ -272,7 +284,6 @@ void analogix_dp_set_analog_power_down(struct analogix_dp_device *dp,
>  		break;
>  	case CH0_BLOCK:
>  		mask = CH0_PD;
> -		reg = readl(dp->reg_base + phy_pd_addr);
>  
>  		if (enable)
>  			reg |= mask;
> @@ -282,7 +293,6 @@ void analogix_dp_set_analog_power_down(struct analogix_dp_device *dp,
>  		break;
>  	case CH1_BLOCK:
>  		mask = CH1_PD;
> -		reg = readl(dp->reg_base + phy_pd_addr);
>  
>  		if (enable)
>  			reg |= mask;
> @@ -292,7 +302,6 @@ void analogix_dp_set_analog_power_down(struct analogix_dp_device *dp,
>  		break;
>  	case CH2_BLOCK:
>  		mask = CH2_PD;
> -		reg = readl(dp->reg_base + phy_pd_addr);
>  
>  		if (enable)
>  			reg |= mask;
> @@ -302,7 +311,6 @@ void analogix_dp_set_analog_power_down(struct analogix_dp_device *dp,
>  		break;
>  	case CH3_BLOCK:
>  		mask = CH3_PD;
> -		reg = readl(dp->reg_base + phy_pd_addr);
>  
>  		if (enable)
>  			reg |= mask;
> @@ -321,7 +329,6 @@ void analogix_dp_set_analog_power_down(struct analogix_dp_device *dp,
>  		else
>  			mask = DP_PHY_PD;
>  
> -		reg = readl(dp->reg_base + phy_pd_addr);
>  		if (enable)
>  			reg |= mask;
>  		else
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

