Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.254.224.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792483392;
	b=imlljIHYSfLvVt/AKQIvMdB1aVeAKSJhhF1cAc5gpr6DhS8wltYJgVSQ7j7slvOJwE0k
	 SvCsdzmQg7zh09XvbBNfEY94X4EYJ0/XNjBx0xzqZvh8QRjqNZVvxe9Ytro1WNeMgJsz/
	 pRMZZ3uwLXp74MoTGnc3g0B85TWIu8wocu+Nnb/neGZCGQqsINtzuh2aEbCZVEO+blGex
	 aCDy3LZtmCx2yos5k9FOyrOJuxAenRGF4pXL6yb72VY0bKXZvhE+4ds3eX5WiN7NIxylZ
	 ur9sJa/crNOzPwIvRN30xWDrUk20UVJ5l3SsWjuPH4Ri2ED1rBSHa3xTqSvEb+pzDRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792483392;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 From:To:Cc:Content-Language:In-Reply-To:Content-Transfer-Encoding:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:CMS-TYPE:cpgsPolicy:
	 X-CFilter-Loop:X-CMS-RootMailID:References;
	bh=uUHcD7c2GU89ccoQK7kmOp+eT94pdtP2AmRHpCgaVV0=;
	b=I+I+DWQlAjN6QqOgg0+c1pI2ti9Ms+LnD9BnQkigFS6zxqE6gOmVo0vji9R1QBTNeZTa
	 s2Vka4pWR2Db0CrclkAEwhl2w/a8kIEKTrFI0rLepqPMvzhh1d49M1ZaY/iDGCtHNwQX7
	 NfeFNKhtyq/as9AY5Gt9UH7CR1um+tlOTHo8JywCDzDmfb28j62RFAfXcCWD0KPJ5je7X
	 3BQBZk7dpR3kqOz6io6WTo61tD7oeek2KxpJfuOuZ6si6x+kdi0n8oa6P8rW+tnxD53Ji
	 YWjwRvSeIYk+vS+bpHZk0AWypDpnSCKVYQncEL9LcH4BXoXHkgtyJSHxkxCgPx1ICpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=noi5RM5q;
	arc=none smtp.remote-ip=203.254.224.34
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3E6606A31E
	for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Oct 2026 08:03:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E3E6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=noi5RM5q
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20261020080308epoutp044ad72c553a25c70b95f1b1e04a0df6c0~gLiUK2Syr0399803998epoutp04Q
	for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Oct 2026 08:03:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20261020080308epoutp044ad72c553a25c70b95f1b1e04a0df6c0~gLiUK2Syr0399803998epoutp04Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1792483388;
	bh=uUHcD7c2GU89ccoQK7kmOp+eT94pdtP2AmRHpCgaVV0=;
	h=Date:Subject:From:To:Cc:In-Reply-To:References:From;
	b=noi5RM5qfrCv4N0v0ZApnpWkaWpTg5qSjCFOoMuFxmS9/LCVCkSvJzTU4czgT+nL6
	 jcV1pGYSOSNEu+7du6x/P4VdFlhX61wxlxWuqmqywqR71eFJ9eAHnySYjOM5Bd9Npv
	 bcyOGHlQwySvz7zBqKgg48qVsbchiQsgBI1ACObI=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20261020080303epcas5p39b35b25b23b24e0cc4adc4c3a6205270~gLiPp6CDo1184711847epcas5p3H;
	Tue, 20 Oct 2026 08:03:03 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.89]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4j84fG3qvSz6B9mF; Tue, 20 Oct
	2026 08:03:02 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20261020080302epcas5p2140954a64a9a8db0f7b802611431eed3~gLiOS_PnJ2967129671epcas5p2u;
	Tue, 20 Oct 2026 08:03:02 +0000 (GMT)
Received: from [107.122.5.126] (unknown [107.122.5.126]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261020080259epsmtip225517e3ffa9b53b64dade8aaa8df77cb~gLiLgSsR62884528845epsmtip2g;
	Tue, 20 Oct 2026 08:02:58 +0000 (GMT)
Message-ID: <6643fece-aa39-42e6-8cd6-5264f15e12ff@samsung.com>
Date: Tue, 20 Oct 2026 13:32:58 +0530
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] dt-bindings: usb: Introduce samsung,snps-dwc3
From: Selvarasu Ganesan <selvarasu.g@samsung.com>
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
In-Reply-To: <ad11251d-6632-498d-95f6-04a7c6dade72@samsung.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261020080302epcas5p2140954a64a9a8db0f7b802611431eed3
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
	<fef2b2f5-3838-4eec-8118-d41f9ca0ed2f@samsung.com>
	<7fbcf497-a166-45d6-844d-faaece6f581c@kernel.org>
	<ad11251d-6632-498d-95f6-04a7c6dade72@samsung.com>


On 9/21/2026 12:26 PM, Selvarasu Ganesan wrote:
>
> On 9/18/2026 7:16 PM, Krzysztof Kozlowski wrote:
>> On 18/09/2026 15:36, Selvarasu Ganesan wrote:
>>> On 9/18/2026 3:24 PM, Krzysztof Kozlowski wrote:
>>>> On Wed, Sep 16, 2026 at 05:52:28PM +0530, Selvarasu Ganesan wrote:
>>>>> +maintainers:
>>>>> +  - Krzysztof Kozlowski <krzk@kernel.org>
>>>>> +  - Selvarasu Ganesan <selvarasu.g@samsung.com>
>>>>> +
>>>>> +description:
>>>>> +  Describes the DWC3 USB controller block implemented on Samsung 
>>>>> Exynos SoCs.
>>>>> +
>>>>> +select:
>>>>> +  properties:
>>>>> +    compatible:
>>>>> +      contains:
>>>>> +        const: samsung,snps-dwc3
>>>>> +  required:
>>>>> +    - compatible
>>>> This select is not needed.
>>>>
>>>>> +
>>>>> +properties:
>>>>> +  compatible:
>>>>> +    items:
>>>>> +      - enum:
>>>>> +          - samsung,exynos8855-dwc3
>>>>> +      - const: samsung,snps-dwc3
>>>> And this fallback is not really accurate. Samsung does not have snps
>>>> device, because snps is a vendor. Anyway, generic fallbacks should go
>>>> away, drop, so you are left with samsung,exynos8855-dwc3 only.
>>> Hi Krzysztof,
>>>
>>> Thanks for your review comments.
>>> And We apologize for our repeated below explanation, but we wanted to
>>> ensure our intentions were clear for each point to avoid any
>>> misunderstanding.
>>>
>>> The original intent of the generic fallback was to support existing
>>> Exynos dwc3 bindings from a parent/child representation from
>> How does it support existing bindings? I don't understand. There is no
>> such fallback in existing bindings.
>
>
> Sorry for the misunderstanding, Yes there is no such a fallback in 
> existing bindings.
>
> Our intention was to use new proposed generic fallback compatible 
> string that will support USB dwc3 flatted node for all Samsung soc 
> when those are migrated in the future without adding SoC specific 
> compatible string in driver.
>
> Agreed, Here using generic fallback name (samsung,snps-dwc3 as a 
> reference of qcom,snps-dwc3) is incorrect as snps is vendor not a device.
>
> As per DTS101 slide , Now we clear that the future Exynos SoCs could 
> use  samsung,exynos8855-dwc3 as a fallback when they are compatible 
> with the Exynos8855 hardware definition, rather than introducing a 
> generic samsung,snps-dwc3 fallback. The dedicated compatible would 
> still describe any SoC specific differences, such as clocks.
>
> And Understood that we were mixing the current Exynos8855 binding with 
> the longer term migration plan for the existing Exynos SoCs and future 
> SoCs.
>
> We will drop the generic fallback and use SoC specific compatible 
> samsung,exynos8855-dwc3 (vendor,device), following 
> samsung,exynos-dwc3.yaml as the reference.
>
> Regarding the binding filename, if the flattened representation is 
> expected to support multiple Exynos SoCs where there is only 
> differences in clock in the future, similar to how 
> samsung,exynos-dwc3.yaml covers multiple SoCs with the legacy (parent 
> and child) node representation, should we use a common binding 
> filename for the flattened representation instead of a SoC specific 
> name like samsung,exynos8855-dwc3.yaml.
> For example,
>     samsung,exynos-dwc3-flattened.yaml.


HI Krzysztof,

I am writing to kindly follow up on my previous inquiry regarding the 
binding filename for the flattened representation.

To recap, I would like to know if we should use a common binding 
filename, such as samsung,exynos-dwc3-flattened.yaml, instead of SoC 
specific names (e.g., samsung,exynos8855-dwc3.yaml). This would be 
consistent with how samsung,exynos-dwc3.yaml covers multiple SoCs in the 
legacy representation, especially if we expect to support multiple 
Exynos SoCs with only clock differences in the future.

I would appreciate your guidance or suggestions on the preferred naming 
convention for this implementation.

Thanks,
Selva
>
>
>>
>>> (samsung,exynos-dwc3.yaml), and upcoming SoCs (Exynos 8865, 9955, and
>>> 9965) can use this flattened representation without requiring a unique
>>> compatible string for every project in the dwc3-generic-plat driver
>> I did not forbid you to use fallbacks, so I do not understand why you
>> would need unique compatible for every device in the driver.
>
>
> The intention was to avoid adding separate compatible entries to 
> dwc3_generic_of_match[] for each Exynos SoC.
>
> We understand that adding SoC specific compatibles is the correct 
> approach, as follow in samsung,exynos-dwc3.yaml.
>
>
>>
>> This is already heavily documented and explained in beginners docs.
>> Please read writing bindings docs and maybe also DTS101 slides. I even
>> gave the talk DTS101 two months ago in your timezone...
>
> Thanks for pointing out the DTS101 slids, and we referred again the 
> binding documentation including DTS101 slids for further clarification 
> on the using of fallback.
>
>>
>>
>>> of_match_table. We referred to qcom,snps-dwc3 as a helpful reference 
>>> for
>>> this approach.
>> When people argue with me, they use more often poor examples as
>> reference, not the good ones. Interesting pattern.
>>
>> And why you did not take the proper example you even mentioned here -
>> Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml - as
>> reference?
>>
>> Anyway, existing bug is not a reason to add new bug, don't you think?
>
> Agreed and As we mentioned in above comment, we will use the existing 
> samsung,exynos-dwc3.yaml as the reference for the Samsung binding and 
> drop the qcom,snps-dwc3 reference.
>
>>
>>
>>> As seen in samsung,exynos-dwc3.yaml, our existing bindings already
>>> support multiple SoCs with diverse clock requirements within a single
>>> file. Similarly, we plan to use a single flattened Samsung binding to
>>> manage these diverse clock requirements. for different SoCs.
>>>
>>> Regarding the migration for current and future SoCs, would you prefer,
>> I do not understand how any of this is relevant to my review comment.
>>
>>> Option A: A single flattened binding file using a common fallback
>>> compatible string (instead of samsung,snps-dwc3) to minimize
>>> of_match_table entries, and if/then constraints to handle diverse clock
>>> requirements.
>>> Option B: Separate binding files for each individual SoCs.
>>>
>>> Could you please let us know your preferred approach? Once 
>>> confirmed, we
>>> will address your other review comments based on the selected approach.
>> You do not have other bindings. You have one device. If you have more,
>> then post more. We are not making reviews based on imaginary future 
>> things.
>
> Understood. As mentioned above, we are mixing the current Exynos8855 
> binding with the longer term migration plan and will keep this binding 
> focused on Exynos8855 only and handle other SoCs when they are 
> actually migrated.
>
> Thanks,
> Selva
>
>
>>
>> Best regards,
>> Krzysztof
