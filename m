Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350BE2571B8
	for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Sep 2026 06:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788761096; cv=none; b=FRKa+X6+Lg2EOHkceTJCAGyPb/KVgGgPYcqKCIG5l7DWnO/uECCx+RFxN/4E8hAN/RQmifbUxK132eg6Au+P5M9h2u7jXl7sRH3pR4Oll1itSW9uhCYagbBOnfMyngznM6HgHMx3j81JJgdQap5M9c4AKLW7FjuAlaRa6RAw2e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788761096; c=relaxed/simple;
	bh=b1Hz9rYycwYrYX/+s3pbLxWS7uKOceawfWb5yqx4yE4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=LHLmuuXtWPWNeD9rUTKR0Gcs4JDB+6h3swEFmq5kPz9j8VnpT1ujTeL1MEL1n/WRS4JJ0+mcCWHT/sQ/JCsMz1ao/9TqUa5HiuZozkJmfZPJ7IuirOLAvgnjZDrFiMekeRYAHQ84YzP/755IJMQ3sKfiMVCqiV98mG7q/wAgbWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=slcRk5m+; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="slcRk5m+"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20260907060445epoutp024c846453bb12de29a9618690fd16b2d2~S9LrWmLFv2286322863epoutp024
	for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Sep 2026 06:04:45 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20260907060445epoutp024c846453bb12de29a9618690fd16b2d2~S9LrWmLFv2286322863epoutp024
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1788761085;
	bh=Apw2iUirqek8VKGufyLgdLjs5Rfxgc8/vl6/NyrKW8k=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=slcRk5m+WGQ1SjbuuoGM/zupLNokbYmmpTiZPQm2hBMLwBwpJquqgA75gVj2kx5ZW
	 qItUWlQ3NBdlpuha6fRDXLcS8npdspRdWWEJffIYY3vEAEKgK5GEG+PxQb/o/JTUWz
	 7M6tfDOsVP0F/W1L01kCkHwkO/ot09Pv1oqCFH28=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20260907060444epcas5p28eb4578f521d4d2b9e0694c18df3def2~S9LqPUohf2359923599epcas5p2F;
	Mon,  7 Sep 2026 06:04:44 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.95]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4hdc3b0q6yz6B9m7; Mon,  7 Sep
	2026 06:04:43 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20260907060442epcas5p309df4da89d1a3040ddcec14195fc2b3b~S9Lo4EmvD1977119771epcas5p3s;
	Mon,  7 Sep 2026 06:04:42 +0000 (GMT)
Received: from [107.122.5.126] (unknown [107.122.5.126]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260907060440epsmtip21f4fd38dcbbe0387455b812404e9bd80~S9LmbZNx51077310773epsmtip2O;
	Mon,  7 Sep 2026 06:04:39 +0000 (GMT)
Message-ID: <e4bafeea-4548-41ef-b5e2-98ade2864e74@samsung.com>
Date: Mon, 7 Sep 2026 11:34:38 +0530
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] dt-bindings: usb: Introduce samsung,snps-dwc3
To: Krzysztof Kozlowski <krzk@kernel.org>, peter.griffin@linaro.org,
	alim.akhtar@samsung.com, gregkh@linuxfoundation.org, robh@kernel.org,
	conor+dt@kernel.org, Thinh.Nguyen@synopsys.com,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: jh0801.jung@samsung.com, dh10.jung@samsung.com, akash.m5@samsung.com,
	hongpooh.kim@samsung.com, eomji.oh@samsung.com, shijie.cai@samsung.com,
	muhammed.ali@samsung.com, thiagu.r@samsung.com
Content-Language: en-US
From: Selvarasu Ganesan <selvarasu.g@samsung.com>
In-Reply-To: <ad1d8c01-a810-443a-9ad5-721d6d0b68b1@kernel.org>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260907060442epcas5p309df4da89d1a3040ddcec14195fc2b3b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260903071318epcas5p4b804edb84554847c576d1d034b814d7a
References: <20260903071250.3421499-1-selvarasu.g@samsung.com>
	<CGME20260903071318epcas5p4b804edb84554847c576d1d034b814d7a@epcas5p4.samsung.com>
	<20260903071250.3421499-3-selvarasu.g@samsung.com>
	<ad1d8c01-a810-443a-9ad5-721d6d0b68b1@kernel.org>


On 9/5/2026 12:52 PM, Krzysztof Kozlowski wrote:
> On 03/09/2026 09:12, Selvarasu Ganesan wrote:
>> The Samsung Exynos8855 USB glue is not separate from the Synopsys DWC3
>> core, using a flattened model where the DWC3 controller is directly
>> addressable rather than nested as a child node of a glue layer.
>>
>> Describe the Exynos USB block as a single node, referencing the split
>> out Synopsys DWC3 core properties via snps,dwc3-common.yaml. The new
>> binding follows the same approach as qcom,snps-dwc3.
>>
>> A generic fallback compatible "samsung,snps-dwc3" is introduced to
>> describe this binding, selected by the validator based on the presence
>> of the fallback string in the compatible list. Future Exynos SoCs
> This is AI slop text. Over longish useless sentence describing diff
> without actual information WHY.
>
> Don't send AI generated slop messages.

Sorry for the misleading info on this commit message. We were trying to 
explain why a separate flattened representation is being introduced with 
using generic fallback string, and follow the style of some other DWC3 
flattened refactors (like the Qualcomm : 
https://lore.kernel.org/all/20250414-dwc3-refactor-v7-2-f015b358722d@oss.qualcomm.com) 
to justify the separate binding, but it became too long. We'll simplify 
it and keep only the technical reasoning.


>
>> utilizing the same flattened model can be added by extending the
>> compatible enum with per SoC clock and property constraints.
>>
>> Co-developed-by: Muhammed Ali <muhammed.ali@samsung.com>
>> Signed-off-by: Muhammed Ali <muhammed.ali@samsung.com>
>> Signed-off-by: Selvarasu Ganesan <selvarasu.g@samsung.com>
>> ---
>>
>> Krzysztof Kozlowski is added as a maintainer of this YAML binding, as
>> he is the ARM/Samsung SoC architecture maintainer (ARM/SAMSUNG S3C,
>> S5P AND EXYNOS ARM ARCHITECTURES) who already maintains Samsung Exynos
>> DT bindings (e.g. samsung,exynos-dwc3.yaml) and reviews all
>> Samsung related binding changes. This follows the same convention used
>> by existing Samsung Exynos DT binding schemas.
>> ---
>>   .../bindings/usb/samsung,snps-dwc3.yaml       | 98 +++++++++++++++++++
>>   1 file changed, 98 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/usb/samsung,snps-dwc3.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/usb/samsung,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/samsung,snps-dwc3.yaml
>> new file mode 100644
>> index 000000000000..480308c16f37
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/usb/samsung,snps-dwc3.yaml
>> @@ -0,0 +1,98 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: https://protect2.fireeye.com/v1/url?k=1a7dfa9a-7bf6efdd-1a7c71d5-000babff99aa-643f51fc0561c489&q=1&e=c6c89336-1f3a-4d30-a005-615c2b8d9c6f&u=http%3A%2F%2Fdevicetree.org%2Fschemas%2Fusb%2Fsamsung%2Csnps-dwc3.yaml%23
>> +$schema: https://protect2.fireeye.com/v1/url?k=515f3c48-30d4290f-515eb707-000babff99aa-9a67f9f3980bd8f3&q=1&e=c6c89336-1f3a-4d30-a005-615c2b8d9c6f&u=http%3A%2F%2Fdevicetree.org%2Fmeta-schemas%2Fcore.yaml%23
>> +
>> +title: Samsung Exynos SoC DWC3 USB Controller
>> +
>> +maintainers:
>> +  - Krzysztof Kozlowski <krzk@kernel.org>
>> +  - Selvarasu Ganesan <selvarasu.g@samsung.com>
>> +
>> +description:
>> +  Describes the DWC3 USB controller block implemented on Samsung Exynos SoCs.
> Huh? Did you even look at existing bindings?


Yes, We checked samsung,exynos-dwc3.yaml. Exynos8855 could use it, but 
that binding uses a parent and child representation. This patch 
introduces a flattened model where the USB vendor block and SNPS dwc3 
block are in a single node. The goal is to use this for Exynos8855 and 
eventually migrate the other samsung USB implementations from the old 
parent and child model to this one. We'll make this clearer and shorter 
in the commit message.

>
>> +
>> +select:
>> +  properties:
>> +    compatible:
>> +      contains:
>> +        const: samsung,snps-dwc3
>> +  required:
>> +    - compatible
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - enum:
>> +          - samsung,exynos8855-dwc3
>> +      - const: samsung,snps-dwc3
> There is no snps device from Samsung, neither DWC3. The name of device
> is completely wrong. snps is a vendor, not a device.
>
> Anyway, don't use generic fallbacks.
Understood. The fallback was intended to cover upcoming SoCs (8865, 
9955, 9965) and the migration of older SoCs without adding a unique 
string for every project, similar to the qcom,snps-dwc3 approach.

We agree that the naming was incorrect since  "snps" is the vendor. We 
can switch to per SoC compatible strings, but would a corrected fallback 
name like samsung,exynos-dwc3-common or samsung,exynos-snps-dwc3 be 
acceptable instead?
>
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
>> +    minItems: 1
>> +    maxItems: 4
>> +
>> +  clock-names:
>> +    minItems: 1
>> +    maxItems: 4
> You have only one device, why is this flexible?


Exynos8855 only needs two clocks, but maxItems: 4 was added to support 
other samsung USB implementations that use up to four. Since we plan to 
migrate those to the flattened representation later, we wanted the 
binding to cover those requirements as well. Example required 4 clocks 
for gs101-dwusb3 (ref: 
Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml)


>
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
>> +        clock-names:
>> +          items:
>> +            - const: ref
>> +            - const: bus
> Why do you need all this? Look at existing code, don't duplicate. And
> for sure do not introduce one more DWC3 binding claiming to be for
> Samsung devices and completely ignoring existing ones.


We understand the concern about adding another binding. The goal is to 
migrate all samsung USB implementations to this flattened model, and 
then deprecate samsung,exynos-dwc3.yaml to avoid duplication.


Thanks,
Selva

>
> Best regards,
> Krzysztof
