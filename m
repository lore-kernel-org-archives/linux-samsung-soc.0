Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.254.224.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792498417;
	b=sSb/MvX4Lx7JxZ1Czfki5AG7yEYYlUYLAxcHCrydIlp67JSgE9RiRumqMjqRPXxLA9eu
	 OjvRBA87ICKWYhJF342Amr1zcGme1Fey9ynKg4QwQWFerFPdDi3yfC+bFVwpFgDGEm6YL
	 zytezvnykOyS1lO8GiS70YkoPvnxGcgksDAUyd+TDlvhqzwdp/oKuDysBuFU/CuoSzcYf
	 AX6FBYzMYya3TyGd/z5pXzmSRTksOMxS02ezOa6YFYz17J6IUHHcRas5tc8vG9f3UBCoX
	 zgl2iRlMPUHR7UuzOPUHk3xuNXhTLk5D+CjkL+0Hit+J7u+ohNGLTRuW+nLyeKFe9Mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792498417;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:
	 Cc:Content-Language:From:In-Reply-To:Content-Transfer-Encoding:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:CMS-TYPE:cpgsPolicy:
	 X-CFilter-Loop:X-CMS-RootMailID:References;
	bh=wLIq/j6Lu+uP0L9kgDFB3USz+FZ01OLIPPeNche/6JE=;
	b=s5wISvQ0C0FrctwFLhb+KO/LC+9v/qFYXH90keUhab96YvQIedeg4Mgo+LnAVybOasvM
	 VLd+jMH3+uKEG1T0yzvabDBu0EoeWYp0b23YY8T22Sqw97AxKEGZWXqdG6GWrwOZa/g1Y
	 E5jA9uRogUw3iXx1ZeSEnnVe1PHuRghw+BSyxFtHaqbMM0dIRkT2WHfUozi0Kr3ieVXE7
	 dWxq4zkrUA5SieZhlLO53JItsVAIvBhtK5g3lM1iF/YDlVjnfeUKA5ePIq9bh7w5u83G0
	 Z+tSAX0JVTACwtp9MpHs6JM6d4t0p1CwrgWdW3V6FogKt7MMJdS9ipNjsq5mhhWUxGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	arc=none smtp.remote-ip=203.254.224.34
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8130D606A31D
	for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Oct 2026 12:13:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8130D606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20261020121334epoutp041634d0b69f413d1ae4a73e1f140ab187~gO8_PKfrV3217032170epoutp04r
	for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Oct 2026 12:13:34 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20261020121334epoutp041634d0b69f413d1ae4a73e1f140ab187~gO8_PKfrV3217032170epoutp04r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1792498414;
	bh=wLIq/j6Lu+uP0L9kgDFB3USz+FZ01OLIPPeNche/6JE=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=Bf/R7kBxjDk8d/h6NQwIAjLmX7PAZ7nYeCiYMZmMpcbC/xL2bw2FMUasCh1AY0PLl
	 0P23ybo/aJqvMh6n20cbXDr7ZD2tVvrACU1CSHQVWRn1qDjX6RAVXpsBfma1uOamYk
	 /cOF2bLor7U6Rm0n4pDaCPqGOvL3mJGM4rSJcC4w=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20261020121333epcas5p1cefd2208a1ba69c3eadff2affe837be0~gO89WhIbt0386603866epcas5p1J;
	Tue, 20 Oct 2026 12:13:33 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.88]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4j8BCJ30DRz3hhT4; Tue, 20 Oct
	2026 12:13:32 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20261020121331epcas5p145a58f26f6c55972c547caed56823b9e~gO87OXQvS2930829308epcas5p1r;
	Tue, 20 Oct 2026 12:13:31 +0000 (GMT)
Received: from [107.122.5.126] (unknown [107.122.5.126]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261020121328epsmtip284d74fcc662d998520715b4f4c9248ca~gO84dUVRu1265412654epsmtip24;
	Tue, 20 Oct 2026 12:13:28 +0000 (GMT)
Message-ID: <2afcbcc4-476a-4350-abc5-cd3b98c185f4@samsung.com>
Date: Tue, 20 Oct 2026 17:43:26 +0530
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
In-Reply-To: <2fd0111b-8dc9-40e5-b705-d9f3d5265035@kernel.org>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261020121331epcas5p145a58f26f6c55972c547caed56823b9e
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
	<6643fece-aa39-42e6-8cd6-5264f15e12ff@samsung.com>
	<2fd0111b-8dc9-40e5-b705-d9f3d5265035@kernel.org>


On 10/20/2026 5:02 PM, Krzysztof Kozlowski wrote:
> On 20/10/2026 10:02, Selvarasu Ganesan wrote:
>>>>>>> +properties:
>>>>>>> +  compatible:
>>>>>>> +    items:
>>>>>>> +      - enum:
>>>>>>> +          - samsung,exynos8855-dwc3
>>>>>>> +      - const: samsung,snps-dwc3
>>>>>> And this fallback is not really accurate. Samsung does not have snps
>>>>>> device, because snps is a vendor. Anyway, generic fallbacks should go
>>>>>> away, drop, so you are left with samsung,exynos8855-dwc3 only.
>>>>> Hi Krzysztof,
>>>>>
>>>>> Thanks for your review comments.
>>>>> And We apologize for our repeated below explanation, but we wanted to
>>>>> ensure our intentions were clear for each point to avoid any
>>>>> misunderstanding.
>>>>>
>>>>> The original intent of the generic fallback was to support existing
>>>>> Exynos dwc3 bindings from a parent/child representation from
>>>> How does it support existing bindings? I don't understand. There is no
>>>> such fallback in existing bindings.
>>>
>>> Sorry for the misunderstanding, Yes there is no such a fallback in
>>> existing bindings.
>>>
>>> Our intention was to use new proposed generic fallback compatible
>>> string that will support USB dwc3 flatted node for all Samsung soc
>>> when those are migrated in the future without adding SoC specific
>>> compatible string in driver.
>>>
>>> Agreed, Here using generic fallback name (samsung,snps-dwc3 as a
>>> reference of qcom,snps-dwc3) is incorrect as snps is vendor not a device.
>>>
>>> As per DTS101 slide , Now we clear that the future Exynos SoCs could
>>> use  samsung,exynos8855-dwc3 as a fallback when they are compatible
>>> with the Exynos8855 hardware definition, rather than introducing a
>>> generic samsung,snps-dwc3 fallback. The dedicated compatible would
>>> still describe any SoC specific differences, such as clocks.
>>>
>>> And Understood that we were mixing the current Exynos8855 binding with
>>> the longer term migration plan for the existing Exynos SoCs and future
>>> SoCs.
>>>
>>> We will drop the generic fallback and use SoC specific compatible
>>> samsung,exynos8855-dwc3 (vendor,device), following
>>> samsung,exynos-dwc3.yaml as the reference.
>>>
>>> Regarding the binding filename, if the flattened representation is
>>> expected to support multiple Exynos SoCs where there is only
>>> differences in clock in the future, similar to how
>>> samsung,exynos-dwc3.yaml covers multiple SoCs with the legacy (parent
>>> and child) node representation, should we use a common binding
>>> filename for the flattened representation instead of a SoC specific
>>> name like samsung,exynos8855-dwc3.yaml.
>>> For example,
>>>      samsung,exynos-dwc3-flattened.yaml.
>>
>> HI Krzysztof,
>>
>> I am writing to kindly follow up on my previous inquiry regarding the
>> binding filename for the flattened representation.
> I started to ignore overly long answers, because to me that means
> contributor expects me to devote a lot of time to their contribution. Or
> second option: LLM proxy. There is even a trend where people paste
> prompts or LLM-chat-confirmation-like answers. I often do not correct
> even such cases, just put the ignore list.

Hi Krzysztof,

Thank you for the feedback. And i apologize for the long answers.

>
>
>> To recap, I would like to know if we should use a common binding
>> filename, such as samsung,exynos-dwc3-flattened.yaml, instead of SoC
>> specific names (e.g., samsung,exynos8855-dwc3.yaml). This would be
>> consistent with how samsung,exynos-dwc3.yaml covers multiple SoCs in the
>> legacy representation, especially if we expect to support multiple
>> Exynos SoCs with only clock differences in the future.
>>
>> I would appreciate your guidance or suggestions on the preferred naming
>> convention for this implementation.
> Please use the naming expressed in on of the rules for writing bindings,
> so one matching the compatible or fallback compatible.


Understood, I will follow the binding rules and use a filename that 
matches the compatible (e.g., compatible: samsung,exynos8855-dwc3, and 
the file name will be: samsung,exynos8855-dwc3.yaml for this new SoC)


Thanks,
Selva
>
>
> Best regards,
> Krzysztof
