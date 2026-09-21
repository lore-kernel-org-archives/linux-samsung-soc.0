Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD66939020C
	for <linux-samsung-soc@vger.kernel.org>; Mon, 21 Sep 2026 06:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789973836; cv=none; b=odk5wgQ9lXmY7CseEMq/baQEe/H1WfpP9RgEiAsHESb+F2DmnFoWmdPeOC93rwn9Zu3op4b3kRa1ciO8x2D/cpUh5IEaCEL0fx413wo+st7Rt2lEJCzoMgclshUa69qAryH2uH23w9nQ349WYDNVaKT1UbVJtZN7YW/QKTj6KGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789973836; c=relaxed/simple;
	bh=FBRSPzbB4uukAf1sfQ5+80EUwCelQB0CoRDmp9fGQbM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=SddvIM6+KVeTbRaQmcwJCdJhnTgOKbbIZdykKEC8F4vzHpQ8q2mNqmlgjMdqwPDCOFysSAh8VI/mf3mj0SrnwAiWFzsfF7+Iaw4Bfjq+WGiyqtpwrnz6A3j7mKTFlSXRYJl1OY/bRcg+c33ncuoVvqSaeZ169arrciZx8POxN0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=goVdX1Fn; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="goVdX1Fn"
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20260921065655epoutp031ba02813ab4edd77b24609f93bf8f4b8~XQ7OMiYu90491104911epoutp03f
	for <linux-samsung-soc@vger.kernel.org>; Mon, 21 Sep 2026 06:56:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20260921065655epoutp031ba02813ab4edd77b24609f93bf8f4b8~XQ7OMiYu90491104911epoutp03f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1789973815;
	bh=Sx9FOoxQvuZUypmVC0L6B51Mmvypr521KEqVNA4oNV8=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=goVdX1FncYEd3pI6dsvnVNdzUTIqA0vViaaeK8F5vtUchD0NHG62ilZxYVzTBzKvD
	 ztBN9uJJR/0n82cIOA7QwqKUJLQ+b4KVi4lE3BarsSSVNT7EaqgnnJMdOMCNAoj1Si
	 Gis6ngakfZdVO+mvzEjK1Po2stJnvQ1WDQNH2ifk=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20260921065654epcas5p14a6ad095d4ed94fb6d6020c63eb2bd5a~XQ7NtefSx0329703297epcas5p1v;
	Mon, 21 Sep 2026 06:56:54 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.86]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4hpDYK5HSwz2SSKb; Mon, 21 Sep
	2026 06:56:53 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20260921065653epcas5p1c783affc2f314e0b1af785fda147c904~XQ7MIkaRz0329703297epcas5p1s;
	Mon, 21 Sep 2026 06:56:53 +0000 (GMT)
Received: from [107.122.5.126] (unknown [107.122.5.126]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260921065650epsmtip23f6c0e3a72a231b4984b198b7aab69cf~XQ7JWDkr72462824628epsmtip28;
	Mon, 21 Sep 2026 06:56:49 +0000 (GMT)
Message-ID: <ad11251d-6632-498d-95f6-04a7c6dade72@samsung.com>
Date: Mon, 21 Sep 2026 12:26:48 +0530
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
In-Reply-To: <7fbcf497-a166-45d6-844d-faaece6f581c@kernel.org>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260921065653epcas5p1c783affc2f314e0b1af785fda147c904
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


On 9/18/2026 7:16 PM, Krzysztof Kozlowski wrote:
> On 18/09/2026 15:36, Selvarasu Ganesan wrote:
>> On 9/18/2026 3:24 PM, Krzysztof Kozlowski wrote:
>>> On Wed, Sep 16, 2026 at 05:52:28PM +0530, Selvarasu Ganesan wrote:
>>>> +maintainers:
>>>> +  - Krzysztof Kozlowski <krzk@kernel.org>
>>>> +  - Selvarasu Ganesan <selvarasu.g@samsung.com>
>>>> +
>>>> +description:
>>>> +  Describes the DWC3 USB controller block implemented on Samsung Exynos SoCs.
>>>> +
>>>> +select:
>>>> +  properties:
>>>> +    compatible:
>>>> +      contains:
>>>> +        const: samsung,snps-dwc3
>>>> +  required:
>>>> +    - compatible
>>> This select is not needed.
>>>
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    items:
>>>> +      - enum:
>>>> +          - samsung,exynos8855-dwc3
>>>> +      - const: samsung,snps-dwc3
>>> And this fallback is not really accurate. Samsung does not have snps
>>> device, because snps is a vendor. Anyway, generic fallbacks should go
>>> away, drop, so you are left with samsung,exynos8855-dwc3 only.
>> Hi Krzysztof,
>>
>> Thanks for your review comments.
>> And We apologize for our repeated below explanation, but we wanted to
>> ensure our intentions were clear for each point to avoid any
>> misunderstanding.
>>
>> The original intent of the generic fallback was to support existing
>> Exynos dwc3 bindings from a parent/child representation from
> How does it support existing bindings? I don't understand. There is no
> such fallback in existing bindings.


Sorry for the misunderstanding, Yes there is no such a fallback in 
existing bindings.

Our intention was to use new proposed generic fallback compatible string 
that will support USB dwc3 flatted node for all Samsung soc when those 
are migrated in the future without adding SoC specific compatible string 
in driver.

Agreed, Here using generic fallback name (samsung,snps-dwc3 as a 
reference of qcom,snps-dwc3) is incorrect as snps is vendor not a device.

As per DTS101 slide , Now we clear that the future Exynos SoCs could 
use  samsung,exynos8855-dwc3 as a fallback when they are compatible with 
the Exynos8855 hardware definition, rather than introducing a generic 
samsung,snps-dwc3 fallback. The dedicated compatible would still 
describe any SoC specific differences, such as clocks.

And Understood that we were mixing the current Exynos8855 binding with 
the longer term migration plan for the existing Exynos SoCs and future 
SoCs.

We will drop the generic fallback and use SoC specific compatible 
samsung,exynos8855-dwc3 (vendor,device), following 
samsung,exynos-dwc3.yaml as the reference.

Regarding the binding filename, if the flattened representation is 
expected to support multiple Exynos SoCs where there is only differences 
in clock in the future, similar to how samsung,exynos-dwc3.yaml covers 
multiple SoCs with the legacy (parent and child) node representation, 
should we use a common binding filename for the flattened representation 
instead of a SoC specific name like samsung,exynos8855-dwc3.yaml.
For example,
     samsung,exynos-dwc3-flattened.yaml.


>
>> (samsung,exynos-dwc3.yaml), and upcoming SoCs (Exynos 8865, 9955, and
>> 9965) can use this flattened representation without requiring a unique
>> compatible string for every project in the dwc3-generic-plat driver
> I did not forbid you to use fallbacks, so I do not understand why you
> would need unique compatible for every device in the driver.


The intention was to avoid adding separate compatible entries to 
dwc3_generic_of_match[] for each Exynos SoC.

We understand that adding SoC specific compatibles is the correct 
approach, as follow in samsung,exynos-dwc3.yaml.


>
> This is already heavily documented and explained in beginners docs.
> Please read writing bindings docs and maybe also DTS101 slides. I even
> gave the talk DTS101 two months ago in your timezone...

Thanks for pointing out the DTS101 slids, and we referred again the 
binding documentation including DTS101 slids for further clarification 
on the using of fallback.

>
>
>> of_match_table. We referred to qcom,snps-dwc3 as a helpful reference for
>> this approach.
> When people argue with me, they use more often poor examples as
> reference, not the good ones. Interesting pattern.
>
> And why you did not take the proper example you even mentioned here -
> Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml - as
> reference?
>
> Anyway, existing bug is not a reason to add new bug, don't you think?

Agreed and As we mentioned in above comment, we will use the existing 
samsung,exynos-dwc3.yaml as the reference for the Samsung binding and 
drop the qcom,snps-dwc3 reference.

>
>
>> As seen in samsung,exynos-dwc3.yaml, our existing bindings already
>> support multiple SoCs with diverse clock requirements within a single
>> file. Similarly, we plan to use a single flattened Samsung binding to
>> manage these diverse clock requirements. for different SoCs.
>>
>> Regarding the migration for current and future SoCs, would you prefer,
> I do not understand how any of this is relevant to my review comment.
>
>> Option A: A single flattened binding file using a common fallback
>> compatible string (instead of samsung,snps-dwc3) to minimize
>> of_match_table entries, and if/then constraints to handle diverse clock
>> requirements.
>> Option B: Separate binding files for each individual SoCs.
>>
>> Could you please let us know your preferred approach? Once confirmed, we
>> will address your other review comments based on the selected approach.
> You do not have other bindings. You have one device. If you have more,
> then post more. We are not making reviews based on imaginary future things.

Understood. As mentioned above, we are mixing the current Exynos8855 
binding with the longer term migration plan and will keep this binding 
focused on Exynos8855 only and handle other SoCs when they are actually 
migrated.

Thanks,
Selva


>
> Best regards,
> Krzysztof
