Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC5A270EA3;
	Mon,  1 Sep 2025 20:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756758095; cv=none; b=EVdJpjAEP3ZfhU8edEirdXsrNs7dL7lzM5q5Ol60ldmpxWVofoKtRZ0RHF4TGXfMFjWbJeXFKp4+Qk/7jyOkPlMMf5SNYldHoFK7iyyhdE89ogv3NSEY9ne4r8y3JIT2Fy++lQSUBSj/585m7K/jCBIHVHXAWsj1SfyljeQGl2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756758095; c=relaxed/simple;
	bh=zupmcbT7MYzC+6+FlkMyuP3znHTEX3ZeQyS/vH9i+Gs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bqC3yo1SE8NMyMICMmKkG75re+rZN5lWlIW6TFV5BFTY8RAuHGAa7HmfG18Ypljc/NnzKyMgIZBuaxt4KBV6qVmeqQYbZ06P/2wLwOu2LAod4t6PKaNmRBUx3g1KJ3/eYWq7gBvz48sOTBeChg0pzfZYK2on57gGoEpYyXIefjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EW+IGoms; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EW+IGoms"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9C65C4CEF0;
	Mon,  1 Sep 2025 20:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756758094;
	bh=zupmcbT7MYzC+6+FlkMyuP3znHTEX3ZeQyS/vH9i+Gs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EW+IGomsJAUChff9Gfgx3X5WbTf2EUQ+5T88BsXsDAWjg3VLClfaczOTrC4ltqKYm
	 1FcnaH9p0mlgM/q31XczwR0fdwMvgdHH8dXzkQLi+y2pu/o3wLP15oOZ7AQCMZ+TWu
	 64XhQLtlPKeElWy9r3O8Ilc7seDm0rx6MVCQ4+gwTXp3dDb+tGkY3rJZZ14ALGCvK2
	 030OxJ91/4dYE4PKW4ha0791/jnLi6GslFzimkfOEth2Gj0haXg6Q10XhSd3Ti+VtM
	 Z/t5RP/S8BlpP4ETgG4+Xd074Xso3ZjIcuO2a50T9DK/un/sjJzR5stW00O6B9z+D6
	 708z4g2CEN4kg==
Date: Mon, 1 Sep 2025 15:21:33 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, linux-kernel@vger.kernel.org,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	linux-samsung-soc@vger.kernel.org,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: mtd samsung-s3c2410: Drop S3C2410
 support
Message-ID: <175675809322.277369.1491301346340311064.robh@kernel.org>
References: <20250830-s3c-cleanup-nand-v1-0-05b99ef990fe@linaro.org>
 <20250830-s3c-cleanup-nand-v1-2-05b99ef990fe@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250830-s3c-cleanup-nand-v1-2-05b99ef990fe@linaro.org>


On Sat, 30 Aug 2025 19:01:10 +0200, Krzysztof Kozlowski wrote:
> Samsung S3C24xx family of SoCs was removed from the Linux kernel in the
> commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support"), in January
> 2023.  There are no in-kernel users of its compatibles.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/mtd/samsung-s3c2410.txt    | 56 ----------------------
>  1 file changed, 56 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

