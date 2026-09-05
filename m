Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF265381EA0;
	Sat,  5 Sep 2026 07:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788592970; cv=none; b=m9hr1q+HXrAHA24qEb8xnkVhExddjxg08Isbtw74Ipr9uZ+ApDy43aOTnW1Q3xexNG6O3t7eeyucKr7dXjpm1udNJGM3CoU3ElNX5q9Fasp0bgCC8M/h923AWOXVn6vx28sCV5hnv3p4gtxmQ2C8XRG6By6d5WOyL+uXPjeZfvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788592970; c=relaxed/simple;
	bh=oMPBl1GCTzB2Z9MPETN7QzFHchvqoUwHWSJ4r/MxgNo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MhAnd9suaOactCq40YH1321R8/MmaTzGQfTotFe01ywx3YxAyc9h1IJTfvoEpdXnmP8frJiIU8SeUgxx2ZGSS+5BCB+8t9q9ezHvwSyoXVVszaSXCN//R/58IhF4orC+KUpHZOI780ueklNPmKX5ePq+dR/7Ew1bScj2iH1VHlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Eg8eb9u3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Eg8eb9u3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 756C71F00A3D;
	Sat,  5 Sep 2026 07:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788592968;
	bh=N/3KUGxz1n+uOa/s4zSKV68Bk8DVLbxLMdLtSTIxu98=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Eg8eb9u3BV5uARQjwqOXeGICiPLIL2419FWMsvhYnDz7K/GmSmyxbVq8iRAKJC19X
	 f5SboAK+rADMHoU7kgi8o81Jy4pUyNrqxd7/Xol3kkH3g1RQJIaHnrkS7vh9N91xPU
	 2vOIArzb9jreh7UEn5bBqfPvPOBxrwpw4a3CgSek+3BKHr/3wlT8XrzFytnq/TY4sZ
	 2lhCaaRDJNq70ypM4VD5fuKLhi6Hsovkn0hNMPrtqt/sTKG48e6s3JLTEtVFDczYZY
	 y6APP2O39ZkEWzLJG66v0iMktVu78i0H2SlsuZ7hzSpUCeTn6b5L6BO+RQPvzpxr7V
	 jp56I2mYQ25KA==
Message-ID: <ad1d8c01-a810-443a-9ad5-721d6d0b68b1@kernel.org>
Date: Sat, 5 Sep 2026 09:22:39 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] dt-bindings: usb: Introduce samsung,snps-dwc3
To: Selvarasu Ganesan <selvarasu.g@samsung.com>, peter.griffin@linaro.org,
 alim.akhtar@samsung.com, gregkh@linuxfoundation.org, robh@kernel.org,
 conor+dt@kernel.org, Thinh.Nguyen@synopsys.com,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: jh0801.jung@samsung.com, dh10.jung@samsung.com, akash.m5@samsung.com,
 hongpooh.kim@samsung.com, eomji.oh@samsung.com, shijie.cai@samsung.com,
 muhammed.ali@samsung.com, thiagu.r@samsung.com
References: <20260903071250.3421499-1-selvarasu.g@samsung.com>
 <CGME20260903071318epcas5p4b804edb84554847c576d1d034b814d7a@epcas5p4.samsung.com>
 <20260903071250.3421499-3-selvarasu.g@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20260903071250.3421499-3-selvarasu.g@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/09/2026 09:12, Selvarasu Ganesan wrote:
> The Samsung Exynos8855 USB glue is not separate from the Synopsys DWC3
> core, using a flattened model where the DWC3 controller is directly
> addressable rather than nested as a child node of a glue layer.
> 
> Describe the Exynos USB block as a single node, referencing the split
> out Synopsys DWC3 core properties via snps,dwc3-common.yaml. The new
> binding follows the same approach as qcom,snps-dwc3.
> 
> A generic fallback compatible "samsung,snps-dwc3" is introduced to
> describe this binding, selected by the validator based on the presence
> of the fallback string in the compatible list. Future Exynos SoCs

This is AI slop text. Over longish useless sentence describing diff
without actual information WHY.

Don't send AI generated slop messages.

> utilizing the same flattened model can be added by extending the
> compatible enum with per SoC clock and property constraints.
> 
> Co-developed-by: Muhammed Ali <muhammed.ali@samsung.com>
> Signed-off-by: Muhammed Ali <muhammed.ali@samsung.com>
> Signed-off-by: Selvarasu Ganesan <selvarasu.g@samsung.com>
> ---
> 
> Krzysztof Kozlowski is added as a maintainer of this YAML binding, as
> he is the ARM/Samsung SoC architecture maintainer (ARM/SAMSUNG S3C,
> S5P AND EXYNOS ARM ARCHITECTURES) who already maintains Samsung Exynos
> DT bindings (e.g. samsung,exynos-dwc3.yaml) and reviews all
> Samsung related binding changes. This follows the same convention used
> by existing Samsung Exynos DT binding schemas.
> ---
>  .../bindings/usb/samsung,snps-dwc3.yaml       | 98 +++++++++++++++++++
>  1 file changed, 98 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/samsung,snps-dwc3.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/samsung,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/samsung,snps-dwc3.yaml
> new file mode 100644
> index 000000000000..480308c16f37
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/samsung,snps-dwc3.yaml
> @@ -0,0 +1,98 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/samsung,snps-dwc3.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung Exynos SoC DWC3 USB Controller
> +
> +maintainers:
> +  - Krzysztof Kozlowski <krzk@kernel.org>
> +  - Selvarasu Ganesan <selvarasu.g@samsung.com>
> +
> +description:
> +  Describes the DWC3 USB controller block implemented on Samsung Exynos SoCs.

Huh? Did you even look at existing bindings?

> +
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        const: samsung,snps-dwc3
> +  required:
> +    - compatible
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - samsung,exynos8855-dwc3
> +      - const: samsung,snps-dwc3

There is no snps device from Samsung, neither DWC3. The name of device
is completely wrong. snps is a vendor, not a device.

Anyway, don't use generic fallbacks.



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
> +    minItems: 1
> +    maxItems: 4
> +
> +  clock-names:
> +    minItems: 1
> +    maxItems: 4

You have only one device, why is this flexible?

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
> +        clock-names:
> +          items:
> +            - const: ref
> +            - const: bus

Why do you need all this? Look at existing code, don't duplicate. And
for sure do not introduce one more DWC3 binding claiming to be for
Samsung devices and completely ignoring existing ones.

Best regards,
Krzysztof
