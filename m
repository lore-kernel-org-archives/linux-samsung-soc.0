Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FAB83EDE6C
	for <linux-samsung-soc@vger.kernel.org>; Wed, 16 Sep 2026 06:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789541740; cv=none; b=gA/Oq0owZ2580VG5HOaegTEIlCsCKtUCGx069V+fQAkh2WMf/dIwMDPpiG1mV8Oe7FLkR7UdGReStlBq4E8N//WzxBcc3iCjyV4N1r3oZn9Cc1kxVz/W5FP2sCM2/WbPG75JUBfeTn+plOoqdnbNmE5gbWXAC+pdNDNxNWJlmL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789541740; c=relaxed/simple;
	bh=JTJ88IGbzVBPXF6knhuLYB1+SszOHaf+na+fa/yh0/Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=QPq0WbqkDI/zL3VAT9J/9h9RaiTrEMOttO+VgxiHAlpLuPAIVEN5zmKDauANaPnstrcxX10fXlcLAMGGMH2rOlk9CDJwB4gX7xAK0OMeoXB/ldEphCuWIJGyuhSASOlGAXMg9eggT+g/8o6Q9CfAtzTaAzbwjEwNpqHPEPNQLsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=sN29VXdR; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="sN29VXdR"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20260916065535epoutp03b290b850485712637aa9acebf8c5f607~VuroCEMyN1222812228epoutp03k
	for <linux-samsung-soc@vger.kernel.org>; Wed, 16 Sep 2026 06:55:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20260916065535epoutp03b290b850485712637aa9acebf8c5f607~VuroCEMyN1222812228epoutp03k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1789541735;
	bh=Dmq9AZ1vIHHYBfJ/kR1wgFXYb1HSX0N4D1w5gRdEoaA=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=sN29VXdR2j2bHvRXpPTbj65RGugMMyVibw4Cu63eA28RRhMrNqI0nPBPvmSnvDR5x
	 gP6nnnf8gREha+A1Ic3cb+oXm+ZsDuAs4r29tPDWqiGZ/cwIwQd1+NbHqICNrggcYE
	 wcMP9LcNSs4xbG6HRoWfXxv9I4rIQan2LaNPgUSs=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20260916065534epcas5p3a129d4f73b4e4d18ce8fb3af12881fb3~VurnU534m1719117191epcas5p3p;
	Wed, 16 Sep 2026 06:55:34 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.86]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4hl8m50R9Bz3hhT7; Wed, 16 Sep
	2026 06:55:33 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20260916065532epcas5p3bac23ebb76d7f13815042d4e89821649~Vurln5I_T1987819878epcas5p3u;
	Wed, 16 Sep 2026 06:55:32 +0000 (GMT)
Received: from [107.122.5.126] (unknown [107.122.5.126]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260916065529epsmtip129833710e6fe28286b722fa81fb5efef~Vuri6XZjm1077810778epsmtip18;
	Wed, 16 Sep 2026 06:55:29 +0000 (GMT)
Message-ID: <0faf2d75-3b0c-4b89-ab89-d5f93eb26821@samsung.com>
Date: Wed, 16 Sep 2026 12:25:21 +0530
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] usb: dwc3: Add Exynos8855 to the generic platform
 driver
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
In-Reply-To: <9969f6d6-71ee-4c22-9b37-a0f6bac97169@kernel.org>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260916065532epcas5p3bac23ebb76d7f13815042d4e89821649
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260903071322epcas5p2a40e3299b0954dd880c9b3651555760c
References: <20260903071250.3421499-1-selvarasu.g@samsung.com>
	<CGME20260903071322epcas5p2a40e3299b0954dd880c9b3651555760c@epcas5p2.samsung.com>
	<20260903071250.3421499-4-selvarasu.g@samsung.com>
	<9969f6d6-71ee-4c22-9b37-a0f6bac97169@kernel.org>


On 9/5/2026 12:49 PM, Krzysztof Kozlowski wrote:
> On 03/09/2026 09:12, Selvarasu Ganesan wrote:
>> Add the "samsung,snps-dwc3" compatible string to dwc3-generic-plat so
>> the Exynos8855 USB3 DWC3 controller can probe through the generic DWC3
>> platform glue.
>>
>> The "samsung,snps-dwc3" string is used as a generic fallback to support
>> any Exynos SoC that utilizes a flattened model instantiation. This
>> fallback allows multiple Exynos SoCs to be supported by the generic
>> platform driver simply by adding the fallback compatible to their
>> respective device tree nodes.
>>
>> Co-developed-by: Muhammed Ali <muhammed.ali@samsung.com>
>> Signed-off-by: Muhammed Ali <muhammed.ali@samsung.com>
>> Signed-off-by: Selvarasu Ganesan <selvarasu.g@samsung.com>
>> ---
>>   drivers/usb/dwc3/dwc3-generic-plat.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3-generic-plat.c
>> index ca69ac0eb07c..33a76c37d15d 100644
>> --- a/drivers/usb/dwc3/dwc3-generic-plat.c
>> +++ b/drivers/usb/dwc3/dwc3-generic-plat.c
>> @@ -237,6 +237,7 @@ static const struct of_device_id dwc3_generic_of_match[] = {
>>   	{ .compatible = "fsl,ls1028a-dwc3", &fsl_ls1028_dwc3},
>>   	{ .compatible = "eswin,eic7700-dwc3", &eic7700_dwc3},
>>   	{ .compatible = "starfive,jhb100-dwc3", },
>> +	{ .compatible = "samsung,snps-dwc3", },
> Why not in alphabetical order?

You're right, it's not in alphabetical order. I'll fix this in the next 
version.

Thanks,
Selva
>
> Best regards,
> Krzysztof
