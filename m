Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C2D49B447
	for <linux-samsung-soc@vger.kernel.org>; Fri, 18 Sep 2026 13:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789739050; cv=none; b=QIBmF06pkS9WAya4HLgVWPES/JJyZi9Ti4Ob/vQ0nnzW7iBE2OMRSAwsIZT38JEczYxRpAMDvoWbh7GB/4CFC1E5M8EbX09+ALg9ODWdw5D0tg1yD+Ffh9TnV15pz1zdoc4eMoQm19fGXGgs+s6c3gA+xYGJf7ZjPGadtTRy07w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789739050; c=relaxed/simple;
	bh=uJsQzfWCDIRCob0IF7snybE9f9o4EOemrRTYpIkms8s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=AzOOCCVQS0OOZZUeobwdo1in0v6wrcjhu82aK4uMMn5v5RVX01JCAc7V/oFf9ZVoXn15Lh+tqZlGqMxwirQAI44DFYvHbocgyi/my6GvfxUE/XdZWaJisEZ/8UGEk4sQs/y90InOQJ8LTH1e9Pv1RQB9UiNNIx6/g3gdfYj7a2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=BvdJV45B; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="BvdJV45B"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20260918134404epoutp0304d823378ac3e85667c0050a0abc08c0~Wbi2iX59K1042110421epoutp03Q
	for <linux-samsung-soc@vger.kernel.org>; Fri, 18 Sep 2026 13:44:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20260918134404epoutp0304d823378ac3e85667c0050a0abc08c0~Wbi2iX59K1042110421epoutp03Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1789739044;
	bh=M/6THK5ybFgfnJ44IwMV41p5iO6sYAnbdxfxWAQES9w=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=BvdJV45BfaSNm3RBet5A4cWePbMXofrFm/MfD3erSc3oygiJg4jzT6iesCSkZBSIt
	 7esRhTulZAIixielR7/NYvk28QLkI8TlZ5S8eN9v04wmQ2FXZfjkteXFt0cihMirdV
	 UeG4gHNUPJPn7hvXKKwQLnnEebgzWKMZvbYNYQ68=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20260918134403epcas5p259a04e149d24f77658758604afbc56b2~Wbi16PIyF3098530985epcas5p21;
	Fri, 18 Sep 2026 13:44:03 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.94]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4hmYkV3WySz6B9m6; Fri, 18 Sep
	2026 13:44:02 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20260918134401epcas5p34a132942523dca5b7e6831894b7ae494~Wbi0dtpu52504725047epcas5p3C;
	Fri, 18 Sep 2026 13:44:01 +0000 (GMT)
Received: from [107.122.5.126] (unknown [107.122.5.126]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260918134358epsmtip1c1a77ba9b4a8af69fba914d4067d77f4~WbixpWZaJ2193021930epsmtip1S;
	Fri, 18 Sep 2026 13:43:58 +0000 (GMT)
Message-ID: <14b69f98-7fd9-4b66-a1c0-0d1c29ab25b0@samsung.com>
Date: Fri, 18 Sep 2026 19:13:57 +0530
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] MAINTAINERS: add Samsung USB DT binding to
 ARM/SAMSUNG entry
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
In-Reply-To: <20260918-eminent-wooden-shark-97b8be@quoll>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260918134401epcas5p34a132942523dca5b7e6831894b7ae494
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260916122351epcas5p37666f1232d3b2bcc1d02a96ab0df4142
References: <20260916122229.2604003-1-selvarasu.g@samsung.com>
	<CGME20260916122351epcas5p37666f1232d3b2bcc1d02a96ab0df4142@epcas5p3.samsung.com>
	<20260916122229.2604003-2-selvarasu.g@samsung.com>
	<20260918-eminent-wooden-shark-97b8be@quoll>


On 9/18/2026 3:28 PM, Krzysztof Kozlowski wrote:
> On Wed, Sep 16, 2026 at 05:52:27PM +0530, Selvarasu Ganesan wrote:
>> Add the Samsung USB devicetree binding file path under the existing
>> ARM/Samsung SoC maintainership.
>>
>> Signed-off-by: Selvarasu Ganesan <selvarasu.g@samsung.com>
>> ---
>>   MAINTAINERS | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index a53620839407..87a1ab24a375 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -3576,6 +3576,7 @@ F:	Documentation/devicetree/bindings/arm/samsung/
>>   F:	Documentation/devicetree/bindings/hwinfo/samsung,*
>>   F:	Documentation/devicetree/bindings/power/pd-samsung.yaml
>>   F:	Documentation/devicetree/bindings/soc/samsung/
>> +F:	Documentation/devicetree/bindings/usb/samsung,*
> I think this is not really needed. First of all, files will be covered
> by N: pattern further in the entry. Second, patches for these should go
> via USB, but listing here the directory could create impression that
> Samsung SoC is responsible.
>
> This one entry is harmless, but if adding this, then next time we got 15
> more updates for each of Documentation/devicetree/bindings/*/samsung*
> files. Is it worth?
>
> Interested people can add themselves to the bindings maintainers entry,
> that's always welcomed.

Hi Krzysztof,

Thanks for your detailed explanations.

Agreed. We will drop this patch in the next version.

Thanks,
Selva
>
> Best regards,
> Krzysztof
