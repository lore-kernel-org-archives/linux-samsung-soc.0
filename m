Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1526D1D6AA;
	Sun,  5 Jan 2025 09:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736068730; cv=none; b=Iv+kRowc1GqitCXQ7b+rOJpDHxUjOjD6A7XjOcEIOID59PFs8IqGVG3yyePNHhExOn8vsbQLrano5DA6IWf84tXtvEyGqX5Tuevvtx0cIM1Qhp4Ao19tADoarH06rnH3UjmcVkzFxIC+vNtvgCiKVli2g8kEQzoem6vOQSQ6jEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736068730; c=relaxed/simple;
	bh=TdK3l02Mvjr7icEQxVdmSFVx/esDQGcdPzwQMMKF92s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tZyM5l/ngFXn6nIT3okDjwr1P3s7A4GGG0ppVHxo4WwMOUYLzPW9LHH234ksRyEaT97fvfx4OgQWsHZRT4TXDK59FLQBnCbG39p0QG42CWYU+q1vKuT4MoFhIRuU9OXIhxEbqi6jPLuSt3zxdZzQ+L8qoxPcA/DN+k8M4Q9PAg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZdqrsbdC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZdqrsbdC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 974DBC4CED0;
	Sun,  5 Jan 2025 09:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736068729;
	bh=TdK3l02Mvjr7icEQxVdmSFVx/esDQGcdPzwQMMKF92s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZdqrsbdCuBt4PpJLGpaR7sak3pbZVAI6sMXUvzR7TrGeH6fymOz2KgZBqS35eOhfj
	 fbv/Z5Z5UzeSM7I8KU6pn2tq7FNXNdQE/kiSmE4VUwXouM155IbUomDi287qVf7kh/
	 6erXeZ+8NnrIWdqC3CVQvo7TkWNAsQTvQw9HLomFFykYNNhKz6QqYjo9ZYd7PQE4Lh
	 VHUlwvzeJ4M+Ch9PAPnuIX5wpWGIett2FLz5vcWMxcjdG9sofSThbTvtxe1eUC7bIu
	 boImhCVACu6v/XLEsE2wSwMhLm3PiZNfOfJrtD3O60QXTfepe3MskBj/D4Hy9uXyXp
	 R48I2CPpNXoww==
Date: Sun, 5 Jan 2025 10:18:45 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Sam Protsenko <semen.protsenko@linaro.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: soc: samsung: usi: add USIv1 and
 samsung,exynos8895-usi
Message-ID: <nk7rifc5mcsdlmgpncrpoumerajrpdekxpvqwwe2hz4b63rgci@flowtxwchm7y>
References: <20250104162915.332005-1-ivo.ivanov.ivanov1@gmail.com>
 <20250104162915.332005-3-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250104162915.332005-3-ivo.ivanov.ivanov1@gmail.com>

On Sat, Jan 04, 2025 at 06:29:14PM +0200, Ivaylo Ivanov wrote:
>  
>    reg:
>      maxItems: 1
> @@ -64,7 +75,6 @@ properties:
>  
>    samsung,mode:
>      $ref: /schemas/types.yaml#/definitions/uint32
> -    enum: [0, 1, 2, 3]

Widest constraints stay here, so minimum/maximum.

>      description:
>        Selects USI function (which serial protocol to use). Refer to
>        <include/dt-bindings/soc/samsung,exynos-usi.h> for valid USI mode values.
> @@ -101,18 +111,42 @@ required:
>    - samsung,sysreg
>    - samsung,mode
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - samsung,exynos850-usi
> +    then:
> +      properties:
> +        reg:
> +          maxItems: 1
> +
> +        samsung,mode:
> +          enum: [0, 1, 2, 3]
> +
> +      required:
> +        - reg
> +
> +    else:
> +      properties:
> +        reg: false
> +        samsung,clkreq-on: false
> +
> +        samsung,mode:
> +          enum: [4, 5, 6, 7, 8, 9, 10]

Is it really true? Previously for example GS101 had values 0-3, now you
claim has values 4-10, so an ABI change without explanation.

> +
>  if:

Missing allOf:

>    properties:
>      compatible:
>        contains:
>          enum:
>            - samsung,exynos850-usi
> +          - samsung,exynos8895-usi

Effect is not readable and not correct. You have two if:then:else.
Usually it is easier to just have separate if: for each group of
variants and define/constrain complete for such group within its if:.

>  
>  then:
>    properties:
> -    reg:
> -      maxItems: 1
> -
>      clocks:
>        items:
>          - description: Bus (APB) clock
> @@ -122,16 +156,13 @@ then:
>        maxItems: 2
>  
>    required:
> -    - reg
>      - clocks
>      - clock-names
>  
>  else:
>    properties:
> -    reg: false
>      clocks: false
>      clock-names: false
> -    samsung,clkreq-on: false
>  
>  additionalProperties: false
>  
> diff --git a/include/dt-bindings/soc/samsung,exynos-usi.h b/include/dt-bindings/soc/samsung,exynos-usi.h
> index a01af169d..4c077c9a8 100644
> --- a/include/dt-bindings/soc/samsung,exynos-usi.h
> +++ b/include/dt-bindings/soc/samsung,exynos-usi.h
> @@ -13,5 +13,12 @@
>  #define USI_V2_UART		1
>  #define USI_V2_SPI		2
>  #define USI_V2_I2C		3
> +#define USI_V1_NONE		4

Drop, it is already there.

> +#define USI_V1_I2C0		5
> +#define USI_V1_I2C1		6
> +#define USI_V1_I2C0_1		7
> +#define USI_V1_SPI		8

Drop

> +#define USI_V1_UART		9

Drop

> +#define USI_V1_UART_I2C1	10


Best regards,
Krzysztof

