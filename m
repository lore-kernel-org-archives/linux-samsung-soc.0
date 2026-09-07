Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2403030CD9E
	for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Sep 2026 08:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788769015; cv=none; b=RoGJSVC2PRy9f/5FNulTjKBoXiFzQcTID7yxLGGb8hX2ee27L6p7ufugjYNPa7/QUlax9csidQK55JM5UB7VoVTv4NPi7vdsLfGnimesM0qrBprGw0ru7J6jH5WE8DqE/TyFw2H+NTIIyk5gxuStE3ATQUAOc8fne4CrHG1d9p4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788769015; c=relaxed/simple;
	bh=7nowSITGcM1q970gApZvr6kZ03hlvDDs8a9iP9BMhhE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=DXCUe52Vyynh7p+YIEkMICCpUOybiSLMFlxZDFsy2nlRFjOzY7b1P6DDAouIdkodewsOt8BGHjCSKg2Fi8aAQFcx/lxGFyK3zwMrXq4VpewfBmTLn7FXVzsrFyV8Cc7JABjiyd1F14xSrGGTHvpZfGCf5QFjgWUhQjVS9Q8c02o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=u7Q2s1he; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="u7Q2s1he"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260907081643euoutp02fa56810a4c44902e02be389e89f37981~S__6IivUy1463814638euoutp02R
	for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Sep 2026 08:16:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260907081643euoutp02fa56810a4c44902e02be389e89f37981~S__6IivUy1463814638euoutp02R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1788769003;
	bh=C49HkmDVZ4lVjfKu187yKcJcfrFqGDQxUYYBb3LwzE4=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=u7Q2s1heUqMda6W5XRBhcPx+MTlXcqrDqyl2qmNV0zWDSSmMKI2HWoP4uLN9hOlvP
	 XmXHSulGrzA4zdKuuUTjPC1zQMRUSzsgxpRcQp3nM6VrhekYpsbS0+5HfPckFaxkLm
	 fErxQpxeu4pXfP+9s405Gr40nX1gdcKu3786lkHw=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260907081643eucas1p20588c21e5a4fc629f9ebc1f8f15c3522~S__54h-yh1075210752eucas1p2o;
	Mon,  7 Sep 2026 08:16:43 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260907081643eusmtip2a290ef3efe626b53d73bbd7fd72e3e51~S__5ZfqCW0517005170eusmtip2N;
	Mon,  7 Sep 2026 08:16:43 +0000 (GMT)
Message-ID: <62afdbc4-f21a-477a-b0ab-de20c96b4b6d@samsung.com>
Date: Mon, 7 Sep 2026 10:16:42 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v2] ARM: dts: samsung: exynos4210-i9100: Enable RTS/CTS
 in Bluetooth node
To: Paul Cercueil <paul@crapouillou.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar
	<alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <1666390417d0d9b8f58a7bdad1b8ecb475ba0d4f.camel@crapouillou.net>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260907081643eucas1p20588c21e5a4fc629f9ebc1f8f15c3522
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260829101532eucas1p29f4e04d4dfd169377793c276221059a6
X-EPHeader: CA
X-CMS-RootMailID: 20260829101532eucas1p29f4e04d4dfd169377793c276221059a6
References: <CGME20260829101532eucas1p29f4e04d4dfd169377793c276221059a6@eucas1p2.samsung.com>
	<20260829101509.138284-1-paul@crapouillou.net>
	<6e319291-72b8-4a43-b953-8a9f0a6049c8@samsung.com>
	<1666390417d0d9b8f58a7bdad1b8ecb475ba0d4f.camel@crapouillou.net>

On 03.09.2026 15:29, Paul Cercueil wrote:
> Le mercredi 02 septembre 2026 à 10:36 +0200, Marek Szyprowski a écrit :
>> On 29.08.2026 12:15, Paul Cercueil wrote:
>>> The BCM4330 is connected using CTS/RTS too, so add the 'uart-has-
>>> rtscts'
>>> property.
>>>
>>> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>> Indeed the CTS/RTS pins are used for BT on most of the ARM Exynos
>> boards,
>> as the "<&uartX_fctl>" property is assigned for pinctl-0. This is not
>> really
>> specific to i9100, so maybe this property should be added to other
>> dts?
> I can add it to all exynos4 boards that use the "uartX_fctl" property.
>
>
>> However I wonder if Samsung UART driver actually use this "uart-has-
>> rtscts"
>> DT property? A quick "git grep uart-has-rtscts drivers/tty" shows
>> nothing
>> related to Samsung Exynos...
> It looks like it does not. I still think the DT property should be here
> but I won't fight over this.
I also don't have strong opinion on this issue. Krzysztof: do You see
any benefit from adding this "uart-has-rtscts" property, just to describe
precisely the actual hardware, even if it won't be used by any driver?

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

