Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B5F381E88
	for <linux-samsung-soc@vger.kernel.org>; Thu,  3 Sep 2026 03:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788407025; cv=none; b=FYakh6P2zzisNy9QMhvr326U7kravV6ezEbVuZ6VyHS5aBscJ/J3TyV2fj4ftXzc3K+KtglOdM9rb6fJOyo44OwSKUSXp368tcSKiUmbhh1M9/OpHnjtvd8Xj2hLrRJtPCgLOt5FoeSsquOX5NhB7sBr0QPfBal55mCu36CYvlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788407025; c=relaxed/simple;
	bh=tlD/300mTCgE6kv08vNQaKy92eCVQTGkxSaMGZ++ryA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=GcVtYJGezv6DnHGjoHfem+mkX7Dy58ceTz3jy99KtJYwZAdhe96MAgPtYJeGFnLxNhZoeOic3rRJguaul9Hv6NwxvBWfO6i/mp1GP5qwn/E84Q+jNPzZL8O5GfhXRM3qXxyo/IV7SB/37JQ0ay+uMzlhxk99k5ALh/s+XX5aDYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=X55mDB+o; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="X55mDB+o"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20260903034328epoutp01fbb27331e9d5b7a1ff9ad1276db611d9~RsrLte3hm3256932569epoutp01F
	for <linux-samsung-soc@vger.kernel.org>; Thu,  3 Sep 2026 03:43:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20260903034328epoutp01fbb27331e9d5b7a1ff9ad1276db611d9~RsrLte3hm3256932569epoutp01F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1788407008;
	bh=hxQCmTNMct1DRhOL2zkVSmPzrkHNVIa3V+xEsZNmDLo=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=X55mDB+o3vq/x9sQQI0kgJmccvhvqmrDBVLetGnJ5rysGFps+x9Z5pg7e7DEXHRPL
	 2/0SyS3NM44wZzXZXqvahQaKVflAHUL/zLeWNphMMxl2hTsWm6SPg144C/7xDZOZAj
	 sP9cSdln4Wrv0RDmhF5uwlfamEGNLhGR+3orqEH0=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20260903034328epcas5p2d368d9a3526cfa324b3ace3ce9cf3757~RsrLRYlZE1311513115epcas5p2y;
	Thu,  3 Sep 2026 03:43:28 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.90]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4hb56R0c1hz6B9m5; Thu,  3 Sep
	2026 03:43:27 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20260903034326epcas5p380022fb00e655b8b4462fe862ccf6c45~RsrJ4OnTk0546505465epcas5p3j;
	Thu,  3 Sep 2026 03:43:26 +0000 (GMT)
Received: from [107.122.5.126] (unknown [107.122.5.126]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260903034324epsmtip19d32848c86f1eb6807590d3a4e492a0c~RsrHrhGP81548715487epsmtip1D;
	Thu,  3 Sep 2026 03:43:24 +0000 (GMT)
Message-ID: <a258af80-c15c-4adf-84ea-c5b0067e5247@samsung.com>
Date: Thu, 3 Sep 2026 09:13:13 +0530
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: exynos5-usbdrd: Use dynamic phy_cfg size to
 prevent OOB access
To: =?UTF-8?B?xYF1a2FzeiBMZWJpZWR6acWEc2tp?= <kernel@lvkasz.us>
Cc: akash.m5@samsung.com, alim.akhtar@samsung.com, andre.draszik@linaro.org,
	dh10.jung@samsung.com, jh0801.jung@samsung.com, krzk@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	muhammed.ali@samsung.com, neil.armstrong@linaro.org,
	peter.griffin@linaro.org, pritam.sutar@samsung.com, thiagu.r@samsung.com,
	vkoul@kernel.org
Content-Language: en-US
From: Selvarasu Ganesan <selvarasu.g@samsung.com>
In-Reply-To: <20260902000439.25379-1-kernel@lvkasz.us>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260903034326epcas5p380022fb00e655b8b4462fe862ccf6c45
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260903034326epcas5p380022fb00e655b8b4462fe862ccf6c45
References: <20260831070309.158069-1-selvarasu.g@samsung.com>
	<20260902000439.25379-1-kernel@lvkasz.us>
	<CGME20260903034326epcas5p380022fb00e655b8b4462fe862ccf6c45@epcas5p3.samsung.com>


On 9/2/2026 5:34 AM, Łukasz Lebiedziński wrote:
> I tested this on my Samsung Galaxy A6 (Exynos7870) with this patch applied
> on top of mainline. I wanted to verify the OOB read first before trusting
> this fix, so I forced the device tree to request PHY index 1
> (phys = <&usbdrd_phy 1>;) - this index does not exist for this SoC,
> because the phy_cfg_exynos7870[] array contains only one entry. I added
> a temporary pr_info() call after assigning phy_cfg in the probe loop to
> display the phy_isol/phy_init values using %pS:
>
>    i=0 phy_isol=exynos7870_usbdrd_phy_isol+0x0/0x60
>        phy_init=exynos7870_usbdrd_utmi_init+0x0/0x260
>    i=1 phy_isol=exynos5_usbdrd_phy_isol+0x0/0x50
>        phy_init=exynos5_usbdrd_utmi_init+0x0/0xc8
>
> For i=1, both function pointers resolve to the exynos5_* variants
> instead of the exynos7870 ones - the OOB read lands right on
> the adjacent phy_cfg_exynos5[] array in .rodata. No crash occurs, since
> these garbage pointers happen to point to valid (though unrelated)
> kernel functions rather than something invalid.
>
> With the patch applied, the same debug print shows the loop correctly
> stopping at n_phy_cfg=1; i=1 is never reached. Boot and USB both work
> fine on the actual PHY index (0).
>
> Tested-by: Łukasz Lebiedziński <kernel@lvkasz.us>

Thanks for your testing and update.

Thanks,
Selva
>
