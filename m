Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95AFF15ACB
	for <linux-samsung-soc@vger.kernel.org>; Fri,  5 Jul 2024 03:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720148875; cv=none; b=DdZbOH71WTprYIhr7GfygccVZoY5+CjBpc/yUxPp3t5WiS60SEXEA+kxUS1Jh2SZEX12tGFpIW8GW517BxCAGYVcaVhROn/kpRm4O09xuVgCVwCi+BVNtkWpJ44PbuLvxQB9/6ty+tjKwZcWxYRU9jsF543xPn5rCWIV2wQyp/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720148875; c=relaxed/simple;
	bh=B8I00wah1b1RjJ14IHjpTpKot9oqn+yYV05RMahbZ+A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=GBMEEymBdOOlOfp71dyVT/iK6aBwSpeso/iYRN2qYQIAbEEl7mA1eELe6DJD56mQ03ylz2fypKtxCpYqRYvjQwJLlnLstIHd5vC8Y1Mi+wlJECMA/Sz1jc9Ud8XlGiB2CpT7/GhEQTgaXkKD9nYqNrXjlPE37OxvC2Rp2Q7aX9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=be6+zIDF; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="be6+zIDF"
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20240705030750epoutp044a89316c3513a6c3adf6ea240bac984c~fMki9uvCh2608226082epoutp04d
	for <linux-samsung-soc@vger.kernel.org>; Fri,  5 Jul 2024 03:07:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20240705030750epoutp044a89316c3513a6c3adf6ea240bac984c~fMki9uvCh2608226082epoutp04d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1720148870;
	bh=97qCgmshFC+7o4y8RJVAn1bwJb4Z9ejodBb+8YgwA4M=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=be6+zIDFHosmKLOcJSn2TTNyXmBB8Zye9L8QV8X9ZOvoXX3WfeW7vuXWBFE63ZhPu
	 Q6nDDchst6fN9RJRUP3jwjQ7pCrlrKYrAundwcCzxKh0bVe+bRerbiRAWz1xDRRdzn
	 V9Sx4ak7SWUzh1j3civO7uRK53rCW/u4XQ2E0vuc=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTP id
	20240705030749epcas2p18081f08de4eb300e3d2a3027e11fed31~fMkiTUqDE2357623576epcas2p1W;
	Fri,  5 Jul 2024 03:07:49 +0000 (GMT)
Received: from epsmgec2p1.samsung.com (unknown [182.195.36.69]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4WFdjx4RLZz4x9Pr; Fri,  5 Jul
	2024 03:07:49 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
	epsmgec2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	71.9B.56241.58367866; Fri,  5 Jul 2024 12:07:49 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20240705030749epcas2p2636f10f34f3642de34475987c724f9f8~fMkhcOOwU2175321753epcas2p2D;
	Fri,  5 Jul 2024 03:07:49 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240705030749epsmtrp27ce6e2517d7276df4f44161c1c3e0fc3~fMkhaoMVC0827608276epsmtrp22;
	Fri,  5 Jul 2024 03:07:49 +0000 (GMT)
X-AuditID: b6c32a43-c03fd7000000dbb1-18-66876385da6f
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	17.35.07412.48367866; Fri,  5 Jul 2024 12:07:48 +0900 (KST)
Received: from [10.229.8.168] (unknown [10.229.8.168]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20240705030748epsmtip216096e6674c2c9f1aef16948eeec7252~fMkhHNXD90097100971epsmtip22;
	Fri,  5 Jul 2024 03:07:48 +0000 (GMT)
Message-ID: <494ac55c-7bd0-79a9-8a56-21aaf0611f81@samsung.com>
Date: Fri, 5 Jul 2024 12:07:31 +0900
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
	Thunderbird/102.11.0
Subject: Re: [PATCH 2/5] dt-bindings: clock: add clock binding definitions
 for Exynos Auto v920
Content-Language: en-US
To: Sunyeal Hong <sunyeal.hong@samsung.com>, Krzysztof Kozlowski
	<krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi
	<cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Michael
	Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
From: Jaewon Kim <jaewon02.kim@samsung.com>
In-Reply-To: <20240705021110.2495344-3-sunyeal.hong@samsung.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrAJsWRmVeSWpSXmKPExsWy7bCmmW5rcnuawZorChYP5m1js7j+5Tmr
	xfnzG9gtPvbcY7W4vGsOm8WM8/uYLC6ecrU4/Kad1eLftY0sFk3L1jM5cHm8v9HK7rFpVSeb
	R9+WVYwenzfJBbBEZdtkpCampBYppOYl56dk5qXbKnkHxzvHm5oZGOoaWlqYKynkJeam2iq5
	+AToumXmAN2jpFCWmFMKFApILC5W0rezKcovLUlVyMgvLrFVSi1IySkwL9ArTswtLs1L18tL
	LbEyNDAwMgUqTMjOmH/1BnvBZ/aKhcsOMDcw7mbrYuTkkBAwkfh89xhrFyMXh5DADkaJGdc2
	skM4nxglTr5+zwzhfGOU6LnRwQTT8urTbRaIxF5GiRNzuqGc14wSkw7sYgGp4hWwk9jwfimY
	zSKgInF3/01GiLigxMmZT8DiogLREq3L7oMdIiyQKPFx/36wOLOAuMStJ/OZQIaKCCxgkji/
	ay8rRCJBYsnhD2ANbALaEt/XLwaLcwo4SDw99xSqWV5i+9s5YHdLCEzlkLj+6i0jxN0uEq2X
	LkPZwhKvjm9hh7ClJD6/2wsNjnyJtitnoOI1EhsXXIKqt5dYdOYnUJwDaIGmxPpd+iCmhICy
	xJFbUGv5JDoO/2WHCPNKdLQJQTSqSdyfeg5quIzEpCMrmSBKPCROnS2dwKg4CylQZiF5fhaS
	X2YhrF3AyLKKUSy1oDg3PTXZqMAQHtnJ+bmbGMFJVct5B+OV+f/0DjEycTAeYpTgYFYS4ZV6
	35wmxJuSWFmVWpQfX1Sak1p8iNEUGDUTmaVEk/OBaT2vJN7QxNLAxMzM0NzI1MBcSZz3Xuvc
	FCGB9MSS1OzU1ILUIpg+Jg5OqQYmy49afjbv1G/x5ot+KjmSEB2rbBqzyUC1tzx4cqBXx4NH
	smzHfTt1egwDg66d9L72fF+8WsJ9x6Jp/GfdxVvcn+j8chBdkdn3O4Df/tCD22fesk4/3MV5
	+WpCYs5bbZe0w4fapz9TeLF7o9sa0T91ocf47V5b7+bqOMFumKdVun29jE9MX0v79ZjYT+HG
	B4OP/HJcMXHTZQ2zbyVF1+cLXOURLPhg+mSp7+SGg0sv/+ou4d6cPqPOgyNo03UT/pudNVu9
	CtsWLDhZ/TN88dzUJfOeLVA8cC5s36Zf/g0r6uINdAXPek+eUxt/1UE29llg9qLrGY1r5m/+
	8CjyttJ0H1OJwyl/U0T6Em+Iv4hRYinOSDTUYi4qTgQAXNe5GjMEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpgkeLIzCtJLcpLzFFi42LZdlhJXrcluT3N4PRDM4sH87axWVz/8pzV
	4vz5DewWH3vusVpc3jWHzWLG+X1MFhdPuVocftPOavHv2kYWi6Zl65kcuDze32hl99i0qpPN
	o2/LKkaPz5vkAliiuGxSUnMyy1KL9O0SuDLmX73BXvCZvWLhsgPMDYy72boYOTkkBEwkXn26
	zQJiCwnsZpRY0pAGEZeRWP6sD6pGWOJ+yxHWLkYuoJqXjBIP385kAknwCthJbHi/FKyZRUBF
	4u7+m4wQcUGJkzOfgMVFBaIlVn++ANTMwSEskCix+FwgSJhZQFzi1pP5TCAzRQQWMUnMW9LG
	DpFIkLi/FeQ4kGUnGSWOXlsPdgWbgLbE9/WLWUFsTgEHiafnnrJANJhJdG3tYoSw5SW2v53D
	PIFRaBaSO2YhWTgLScssJC0LGFlWMUqmFhTnpucmGxYY5qWW6xUn5haX5qXrJefnbmIER5KW
	xg7Ge/P/6R1iZOJgPMQowcGsJMIr9b45TYg3JbGyKrUoP76oNCe1+BCjNAeLkjiv4YzZKUIC
	6YklqdmpqQWpRTBZJg5OqQYm53K51JYDUvESb1Ts7m/aLrJXKHBqqVTtnQlMh83vK2toMjTq
	FYm3rb+YcPr0ya8v969ZzFFbGqXM3rphOU/NG6aeHQ/5uwzCL+pxp+nqLL/U9t2kYY/5mYvW
	vAvbagS7FU6/jBNSdnjTn5FVOmd9crShjGr3uUMCSlE+jw2vRjfO7JxziOnmG8ZI0fBSlvOl
	bl3Cmveb657Efj0VXbP0yhq9ywEJd16IhZ9N+HhF+ZTxg133fQp8dLsYf4gej/3x40Fjx68D
	ac2VyvZ6dRwi3+T21jBuDLRQ465RMJhydbbwvvOnn2xNqf82NVng/nWvwNQXsRE/f/hz6Kie
	FfStiM8Lq6m2197Ae+CfuBJLcUaioRZzUXEiAMV6Aw8TAwAA
X-CMS-MailID: 20240705030749epcas2p2636f10f34f3642de34475987c724f9f8
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240705021200epcas2p273ca089c2cb9882f121e864ec8407367
References: <20240705021110.2495344-1-sunyeal.hong@samsung.com>
	<CGME20240705021200epcas2p273ca089c2cb9882f121e864ec8407367@epcas2p2.samsung.com>
	<20240705021110.2495344-3-sunyeal.hong@samsung.com>

Hi Sunyeal,


On 7/5/24 11:11, Sunyeal Hong wrote:
> Add device tree clock binding definitions for below CMU blocks.
>
> - CMU_TOP
> - CMU_PERIC0
>
> Signed-off-by: Sunyeal Hong <sunyeal.hong@samsung.com>
> ---
>   .../clock/samsung,exynosautov920.h            | 191 ++++++++++++++++++
>   1 file changed, 191 insertions(+)
>   create mode 100644 include/dt-bindings/clock/samsung,exynosautov920.h
>
> diff --git a/include/dt-bindings/clock/samsung,exynosautov920.h b/include/dt-bindings/clock/samsung,exynosautov920.h
> new file mode 100644
> index 000000000000..bbddf7583e61
> --- /dev/null
> +++ b/include/dt-bindings/clock/samsung,exynosautov920.h
> @@ -0,0 +1,191 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (c) 2024 Samsung Electronics Co., Ltd.
> + * Author: Sunyeal Hong <sunyeal.hong@samsung.com>
> + *
> + * Device Tree binding constants for Exynos Auto V209 clock controller.

Typo : V209 -> V920


Thanks

Jaewon Kim

