Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CDE6367F25
	for <linux-samsung-soc@vger.kernel.org>; Mon, 21 Sep 2026 07:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789974249; cv=none; b=FAdFPVvP5Yl5uyACMPyN4/OAq2GY90uf+AZMQV8CT0fTjnd9ZMpIsp4bhmjSbieM812rU+lMS12uGij5YehGpmBaoWMvwdvbf4eb+3ny6hwI2B3TMpg2HqRJGpT0kfpw59/aDfNgP7PkKDHPt6/5zbczA9+//tbZWNds1wD4/rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789974249; c=relaxed/simple;
	bh=bIoiuueqrgbj5iOEpDzHmj1mvUntjViMQNteYy73Loo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=tilh3uFGhYYADQxXuW12MTIsBtw9bFf1xCOnGbUj3bqKVQCLFIiiRNoeYplPCY5axcqnKt7qvQbQZokKDDo7ys9lexXLwYdhmOIrT2ClNP/vkApALGz3gR5g59im11W9XK7Os4d6+6Zi07DkNSmx1tJMcD0hoz2p3IYK6KOXqUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=OJltEPhS; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="OJltEPhS"
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20260921070405epoutp011a04b5553b40f4d6f001a8257d33c2d2~XRBesNE2w1751517515epoutp01U
	for <linux-samsung-soc@vger.kernel.org>; Mon, 21 Sep 2026 07:04:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20260921070405epoutp011a04b5553b40f4d6f001a8257d33c2d2~XRBesNE2w1751517515epoutp01U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1789974245;
	bh=A2RGwEkX8Nr2X2WiqJgXRovZAX/TOp2rfkegY7+nn5M=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=OJltEPhS4bdswx5DbOMWMF7aMeuigsTDgRdBzFosjRnngMXqPf+GD6UN4IG7qPhKz
	 wQbRBoMSKKMeC5v7dW2sAVY/AzIR/TUv5XEYPCVs8Xr6PxjLrkJf0IUfK+OxUJJe8N
	 MbQUz97SNvL5QlmO7OApDSNgkbOwn4FmOuH8fS1g=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20260921070404epcas5p3fd32e1e83eed9c75c3552ede73a9bcf4~XRBeSK8Xc0766607666epcas5p3g;
	Mon, 21 Sep 2026 07:04:04 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.91]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4hpDjb6Tcfz3hhTL; Mon, 21 Sep
	2026 07:04:03 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20260921070403epcas5p1e5467529358348d41e60829d045e55e9~XRBcw5yLI1491414914epcas5p1n;
	Mon, 21 Sep 2026 07:04:03 +0000 (GMT)
Received: from [107.122.5.126] (unknown [107.122.5.126]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260921070400epsmtip20f421aa8950b361a497ca737f8cf6a1d~XRBZ8jRid2760327603epsmtip2I;
	Mon, 21 Sep 2026 07:04:00 +0000 (GMT)
Message-ID: <053c58ae-5920-4aed-a3b8-61b0a02fc52d@samsung.com>
Date: Mon, 21 Sep 2026 12:33:58 +0530
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
In-Reply-To: <628a4ac0-135d-434a-b5c7-27453e96fdec@kernel.org>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260921070403epcas5p1e5467529358348d41e60829d045e55e9
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
	<628a4ac0-135d-434a-b5c7-27453e96fdec@kernel.org>


On 9/18/2026 7:25 PM, Krzysztof Kozlowski wrote:
> On 18/09/2026 15:46, Krzysztof Kozlowski wrote:
>> On 18/09/2026 15:36, Selvarasu Ganesan wrote:
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
>>> Could you please let us know your preferred approach? Once confirmed, we
>>> will address your other review comments based on the selected approach.
>> You do not have other bindings. You have one device. If you have more,
>> then post more. We are not making reviews based on imaginary future things.
> OK, I guess you referred to my further comments about if:then: block
> here. When you have more devices, you can add them to the same binding,
> with proper constraints for each variant.
>
> https://protect2.fireeye.com/v1/url?k=9ebe79fc-ff356cca-9ebff2b3-74fe485fffe0-0d2d81d841babdca&q=1&e=60d36b7b-e65b-4d92-9fe0-f943564aaf66&u=https%3A%2F%2Felixir.bootlin.com%2Flinux%2Fv7.3-rc3%2Fsource%2FDocumentation%2Fdevicetree%2Fbindings%2Fclock%2Fsamsung%2Cexynos990-clock.yaml%23L93
>
> If the difference is only in clocks, one binding file is usually good to
> hold many variants. If there are more differences, things are getting
> too messy and more files are useful (see commit
> c80dc8121d3af8f33413bb0f9ed9e81e2c576e1a for example).


Thanks for your reference.


Since the differences between the Exynos SoCs with USB DWc3 are 
primarily their clock requirements, We will keep the one binding file 
and add Exynos8855 SoC now and extend the same binding with per 
compatible clock constraints when others are migrated.

As we mentioned in our previous comment, we would appreciate your 
guidance on the naming convention for a binding file that supports 
multiple SoCs for flattened support , similar to how 
samsung,exynos-dwc3.yaml is structured.

should we use a common binding filename for the flattened representation 
(Example: samsung,exynos-dwc3-flattened.yaml)?


Thanks,
Selva
>
> Best regards,
> Krzysztof
