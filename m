Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591744F96B1
	for <linux-samsung-soc@vger.kernel.org>; Fri, 18 Sep 2026 13:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789738589; cv=none; b=bWpTtxD0qHmGYQCKnV0VIcrGxGDkI8SI+wYDqU0qa8lhDEP3vXoKth6DZp63BAeHY0bKpZl/sicO1ScwjVgn5Kzomhav+5yVS4lTu0yBFO30Fm5cSaoIa+PMPEZ5BudLEBG0IFpkwLJFJlRwLWnTUoljPQ5GG7L0sp4SBV/BJ4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789738589; c=relaxed/simple;
	bh=EQOVRg/qVIU5+nVTCQ1rPABzKLZ/omnfd9FhU1eP2m4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=Oh+v5dfM1Zs5lkzmzOw0sweWxN2vJ1ZWMXuEAvv6Hy1AksBlVZ99TG7I/YCtjaDw2SA1he+vLIGwMA6zS7cQ/gi6X+RmJrTf3qeWQESkxLlF+8/8YdSa1LX52JAi2FG6hWUmTB2/i2cXaaHvqxPEREw2HRkQCHsHAAswRSzh1go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=hTRqG8yR; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="hTRqG8yR"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20260918133623epoutp03b86302cbd777d159af05c8bc5adede9c~WbcJ5V7PK0455704557epoutp03X
	for <linux-samsung-soc@vger.kernel.org>; Fri, 18 Sep 2026 13:36:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20260918133623epoutp03b86302cbd777d159af05c8bc5adede9c~WbcJ5V7PK0455704557epoutp03X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1789738583;
	bh=DmavpybYN0LBa3BilD0E1eX3g1b+G3rHrs0swG4JQog=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=hTRqG8yRJaM4O2m3d0ZvEYN9GaqgUYb84dNJdYaBvCCz0cVJh4FFo3d5BBkV6W31o
	 Y88XAzzWNm9lSxFYewVJY2elCLojWV4jIy2BPdvCYXaU2MHNJ+rfYtgSnAqL2zj6i1
	 9BAuoI1wrYTjMaRVsBafTTwea5ZeGQc9AavCzXhQ=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20260918133623epcas5p2a0d653ee2ad5d6f01b37f0089059b8ba~WbcJGrl-n0578205782epcas5p2r;
	Fri, 18 Sep 2026 13:36:23 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.88]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4hmYYf0mpMz6B9m5; Fri, 18 Sep
	2026 13:36:22 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20260918133621epcas5p38bcaad0af7a96839fea53c06c57d10f3~WbcHtMVS91576415764epcas5p3D;
	Fri, 18 Sep 2026 13:36:21 +0000 (GMT)
Received: from [107.122.5.126] (unknown [107.122.5.126]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260918133618epsmtip22c2e800475d63ed12ae7e900b295f553~WbcExuej70030600306epsmtip2F;
	Fri, 18 Sep 2026 13:36:18 +0000 (GMT)
Message-ID: <fef2b2f5-3838-4eec-8118-d41f9ca0ed2f@samsung.com>
Date: Fri, 18 Sep 2026 19:06:17 +0530
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] dt-bindings: usb: Introduce samsung,snps-dwc3
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: peter.griffin@linaro.org, alim.akhtar@samsung.com,
	gregkh@linuxfoundation.org, robh@kernel.org, conor+dt@kernel.org,
	Thinh.Nguyen@synopsys.com, mani@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, jh0801.jung@samsung.com, h10.kim@samsung.com,
	dh10.jung@samsung.com, akash.m5@samsung.com, hongpooh.kim@samsung.com,
	eomji.oh@samsung.com, shijie.cai@samsung.com, muhammed.ali@samsung.com,
	thiagu.r@samsung.com
Content-Language: en-US
From: Selvarasu Ganesan <selvarasu.g@samsung.com>
In-Reply-To: <20260918-burgundy-marmoset-of-focus-c9b9a7@quoll>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260918133621epcas5p38bcaad0af7a96839fea53c06c57d10f3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260916122354epcas5p401fd6470d6cef75951af732b03aa5970
References: <20260916122229.2604003-1-selvarasu.g@samsung.com>
	<CGME20260916122354epcas5p401fd6470d6cef75951af732b03aa5970@epcas5p4.samsung.com>
	<20260916122229.2604003-3-selvarasu.g@samsung.com>
	<20260918-burgundy-marmoset-of-focus-c9b9a7@quoll>


On 9/18/2026 3:24 PM, Krzysztof Kozlowski wrote:
> On Wed, Sep 16, 2026 at 05:52:28PM +0530, Selvarasu Ganesan wrote:
>> +maintainers:
>> +  - Krzysztof Kozlowski <krzk@kernel.org>
>> +  - Selvarasu Ganesan <selvarasu.g@samsung.com>
>> +
>> +description:
>> +  Describes the DWC3 USB controller block implemented on Samsung Exynos SoCs.
>> +
>> +select:
>> +  properties:
>> +    compatible:
>> +      contains:
>> +        const: samsung,snps-dwc3
>> +  required:
>> +    - compatible
> This select is not needed.
>
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - enum:
>> +          - samsung,exynos8855-dwc3
>> +      - const: samsung,snps-dwc3
> And this fallback is not really accurate. Samsung does not have snps
> device, because snps is a vendor. Anyway, generic fallbacks should go
> away, drop, so you are left with samsung,exynos8855-dwc3 only.

Hi Krzysztof,

Thanks for your review comments.
And We apologize for our repeated below explanation, but we wanted to 
ensure our intentions were clear for each point to avoid any 
misunderstanding.

The original intent of the generic fallback was to support existing 
Exynos dwc3 bindings from a parent/child representation from 
(samsung,exynos-dwc3.yaml), and upcoming SoCs (Exynos 8865, 9955, and 
9965) can use this flattened representation without requiring a unique 
compatible string for every project in the dwc3-generic-plat driver 
of_match_table. We referred to qcom,snps-dwc3 as a helpful reference for 
this approach.

As seen in samsung,exynos-dwc3.yaml, our existing bindings already 
support multiple SoCs with diverse clock requirements within a single 
file. Similarly, we plan to use a single flattened Samsung binding to 
manage these diverse clock requirements. for different SoCs.

Regarding the migration for current and future SoCs, would you prefer,

Option A: A single flattened binding file using a common fallback 
compatible string (instead of samsung,snps-dwc3) to minimize 
of_match_table entries, and if/then constraints to handle diverse clock 
requirements.
Option B: Separate binding files for each individual SoCs.

Could you please let us know your preferred approach? Once confirmed, we 
will address your other review comments based on the selected approach.


Thanks,
Selva


> Filename should be then samsung,exynos8855-dwc3.yaml.
>
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    description: |
>> +      Several clocks are used, depending on the variant. Typical ones are:
>> +       - ref: Reference clock for SOF/ITP generation.
>> +       - bus: Bus (APB) clock for register access.
> You have only one variant, no? Or you mean one SoC has different
> variants?
>
>> +    minItems: 1
>> +    maxItems: 4
> Nope, you to list items.
>
>> +
>> +  clock-names:
>> +    minItems: 1
>> +    maxItems: 4
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +  - interrupts
>> +
>> +allOf:
>> +  - $ref: snps,dwc3-common.yaml#
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: samsung,exynos8855-dwc3
>> +    then:
>> +      properties:
>> +        clocks:
>> +          minItems: 2
>> +          maxItems: 2
> How can it be two if you have ONLY one device in the binding and that
> device has between 1 and 4?
>
> This entire if is redundant, no? How many clocks do you actually have
> there?
>
>> +        clock-names:
>> +          items:
>> +            - const: ref
>> +            - const: bus
>> +
>> +unevaluatedProperties: false
> Best regards,
> Krzysztof
