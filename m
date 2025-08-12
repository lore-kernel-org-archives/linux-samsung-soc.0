Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001D02EE5FE;
	Tue, 12 Aug 2025 14:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755008121; cv=none; b=XbCM6VnXEsugp3/eZIG0egIM49X+cdLFFveWeI4y2IdkCLxdDb+AgoRBm0w1EnhE2EMIEoQFjpUQoUTXDxGBw7qA9BjpJKNkgv1Z+zzRhbraigoZMDJ1brd/oEV1siXoKqtxZD2ldtzXacH4hp/kg4v8EBYMCdkaHm1AsXPrCiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755008121; c=relaxed/simple;
	bh=w7+yVouNu4e07ndbQI5R/ESPidCEgnhCvVvoIskNZ1o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E4Sum5595zp753t47zAqG4WrGsRTMU+2tPT/5XErPkne5Gedcm8nb4CxrDUrrUEGYwaFA9DUL/QaRwcUfCnBSCFvnUqAnlWqnU0je72S5aaDRToaspTNIcfdydpI+yy+N4IFFoKKEVfVPdeu8r9oXutK3ir9tMZPeAtsAmM4JjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZVSkDOp7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZVSkDOp7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B94BC4CEF0;
	Tue, 12 Aug 2025 14:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755008120;
	bh=w7+yVouNu4e07ndbQI5R/ESPidCEgnhCvVvoIskNZ1o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZVSkDOp7TGFY8qTzD3/ueAnokWbRqIhNjIf3yT3tGKpLWBAQfhe1eHdSUVH4A9aNf
	 43nKMj+QoXfD4N5hbUkiHsEBUoGx/2Xj8/DU/kmIK3MtV48P0FC3JH32upqd48Et6r
	 RLTFstH59k/O49ndEKOrP4NQ5VDlVnatFOEZsJvj1cukwZ0p1vDngo+jkRTU01PNMs
	 A4l9hJsevQ5hPr8XIR451S/yrJqwEg+YmC51nsVhxTS2qKPnfP57LH1OW61ofV5FIS
	 V4lya1lyIousHF2WpRvfPynjoffb8bspyTT522Z/hkexyupY233NV+YLEiH20F3ZTR
	 RFN1LZPbuAFGg==
Date: Tue, 12 Aug 2025 19:45:16 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pritam Manohar Sutar <pritam.sutar@samsung.com>
Cc: kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, alim.akhtar@samsung.com,
	andre.draszik@linaro.org, peter.griffin@linaro.org,
	kauschluss@disroot.org, ivo.ivanov.ivanov1@gmail.com,
	igor.belwon@mentallysanemainliners.org, m.szyprowski@samsung.com,
	s.nawrocki@samsung.com, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, rosa.pila@samsung.com,
	dev.tailor@samsung.com, faraz.ata@samsung.com,
	muhammed.ali@samsung.com, selvarasu.g@samsung.com
Subject: Re: [PATCH v5 2/6] phy: exynos5-usbdrd: support HS phy for
 ExynosAutov920
Message-ID: <aJtMdHcidETZyiIp@vaman>
References: <20250805115216.3798121-1-pritam.sutar@samsung.com>
 <CGME20250805114310epcas5p459aa232884d22501f5fefe42f239fecc@epcas5p4.samsung.com>
 <20250805115216.3798121-3-pritam.sutar@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250805115216.3798121-3-pritam.sutar@samsung.com>

On 05-08-25, 17:22, Pritam Manohar Sutar wrote:
> Enable UTMI+ phy support for this SoC which is very similar to what
> the existing Exynos850 supports.
> 
> Add required change in phy driver to support HS phy for this SoC.
> 
> Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
> ---
>  drivers/phy/samsung/phy-exynos5-usbdrd.c    | 123 ++++++++++++++++++++
>  include/linux/soc/samsung/exynos-regs-pmu.h |   2 +
>  2 files changed, 125 insertions(+)
> 
> diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> index dd660ebe8045..5400dd23e500 100644
> --- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
> +++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> @@ -2054,6 +2054,126 @@ static const struct exynos5_usbdrd_phy_drvdata exynos990_usbdrd_phy = {
>  	.n_regulators		= ARRAY_SIZE(exynos5_regulator_names),
>  };
>  
> +static int exynosautov920_usbdrd_phy_init(struct phy *phy)
> +{
> +	struct phy_usb_instance *inst = phy_get_drvdata(phy);
> +	struct exynos5_usbdrd_phy *phy_drd = to_usbdrd_phy(inst);
> +	int ret;
> +
> +	ret = clk_bulk_prepare_enable(phy_drd->drv_data->n_clks, phy_drd->clks);
> +	if (ret)
> +		return ret;
> +
> +	/* Bypass PHY isol */
> +	inst->phy_cfg->phy_isol(inst, false);
> +
> +	/* UTMI or PIPE3 specific init */
> +	inst->phy_cfg->phy_init(phy_drd);
> +
> +	clk_bulk_disable_unprepare(phy_drd->drv_data->n_clks, phy_drd->clks);
> +
> +	return 0;
> +}
> +
> +static int exynosautov920_usbdrd_phy_exit(struct phy *phy)
> +{
> +	struct phy_usb_instance *inst = phy_get_drvdata(phy);
> +	struct exynos5_usbdrd_phy *phy_drd = to_usbdrd_phy(inst);
> +	int ret = 0;

Superfluous init..

> +
> +	ret = clk_bulk_prepare_enable(phy_drd->drv_data->n_clks, phy_drd->clks);
> +	if (ret)
> +		return ret;
> +
> +	exynos850_usbdrd_phy_exit(phy);
> +
> +	/* enable PHY isol */
> +	inst->phy_cfg->phy_isol(inst, true);
> +
> +	clk_bulk_disable_unprepare(phy_drd->drv_data->n_clks, phy_drd->clks);
> +
> +	return 0;
> +}
> +
> +static int exynosautov920_usbdrd_phy_power_on(struct phy *phy)
> +{
> +	int ret;
> +	struct phy_usb_instance *inst = phy_get_drvdata(phy);
> +	struct exynos5_usbdrd_phy *phy_drd = to_usbdrd_phy(inst);

Reverse chrsitmas tree pls

-- 
~Vinod
