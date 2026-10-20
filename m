Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.254.224.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792474011;
	b=rDxbHbFdXLDUfWIYNGAkwiiSpUYLY04JDz5O+7p+VYUv0qtisjHveIkhr/Zev2SXqkJM
	 PceOogHKYMTjWiMVyLwNKR7XoMB9qgKBG/VmKW7BP4ydmpkC0ugIix43jKXN1RrpScGch
	 OH8mE/OLiDupkVI3nOkx5rt5KHOLJb/+gtB9u8mhLAjrpKg3wjmM1GtjSp511RQ2Kh2M8
	 KqJfSzSlCl7PktWBqWAusGtLXvBHIMsOy5qkIKMTIsj8GVhG0F5lTtufO80HjtER+v1iO
	 BjWGaTXvYVpF1WsSDsHIIiRjA6liSHhtpHWjkzO69avRCHwJFG9XMsL5gjId7JD0gVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792474011;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:
	 Cc:Content-Language:From:In-Reply-To:Content-Transfer-Encoding:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:CMS-TYPE:cpgsPolicy:
	 X-CFilter-Loop:X-CMS-RootMailID:References;
	bh=VBaqtAYhzt9vjT0IOaJ3LEbjNlh/6yFmqmAUZP/n84g=;
	b=Wtr7qcaYEz/uYfBpw1gJ0mTyJZVRfeMfLOxa+Q67zWJq6EKP+Be5QPjs/TcFKPrfR9q8
	 TTH5kkuz4M58b+EVpQjzxhAf2kppfPqZbpSEE5/ndvRXqVBeJk7w/UPHPlmcEWExjLJxn
	 g/rWK3m2AT/BS5tdZd6XNPFSKFWVVUCsyhRf0jJ5pB99MtlViBr2LJOVlxCD9AmPzBW6i
	 xCXKocyhphQOsl73gw+984M3s5qiMZrG0StiOvuy7hvLOEkhBv8j0SgXXCKnldckGtyh8
	 zhGPacehRcnQgtxfWcnOTY+yA7Uj6uX3fqJva0h/LxuRIVjT5RhOUCVveJhJ4P48v/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b="dYEGJLl/";
	arc=none smtp.remote-ip=203.254.224.33
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9C5606A31A
	for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Oct 2026 05:26:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA9C5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=dYEGJLl/
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20261020052641epoutp038b6ee1bb2e97f48f172246b027753f91~gJZuFCo6G1936819368epoutp03Q
	for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Oct 2026 05:26:41 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20261020052641epoutp038b6ee1bb2e97f48f172246b027753f91~gJZuFCo6G1936819368epoutp03Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1792474001;
	bh=VBaqtAYhzt9vjT0IOaJ3LEbjNlh/6yFmqmAUZP/n84g=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=dYEGJLl/XaI8YLA9R+Ob8BLNL4Oe4NEqVu0yZo7lPIWNUon5CtaJa5P+ABxEeLhKV
	 RdokE3KZAgTDw4/1+B9Sq4zlulMxapQI/9OppFOFp4VWgAJIEdR+igm+327fNAyrrt
	 qJWhR/yoLNGDAg38FHqOgluaTODXTEdRRGI7VbQ0=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20261020052640epcas5p27161ada23d6deba25cb84e6fcb0165b0~gJZtBVh9C2585725857epcas5p2s;
	Tue, 20 Oct 2026 05:26:40 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.93]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4j819q3JvDz2SSKb; Tue, 20 Oct
	2026 05:26:39 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20261020052638epcas5p18ff9bffbddf4c8f106a4669f4810370f~gJZrnNRuA1711217112epcas5p1J;
	Tue, 20 Oct 2026 05:26:38 +0000 (GMT)
Received: from [107.122.5.126] (unknown [107.122.5.126]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261020052635epsmtip1b24d9cf98f9333c343d2bf34c031fda5~gJZoqwYIG2871028710epsmtip1g;
	Tue, 20 Oct 2026 05:26:35 +0000 (GMT)
Message-ID: <40a922b9-f56f-4fe1-88f5-5bb236735951@samsung.com>
Date: Tue, 20 Oct 2026 10:56:34 +0530
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
Subject: Re: [PATCH v2] phy: exynos5-usbdrd: Use dynamic phy_cfg size to
 prevent OOB access
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, krzk@kernel.org,
	peter.griffin@linaro.org, alim.akhtar@samsung.com, pritam.sutar@samsung.com,
	andre.draszik@linaro.org, kernel@lvkasz.us, pengpeng@iscas.ac.cn,
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	jh0801.jung@samsung.com, h10.kim@samsung.com, dh10.jung@samsung.com,
	akash.m5@samsung.com, hongpooh.kim@samsung.com, eomji.oh@samsung.com,
	shijie.cai@samsung.com, muhammed.ali@samsung.com, thiagu.r@samsung.com
Content-Language: en-US
From: Selvarasu Ganesan <selvarasu.g@samsung.com>
In-Reply-To: <as0G-bk_TKRToOkv@debian>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261020052638epcas5p18ff9bffbddf4c8f106a4669f4810370f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260918103249epcas5p49c9b4bf6fd60c28f5f09f0b7b69828b6
References: <CGME20260918103249epcas5p49c9b4bf6fd60c28f5f09f0b7b69828b6@epcas5p4.samsung.com>
	<20260918103147.2628614-1-selvarasu.g@samsung.com> <as0G-bk_TKRToOkv@debian>


On 10/12/2026 9:44 PM, Manivannan Sadhasivam wrote:
> On Fri, Sep 18, 2026 at 04:01:47PM +0530, Selvarasu Ganesan wrote:
>> The probe loop currently iterates using EXYNOS5_DRDPHYS_NUM (2),
>> creating both UTMI and PIPE3 PHY instances regardless of the SoC
>> capability. Several SoCs (Exynos2200, Exynos7870, Exynos850, Exynos990,
>> and ExynosAutoV920) provide phy_cfg arrays containing only a single
>> element.
>>
>> On these SoCs, when the loop reaches index 1, the driver reads past the
>> end of the rodata array, populating the second PHY instance with garbage
>> data. Since the configuration structure contains critical function
>> pointers (phy_isol, phy_init, set_refclk), any subsequent access to this
>> PHY instance via exynos5_usbdrd_phy_xlate could result in a kernel oops.
>>
>> Fix this by adding 'n_phy_cfg' to struct exynos5_usbdrd_phy_drvdata to
>> store the actual size of the phy_cfg array for each SoC. Update the
>> probe loop and the xlate function to bound their access against this
>> value instead of the hardcoded EXYNOS5_DRDPHYS_NUM.
>>
>> Assisted-by: LLM
>> Signed-off-by: Selvarasu Ganesan <selvarasu.g@samsung.com>
>> Tested-by: Łukasz Lebiedziński <kernel@lvkasz.us>
>> Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
>> Reviewed-by: André Draszik <andre.draszik@linaro.org>
>> Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
> Since this patch fixes an OOB issue, it should have a Fixes tag and the stable
> list should be CCed for backporting.

Hi Mani,

Thanks for your reviewing patch.

Sure, I will add fixes and stable tag in the next version.

Thanks,
Selva
>
> - Mani
>
