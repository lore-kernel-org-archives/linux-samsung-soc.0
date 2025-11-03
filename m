Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A4E2FD677;
	Mon,  3 Nov 2025 10:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762164953; cv=none; b=UG0kpuPrJLYXs1CWy6BddJOJT/QJD3cOBR+DupfjvUEj0kpuiuVJ7ZGogvefYC+VJcek+Dn8aAlw/XcLP82qdjAXA0nyPWdDhL0hDslwopCTDF5Z3nYOC3Q5VNWD/dyLh8iBNs8pEbz+/2usn8URwuCbtsp4FkERLA9Igxp1asQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762164953; c=relaxed/simple;
	bh=dm7oH3nTgvJPBFEPHOn1ekJrOzWA9gbujJ2NtsgHXr4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qzn1ZNCTX17PLzJyBDt28jh+FarONQdvExvWWxH+XPTeG5X5yzcwLtrZstdXoPx+06leV2PH6ibSDRrujVxbOj2Ceurc+l6onq0e2ln8gM86DXwRRVYhIyX5QGjECRCW/n4cgODGGFTiCGGpYnwU4UXWtzE6XLOYoyIwVSRyQVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hH1Dit0w; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hH1Dit0w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD967C4CEE7;
	Mon,  3 Nov 2025 10:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762164953;
	bh=dm7oH3nTgvJPBFEPHOn1ekJrOzWA9gbujJ2NtsgHXr4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hH1Dit0wk9oiesrLwFJAlNmPS6aQvL3139fH7tJ34UCj2WovwcCoi9NLoPf2ixyro
	 2cRSsoSPwhvmhbgNM3oj989qyG+26Otryd/Z9ZvdhUUM0SYOrkolWmH86RJnwFRcnc
	 NavM7BTs9daY3y5gvblFMepkEsDBbnEJXfHPeKV9l3KxW9k3FpG+Rx3jg/MoQxYkY+
	 21XAIXykHIp7FFno9j7elmercX3zpYmZilRJZmGwUkI4/BGNuDKnUAHVyr9+qdRBgS
	 dmcycU6x/9I7LbITL272PNTxYhUkK88IkzThwCPV7bvsPdJlDh7hIxbQymY1wXFpaE
	 1PuIrt49nIbnQ==
Date: Mon, 3 Nov 2025 11:15:50 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, 
	=?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, semen.protsenko@linaro.org, willmcvicker@google.com, 
	kernel-team@android.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/11] soc: samsung: exynos-chipid: introduce
 match_data->get_chipid_info()
Message-ID: <20251103-polar-wasp-of-chivalry-9cd93f@kuoka>
References: <20251031-gs101-chipid-v1-0-d78d1076b210@linaro.org>
 <20251031-gs101-chipid-v1-5-d78d1076b210@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251031-gs101-chipid-v1-5-d78d1076b210@linaro.org>

On Fri, Oct 31, 2025 at 12:56:04PM +0000, Tudor Ambarus wrote:
> Newer SoCs, like GS101, don't have a dedicated Chip ID controller.

This would suggest that these are completely different devices and
should not be part of the same bindings. Actually bindings also
suggested this - changing programming model.

> The GS101 Chip ID info is available as part of the OTP controller
> registers, among other things. For GS101 we will read the Chip ID from
> the OTP controller using the nvmem API.
> 
> Extend the match_data with a get_chipid_info() method, to allow nvmem
> integration.
> 
> `struct exynos_chipid_info` is moved to the top of the file to avoid a
> forward declaration. The structure is extended with pointers to device
> and regmap to allow current implementation to obtain the regmap in the
> newly introduced exynos_chipid_get_regmap_chipid_info() method. The
> nvmem consumer support that will follow won't use the regmap, and
> instead will use the nvmem API. It will need the pointer to the device
> to report errors.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  drivers/soc/samsung/exynos-chipid.c | 35 ++++++++++++++++++++++-------------
>  1 file changed, 22 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
> index ab6bdf24a754a0faf974190c1fa1f99735cbef8e..7b1951f28e8d4958ab941af91dab4b0183ceda5f 100644
> --- a/drivers/soc/samsung/exynos-chipid.c
> +++ b/drivers/soc/samsung/exynos-chipid.c
> @@ -26,17 +26,21 @@
>  
>  #include "exynos-asv.h"
>  
> +struct exynos_chipid_info {
> +	struct regmap *regmap;
> +	struct device *dev;
> +	u32 product_id;
> +	u32 revision;
> +};
> +
>  struct exynos_chipid_variant {
> +	int (*get_chipid_info)(const struct exynos_chipid_variant *data,
> +			       struct exynos_chipid_info *exynos_chipid);
>  	unsigned int rev_reg;		/* revision register offset */
>  	unsigned int main_rev_shift;	/* main revision offset in rev_reg */
>  	unsigned int sub_rev_shift;	/* sub revision offset in rev_reg */
>  };
>  
> -struct exynos_chipid_info {
> -	u32 product_id;
> -	u32 revision;
> -};
> -
>  static const struct exynos_soc_id {
>  	const char *name;
>  	unsigned int id;
> @@ -80,13 +84,19 @@ static const char *product_id_to_soc_id(unsigned int product_id)
>  	return NULL;
>  }
>  
> -static int exynos_chipid_get_chipid_info(struct regmap *regmap,
> -		const struct exynos_chipid_variant *data,
> +static int exynos_chipid_get_regmap_chipid_info(const struct exynos_chipid_variant *data,
>  		struct exynos_chipid_info *exynos_chipid)
>  {

This function now gets both regmap and chip info, that's too much.
Probably all ASV and regmap getting should be somehow split/customized
per variant.

I don't know yet, need to read rest of patches.

Best regards,
Krzysztof

