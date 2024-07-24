Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE835158871;
	Wed, 24 Jul 2024 10:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721815928; cv=none; b=Up68s+FDJpmWBxrbhnoylmrHu/B6GlNJGqxZCZBK09tftMEPqeUI2Gcf1MrGh6T9fkJXc5zr6yQUS/VKpKPv2YVjOL0ic+xeaoeNmKMiE+6q5N38g6Y3daZyM43vkFTOHX6qL2UFXp/UVEnlAHY5EPDOTHvNO8GOqxoBciS6RZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721815928; c=relaxed/simple;
	bh=Uqbvr11D9AdAvRrO/Gx+qH47OKL06kpUfqsqfplLr44=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YOI9iqqHv/NjQWinHZ4LQKGcRmkqGPnV2HJAumFJhfxBNmSov08xnxIIgM+Jv4OKs4y3fDADw2m+PaWmQ5zuXRE7Ghh49tVTHY0WctEOoO2NTT4mXhbKMJi6EjE6cd3cNCHqbJeXnsspcOeJ3RfVfLqVJVQrqyg6qyYuXjS4hco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AyhsA9nH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AyhsA9nH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C163C4AF0C;
	Wed, 24 Jul 2024 10:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721815928;
	bh=Uqbvr11D9AdAvRrO/Gx+qH47OKL06kpUfqsqfplLr44=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AyhsA9nHW5INzi1KByBWIblUwgL59r4vkjiK5TJdPIP4Y+QGqwnJmudUSFfb4v+2K
	 DvD5MgWjcYh1RlxhAuwUiwaPOF1tATyEOteGpUFM5OIsTpTUpUU7j0WjTVJyU+ValF
	 ZVWQYlLTNHcjH8xITeWv0rRZ80shTwkkZOcpScL3wb+j+R++Smx9qER+XT0fTy1Gq6
	 3cFNwVwWt56RkVAkCp8S2d2CTwAIe+O6lPE2r0vh/WkfQiHC5OBMRYUlUBK0InkkwQ
	 5R8AHESTtcWQty8ShWW2G7kVRYVmHrShUU0oGeKqoOqrarOAO9DfPToh83OZHiPQ1X
	 cBWYgcrdSBASQ==
Message-ID: <18f5565f-11f5-49ce-a816-366cff25b703@kernel.org>
Date: Wed, 24 Jul 2024 12:12:03 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] dt-bindings: clock: add ExynosAuto v920 SoC CMU
 bindings
To: Sunyeal Hong <sunyeal.hong@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240722223333.1137947-1-sunyeal.hong@samsung.com>
 <CGME20240722223340epcas2p4ab83b1e8dbc64eaaf32f4f8b7e3f015d@epcas2p4.samsung.com>
 <20240722223333.1137947-2-sunyeal.hong@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240722223333.1137947-2-sunyeal.hong@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/07/2024 00:33, Sunyeal Hong wrote:
> Add dt-schema for ExynosAuto v920 SoC clock controller.
> Add device tree clock binding definitions for below CMU blocks.
> 
> - CMU_TOP
> - CMU_PERIC0
> 
> Signed-off-by: Sunyeal Hong <sunyeal.hong@samsung.com>
> ---
>  .../clock/samsung,exynosautov920-clock.yaml   | 115 +++++++++++
>  .../clock/samsung,exynosautov920.h            | 191 ++++++++++++++++++
>  2 files changed, 306 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml
>  create mode 100644 include/dt-bindings/clock/samsung,exynosautov920.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml
> new file mode 100644
> index 000000000000..90f9f17da959
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml
> @@ -0,0 +1,115 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/samsung,exynosautov920-clock.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung ExynosAuto v920 SoC clock controller
> +
> +maintainers:
> +  - Sunyeal Hong <sunyeal.hong@samsung.com>
> +  - Chanwoo Choi <cw00.choi@samsung.com>
> +  - Krzysztof Kozlowski <krzk@kernel.org>
> +  - Sylwester Nawrocki <s.nawrocki@samsung.com>
> +
> +description: |
> +  ExynosAuto v920 clock controller is comprised of several CMU units, generating
> +  clocks for different domains. Those CMU units are modeled as separate device
> +  tree nodes, and might depend on each other. Root clocks in that clock tree are
> +  two external clocks:: OSCCLK/XTCXO (38.4 MHz) and RTCCLK/XrtcXTI (32768 Hz).
> +  The external OSCCLK must be defined as fixed-rate clock in dts.
> +
> +  CMU_TOP is a top-level CMU, where all base clocks are prepared using PLLs and
> +  dividers; all other clocks of function blocks (other CMUs) are usually
> +  derived from CMU_TOP.
> +
> +  Each clock is assigned an identifier and client nodes can use this identifier
> +  to specify the clock which they consume. All clocks available for usage
> +  in clock consumer nodes are defined as preprocessor macros in
> +  'include/dt-bindings/clock/samsung,exynosautov920.h' header.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - samsung,exynosautov920-cmu-top
> +      - samsung,exynosautov920-cmu-peric0
> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 3
> +
> +  clock-names:
> +    minItems: 1
> +    maxItems: 3
> +
> +  "#clock-cells":
> +    const: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,exynosautov920-cmu-top
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: External reference clock (38.4 MHz)
> +
> +        clock-names:
> +          items:
> +            - const: oscclk
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,exynosautov920-cmu-peric0
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: External reference clock (38.4 MHz)
> +            - description: CMU_PERIC0 NOC clock (from CMU_TOP)
> +            - description: CMU_PERIC0 IP clock (from CMU_TOP)
> +
> +        clock-names:
> +          items:
> +            - const: oscclk
> +            - const: noc
> +            - const: ip
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
> +  # Clock controller node for CMU_PERIC0
> +  - |
> +    #include <dt-bindings/clock/samsung,exynosautov920.h>
> +
> +    cmu_peric0: clock-controller@10800000 {
> +        compatible = "samsung,exynosautov920-cmu-peric0";
> +        reg = <0x10800000 0x8000>;
> +        #clock-cells = <1>;
> +
> +        clocks = <&xtcxo>,
> +                 <&cmu_top DOUT_CLKCMU_PERIC0_NOC>,
> +                 <&cmu_top DOUT_CLKCMU_PERIC0_IP>;
> +        clock-names = "oscclk",
> +                      "noc",
> +                      "ip";
> +    };
> +
> +...
> diff --git a/include/dt-bindings/clock/samsung,exynosautov920.h b/include/dt-bindings/clock/samsung,exynosautov920.h
> new file mode 100644
> index 000000000000..ad89728a4396
> --- /dev/null
> +++ b/include/dt-bindings/clock/samsung,exynosautov920.h
> @@ -0,0 +1,191 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (c) 2024 Samsung Electronics Co., Ltd.
> + * Author: Sunyeal Hong <sunyeal.hong@samsung.com>
> + *
> + * Device Tree binding constants for ExynosAuto v920 clock controller.
> + */
> +
> +#ifndef _DT_BINDINGS_CLOCK_EXYNOSAUTOV920_H
> +#define _DT_BINDINGS_CLOCK_EXYNOSAUTOV920_H
> +
> +/* CMU_TOP */
> +#define FOUT_SHARED0_PLL		1
> +#define FOUT_SHARED1_PLL		2
> +#define FOUT_SHARED2_PLL		3
> +#define FOUT_SHARED3_PLL		4
> +#define FOUT_SHARED4_PLL		5
> +#define FOUT_SHARED5_PLL		6
> +#define FOUT_MMC_PLL			7
> +
> +/* MUX in CMU_TOP */
> +#define MOUT_SHARED0_PLL		101

This is some odd numbering. Numbers start from 0 or 1 and are continuous.


Best regards,
Krzysztof

