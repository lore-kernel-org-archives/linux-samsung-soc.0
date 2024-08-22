Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8463716EBED
	for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Aug 2024 08:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724316976; cv=none; b=FRIlo63K5/9bq2eBw9AqI0Det+YhWI12uuIBBlQVCYCY80kuiLREr5vCWtUQsTZC/6QVaMVZQ6EPftH8pixJYDglVrEq8fWb/3HyP4Q05JJEulERQu5I8rXaAxtf54hGRVn0PzNNNSTFdZKmcicz/x2jJbLwD16SuwZl7FaV80A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724316976; c=relaxed/simple;
	bh=O1pQwnaWg5sUqXX8CzuAzgqRy6GU/4AsC8173KSiKpQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:MIME-Version:
	 Content-Type:References; b=cWGoGxUbHeBTCsTvXmYgvYztR0BOl6nhTV1cH1h2e8WXKyrbu2BFngFs1KrmdbW3ww3E1kOApLA9lNW1za+huV+PGKCYV5Yf8mJwh9dAQ9JTlOAXQin7omVO819GPxo+bt2MKUVqZVMufy6CYAzeBc7INfwBcPwzqa6qhW9KglM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=W/rX2xh5; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="W/rX2xh5"
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20240822085607epoutp04824d005ffe144cf16fa50f7453cae3a3~uASViplTP1054610546epoutp04l
	for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Aug 2024 08:56:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20240822085607epoutp04824d005ffe144cf16fa50f7453cae3a3~uASViplTP1054610546epoutp04l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1724316967;
	bh=y/skavvxnDPteOq4BgTyYlmkQ68yu5OQBExQtCpU2yE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=W/rX2xh5ZlL5qyDDSvmgRcQOK3PQwYCcEXq8MgdHMppwb/Vj1rCuveLICw/BvLqO8
	 bih4TaBVEWqPLFqqLT/gJkGYhXfVrVlEWsEycYHnLYcwqSuHtnDureJ2NNXiAsLiM3
	 M3FnujSa50FWXX9oT/luvxX8woqfFAN29UpDyT8c=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas1p3.samsung.com (KnoxPortal) with ESMTP id
	20240822085606epcas1p3e42b01e08d14e06b7eb6efc73d8e0340~uASVF9dfZ3077130771epcas1p3P;
	Thu, 22 Aug 2024 08:56:06 +0000 (GMT)
Received: from epsmgec1p1.samsung.com (unknown [182.195.36.132]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4WqH9d6k6Yz4x9Q1; Thu, 22 Aug
	2024 08:56:05 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
	epsmgec1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	C4.FD.09623.52DF6C66; Thu, 22 Aug 2024 17:56:05 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20240822085605epcas1p12604f5cc1c5df81b2098376b2dcbe766~uAST4dCCo1705917059epcas1p1N;
	Thu, 22 Aug 2024 08:56:05 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240822085605epsmtrp1517a92241050b7dacf88910603787fd5~uAST3jSnt3046430464epsmtrp1P;
	Thu, 22 Aug 2024 08:56:05 +0000 (GMT)
X-AuditID: b6c32a36-ef9ff70000002597-72-66c6fd255bd6
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	DD.45.08964.52DF6C66; Thu, 22 Aug 2024 17:56:05 +0900 (KST)
Received: from [10.113.111.204] (unknown [10.113.111.204]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20240822085605epsmtip21d724b3f95bcac81a650a1f729e6a31b~uASTloKNJ1033910339epsmtip2T;
	Thu, 22 Aug 2024 08:56:05 +0000 (GMT)
Message-ID: <08b3d20ccd34aabd59b22e2095412f43370e23b6.camel@samsung.com>
Subject: Re: [PATCH] arm64: dts: exynosautov9: Add dpum SysMMU
From: Kwanghoon Son <k.son@samsung.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 22 Aug 2024 17:56:04 +0900
In-Reply-To: <2e38f14b-41f4-401f-915e-fe3a4c1bfbe8@linaro.org>
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupgk+LIzCtJLcpLzFFi42LZdljTQFf177E0g1c7TS0ezNvGZrFm7zkm
	i/lHzrFavJx1j81i7+ut7BabHl9jtbi8aw6bxYzz+5gs/u/Zwe7A6bFpVSebx51re9g8Ni+p
	9+jbsorR4/MmuQDWqGybjNTElNQihdS85PyUzLx0WyXv4HjneFMzA0NdQ0sLcyWFvMTcVFsl
	F58AXbfMHKB7lBTKEnNKgUIBicXFSvp2NkX5pSWpChn5xSW2SqkFKTkFpgV6xYm5xaV56Xp5
	qSVWhgYGRqZAhQnZGYf/tbAXfOWuWLV+HVsD42TOLkZODgkBE4m2vWcYuxi5OIQEdjBK/Jg1
	nxXC+cQo8WdJFytIlZDAN0aJR828MB37Hv9hgyjayyjRf2sFM0TRe0aJGUtVQWxeAQ+Jqbdn
	sYDYwgJ2EjdvnwWz2QTUJZa0rWUHaRYRuMAoMXvRC7DdzALtjBKn5txgB6liEVCVePm2FWgF
	BwcnUPejFV4gYWYBbYllC1+DLRMVkJdoeHiCGWKZoMTJmU9YQOZICPRySKxZDNILcqqLxOH3
	a1ggbGGJV8e3sEPYUhIv+9ug7GyJox/3QtWXSFyftYgVwjaW2L90MhPIDcwCmhLrd+lD3MAn
	8e5rDytIWEKAV6KjTQjClJe41VkO0SgqcebpR6iBHhKXFu2Fhu53Jonu6ZNZJjDKz0LyzSwk
	H8xCWLaAkXkVo1hqQXFuemqxYYERPFKT83M3MYKTpJbZDsZJbz/oHWJk4mA8xCjBwawkwpt0
	72iaEG9KYmVValF+fFFpTmrxIUZTYJBOZJYSTc4Hpum8knhDE0sDEzMjYxMLQzNDJXHeM1fK
	UoUE0hNLUrNTUwtSi2D6mDg4pRqYfPNCu7TfyngxmsWlfy5bM2v+L3F7xZsmtvp76yaUHnvw
	1HqL3G7VGX1HQkzmn/gnx7pjTbT+Y25Dd237+o8r1k+V2n6tbq69L5fap/Zt67yMZ04MSvvl
	7X/3V4voqQe5S9XDG/SlT+ifXnz5jrObQEmhhVTA+b91945r2zQ55b9IkdT0tP7rM3H+8idH
	Yu1Yz6/vfbrz4ROJXo7uq6wuL6qvSE+fxpQxhyfJ29ro+5vVkz9P6FE53Hl731Pn9u+yz0xL
	+/tlKvgquvzS6+3k15V+Oet5RubrnmwezdVr1a9t22XqJPBP9of3+72r7yrrKp/72TifKf70
	LGX9vYf5cqISnxw/vO7Bjt+zimbnKrEUZyQaajEXFScCAM0M7E0bBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrJLMWRmVeSWpSXmKPExsWy7bCSvK7q32NpBjNnS1s8mLeNzWLN3nNM
	FvOPnGO1eDnrHpvF3tdb2S02Pb7GanF51xw2ixnn9zFZ/N+zg92B02PTqk42jzvX9rB5bF5S
	79G3ZRWjx+dNcgGsUVw2Kak5mWWpRfp2CVwZ+7qesxS85K7Yc7aBtYGxnbOLkZNDQsBEYt/j
	P2xdjFwcQgK7GSUuT3nBBpEQlei43MjYxcgBZAtLHD5cDFHzllHizN+f7CA1vAIeElNvz2IB
	sYUF7CRu3j4LZrMJqEssaVvLDtIgInCJUeLVwlNMIA6zQAejxPVn38A2sAioSrx828oGsoET
	qPvRCi+IDf+ZJO5tPwi2gVlAU6J1+28oW1ti2cLXzCC2qIC8RMPDE8wQVwhKnJz5hGUCo+As
	JC2zkLTMQlK2gJF5FaNkakFxbnpusWGBYV5quV5xYm5xaV66XnJ+7iZGcGxoae5g3L7qg94h
	RiYOxkOMEhzMSiK8SfeOpgnxpiRWVqUW5ccXleakFh9ilOZgURLnFX/RmyIkkJ5YkpqdmlqQ
	WgSTZeLglGpgqnpkrNXpfJhvyo7Xt06ZrNDzrJuZYnR03s7LIrX6O3KW1m/o2/r+RRyPwKYf
	v+KWRsatu1go/sMyoGMZn9T7dNY1ihcjjjHcW7/6x2N3npyvwoFpCX0B/VEO08oZ3/L/2mby
	u0GYp8BYKzzejoEnOKFDf8Wi3fpp2Vfik96+9Crk9uffdHF950SXa19Z5NcE2021mxPgnFJj
	rbxp7/MW75ibZyMmTfkhUlHCzmMYK+aSIeGhK7r2/BXLq/PW+W8432b+LcN9guo5AfsJBf6P
	84Ie8atVhMidW7hd5cL5b4fFpb6JHr1loc1zLLjj+aJXgqxpzSIvl0gpTf6fwP9vaufLK6my
	xf+FA5/ssrqvxFKckWioxVxUnAgAuXymhPwCAAA=
X-CMS-MailID: 20240822085605epcas1p12604f5cc1c5df81b2098376b2dcbe766
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240819075546epcas1p355a3c85ffcea2c43e8f1b2c69a0f3b4e
References: <CGME20240819075546epcas1p355a3c85ffcea2c43e8f1b2c69a0f3b4e@epcas1p3.samsung.com>
	<20240819-add_sysmmu-v1-1-799c0f3f607f@samsung.com>
	<172423973836.252925.2617927566866963313.b4-ty@linaro.org>
	<754863f6-0fc3-4223-940a-4ca33bfbe633@linaro.org>
	<62304fa0bdbc76cb006927b6d40c670c4843f83f.camel@samsung.com>
	<2e38f14b-41f4-401f-915e-fe3a4c1bfbe8@linaro.org>

On Thu, 2024-08-22 at 08:21 +0200, Krzysztof Kozlowski wrote:
> On 22/08/2024 04:16, Kwanghoon Son wrote:
> > On Wed, 2024-08-21 at 13:29 +0200, Krzysztof Kozlowski wrote:
> > > On 21/08/2024 13:28, Krzysztof Kozlowski wrote:
> > > >=20
> > > > On Mon, 19 Aug 2024 16:55:45 +0900, Kwanghoon Son wrote:
> > > > > Add System Memory Management Unit(SysMMU) for dpum also called io=
mmu.
> > > > >=20
> > > > > This sysmmu is version 7.4, which has same functionality as exyno=
s850.
> > > > >=20
> > > > > DPUM has 4 dma channel, each channel is mapped to one iommu.
> > > > >=20
> > > > >=20
> > > > > =5B...=5D
> > > >=20
> > > > Applied, thanks=21
> > > >=20
> > > > =5B1/1=5D arm64: dts: exynosautov9: Add dpum SysMMU
> > > >       (no commit info)
> > >=20
> > > I should reply here - unapplied. Does not build.
> > >=20
> > > Best regards,
> > > Krzysztof
> > >=20
> >=20
> > I apologize for the inconvenience.
> >=20
> > This should come after
> > https://lore.kernel.org/linux-samsung-soc/20240809-clk_dpum-v3-0-359dec=
c30fe2=40samsung.com/
> > patch (already merged in next) as 'next'.
> >=20
> > Would it be okay to you if I write 'next' on title and required patch
> > in cover-letter? or anything more make you more easy to review.
>=20
> 'next' has no meaning. It is impossible to apply patches on next.
>=20
> You should document the dependency in changelog or cover letter.
>=20
> Best regards,
> Krzysztof
>=20

Thanks, I'll follow guide when send v2.

Kwang.

