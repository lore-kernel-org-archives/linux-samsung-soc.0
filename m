Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41F11D130E
	for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Aug 2024 02:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724293014; cv=none; b=PNHQInnCbACKnLkOrn0PANRV5h1Y7wsn1ZUmGAwEb6iJT1fFOh/4L1eAp2RFyv6iB+jfwSXRELu/qr1htJ29hdCeYLXMEV5qTe15Z+QCaq4z95oJacPlRMBHdCsRfIQa7ptrjR6GZS+vRpqnHk0toX5iaXJBu+AlN1g7at6V6dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724293014; c=relaxed/simple;
	bh=HAHtk5gOomi0rNSCg7NmUVUVAU/xA4JVgm51EhXYYig=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:MIME-Version:
	 Content-Type:References; b=Kl/PYxNtereayBZczeyz2vR2LJC4JXS07bpxx7RDgFGCfd9IFulycmnRAjtQWGsEUcQKjaxwUxIqdrxLtZWEyXAt6WUpRvv7n/klnlv8q8Kpfe5fV3mg9uW/R89099HXJrjz5UGINqtMzsEnaSMu4wpA6Whd00LFBvwwN+woaAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=WwZ8aM5w; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="WwZ8aM5w"
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20240822021649epoutp02cf9768e9adacc1ea6b1d46cb266311aa~t61tbcOIm0090200902epoutp02D
	for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Aug 2024 02:16:49 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20240822021649epoutp02cf9768e9adacc1ea6b1d46cb266311aa~t61tbcOIm0090200902epoutp02D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1724293010;
	bh=ErFUYDw1tDlO05/oM77x3+swP7b9WuIn5ChAdMIh8ug=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=WwZ8aM5wtOuAbkr/RnTfzQAfGBZ9Ls/ohtunLJBHWhyMYaibVNvgwjgnBK2CgnjAy
	 RzpgZ4cQvACrqLpN4UncZTkl1lfLIHWTQ4KmQRJLa3QDob4StoaF+p0l6jTz2ULSxX
	 Q/jvzJLtoLBpNFfWF37FOOmneYL6i469swF+Dzfo=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas1p3.samsung.com (KnoxPortal) with ESMTP id
	20240822021649epcas1p37a1ad9f89aa450c62293b380824a02f3~t61s38uLQ1012010120epcas1p3c;
	Thu, 22 Aug 2024 02:16:49 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.38.232]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4Wq6Jw316cz4x9Pv; Thu, 22 Aug
	2024 02:16:48 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
	epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
	15.40.09725.09F96C66; Thu, 22 Aug 2024 11:16:48 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20240822021647epcas1p273ff726eb3cb3b58deb42612239ee1c7~t61rkYCVo0674906749epcas1p24;
	Thu, 22 Aug 2024 02:16:47 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240822021647epsmtrp2c1101eb55a4c79f6c793b5071ede55ae~t61rjqEsI2781727817epsmtrp22;
	Thu, 22 Aug 2024 02:16:47 +0000 (GMT)
X-AuditID: b6c32a37-245b8700000025fd-f2-66c69f90250c
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	77.F7.07567.F8F96C66; Thu, 22 Aug 2024 11:16:47 +0900 (KST)
Received: from [10.113.111.204] (unknown [10.113.111.204]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20240822021647epsmtip2c77d5d2705360c636b2f0b10b7688e81~t61rU7Pw02970929709epsmtip2H;
	Thu, 22 Aug 2024 02:16:47 +0000 (GMT)
Message-ID: <62304fa0bdbc76cb006927b6d40c670c4843f83f.camel@samsung.com>
Subject: Re: [PATCH] arm64: dts: exynosautov9: Add dpum SysMMU
From: Kwanghoon Son <k.son@samsung.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 22 Aug 2024 11:16:47 +0900
In-Reply-To: <754863f6-0fc3-4223-940a-4ca33bfbe633@linaro.org>
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkk+LIzCtJLcpLzFFi42LZdlhTT3fC/GNpBu9ei1g8mLeNzWLN3nNM
	FvOPnGO1eDnrHpvF3tdb2S02Pb7GanF51xw2ixnn9zFZ/N+zg92B02PTqk42jzvX9rB5bF5S
	79G3ZRWjx+dNcgGsUdk2GamJKalFCql5yfkpmXnptkrewfHO8aZmBoa6hpYW5koKeYm5qbZK
	Lj4Bum6ZOUD3KCmUJeaUAoUCEouLlfTtbIryS0tSFTLyi0tslVILUnIKTAv0ihNzi0vz0vXy
	UkusDA0MjEyBChOyM46svMBeMI2j4n7PduYGxh1sXYycHBICJhJ77txk7GLk4hAS2MEoMefd
	P3YI5xOjxPb2WUwQzjdGiecnVsG1zHj+AaplL6PEtQtzWUASQgLvGSUO/awFsXkFPCQePZrA
	CmILC9hJ3Lx9FqyGTUBdYknbWrAVIgIXGCVmL3oBNolZoJ1R4tScG0AZDg4WAVWJ060mIA2c
	QM1H9y4GG8QsoC2xbOFrZhBbVEBeouHhCWaIZYISJ2c+YQGZIyEwkUNi79HZzBCnukgc+/CK
	BcIWlnh1fAs7hC0l8fndXqh3siWOfoSxSySuz1rECmEbS+xfOpkJ5B5mAU2J9bv0IW7gk3j3
	tYcVJCwhwCvR0SYEYcpL3Oosh2gUlTjz9CPUQA+JS4v2QsOqhUni5OkGxgmM8rOQfDMLyQez
	EJYtYGRexSiWWlCcm55abFhgDI/V5PzcTYzgNKllvoNx2tsPeocYmTgYDzFKcDArifAm3Tua
	JsSbklhZlVqUH19UmpNafIjRFBikE5mlRJPzgYk6ryTe0MTSwMTMyNjEwtDMUEmc98yVslQh
	gfTEktTs1NSC1CKYPiYOTqkGpovOpwo3pQacX7mtP9z28JLD52OXx6184zy7rirs0yKBWuW1
	6zhnG9S1XGdbP79aM6/uQYLZ1+7S23xq3ctLzs6IuBzEksOktdvwtbLf5cC3Pflzpu+XD2w1
	3bpkl+vxjtnZh15I7wha/KL8Z1JM9I1HC2IropYdyXU9ouOgu2STa4Dufqa5e3p2aLR9PCD0
	+FJ1kM+BFxzlDzt9OcyabvsLJG7RyHqW4JUZ9O+zmm1S5IvYNbMrFjWkXxTKvTPLti606PzD
	m/cjernWHVzyiOd4WcTWwk/v9TmPPks8HRPZtELx/nXvtJgi3mfxXjLbP/C7hkW//rBv9ZaM
	/0HHeLces3rVeF3Tc35t3ZXPM5RYijMSDbWYi4oTAWsn95scBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrBLMWRmVeSWpSXmKPExsWy7bCSvG7//GNpBn//G1s8mLeNzWLN3nNM
	FvOPnGO1eDnrHpvF3tdb2S02Pb7GanF51xw2ixnn9zFZ/N+zg92B02PTqk42jzvX9rB5bF5S
	79G3ZRWjx+dNcgGsUVw2Kak5mWWpRfp2CVwZXz9NYi7o4qh48/wTYwPjGrYuRk4OCQETiRnP
	PzB2MXJxCAnsZpTY+PUOK0RCVKLjciNQggPIFpY4fLgYouYto8T3bU8ZQWp4BTwkHj2aAFYv
	LGAncfP2WRYQm01AXWJJ21p2kAYRgUuMEq8WnmICcZgFOhglrj/7xgYylUVAVeJ0qwlIAydQ
	89G9i8EGCQl0MUnsPBgEYjMLaEq0bv/NDmFrSyxb+JoZxBYVkJdoeHiCGeIIQYmTM5+wTGAU
	nIWkZRaSlllIyhYwMq9ilEwtKM5Nz002LDDMSy3XK07MLS7NS9dLzs/dxAiODC2NHYz35v/T
	O8TIxMF4iFGCg1lJhDfp3tE0Id6UxMqq1KL8+KLSnNTiQ4zSHCxK4ryGM2anCAmkJ5akZqem
	FqQWwWSZODilGpgqBcM+r1nMpvfT0LjqsgXTTPOo5j+p9eevrl2n7OrqX2N9OUfz+rfT6w0f
	335yQe/30jUb187Ybs954bJMkdrqX7+2V7V8/2TxMt5b51IR6/GjuWet2RSvfm3ou8d3cVHj
	oReTHZjXpca53vlZ0zb1uXBRXJ+t3939EXPFl/znz3TNeuXbHJDLzjA/p+PnjvkZPUzqhjWZ
	r/JVHBdJrxPmu2LGIXl6DvscWcbgdYc5/ly9XaUd43NBM+34SR5558z7swQX5P+v228rFRa9
	dG9v1WqfZ5fnRCXOnzRPjHO35vLEjPkMQb/+qFXmiH5bdvTBpbow/vs2r+pm8X1r2j7HbHLu
	hNfvWfwvXvz+n1FCiaU4I9FQi7moOBEA2AX9//sCAAA=
X-CMS-MailID: 20240822021647epcas1p273ff726eb3cb3b58deb42612239ee1c7
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

On Wed, 2024-08-21 at 13:29 +0200, Krzysztof Kozlowski wrote:
> On 21/08/2024 13:28, Krzysztof Kozlowski wrote:
> >=20
> > On Mon, 19 Aug 2024 16:55:45 +0900, Kwanghoon Son wrote:
> > > Add System Memory Management Unit(SysMMU) for dpum also called iommu.
> > >=20
> > > This sysmmu is version 7.4, which has same functionality as exynos850=
.
> > >=20
> > > DPUM has 4 dma channel, each channel is mapped to one iommu.
> > >=20
> > >=20
> > > =5B...=5D
> >=20
> > Applied, thanks=21
> >=20
> > =5B1/1=5D arm64: dts: exynosautov9: Add dpum SysMMU
> >       (no commit info)
>=20
> I should reply here - unapplied. Does not build.
>=20
> Best regards,
> Krzysztof
>=20

I apologize for the inconvenience.

This should come after
https://lore.kernel.org/linux-samsung-soc/20240809-clk_dpum-v3-0-359decc30f=
e2=40samsung.com/
patch (already merged in next) as 'next'.

Would it be okay to you if I write 'next' on title and required patch
in cover-letter? or anything more make you more easy to review.

Kwang.

