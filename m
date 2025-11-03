Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25ED92E8B6C;
	Mon,  3 Nov 2025 09:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762163913; cv=none; b=kMI9jWlACNFjLxYImW4keoR0Y98hV4HggzAUupYzwKGt08XovjiRnBLW1Yru7XCTQX31JU8FQCi23FG64sFMnJass+P90hN0B1zHJjTi2Fm1qEazdXLGoo4gJdP5kt/lGjJSFl42Jl0EZvY55/O/KCAy0ZC+YsADKKe43ji26+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762163913; c=relaxed/simple;
	bh=AQVt53EcUhGtycvRvdbhIy9l4ZVj1BQDK1Eh3TQzU3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LqxiGOh9qZ6D2zv18jiyZ4r9i3soJbc5Mkca5kCt2Zjy86MkvsjpyhykR5m43LToAiXPTRMI5pkkJgt9OZD1LU9igWLAxok389TUVYnLUpxZY0VsQbQtxq3uIM25q5fJ5zTZx+VUQHZXzIEkS4xAd7jcZR1pfrBbf+GNcbj4gJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TdTyXk64; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TdTyXk64"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2284CC4CEE7;
	Mon,  3 Nov 2025 09:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762163912;
	bh=AQVt53EcUhGtycvRvdbhIy9l4ZVj1BQDK1Eh3TQzU3U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TdTyXk64a6SoBF2/pJUMVlz5jU5aR1tzVMqXCULhfRj4pIkOvFOf6FIp+Ztipbk37
	 KceYPFct5Ya2Kr/NdS+C/NlBh8/5uvfFmh/skUwiiLLZHxvtaE8XEBITkduTZjiqxy
	 FwVsyV5BGaAFbsuJc08/jCym+PZLc5KVtgQrsSseXLgxRmvKcEn9Vx1YEdA/jZdY1A
	 RP64pPjO6lJfT3PZJANA13sTylaYqnIgJa4D+YlLvKrkrHF6q3FcRmG0VWT013FYEf
	 tigiuqxVdb4JSkLftXkezpKX6Snt1DXr9Cud3xLuGWk4Nqo0jZtCarQkDMX9fCiwxX
	 y27WIfxuUYpqg==
Date: Mon, 3 Nov 2025 10:58:30 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, 
	=?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, semen.protsenko@linaro.org, willmcvicker@google.com, 
	kernel-team@android.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/11] dt-bindings: hwinfo: samsung,exynos-chipid: add
 google,gs101 compatible
Message-ID: <20251103-economic-tuscan-mink-0ebfa1@kuoka>
References: <20251031-gs101-chipid-v1-0-d78d1076b210@linaro.org>
 <20251031-gs101-chipid-v1-1-d78d1076b210@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251031-gs101-chipid-v1-1-d78d1076b210@linaro.org>

On Fri, Oct 31, 2025 at 12:56:00PM +0000, Tudor Ambarus wrote:
> Google GS101 Chip ID references the nvmem cells from the OTP controller,
> it doesn't need a reg space. Add the google,gs101-chipid compatible.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  .../bindings/hwinfo/samsung,exynos-chipid.yaml     | 51 +++++++++++++++++++++-
>  1 file changed, 50 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml b/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
> index b9cdfe52b62ff3a365d61368c39db21facff6565..6d6260be02d47712ebf1e4d31973802e8340cdfe 100644
> --- a/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
> +++ b/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
> @@ -33,6 +33,16 @@ properties:
>                - samsung,exynosautov9-chipid
>                - samsung,exynosautov920-chipid
>            - const: samsung,exynos850-chipid
> +      - items:
> +          - const: google,gs101-chipid

That's a part of first enum at the beginning.

> +
> +  nvmem-cells:
> +    maxItems: 2
> +
> +  nvmem-cell-names:
> +    items:
> +      - const: product-id
> +      - const: chip-id
>  
>    reg:
>      maxItems: 1
> @@ -47,7 +57,46 @@ properties:
>  
>  required:
>    - compatible
> -  - reg
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            oneOf:

No, don't copy. It's just redundant. Just like the fallbacks under one
enum.

> +              - enum:
> +                  - samsung,exynos4210-chipid
> +                  - samsung,exynos850-chipid
> +              - items:
> +                  - enum:
> +                      - samsung,exynos5433-chipid
> +                      - samsung,exynos7-chipid
> +                      - samsung,exynos7870-chipid
> +                      - samsung,exynos8890-chipid
> +                  - const: samsung,exynos4210-chipid
> +              - items:
> +                  - enum:
> +                      - samsung,exynos2200-chipid
> +                      - samsung,exynos7885-chipid
> +                      - samsung,exynos8895-chipid
> +                      - samsung,exynos9610-chipid
> +                      - samsung,exynos9810-chipid
> +                      - samsung,exynos990-chipid
> +                      - samsung,exynosautov9-chipid
> +                      - samsung,exynosautov920-chipid
> +                  - const: samsung,exynos850-chipid
> +    then:

properties:
  nvmem-cells: false
  same for names

> +      required:
> +        - reg
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: google,gs101-chipid
> +    then:

reg: false, similarly.

> +      required:
> +        - nvmem-cells
> +        - nvmem-cell-names
>  
>  additionalProperties: false
>  
> 
> -- 
> 2.51.1.930.gacf6e81ea2-goog
> 
