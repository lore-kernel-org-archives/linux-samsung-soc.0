Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867F81E2832;
	Mon, 21 Oct 2024 09:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729503538; cv=none; b=HbTDInkqFxKcrX868sDskg8juxBIHD1xMQTYJo2iOXtvZWJaPZSnH7OcoBYFtsYXmPzj2pPKy+FdMjoYPIP4ACJmYPYR5HKP/ZO/X7aXhpRqRw7tmVv15296yrx/tBBZF1fqDhm2u6hMDLZ7fSbQY04mMekPNaR2pXK3Prg9LfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729503538; c=relaxed/simple;
	bh=iPJiMNEykmygKK9U7LLgYn4fbQamSlXN2pkxhxKga+o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LAxE4IzymhBdPLPLHI0K5CetFb83IJWdzexRn0kmdyNTzyCfDOJnbP1k3U4ZcjvvrnkBrAWpwmP1l6D//wpqiDEY06YBA706sp4oX+cLn44f0drq0qxCcVQXj27224uBQB9Dlm/3Tdf/uetS349tZ5TP8b2BkuItozUl9cwEhbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cx21eOuq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cx21eOuq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C8C4C4CEC7;
	Mon, 21 Oct 2024 09:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729503538;
	bh=iPJiMNEykmygKK9U7LLgYn4fbQamSlXN2pkxhxKga+o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cx21eOuqRk1InQWTmPOs2TZbWRD9c/VT/y6gx2sWJIaa4MwoZbIuhkrL1Z6trEIVI
	 BpUyn7KqxAeZh9ACBpXRl4Bfni+36Zi3VqfPWG9A4eE/zedguU/rfmFw/aySLPxNx3
	 /EV8wB5gvTT7igs5V7CC7MVfmWmC11FyvMmm9lfZfn+qSMTVYCIn7K+/QtqnbsCEfh
	 Jw0G+GvGanbcl5Fwd2IttGgzSgj/AIrHxr+zZP/RNqs6SbpmFTc9t5eI1lL5KGkAvg
	 Pd+Gyghc4n+HiYgDLb9jZXmFjeG1v1dYMvYZeAIswjGOrF7aaCn8YwTy5rCET59+iq
	 Yps5bnsaVADqA==
Message-ID: <75e0b0a3-6b6c-427e-a748-329dc1237da7@kernel.org>
Date: Mon, 21 Oct 2024 11:38:49 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] dt-bindings: clock: Add Exynos8895 SoC CMU
 bindings
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20241020174825.375096-1-ivo.ivanov.ivanov1@gmail.com>
 <20241020174825.375096-2-ivo.ivanov.ivanov1@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20241020174825.375096-2-ivo.ivanov.ivanov1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/10/2024 19:48, Ivaylo Ivanov wrote:
> Provide dt-schema documentation for Exynos8895 SoC clock controller.
> Add device tree clock binding definitions for the following CMU blocks:
>  - CMU_TOP
>  - CMU_FSYS0/1
>  - CMU_PERIC0/1
>  - CMU_PERIS
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>


A nit, subject: drop second/last, redundant "bindings". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

> +
> +title: Samsung Exynos8895 SoC clock controller
> +
> +maintainers:
> +  - Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> +  - Chanwoo Choi <cw00.choi@samsung.com>
> +  - Krzysztof Kozlowski <krzk@kernel.org>
> +  - Sylwester Nawrocki <s.nawrocki@samsung.com>
> +  - Tomasz Figa <tomasz.figa@gmail.com>

Please drop Sylwester and Tomasz, they opted out from clocks.

> +
> +description: |
> +  Exynos8895 clock controller is comprised of several CMU units, generating
> +  clocks for different domains. Those CMU units are modeled as separate device
> +  tree nodes, and might depend on each other. The root clock in that root tree
> +  is an external clock: OSCCLK (26 MHz). This external clock must be defined
> +  as a fixed-rate clock in dts.
> +
> +  CMU_TOP is a top-level CMU, where all base clocks are prepared using PLLs and
> +  dividers; all other clocks of function blocks (other CMUs) are usually
> +  derived from CMU_TOP.
> +
> +  Each clock is assigned an identifier and client nodes can use this identifier
> +  to specify the clock which they consume. All clocks available for usage
> +  in clock consumer nodes are defined as preprocessor macros in
> +  'include/dt-bindings/clock/samsung,exynos8895.h' header.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - samsung,exynos8895-cmu-top
> +      - samsung,exynos8895-cmu-fsys0
> +      - samsung,exynos8895-cmu-fsys1
> +      - samsung,exynos8895-cmu-peric0
> +      - samsung,exynos8895-cmu-peric1
> +      - samsung,exynos8895-cmu-peris

Alphabetical order.

> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 16
> +
> +  clock-names:
> +    minItems: 1
> +    maxItems: 16
> +
> +  "#clock-cells":
> +    const: 1
> +
> +  reg:
> +    maxItems: 1
> +

required: block should go here (I know that other Samsung clock bindings
do not follow this convention).

> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,exynos8895-cmu-top
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: External reference clock (26 MHz)
> +
> +        clock-names:
> +          items:
> +            - const: oscclk
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,exynos8895-cmu-fsys0
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: External reference clock (26 MHz)
> +            - description: CMU_FSYS0 BUS clock (from CMU_TOP)
> +            - description: CMU_FSYS0 DPGTC clock (from CMU_TOP)
> +            - description: CMU_FSYS0 MMC_EMBD clock (from CMU_TOP)
> +            - description: CMU_FSYS0 UFS_EMBD clock (from CMU_TOP)
> +            - description: CMU_FSYS0 USBDRD30 clock (from CMU_TOP)
> +
> +        clock-names:
> +          items:
> +            - const: oscclk
> +            - const: bus
> +            - const: dpgtc
> +            - const: mmc_embd

mmc

> +            - const: ufs_embd

ufs

> +            - const: usbdrd30
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,exynos8895-cmu-fsys1
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: External reference clock (26 MHz)
> +            - description: CMU_FSYS1 BUS clock (from CMU_TOP)
> +            - description: CMU_FSYS1 MMC_CARD clock (from CMU_TOP)
> +            - description: CMU_FSYS1 PCIE clock (from CMU_TOP)
> +            - description: CMU_FSYS1 UFS_CARD clock (from CMU_TOP)
> +
> +        clock-names:
> +          items:
> +            - const: oscclk
> +            - const: bus
> +            - const: mmc_card

mmc
Although now I wonder, why this is different FSYS. Is it for different
mmc controller?

> +            - const: pcie
> +            - const: ufs_card

ufs

Keep the order as in GS101 file.

> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,exynos8895-cmu-peric0
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: External reference clock (26 MHz)
> +            - description: CMU_PERIC0 BUS clock (from CMU_TOP)
> +            - description: CMU_PERIC0 UART_DBG clock (from CMU_TOP)
> +            - description: CMU_PERIC0 USI00 clock (from CMU_TOP)
> +            - description: CMU_PERIC0 USI01 clock (from CMU_TOP)
> +            - description: CMU_PERIC0 USI02 clock (from CMU_TOP)
> +            - description: CMU_PERIC0 USI03 clock (from CMU_TOP)
> +
> +        clock-names:
> +          items:
> +            - const: oscclk
> +            - const: bus
> +            - const: uart_dbg

uart

> +            - const: usi00

usi0

> +            - const: usi01

usi1

> +            - const: usi02

usi2

> +            - const: usi03

usi3

> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,exynos8895-cmu-peric1
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: External reference clock (26 MHz)
> +            - description: CMU_PERIC1 BUS clock (from CMU_TOP)
> +            - description: CMU_PERIC1 SPEEDY2 clock (from CMU_TOP)
> +            - description: CMU_PERIC1 SPI_CAM0 clock (from CMU_TOP)
> +            - description: CMU_PERIC1 SPI_CAM1 clock (from CMU_TOP)
> +            - description: CMU_PERIC1 UART_BT clock (from CMU_TOP)
> +            - description: CMU_PERIC1 USI04 clock (from CMU_TOP)
> +            - description: CMU_PERIC1 USI05 clock (from CMU_TOP)
> +            - description: CMU_PERIC1 USI06 clock (from CMU_TOP)
> +            - description: CMU_PERIC1 USI07 clock (from CMU_TOP)
> +            - description: CMU_PERIC1 USI08 clock (from CMU_TOP)
> +            - description: CMU_PERIC1 USI09 clock (from CMU_TOP)
> +            - description: CMU_PERIC1 USI10 clock (from CMU_TOP)
> +            - description: CMU_PERIC1 USI11 clock (from CMU_TOP)
> +            - description: CMU_PERIC1 USI12 clock (from CMU_TOP)
> +            - description: CMU_PERIC1 USI13 clock (from CMU_TOP)
> +
> +        clock-names:
> +          items:
> +            - const: oscclk
> +            - const: bus
> +            - const: speedy2

speedy

> +            - const: cam0
> +            - const: cam1
> +            - const: uart_bt

uart

> +            - const: usi04

usi4, etc

> +            - const: usi05
> +            - const: usi06
> +            - const: usi07
> +            - const: usi08
> +            - const: usi09
> +            - const: usi10
> +            - const: usi11
> +            - const: usi12
> +            - const: usi13
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,exynos8895-cmu-peris
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: External reference clock (26 MHz)
> +            - description: CMU_PERIS BUS clock (from CMU_TOP)
> +
> +        clock-names:
> +          items:
> +            - const: oscclk
> +            - const: bus
> +
> +required:
> +  - compatible
> +  - "#clock-cells"
> +  - clocks
> +  - clock-names
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  # Clock controller node for CMU_FSYS1
> +  - |
> +    #include <dt-bindings/clock/samsung,exynos8895.h>
> +
> +    cmu_fsys1: clock-controller@11400000 {
> +        compatible = "samsung,exynos8895-cmu-fsys1";
> +        reg = <0x11400000 0x8000>;
> +        #clock-cells = <1>;
> +
> +        clocks = <&oscclk>,
> +                 <&cmu_top CLK_DOUT_CMU_FSYS1_BUS>,
> +                 <&cmu_top CLK_DOUT_CMU_FSYS1_MMC_CARD>,
> +                 <&cmu_top CLK_DOUT_CMU_FSYS1_PCIE>,
> +                 <&cmu_top CLK_DOUT_CMU_FSYS1_UFS_CARD>;
> +        clock-names = "oscclk", "bus", "mmc_card",
> +                      "pcie", "ufs_card";
> +    };
> +


Best regards,
Krzysztof

