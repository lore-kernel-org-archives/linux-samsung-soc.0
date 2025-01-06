Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C0D4207F;
	Mon,  6 Jan 2025 06:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736145112; cv=none; b=cIcYwUsLUZRx3L+vGJw7rrp+okG7zrm61h+n/AqE8FwLnNS9KN5FouddycXNVppKQWX3N5Qj4Ldu/jMfI6sg05CI1BKtvNvFP+j5/drC6n5QHFEz9NjIJGt545nk1fUJ7TzhcNGqo6danX3PxoFhCQ33P8k3hDkpHnSNTVosGFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736145112; c=relaxed/simple;
	bh=ReehICcFsuYHM6emN6qSRF1/JQg8rc/eMPB/Mcew+p8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nt8wx/WuOM7fkXnGvNujCGNI/vekeQcrNNVQzgerj5GstJeKGldh6lcozLC+gU7iOz6tmk3oBFCh1Qv8HFGmleekPd9/+lS/xrRH/6X10Jzo1tbds8Qbrnw2biYPjEwjwp2fliE2/6YWEH/A/sDvE+UwhxkvE5FkHE9A6Fs40Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EPk757Bf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EPk757Bf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA7EAC4CED2;
	Mon,  6 Jan 2025 06:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736145111;
	bh=ReehICcFsuYHM6emN6qSRF1/JQg8rc/eMPB/Mcew+p8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EPk757BfT18qzAm5sUY/+AtFy9GvFHRukbmAW/H5b5LiaLElXOYwwCIG98qwTfZSw
	 5+KkXNfo9wu0WKjNkL+U2/TNKmvcH1yObs9UTGpqMtZ2mMFrg7otJ+oafBwd/pOqVA
	 8+YbOdJ1cYb29Y+jq4LagQYZQ3go6VRkMgipryyHTsTDffUKtou8nrG6rwnzFvBY7e
	 fBUMPZqGklvovRaSAIlN+7g8Eyw5s48s7WnbmPftTsTTRFPgkUJoZgQLeFWvNRPAW8
	 ErqOy/TZAQQ0wKDVlt31tNM2xVTje0DRW81iQ1o6a0x/2IiROIi844i2u1NoxofowX
	 ErWB/e03oPT3A==
Date: Mon, 6 Jan 2025 07:31:48 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Sam Protsenko <semen.protsenko@linaro.org>, 
	Peter Griffin <peter.griffin@linaro.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] dt-bindings: soc: samsung: usi: add USIv1 and
 samsung,exynos8895-usi
Message-ID: <kgcgxhfwxdrja6djiv45f45pqwbtwnd2bw63xcsyo2msewkzfr@qypxgl2a7gyg>
References: <20250105160346.418829-1-ivo.ivanov.ivanov1@gmail.com>
 <20250105160346.418829-3-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250105160346.418829-3-ivo.ivanov.ivanov1@gmail.com>

On Sun, Jan 05, 2025 at 06:03:44PM +0200, Ivaylo Ivanov wrote:
>    samsung,mode:
>      $ref: /schemas/types.yaml#/definitions/uint32
> -    enum: [0, 1, 2, 3]
> +    enum: [0, 1, 2, 3, 4, 5, 6]
>      description:
>        Selects USI function (which serial protocol to use). Refer to
>        <include/dt-bindings/soc/samsung,exynos-usi.h> for valid USI mode values.
> @@ -101,37 +111,62 @@ required:
>    - samsung,sysreg
>    - samsung,mode
>  
> -if:
> -  properties:
> -    compatible:
> -      contains:
> -        enum:
> -          - samsung,exynos850-usi
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - google,gs101-usi
> +              - samsung,exynos850-usi
> +              - samsung,exynosautov9-usi
> +              - samsung,exynosautov920-usi

I made mistake during last review - the binding had a confusing "else"
here, but that else was a no-op. All existing compatibles are fallbacked
to samsung,exynos850-usi, so previous code "contains: enum:
samsung,exynos850-usi" was covering everything.

You can drop other variants and keep the original samsung,exynos850-usi
only.

> +
> +    then:
> +      properties:
> +        reg:
> +          maxItems: 1
> +
> +        clocks:
> +          items:
> +            - description: Bus (APB) clock
> +            - description: Operating clock for UART/SPI/I2C protocol
> +
> +        clock-names:
> +          maxItems: 2
> +
> +        samsung,mode:
> +          enum: [0, 1, 2, 3]
> +
> +      required:
> +        - reg
> +        - clocks
> +        - clock-names
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - samsung,exynos8895-usi

I don't see where this compatible is documented.

> +
> +    then:
> +      properties:
> +        reg: false
> +
> +        clocks:
> +          items:
> +            - description: Bus (APB) clock
> +            - description: Operating clock for UART/SPI protocol

Best regards,
Krzysztof

