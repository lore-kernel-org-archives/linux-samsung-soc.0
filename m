Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9462388E49;
	Fri, 18 Sep 2026 09:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789725264; cv=none; b=ZO9jZJGuY/cUQZYhZjzepEKGtwv5ARCfARYlNE/12v8qKruOcaMYHwHguqyas+amzMhOe7pvMMjDJkbBZgscn/6wqs87zff33MQLtXZeMg0jLPoAByb43QVAR6SLGTXfMnlWshmeIikDOHJ1uNw0OXueOcTKGi4Gc8W/GdzEoyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789725264; c=relaxed/simple;
	bh=4DQVg7VXqomEkAXtfIiLjI2bxs64Iz+9Da3k5xvjuNU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d/1rehu0uOso05CbQwoE+K5YiiPsw4NfW1VJbRLm3MhBqSZ/jGUIyI9XXelgCnvVn4mMbXwinkJpVP8n10nDfp4mFFAAidna04Kzft3Sqlcj5fHC5Y+2hVHRP9BsiYLMez2XyD3QSAp4ha4GH/ZbkKUILoKHJcjt8x5bFEypFf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XSpUbo6a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XSpUbo6a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E59E51F000FF;
	Fri, 18 Sep 2026 09:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789725261;
	bh=oPIGgBDhH03Eoz0mlE8Uu2/zfLPJIqNjxdqPk5XPMcM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XSpUbo6aq/Fg94VYY9JYLyXLx34uec7Fw47RkWYJ4pfm+uu78EGxeKVV6V69IV22H
	 5dZKgdRuaBMu3OM60N8HGkulPKH6/vQawO5YBLOnYKn/XwL6IQt+WDlFCsRnPXbuIx
	 p+y7H4+nyx29lm2fhzoKFznJyEuZyV73qidivvgmnFy84JDsde5qXN7jLc2xxc9Kd6
	 mg5/OoMT/wl61fJlFeBLYSb8Jqn2PcKmm5Ufj8+OHi369h+ziCnem36wKe9jKojjK7
	 DjFuO3q2jAv4lm1Uy/xp25sIyHuAJJn/Xf0WuiaCmfWqJMtpvaxm1LMsDheTyG/E5E
	 BJ8h1UhSH4RQg==
Date: Fri, 18 Sep 2026 11:54:16 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Selvarasu Ganesan <selvarasu.g@samsung.com>
Cc: peter.griffin@linaro.org, alim.akhtar@samsung.com, 
	gregkh@linuxfoundation.org, robh@kernel.org, conor+dt@kernel.org, Thinh.Nguyen@synopsys.com, 
	mani@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, jh0801.jung@samsung.com, h10.kim@samsung.com, 
	dh10.jung@samsung.com, akash.m5@samsung.com, hongpooh.kim@samsung.com, 
	eomji.oh@samsung.com, shijie.cai@samsung.com, muhammed.ali@samsung.com, 
	thiagu.r@samsung.com
Subject: Re: [PATCH v2 2/3] dt-bindings: usb: Introduce samsung,snps-dwc3
Message-ID: <20260918-burgundy-marmoset-of-focus-c9b9a7@quoll>
References: <20260916122229.2604003-1-selvarasu.g@samsung.com>
 <CGME20260916122354epcas5p401fd6470d6cef75951af732b03aa5970@epcas5p4.samsung.com>
 <20260916122229.2604003-3-selvarasu.g@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260916122229.2604003-3-selvarasu.g@samsung.com>

On Wed, Sep 16, 2026 at 05:52:28PM +0530, Selvarasu Ganesan wrote:
> +maintainers:
> +  - Krzysztof Kozlowski <krzk@kernel.org>
> +  - Selvarasu Ganesan <selvarasu.g@samsung.com>
> +
> +description:
> +  Describes the DWC3 USB controller block implemented on Samsung Exynos SoCs.
> +
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        const: samsung,snps-dwc3
> +  required:
> +    - compatible

This select is not needed.

> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - samsung,exynos8855-dwc3
> +      - const: samsung,snps-dwc3

And this fallback is not really accurate. Samsung does not have snps
device, because snps is a vendor. Anyway, generic fallbacks should go
away, drop, so you are left with samsung,exynos8855-dwc3 only.

Filename should be then samsung,exynos8855-dwc3.yaml.

> +
> +  reg:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    description: |
> +      Several clocks are used, depending on the variant. Typical ones are:
> +       - ref: Reference clock for SOF/ITP generation.
> +       - bus: Bus (APB) clock for register access.

You have only one variant, no? Or you mean one SoC has different
variants?

> +    minItems: 1
> +    maxItems: 4

Nope, you to list items.

> +
> +  clock-names:
> +    minItems: 1
> +    maxItems: 4
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +
> +allOf:
> +  - $ref: snps,dwc3-common.yaml#
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,exynos8855-dwc3
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 2
> +          maxItems: 2

How can it be two if you have ONLY one device in the binding and that
device has between 1 and 4?

This entire if is redundant, no? How many clocks do you actually have
there?

> +        clock-names:
> +          items:
> +            - const: ref
> +            - const: bus
> +
> +unevaluatedProperties: false

Best regards,
Krzysztof

