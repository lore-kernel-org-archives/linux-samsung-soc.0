Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9AB1D4336;
	Mon, 21 Oct 2024 14:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729522789; cv=none; b=ldGckeh+hM0cqJHcTlSAjHYCud9My3xp/qMUEnFeO4QvO1QRuGwvTPXWAGbD5avlIZ33XgiT3tKBMblwTgSHdQ1ZdxOFuf3N3iv33n11g6Jgqjh4tX0nKTUsu4c8EgCzECNhmoD+zroVAJhPMUtNNCAzPXO+YR8pCtEeAbUFQwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729522789; c=relaxed/simple;
	bh=c+Qi+Jx+CXTBC6SGBbwZd+QHqQ3u2ujH1bhsnaOs+tM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ne9yco+NtuG/vRD8y37YrwykmuaPXljkxspWOEY9d0uAb0nhLvRRC2Luuu7QQBhSb8eTvr8DT1CfQEfAks6lOXTgAnmXq2w8JtUSK2CVxNvWnYxtctMVV9cIP5+idZXYFCx/3yRLNg308afXv3kodmJ76vEhbgO7oPBhY6BXl4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eRxj5sOX; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eRxj5sOX"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4315e62afe0so43876765e9.1;
        Mon, 21 Oct 2024 07:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729522786; x=1730127586; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b2oNlw5sC6corZeG/j34t0WS9fihe4BrMBO9k5dV7z4=;
        b=eRxj5sOXjm4J09BnG6O3xr6nyMmZMrKA/mdHjZ/e/hp5C5o23VSbFVUYKRCF4BOdOL
         vT0PrU6m8R9mGAeTXsIci8BKACqtHiDHQcKVmD7bSAUfTdSXQa/ooT+aB7Ddx+7TMcgI
         Y8I3NNUHKNvs0V+xXV8PaGkxPEKSF6K/guKydxQm7FodkMxSn3sXij2/HGIodK5rr8V3
         iBvCgpKAwikXtHG0gQXe2e0DW8mp/S0VoPzkO949h32PJ75/ZLE6iC0lUXD3o1nYhwhF
         INRn3uiXHgSxk2BCPQOYkr21jOI0DsNNb0JkgWrWC/5RIGLfIsXPq/DB6b2adK/j0heD
         6jZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729522786; x=1730127586;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b2oNlw5sC6corZeG/j34t0WS9fihe4BrMBO9k5dV7z4=;
        b=IZ8F4pOjP4MrrCmyGewttvFir6ovtyj/l9qJvfJQUIUjuAA6V4DlzWriVBkrtiyjSG
         PSjkaPE0LLmMhaJBNoqQpaxbji9SSReKQnNggOeifBD+voF7sj4SoVLeRxz9CzNOpLGI
         mX9uvajzn059U7+wV4uSFRpELEgVY8fJvdpfMc8zKtJxQ2R77yXXqAmmhFr/VQcER8GT
         cshGcusqeMCnyM+LR46u1vbg2SyVjXE7VEUqzXLVpFlU14bF6BK7mVb94Pho0TUKKOYr
         zlJdr1DuTeYWwPcQN5/AVmqH87mfXiHriSacs+22sl47dC5F1n/G1OnOAyzSX5N23ObI
         motw==
X-Forwarded-Encrypted: i=1; AJvYcCUuCpDYuBcuIly84JwgDJfj+1bMjUBqMIX629KBvWMksdiBXc+280hYcFUbt6bXqebq5ysPBvHTZ5N4elqg@vger.kernel.org, AJvYcCVOf6qXMhJNCA70CkUjMEuU9NFvoD6MKLVJ5G6mUQAq2ht1t/25wZdHS503Vl8C6FdHTfMhoDAs1VAx@vger.kernel.org, AJvYcCX1V1MDUCWG0Zavvu3J3niGIV1PpGNi6O3wftzXVUbfJF9LMYmECr71OQqsJtYbyuDpjuFVH3fknGMk@vger.kernel.org
X-Gm-Message-State: AOJu0Yz00vJY1Uq/xXERHOM08nhjvwyCIvqbMoQIdVyS+Zl/SdPGXoyy
	mQP913+2OVzX6NZoxwU06bJ88k6UcXmbbAc5/QcmvFcElEpnygHK
X-Google-Smtp-Source: AGHT+IEst292QV7hRLtR3biILTiH0zvysU6L3GW2PdM63Pg8uNswcivTzfgAQhuoJltf24mOVAd5AQ==
X-Received: by 2002:a05:600c:1d27:b0:431:4e25:fe26 with SMTP id 5b1f17b1804b1-4316169742fmr80595915e9.27.1729522785452;
        Mon, 21 Oct 2024 07:59:45 -0700 (PDT)
Received: from [192.168.1.105] (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316f58ae0asm60050285e9.23.2024.10.21.07.59.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Oct 2024 07:59:45 -0700 (PDT)
Message-ID: <f472ab62-a248-4753-a2cf-a8b85ae88638@gmail.com>
Date: Mon, 21 Oct 2024 17:59:43 +0300
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] dt-bindings: clock: Add Exynos8895 SoC CMU
 bindings
To: Krzysztof Kozlowski <krzk@kernel.org>,
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
 <75e0b0a3-6b6c-427e-a748-329dc1237da7@kernel.org>
Content-Language: en-US
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <75e0b0a3-6b6c-427e-a748-329dc1237da7@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 10/21/24 12:38, Krzysztof Kozlowski wrote:
> On 20/10/2024 19:48, Ivaylo Ivanov wrote:
>> Provide dt-schema documentation for Exynos8895 SoC clock controller.
>> Add device tree clock binding definitions for the following CMU blocks:
>>  - CMU_TOP
>>  - CMU_FSYS0/1
>>  - CMU_PERIC0/1
>>  - CMU_PERIS
>>
>> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>
> A nit, subject: drop second/last, redundant "bindings". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
>
>> +
>> +title: Samsung Exynos8895 SoC clock controller
>> +
>> +maintainers:
>> +  - Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>> +  - Chanwoo Choi <cw00.choi@samsung.com>
>> +  - Krzysztof Kozlowski <krzk@kernel.org>
>> +  - Sylwester Nawrocki <s.nawrocki@samsung.com>
>> +  - Tomasz Figa <tomasz.figa@gmail.com>
> Please drop Sylwester and Tomasz, they opted out from clocks.
>
>> +
>> +description: |
>> +  Exynos8895 clock controller is comprised of several CMU units, generating
>> +  clocks for different domains. Those CMU units are modeled as separate device
>> +  tree nodes, and might depend on each other. The root clock in that root tree
>> +  is an external clock: OSCCLK (26 MHz). This external clock must be defined
>> +  as a fixed-rate clock in dts.
>> +
>> +  CMU_TOP is a top-level CMU, where all base clocks are prepared using PLLs and
>> +  dividers; all other clocks of function blocks (other CMUs) are usually
>> +  derived from CMU_TOP.
>> +
>> +  Each clock is assigned an identifier and client nodes can use this identifier
>> +  to specify the clock which they consume. All clocks available for usage
>> +  in clock consumer nodes are defined as preprocessor macros in
>> +  'include/dt-bindings/clock/samsung,exynos8895.h' header.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - samsung,exynos8895-cmu-top
>> +      - samsung,exynos8895-cmu-fsys0
>> +      - samsung,exynos8895-cmu-fsys1
>> +      - samsung,exynos8895-cmu-peric0
>> +      - samsung,exynos8895-cmu-peric1
>> +      - samsung,exynos8895-cmu-peris
> Alphabetical order.
>
>> +
>> +  clocks:
>> +    minItems: 1
>> +    maxItems: 16
>> +
>> +  clock-names:
>> +    minItems: 1
>> +    maxItems: 16
>> +
>> +  "#clock-cells":
>> +    const: 1
>> +
>> +  reg:
>> +    maxItems: 1
>> +
> required: block should go here (I know that other Samsung clock bindings
> do not follow this convention).
>
>> +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: samsung,exynos8895-cmu-top
>> +
>> +    then:
>> +      properties:
>> +        clocks:
>> +          items:
>> +            - description: External reference clock (26 MHz)
>> +
>> +        clock-names:
>> +          items:
>> +            - const: oscclk
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: samsung,exynos8895-cmu-fsys0
>> +
>> +    then:
>> +      properties:
>> +        clocks:
>> +          items:
>> +            - description: External reference clock (26 MHz)
>> +            - description: CMU_FSYS0 BUS clock (from CMU_TOP)
>> +            - description: CMU_FSYS0 DPGTC clock (from CMU_TOP)
>> +            - description: CMU_FSYS0 MMC_EMBD clock (from CMU_TOP)
>> +            - description: CMU_FSYS0 UFS_EMBD clock (from CMU_TOP)
>> +            - description: CMU_FSYS0 USBDRD30 clock (from CMU_TOP)
>> +
>> +        clock-names:
>> +          items:
>> +            - const: oscclk
>> +            - const: bus
>> +            - const: dpgtc
>> +            - const: mmc_embd
> mmc
>
>> +            - const: ufs_embd
> ufs
>
>> +            - const: usbdrd30
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: samsung,exynos8895-cmu-fsys1
>> +
>> +    then:
>> +      properties:
>> +        clocks:
>> +          items:
>> +            - description: External reference clock (26 MHz)
>> +            - description: CMU_FSYS1 BUS clock (from CMU_TOP)
>> +            - description: CMU_FSYS1 MMC_CARD clock (from CMU_TOP)
>> +            - description: CMU_FSYS1 PCIE clock (from CMU_TOP)
>> +            - description: CMU_FSYS1 UFS_CARD clock (from CMU_TOP)
>> +
>> +        clock-names:
>> +          items:
>> +            - const: oscclk
>> +            - const: bus
>> +            - const: mmc_card
> mmc
> Although now I wonder, why this is different FSYS. Is it for different
> mmc controller?

FSYS0 provides clocks for embedded storages (UFS and eMMC), whereas FSYS1

clocks external storage cards (UFS and MMC cards). As far as I can tell, there's

only one MMC controller, so perhaps it could be set to drive an eMMC or an SD

card. On retail devices, UFS_EMBD and MMC_CARD are used.

Thanks for the review, will fix the issues in the next patchset.

Best regards, Ivo.

>
>> +            - const: pcie
>> +            - const: ufs_card
> ufs
>
> Keep the order as in GS101 file.
>
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: samsung,exynos8895-cmu-peric0
>> +
>> +    then:
>> +      properties:
>> +        clocks:
>> +          items:
>> +            - description: External reference clock (26 MHz)
>> +            - description: CMU_PERIC0 BUS clock (from CMU_TOP)
>> +            - description: CMU_PERIC0 UART_DBG clock (from CMU_TOP)
>> +            - description: CMU_PERIC0 USI00 clock (from CMU_TOP)
>> +            - description: CMU_PERIC0 USI01 clock (from CMU_TOP)
>> +            - description: CMU_PERIC0 USI02 clock (from CMU_TOP)
>> +            - description: CMU_PERIC0 USI03 clock (from CMU_TOP)
>> +
>> +        clock-names:
>> +          items:
>> +            - const: oscclk
>> +            - const: bus
>> +            - const: uart_dbg
> uart
>
>> +            - const: usi00
> usi0
>
>> +            - const: usi01
> usi1
>
>> +            - const: usi02
> usi2
>
>> +            - const: usi03
> usi3
>
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: samsung,exynos8895-cmu-peric1
>> +
>> +    then:
>> +      properties:
>> +        clocks:
>> +          items:
>> +            - description: External reference clock (26 MHz)
>> +            - description: CMU_PERIC1 BUS clock (from CMU_TOP)
>> +            - description: CMU_PERIC1 SPEEDY2 clock (from CMU_TOP)
>> +            - description: CMU_PERIC1 SPI_CAM0 clock (from CMU_TOP)
>> +            - description: CMU_PERIC1 SPI_CAM1 clock (from CMU_TOP)
>> +            - description: CMU_PERIC1 UART_BT clock (from CMU_TOP)
>> +            - description: CMU_PERIC1 USI04 clock (from CMU_TOP)
>> +            - description: CMU_PERIC1 USI05 clock (from CMU_TOP)
>> +            - description: CMU_PERIC1 USI06 clock (from CMU_TOP)
>> +            - description: CMU_PERIC1 USI07 clock (from CMU_TOP)
>> +            - description: CMU_PERIC1 USI08 clock (from CMU_TOP)
>> +            - description: CMU_PERIC1 USI09 clock (from CMU_TOP)
>> +            - description: CMU_PERIC1 USI10 clock (from CMU_TOP)
>> +            - description: CMU_PERIC1 USI11 clock (from CMU_TOP)
>> +            - description: CMU_PERIC1 USI12 clock (from CMU_TOP)
>> +            - description: CMU_PERIC1 USI13 clock (from CMU_TOP)
>> +
>> +        clock-names:
>> +          items:
>> +            - const: oscclk
>> +            - const: bus
>> +            - const: speedy2
> speedy
>
>> +            - const: cam0
>> +            - const: cam1
>> +            - const: uart_bt
> uart
>
>> +            - const: usi04
> usi4, etc
>
>> +            - const: usi05
>> +            - const: usi06
>> +            - const: usi07
>> +            - const: usi08
>> +            - const: usi09
>> +            - const: usi10
>> +            - const: usi11
>> +            - const: usi12
>> +            - const: usi13
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: samsung,exynos8895-cmu-peris
>> +
>> +    then:
>> +      properties:
>> +        clocks:
>> +          items:
>> +            - description: External reference clock (26 MHz)
>> +            - description: CMU_PERIS BUS clock (from CMU_TOP)
>> +
>> +        clock-names:
>> +          items:
>> +            - const: oscclk
>> +            - const: bus
>> +
>> +required:
>> +  - compatible
>> +  - "#clock-cells"
>> +  - clocks
>> +  - clock-names
>> +  - reg
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  # Clock controller node for CMU_FSYS1
>> +  - |
>> +    #include <dt-bindings/clock/samsung,exynos8895.h>
>> +
>> +    cmu_fsys1: clock-controller@11400000 {
>> +        compatible = "samsung,exynos8895-cmu-fsys1";
>> +        reg = <0x11400000 0x8000>;
>> +        #clock-cells = <1>;
>> +
>> +        clocks = <&oscclk>,
>> +                 <&cmu_top CLK_DOUT_CMU_FSYS1_BUS>,
>> +                 <&cmu_top CLK_DOUT_CMU_FSYS1_MMC_CARD>,
>> +                 <&cmu_top CLK_DOUT_CMU_FSYS1_PCIE>,
>> +                 <&cmu_top CLK_DOUT_CMU_FSYS1_UFS_CARD>;
>> +        clock-names = "oscclk", "bus", "mmc_card",
>> +                      "pcie", "ufs_card";
>> +    };
>> +
>
> Best regards,
> Krzysztof
>
