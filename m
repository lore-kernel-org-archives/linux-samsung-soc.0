Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBE6381E84
	for <linux-samsung-soc@vger.kernel.org>; Fri, 18 Sep 2026 10:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789726879; cv=none; b=LUMk5Fz6U6frlSDvZdYvBB91QS3gi2kKmNDTUnNWvSw8tLvxQiEgLERjlmwyhy1jMTmlcHAXEHRTSdk3US1ir5y6AqIZ46fXghJJH4jj68AuHXu89fu0i+0Gq1VUXIbomLIJZnPkaOVl/yL26Mlm3q06Y/nyiF3hdZF+ZnGlYQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789726879; c=relaxed/simple;
	bh=mG76quiYNz0AT0P7HQbuEU8wQLgXjM+PNjTABkJPj8w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=FhuZs+5jG//i3hYyzl9TpFcHKvtn0vSuXCNRiYRTr1WdMHky1abloIBdpvKHUBDrCDA58fhAgTrVYvUcuq1pBq+LxS5igYynBvi3/QvOCYBd9yb6KRKj+v2sJ5zUkVb8DeAiRQHVVjcPVYtq0SCCpyrOQFcR1yiurz2YEUm3QzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=q5/rYOyz; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="q5/rYOyz"
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20260918102113epoutp0282015cfc0a75ccfe834c3b2ecc31cf75~WYxwJPdmA1686516865epoutp02k
	for <linux-samsung-soc@vger.kernel.org>; Fri, 18 Sep 2026 10:21:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20260918102113epoutp0282015cfc0a75ccfe834c3b2ecc31cf75~WYxwJPdmA1686516865epoutp02k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1789726874;
	bh=mboPEqvEACJTAtKfdZ1iQemoHuICqAXG3If2FFLFlMA=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=q5/rYOyzAIRpwubUTigeHz6catvyr++oiaU0INH8BrZP7KLLV9GmF/P5lT+WyNEqy
	 UjLYF4YCdC/VH4C7Haw4t0HWT7x0kdeA4NnZG3++Eq4dMR/OGK38YtBcwoHISHcvKG
	 4qkctIkTlEfF4mqOP/2EOkD1nnjrUbES0DxJmT9w=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20260918102113epcas5p2a37090873c7e08a5b15b0fecf005810b~WYxvgUOtV0355903559epcas5p2C;
	Fri, 18 Sep 2026 10:21:13 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.92]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4hmTDS15Ysz6B9m7; Fri, 18 Sep
	2026 10:21:12 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20260918102111epcas5p202e3b90fcfd624683f76a2ee45f199d4~WYxt86RB51756317563epcas5p20;
	Fri, 18 Sep 2026 10:21:11 +0000 (GMT)
Received: from [107.122.5.126] (unknown [107.122.5.126]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260918102109epsmtip1577c944b77491d8b4992d17593276ce2~WYxrze7hA1639116391epsmtip1_;
	Fri, 18 Sep 2026 10:21:09 +0000 (GMT)
Message-ID: <32029c62-faad-42e3-b1bb-e66772ca8ac0@samsung.com>
Date: Fri, 18 Sep 2026 15:51:08 +0530
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: exynos5-usbdrd: Use dynamic phy_cfg size to
 prevent OOB access
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
	vkoul@kernel.org, neil.armstrong@linaro.org, krzk@kernel.org,
	peter.griffin@linaro.org, alim.akhtar@samsung.com, pritam.sutar@samsung.com,
	kernel@lvkasz.us, linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: jh0801.jung@samsung.com, dh10.jung@samsung.com, akash.m5@samsung.com,
	muhammed.ali@samsung.com, thiagu.r@samsung.com
Content-Language: en-US
From: Selvarasu Ganesan <selvarasu.g@samsung.com>
In-Reply-To: <950335110f9d9c22a026fa5174e492c4194299a5.camel@linaro.org>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260918102111epcas5p202e3b90fcfd624683f76a2ee45f199d4
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260831070349epcas5p4c62a4e46592dffe95723ddd51a6068e0
References: <CGME20260831070349epcas5p4c62a4e46592dffe95723ddd51a6068e0@epcas5p4.samsung.com>
	<20260831070309.158069-1-selvarasu.g@samsung.com>
	<950335110f9d9c22a026fa5174e492c4194299a5.camel@linaro.org>


On 9/18/2026 2:04 PM, André Draszik wrote:
> On Mon, 2026-08-31 at 12:33 +0530, Selvarasu Ganesan wrote:
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
>> Assisted-by: Claude:claude-sonnet-5
> Shouldn't this be 'Assisted-by: LLM'?
You are correct. I will update the tag to 'Assisted-by: LLM' as per the 
kernel documentation in the next version.

Thank you for pointing this out.

Thanks,
Selva
>
>> Signed-off-by: Selvarasu Ganesan <selvarasu.g@samsung.com>
>> ---
>>   drivers/phy/samsung/phy-exynos5-usbdrd.c | 17 +++++++++++++++--
>>   1 file changed, 15 insertions(+), 2 deletions(-)
> Other than that:
>
> Reviewed-by: André Draszik <andre.draszik@linaro.org>
