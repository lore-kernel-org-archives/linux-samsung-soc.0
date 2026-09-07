Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20871D7E5C
	for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Sep 2026 08:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788771046; cv=none; b=VDXHSjpbeGU6wtsbWQzTizrQ43TuqnwQQC2QrwADkmRFFnEFUB9kFRvskkC7cE6Wl8zPyCjSE2dgfPlU12XxvKkqFwKL57vlEkU4eluUwtR/LMOk+zdxxv59AhHnUqzy+EEf3/upFZJEEeU4JbGxAw22Gurjnen+PURMPd+8NR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788771046; c=relaxed/simple;
	bh=xmCTnONORML0xzQsXGPQJSnXopDASGXDpFKTtpfRy+I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=ZwYNRZ4Y6zP1V7zbPZ+476AXLOt53+zQdfgfxb4M48QryDo4WbMRJx33b1kGpmFVtKTrwFaN/ETQvyWsoJBm+fpmHNpy2hJp+nzR68GPQF3bvEwgV1dWvaDz8NiR2Kl1Txwq4LPVwmINwoECVSm3qKwWtmlcHU1s7RtCSptWiZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=qnDUqXXA; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="qnDUqXXA"
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20260907085041epoutp044bd61db5bb279ac01081efd6c50e45e3~S-cjgpSll0997409974epoutp04q
	for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Sep 2026 08:50:41 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20260907085041epoutp044bd61db5bb279ac01081efd6c50e45e3~S-cjgpSll0997409974epoutp04q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1788771041;
	bh=RFjqqtuQMHlIRw585Wn4nrpGsc9yhalulq9+ydGLu7Y=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=qnDUqXXADXQcaLnqfevPguIb1R/9rdh7a226I89ZUI3hHpgxUCG2wo9o+lGSmbG2l
	 /pDaDBj/tFVhMDTP6x+tWpLO4iP3FFw6Xc5Jm2Xe7paNwEE75MKVhkmtkf5IKFNrtd
	 D0lKe9QAmIu1SoPrA4oj3bjby4xpLTv5GvM7cu7k=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20260907085040epcas5p11e00318dbcf56c67ee11afd79369faa9~S-ci_hk3f3212532125epcas5p1g;
	Mon,  7 Sep 2026 08:50:40 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.90]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4hdgl346Sgz6B9mH; Mon,  7 Sep
	2026 08:50:39 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20260907085039epcas5p24c419437ae9644adc78521646b2f1728~S-chhk3rU1189311893epcas5p2O;
	Mon,  7 Sep 2026 08:50:39 +0000 (GMT)
Received: from [107.122.5.126] (unknown [107.122.5.126]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260907085036epsmtip189981f862ba2d77168178876da8696a5~S-ce6VyDH2067720677epsmtip1s;
	Mon,  7 Sep 2026 08:50:36 +0000 (GMT)
Message-ID: <792517c1-9970-44f2-8eff-2a87895cc37c@samsung.com>
Date: Mon, 7 Sep 2026 14:20:35 +0530
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
In-Reply-To: <5629de34-1a63-40bf-8375-64be9a69eea2@kernel.org>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260907085039epcas5p24c419437ae9644adc78521646b2f1728
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
	<e4bafeea-4548-41ef-b5e2-98ade2864e74@samsung.com>
	<5629de34-1a63-40bf-8375-64be9a69eea2@kernel.org>


On 9/7/2026 12:37 PM, Krzysztof Kozlowski wrote:
> On 07/09/2026 08:04, Selvarasu Ganesan wrote:
>> On 9/5/2026 12:52 PM, Krzysztof Kozlowski wrote:
>>> On 03/09/2026 09:12, Selvarasu Ganesan wrote:
>>>> The Samsung Exynos8855 USB glue is not separate from the Synopsys DWC3
>>>> core, using a flattened model where the DWC3 controller is directly
>>>> addressable rather than nested as a child node of a glue layer.
>>>>
>>>> Describe the Exynos USB block as a single node, referencing the split
>>>> out Synopsys DWC3 core properties via snps,dwc3-common.yaml. The new
>>>> binding follows the same approach as qcom,snps-dwc3.
>>>>
>>>> A generic fallback compatible "samsung,snps-dwc3" is introduced to
>>>> describe this binding, selected by the validator based on the presence
>>>> of the fallback string in the compatible list. Future Exynos SoCs
>>> This is AI slop text. Over longish useless sentence describing diff
>>> without actual information WHY.
>>>
>>> Don't send AI generated slop messages.
>> Sorry for the misleading info on this commit message. We were trying to
>> explain why a separate flattened representation is being introduced with
>> using generic fallback string, and follow the style of some other DWC3
>> flattened refactors (like the Qualcomm :
>> https://lore.kernel.org/all/20250414-dwc3-refactor-v7-2-f015b358722d@oss.qualcomm.com)
>> to justify the separate binding, but it became too long. We'll simplify
>> it and keep only the technical reasoning.
> Flattened node is the right approach, so just say this is the first
> Samsung Exynos binding using flattened node.


Thanks for your update.
We will update the commit message as follows and post a new patch set.
And We are assuming that all other points including the clock count and 
the generic fallback compatible (samsung,snps-dwc3) are fine.


dt-bindings: usb: Introduce samsung,snps-dwc3

Add the Samsung Exynos8855 DWC3 binding using a flattened node
representation, where the DWC3 controller is directly
addressable rather than nested as a child node of a glue layer.

This is the first Samsung Exynos binding using the flattened
representation. The existing samsung,exynos-dwc3 binding describes the
parent and child representation used by existing Exynos SoCs, which can
be migrated to the flattened model.

Use the samsung,snps-dwc3 fallback compatible for Samsung Exynos SoCs
sharing the same flattened model can be added by extending the
compatible enum with per SoC clock and property constraints.

Thanks,
Selva
>
>
> Best regards,
> Krzysztof
