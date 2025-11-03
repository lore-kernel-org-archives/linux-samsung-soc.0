Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D094B14A60F;
	Mon,  3 Nov 2025 10:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762164340; cv=none; b=uKRR9WnIijnh8JDqrbL9fXjHNqL8wy2zMk6zFYxrs3h7O3FqkAVOsp7ijHvipKtjJlmtRw+6cO2gkSEyn/nPWdl0L8AstGdxLfrJVPRWkx8EVI7UZaDpc4qiOxVNGBCVjdDEJGrzkxuER4M6wvPQ2A736WqtU1PPCf0u8zctenA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762164340; c=relaxed/simple;
	bh=r5ZAahRc6Rn7ZJ6STU/KlsskUpNdQLHqPWsUeMUM35M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K3YkS4/7W2AXlqIIy2uerU5/aezoB0lGrfS6nCW04jtbd20zBzKDPTv+GRiSdUBZeAvzybuE3/5QVQIrFUWlI9HQPkkhG6N+UDjRQUp6Ht7keUdkMzxSNCaS7z5pn4nCER+ljswgO8rdNSJpg+XRRlO1XibFINOCfCmuAgEafgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eL2lC8rm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eL2lC8rm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E9E4C4CEE7;
	Mon,  3 Nov 2025 10:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762164340;
	bh=r5ZAahRc6Rn7ZJ6STU/KlsskUpNdQLHqPWsUeMUM35M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eL2lC8rmaq3O60XkiGTmkNNrnvk5bW+DcBQt4+I+zrOPAFhoS9KuvvFe2U7Rxbmn4
	 34oXI5MPb3x8rohfCg0fSGKA7G2RwdqwlK7vDJ3Fj5q7Dg5ycOSitET8XcMlPC0tCH
	 ktUcd/T3lYGGWtvNqqsZDuu1G/fyFOs3pbPGd8TRKAltwkPECc5arOxFvLHJjWrNIv
	 JeUXSLJ5IqVO7RQK2LOSg2Sas+Z/wvGF7Cbwc14NSDYVoi00vhBmzMEKOxHPyc7od/
	 oXSWLvQV7hFFGw4R8IwigjbdH/Roobxvjvc/K/c4v6mMuXeKOqSHxrIgBfHzN985d1
	 QKnj0fWt/Z9tw==
Date: Mon, 3 Nov 2025 11:05:38 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, 
	=?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, semen.protsenko@linaro.org, willmcvicker@google.com, 
	kernel-team@android.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/11] soc: samsung: exynos-chipid: refer to match->data
 as data
Message-ID: <20251103-spoonbill-of-incredible-resistance-d5befc@kuoka>
References: <20251031-gs101-chipid-v1-0-d78d1076b210@linaro.org>
 <20251031-gs101-chipid-v1-4-d78d1076b210@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251031-gs101-chipid-v1-4-d78d1076b210@linaro.org>

On Fri, Oct 31, 2025 at 12:56:03PM +0000, Tudor Ambarus wrote:
> Be consistent across the driver and refer to match->data as data.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  drivers/soc/samsung/exynos-chipid.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
> index f5107b8b339e8884d6a67a80650a95441510c66c..ab6bdf24a754a0faf974190c1fa1f99735cbef8e 100644
> --- a/drivers/soc/samsung/exynos-chipid.c
> +++ b/drivers/soc/samsung/exynos-chipid.c
> @@ -106,7 +106,7 @@ static int exynos_chipid_get_chipid_info(struct regmap *regmap,
>  
>  static int exynos_chipid_probe(struct platform_device *pdev)
>  {
> -	const struct exynos_chipid_variant *drv_data;
> +	const struct exynos_chipid_variant *data;

I would prefer name drv_data, to mark clearly this is driver data.
Sometimes driver state container is called "data".

Best regards,
Krzysztof

