Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05B73909A2;
	Mon, 13 Apr 2026 22:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776119104; cv=none; b=PlLFSctSuDGApH8T43G4wcBf1Eijd5h/TOStmDa7AUDT4JO2o24M3QVXsInXCToo9g6T4PUH98AvkD9CZZTHE31Z/xSKzF23pxY2UdPug5gn9OIi5IoANzOAUaRiuDOeGWBnrk7iRabPD8BvKgzAPmSteKEMGpdugn6NjMeN4WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776119104; c=relaxed/simple;
	bh=Ut/oQBbdrKL/HKzzwqF5uKl3t0Tq44YB/2vrPO74Pdg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nrPMPc2Hc2NL74UDm2EWYPVFEogEXgZ6RnjyJ0eQ6KJ3n9nJE4DTFWJT4EXjKZDOOeq4/XzrpEIwOQ7rdrQAvhUG0aUhNdCEK3veaPaN4veyANFhtWO2X4DreicMOMlU5cIb3vWGJ9g44FLG7DnpBQAss6TUluoZqklebhdm104=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VrABTquf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VrABTquf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C18EC2BCB3;
	Mon, 13 Apr 2026 22:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776119103;
	bh=Ut/oQBbdrKL/HKzzwqF5uKl3t0Tq44YB/2vrPO74Pdg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VrABTqufmtyESUPGG0WBWPGrchpdlesDdmvZeoVHqytKV9rF+2j1HYkF/H2OwDmGB
	 nVzdzAtJdOmD+FyvtExDIj6OCFvcSzuD1hv8H0rVGgvWASDquH0OD9GOlzk2u1JkA9
	 dwfrGJDpJ1r6qm4Lu1jT3Td3Dy6arvkf7sAE3o9a83gTxLo5u0/nf1f4fvGEcoTRSN
	 pDD5ESotBpFyGCRVmvp6vUpVh6rOinzmRrehztxg//l4hfZpq4Y/vX+U2mLQsM5LMM
	 UiCb7QgMDKf43lPlPc05O3aMqU0ukd+jW6iZZes/vOGuvvo519sUj8gelDuV8iFofz
	 24GQJdRgzEUFw==
Date: Mon, 13 Apr 2026 17:25:01 -0500
From: Rob Herring <robh@kernel.org>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Sam Protsenko <semen.protsenko@linaro.org>,
	linux-samsung-soc@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/7] dt-bindings: soc: samsung: exynos-pmu: deprecate
 google,pmu-intr-gen-syscon
Message-ID: <20260413222501.GA3642201-robh@kernel.org>
References: <20260401-exynos850-cpuhotplug-v2-0-c5a760a3e259@linaro.org>
 <20260401-exynos850-cpuhotplug-v2-3-c5a760a3e259@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401-exynos850-cpuhotplug-v2-3-c5a760a3e259@linaro.org>

On Wed, Apr 01, 2026 at 05:51:56AM +0100, Alexey Klimov wrote:
> The generic property samsung,pmu-intr-gen-syscon should be used
> by default for Samsung Exynos PMU hardware blocks. Update binding
> document to add deprecated flag for google,pmu-intr-gen-syscon
> property.
> While at this, also add dependency to not allow usage of both
> above mentioned properties in the same time.
> 
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
> index 92acdfd5d44e..1ff1a8729989 100644
> --- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
> +++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
> @@ -119,6 +119,7 @@ properties:
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description:
>        Phandle to PMU interrupt generation interface.
> +    deprecated: true

Deprecating doesn't really help. We still have to support both forever. 

>  
>  required:
>    - compatible
> @@ -207,6 +208,11 @@ allOf:
>        properties:
>          samsung,pmu-intr-gen-syscon: false
>  
> +dependencies:
> +  google,pmu-intr-gen-syscon:
> +    not:
> +      required: ['samsung,pmu-intr-gen-syscon']

Disallowing both means you couldn't update the DT in a compatible way 
where you have both properties for some transistion period.

Rob
