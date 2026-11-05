Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.254.224.25
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793881324;
	b=sztbfAPxA5UaOV1L+o3oF2yvwIPb6p4vxxhXnWl76sItGDzp+JTyR5bnMqWxUOmnVMNr
	 w965Hlyc+bVlMJSyeXEJ+QxxUfJtu5m7AEQELjoKGH7Da7ILzzuHKh2ElJfaXXKO/ZOSZ
	 VUut3XKbNboPLza5xytdrXQMombUnIYqVucG/27ZvbcoolA4NfTyQpQY+lbmGwEqBw5CR
	 099EmxeqqVrcAVvt1L0AXYWDtho7rccQ01vhoaDbFib8gADWt5QnnZmCUXlpKkvXfPyya
	 LlKu3mfCi95nYIwjDqNp73VwRGxzk3hvJh8nhgCrwN5lW6O833EwF/iWtlKhW7IhW7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793881324;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:
	 Cc:Content-Language:From:In-Reply-To:Content-Transfer-Encoding:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:CMS-TYPE:cpgsPolicy:
	 X-CFilter-Loop:X-CMS-RootMailID:References;
	bh=cNjLxshjbldmtVi7ezW8lx2AJPpiQwNaAFoiNC9ElWA=;
	b=eQ5/G5yeIhbEiXn/skNy8HofIUMmv6au+0KNE+5u+tXhJvl/zy0uA0KKeQqtpsnyxGBf
	 2bPsMwVTDe9UFcAVFaTA+IwvIRnlEI0bRc07il7cRW+YPV2fM9J8ZUVk76CH0uqexGIXJ
	 nwejVnEyqQC/5/xsPh9hsIMQJ0MnD2zRD3M7q2jz6GGg3TVzMjPVDF1VR0r1z5TkWHNXL
	 WuI/KD93M7zqnl/qBsl+f/tse4h6F8LwXguhTET4F1UDFY1/YU/B/ABbTaVT0W43KC3q6
	 TYETeae1iQhhaLfwEFQn6yPSD8hq6/onv+L2xcgGLuR+XnJR2H48GpEkFB/8RMoueBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=HTtx2Z5m;
	arc=none smtp.remote-ip=203.254.224.25
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE0A606A32C
	for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Nov 2026 12:22:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AE0A606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=HTtx2Z5m
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20261105122200epoutp0245ed08aa5d26ab2c7f8e4a8b81a269a3~lJY5rNOMM2189721897epoutp02P
	for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Nov 2026 12:22:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20261105122200epoutp0245ed08aa5d26ab2c7f8e4a8b81a269a3~lJY5rNOMM2189721897epoutp02P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793881320;
	bh=cNjLxshjbldmtVi7ezW8lx2AJPpiQwNaAFoiNC9ElWA=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=HTtx2Z5mL5rvw12jKQfhGYsXeW0lv32F1V8xMP3ap5FBhTtpo3kuHw1+yZzRg1wZV
	 UwWZwe8TfhWpt3XO0P/UV0lTP43yhFt36z1VOjtPhD8H9td/Aus80y9xuD7TDgPfxt
	 b9ohh/fSY/FipVYMt8BU/Qaqtfkr+dZWa1X0babg=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20261105122158epcas5p41fe17543c8abcd4c86815bcdcfa554d8~lJY4Xi13h2387123871epcas5p40;
	Thu,  5 Nov 2026 12:21:58 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.89]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4jL1dd5nMXz3hhTC; Thu,  5 Nov
	2026 12:21:57 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20261105122157epcas5p1320966a69d34521faeaabda354501162~lJY2_W1Ae2240322403epcas5p1F;
	Thu,  5 Nov 2026 12:21:57 +0000 (GMT)
Received: from [107.122.5.126] (unknown [107.122.5.126]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261105122154epsmtip29c3fc114ce1213d5c87c233119230900~lJY0PNi8z0501305013epsmtip2l;
	Thu,  5 Nov 2026 12:21:54 +0000 (GMT)
Message-ID: <b68297b5-58cb-4dd6-ac2e-07d6bd408c1c@samsung.com>
Date: Thu, 5 Nov 2026 17:51:46 +0530
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
Subject: Re: [PATCH v4 2/2] usb: dwc3: Add Exynos8855 to the generic
 platform driver
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"peter.griffin@linaro.org" <peter.griffin@linaro.org>,
	"alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org"
	<linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "jh0801.jung@samsung.com"
	<jh0801.jung@samsung.com>, "h10.kim@samsung.com" <h10.kim@samsung.com>,
	"dh10.jung@samsung.com" <dh10.jung@samsung.com>, "akash.m5@samsung.com"
	<akash.m5@samsung.com>, "hongpooh.kim@samsung.com"
	<hongpooh.kim@samsung.com>, "eomji.oh@samsung.com" <eomji.oh@samsung.com>,
	"shijie.cai@samsung.com" <shijie.cai@samsung.com>,
	"muhammed.ali@samsung.com" <muhammed.ali@samsung.com>,
	"thiagu.r@samsung.com" <thiagu.r@samsung.com>
Content-Language: en-US
From: Selvarasu Ganesan <selvarasu.g@samsung.com>
In-Reply-To: <auvcLYl-ZnagU-7H@vbox>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20261105122157epcas5p1320966a69d34521faeaabda354501162
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261026135755epcas5p4efa15a5e7540d91b4411a7b324aeaa5d
References: <20261026135715.33071-1-selvarasu.g@samsung.com>
	<CGME20261026135755epcas5p4efa15a5e7540d91b4411a7b324aeaa5d@epcas5p4.samsung.com>
	<20261026135715.33071-3-selvarasu.g@samsung.com> <auvcLYl-ZnagU-7H@vbox>


On 11/5/2026 7:04 AM, Thinh Nguyen wrote:
> On Mon, Oct 26, 2026, Selvarasu Ganesan wrote:
>> Add the "samsung,exynos8855-dwc3" compatible string to dwc3-generic-plat
>> so the Exynos8855 DWC3 controller can probe through the generic DWC3
>> platform glue. While at it, alphabetically reorder the existing entries.
> Please split the reordering into a separate patch, or just add the new
> entry without it. There are other pending additions to this driver, and
> the reorder will likely cause conflicts.
>
> Thanks,
> Thinh


Hi Thinh,

Thanks for your feedback.

We posted new patchset with drop the alphabetical reorder of 
dwc3_generic_of_match and just add our new entry.

https://lore.kernel.org/all/20261105121401.1661711-1-selvarasu.g@samsung.com/


Thanks,
Selva
>
>> Co-developed-by: Muhammed Ali <muhammed.ali@samsung.com>
>> Signed-off-by: Muhammed Ali <muhammed.ali@samsung.com>
>> Signed-off-by: Selvarasu Ganesan <selvarasu.g@samsung.com>
>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> ---
>>   drivers/usb/dwc3/dwc3-generic-plat.c | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3-generic-plat.c
>> index ca69ac0eb07c..d57496716204 100644
>> --- a/drivers/usb/dwc3/dwc3-generic-plat.c
>> +++ b/drivers/usb/dwc3/dwc3-generic-plat.c
>> @@ -232,10 +232,11 @@ static const struct dwc3_generic_config eic7700_dwc3 =  {
>>   };
>>   
>>   static const struct of_device_id dwc3_generic_of_match[] = {
>> +	{ .compatible = "eswin,eic7700-dwc3", &eic7700_dwc3},
>> +	{ .compatible = "fsl,ls1028a-dwc3", &fsl_ls1028_dwc3},
>> +	{ .compatible = "samsung,exynos8855-dwc3", },
>>   	{ .compatible = "spacemit,k1-dwc3", &spacemit_k1_dwc3},
>>   	{ .compatible = "spacemit,k3-dwc3", },
>> -	{ .compatible = "fsl,ls1028a-dwc3", &fsl_ls1028_dwc3},
>> -	{ .compatible = "eswin,eic7700-dwc3", &eic7700_dwc3},
>>   	{ .compatible = "starfive,jhb100-dwc3", },
>>   	{ /* sentinel */ }
>>   };
>> -- 
>> 2.17.1
