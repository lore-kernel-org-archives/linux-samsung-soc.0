Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794481706;
	b=VF185SZnGc+Jkomwh4U82T99kSrymmYEdOcvE+VIOSnAGWuHPTH6By6fuYZWog6vNVxL
	 UfLWIkEtkaY15PdCIJwaoKAEVA1YoV4QcDUlW/sQFGfbMKSmzIm2BQf/oH3b4M0V5Jln1
	 mW+HWH8y46SHILBqcHpdNlt9Gs1giv6Kth2LhOc96kdUh3Am04tm6IHqOicsmCm7BENlH
	 0zCDWwDlEEukUboQJlJdt1J38K7L4WTRBXMUEwPNNcYdva36v8/l9T+0rKcKAMj4LA1Kc
	 TNOn2Sz6UTZibxRXLkMRrFFPbV6ezbs1fCw7YHnYjLGrqpYqbKhNxm8zyiv1EZe9tLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794481706;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=CwOsftxfNPZqsPWmATYl8H3Jcuwt3wJErixQ5+qMlpE=;
	b=ykd+fLSKQS5xFbmU04Yw1oaINwbfoBy+XF2UkZvFibfQZj8Tu41JPIKDZ9U+mm5yw245
	 X+RJmCt2sbatP0sOSq2QGDoFyY+bS0A1mUmEVV1qCxrF5v3DNEAMmVrlLCtpdGFTbI4mz
	 9d9i4Iye+pxv+z2OIZMhMcdcHFT9KaktHcUE5xYHIp4X5qi/bp9y195DmQAYmkWJ5oJqz
	 UtpCtDOHb+75qwdQj7LvAnw+RDj1pJgGvFMXrK0WdILAr5BYfycwXjR+9jrW7+XrNk7Fr
	 KE/veMYr/ezh7SPkAp2rRKPsSiwo6bjb7dSaYLgwZ0M93Qc/I9U0roWH7zbFadmOzGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="DyW/n0qa";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADEB5606A327;
	Thu, 12 Nov 2026 11:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DyW/n0qa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B1711F00A05;
	Thu, 12 Nov 2026 11:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794481706;
	bh=CwOsftxfNPZqsPWmATYl8H3Jcuwt3wJErixQ5+qMlpE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DyW/n0qa91KOXYIdySgHj3eIEbcxiNLeNpFJQeJIhuco7rqZhcUrZWt85zW2HvkZ9
	 2wHcJEktysymXTF6HagokqiVhCbjwDWD8yix6rDxMSGsopa8pZHnoxnrvLe/8Hz+2u
	 /Oeg3+Wul0MlRp1g521fXX3TFW07X/L5HX5Qvh0aSubdGVt08DH7GwnuO2LSJ2KXau
	 RPAXXyI2D8ChNftplFJpDpNSn2iMeD5JkQihuDtFyl16gS3OoJJvQR25xqK55OoY+3
	 gzGIr1nwOPmi+95UfGmefDWE5eByHd4cmfi1D0Ti6MIdqFXLTfEYjZ7WsHvUTpW7GR
	 EzmSUwBmBxA8g==
Date: Thu, 12 Nov 2026 16:38:22 +0530
From: Vinod Koul <vkoul@kernel.org>
To: aidenisik@member.fsf.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] phy: exynos5-usbdrd: Add support for the Exynos5515
 usbdrd phy
Message-ID: <avWeJqbpbLcWgq_R@parshuram>
References: <20261022-for-next-lucky7-usb-phy-v1-0-2e47f8484bf4@member.fsf.org>
 <20261022-for-next-lucky7-usb-phy-v1-2-2e47f8484bf4@member.fsf.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261022-for-next-lucky7-usb-phy-v1-2-2e47f8484bf4@member.fsf.org>

On 22-10-26, 17:46, Aiden Isik via B4 Relay wrote:
> From: Aiden Isik <aidenisik@member.fsf.org>
> 
> The Exynos5515 USBDRD PHY is a USB PHY which supports USB Super-Speed
> and High-Speed. Add support for High-Speed (UTMI+) operation.
> 
> Signed-off-by: Aiden Isik <aidenisik@member.fsf.org>
> ---
>  drivers/phy/samsung/phy-exynos5-usbdrd.c | 43 ++++++++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
> 
> diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> index f10cf7b6e0aa..8718e8f01e46 100644
> --- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
> +++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> @@ -2075,6 +2075,46 @@ static const struct exynos5_usbdrd_phy_drvdata exynos5433_usbdrd_phy = {
>  	.n_regulators		= ARRAY_SIZE(exynos5_regulator_names),
>  };
>  
> +static const struct exynos5_usbdrd_phy_tuning exynos5515_tunes_utmi_postinit[] = {
> +	PHY_TUNING_ENTRY_PHY(EXYNOS850_DRD_HSPPARACON,
> +			     (HSPPARACON_TXVREF | HSPPARACON_TXRISE |
> +			      HSPPARACON_TXRES |
> +			      HSPPARACON_TXPREEMPPULSE |
> +			      HSPPARACON_TXPREEMPAMP |
> +			      HSPPARACON_TXHSXV | HSPPARACON_TXFSLS |
> +			      HSPPARACON_SQRX | HSPPARACON_OTG |
> +			      HSPPARACON_COMPDIS),
> +			     (FIELD_PREP_CONST(HSPPARACON_TXVREF, 15) |
> +			      FIELD_PREP_CONST(HSPPARACON_TXRISE, 3) |
> +			      FIELD_PREP_CONST(HSPPARACON_TXRES, 3) |
> +			      FIELD_PREP_CONST(HSPPARACON_TXPREEMPPULSE, 0) |
> +			      FIELD_PREP_CONST(HSPPARACON_TXPREEMPAMP, 3) |
> +			      FIELD_PREP_CONST(HSPPARACON_TXHSXV, 3) |
> +			      FIELD_PREP_CONST(HSPPARACON_TXFSLS, 3) |
> +			      FIELD_PREP_CONST(HSPPARACON_SQRX, 7) |
> +			      FIELD_PREP_CONST(HSPPARACON_OTG, 2) |
> +			      FIELD_PREP_CONST(HSPPARACON_COMPDIS, 7))),
> +	PHY_TUNING_ENTRY_LAST
> +};
> +
> +static const struct exynos5_usbdrd_phy_tuning *exynos5515_tunes[PTS_MAX] = {
> +	[PTS_UTMI_POSTINIT] = exynos5515_tunes_utmi_postinit,
> +};
> +
> +static const struct exynos5_usbdrd_phy_drvdata exynos5515_usbdrd_phy = {
> +	.phy_cfg		= phy_cfg_exynos850,
> +	.n_phy_cfg		= ARRAY_SIZE(phy_cfg_exynos850),

.n_phy_cfg does not exist.. Please fix this

-- 
~Vinod
