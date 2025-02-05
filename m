Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8971DA31F
	for <linux-samsung-soc@vger.kernel.org>; Wed,  5 Feb 2025 16:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738771864; cv=none; b=DCL1WLsSHl0PzaCPyDCcGh9T6GPxFYJYG53e+S/OrLIA9UI0R8c0wUcsYSWREb8CCSFW4qHMwvnVWIsu+ur9uzJAlsk6hr/+zH7+K91tL7xDGVVPp6G0c8u6kmkKiEQvSWqZ2yxDRMfJKFaOwXJLX3DNFpqRhVw1qi78W5PbqWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738771864; c=relaxed/simple;
	bh=zGOTGbjFfgVATXurZclzZ9z9K3oGBKGvyHPvS3OsEQ8=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=BUtAqLHZsjfao+T0/o80OubLp8ZAHibcQMD9EYvloZ2fNeWwKnZ1/1ICJmU8ObVaMycAeadVJ5HPXPnNafHb3a1TOARK6lhoVYcUWD9J2NW4mgA9bQ4ZEdPc2r40BgCMeOUKkugrUxXxYtleNXsVAQvTYVBLjuJw5vZUs8PWp9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Vr33Q83R; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Vr33Q83R"
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250205161055epoutp01b203fcba521ea1df552b457cc0817bac~hW8o3ZtvM1197111971epoutp01a
	for <linux-samsung-soc@vger.kernel.org>; Wed,  5 Feb 2025 16:10:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250205161055epoutp01b203fcba521ea1df552b457cc0817bac~hW8o3ZtvM1197111971epoutp01a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1738771855;
	bh=QW9J/rjwU+o+SqKpPsPh38JFBxMAa0k1ReyEkkZt/Pc=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=Vr33Q83ReaUYcKmzBa3H3q49/ONTz5UJN51Eu/svtZM8koRnPXVOTGMiM8awVkzga
	 FX1xfrF8tkqaLsemvcqLYWaur7l9cJqQbilIvQAmHEpJDKC8MECejNvH4jyD4Uofv6
	 3qkZYwZR5AlovX3iEvihLjFlHjdsH7szva7CW1ic=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTP id
	20250205161054epcas5p462e3a79ddb2c59bb8791bdddc74eb01f~hW8oZ_f9o1659716597epcas5p41;
	Wed,  5 Feb 2025 16:10:54 +0000 (GMT)
Received: from epsmges5p1new.samsung.com (unknown [182.195.38.181]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4Yp4wD6QgGz4x9Pp; Wed,  5 Feb
	2025 16:10:52 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
	epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	9E.CF.20052.C8D83A76; Thu,  6 Feb 2025 01:10:52 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250205161051epcas5p26dda7521e6fe32f18d6ef155802573b7~hW8lbmFSm1244212442epcas5p2U;
	Wed,  5 Feb 2025 16:10:51 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250205161051epsmtrp10c1cde19bc06d6d10c26eece77d38c94~hW8lav6Ud2899028990epsmtrp1A;
	Wed,  5 Feb 2025 16:10:51 +0000 (GMT)
X-AuditID: b6c32a49-3d20270000004e54-6c-67a38d8c4619
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	34.FE.18729.B8D83A76; Thu,  6 Feb 2025 01:10:51 +0900 (KST)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250205161049epsmtip29462bda9337d6f4970716ff4d4d8fe2c~hW8j4dd_a1519415194epsmtip2Y;
	Wed,  5 Feb 2025 16:10:49 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, "'Sudeep Holla'"
	<sudeep.holla@arm.com>
Cc: "'Devang Tailor'" <dev.tailor@samsung.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <faraz.ata@samsung.com>
In-Reply-To: <6d4d93a5-9a03-4cc3-9ef4-ab64562560f3@kernel.org>
Subject: RE: [PATCH v2] arm64: dts: add cpu cache information to
 ExynosAuto-v920
Date: Wed, 5 Feb 2025 21:40:48 +0530
Message-ID: <090d01db77e8$8687db10$93979130$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJnCMNmj1amGSmPwLixER7WDeLbQALDHLFMAzsAx8ICGgWRGwKIqjkLscy4HXA=
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHJsWRmVeSWpSXmKPExsWy7bCmum5P7+J0g6ufjCzW7D3HZHFvxzJ2
	i/lHzrFaXLuxkN3i5ax7bBbnz29gt9j0+BqrxeVdc9gsZpzfx2Txf88Odovlp3awOHB7rJm3
	htFj06pONo/NS+o9+rasYvT4vEkugDUq2yYjNTEltUghNS85PyUzL91WyTs43jne1MzAUNfQ
	0sJcSSEvMTfVVsnFJ0DXLTMH6DIlhbLEnFKgUEBicbGSvp1NUX5pSapCRn5xia1SakFKToFJ
	gV5xYm5xaV66Xl5qiZWhgYGRKVBhQnbGrenrmAq+8FTc36bUwLiXq4uRk0NCwERiY/931i5G
	Lg4hgd2MEpveH2SGcD4xSmzYco8FwvnGKPF6ylZWmJZliz5CVe1llHi8vwPKeckosXHCZUaQ
	KjYBXYkdi9vYQGwRgQiJW98mMoIUMQvMYJLYvfwCC0iCU8BOYsmUvWBjhQWCJBZMPcIOYrMI
	qEgcar4AZvMKWEpsOj0fyhaUODnzCVgvs4C2xLKFr5khTlKQ+Pl0GSvEMj+Jhxt2skLUiEu8
	PAoykwuoZguHxKsrd9kgGlwk3k/+wAhhC0u8Or6FHcKWknjZ3wZlV0us3zCPBcLuYJRo3F4D
	YdtL7Hx0EyjOAbRAU2L9Ln2IXXwSvb+fMIGEJQR4JTrahCCqVSWa312FmiItMbG7GxqKHhLv
	r81inMCoOAvJZ7OQfDYLyQezEJYtYGRZxSiZWlCcm55abFpgmJdaDo/w5PzcTYzghKvluYPx
	7oMPeocYmTgYDzFKcDArifCe3r4gXYg3JbGyKrUoP76oNCe1+BCjKTC4JzJLiSbnA1N+Xkm8
	oYmlgYmZmZmJpbGZoZI4b/POlnQhgfTEktTs1NSC1CKYPiYOTqkGpoRPPRNf30i7863kxt6j
	e5jj37xxqm6S7fZdpvHMso3nRZ2V8iwtX/dpR65JV56TONH3vdKISX3R4iKjfcn+m389Pbh3
	q6buHZfrD9kYVI+zG6+OPnZddq/J3uornxtcNa89cvxxyUDn94oXK4QLrdJkDv5oeLS2ns1v
	0bSPHg8+v5S8dLx4ig3ft4Z5x9fMvRM7UzPjqvFUxd9sG9dpnNvq6GGcLuwn/FWTNXrB5CyW
	r9YqpyY9zLUPr5/c9X2povnWdKfLsl29T05yTd8Ws3D5iZ9vl1j1tuS3ckYYmpq+jxHZIH23
	13/nOj+1AraIDyrTLX6VLucyWLlw3Uvp3ZZ+MfuZHkx+qGWjadZ3ZroSS3FGoqEWc1FxIgDd
	4f+zQQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOIsWRmVeSWpSXmKPExsWy7bCSvG537+J0g5VrpC3W7D3HZHFvxzJ2
	i/lHzrFaXLuxkN3i5ax7bBbnz29gt9j0+BqrxeVdc9gsZpzfx2Txf88Odovlp3awOHB7rJm3
	htFj06pONo/NS+o9+rasYvT4vEkugDWKyyYlNSezLLVI3y6BK2PX3mXsBSd4Kn59PMfSwDiR
	q4uRk0NCwERi2aKPzF2MXBxCArsZJX6vWc4EkZCWuL5xAjuELSyx8t9zdoii54wS/99fYANJ
	sAnoSuxY3AZmiwhESBw+Mp8FpIhZYBGTxKal11khOjqYJG7/2Qw2llPATmLJlL1ACQ4OYYEA
	iQN7pEHCLAIqEoeaL4Bt4xWwlNh0ej6ULShxcuYTFhCbWUBbovdhKyOMvWzha2aI6xQkfj5d
	xgpxhJ/Eww07WSFqxCVeHj3CPoFReBaSUbOQjJqFZNQsJC0LGFlWMUqmFhTnpucWGxYY5qWW
	6xUn5haX5qXrJefnbmIEx52W5g7G7as+6B1iZOJgPMQowcGsJMJ7evuCdCHelMTKqtSi/Pii
	0pzU4kOM0hwsSuK84i96U4QE0hNLUrNTUwtSi2CyTBycUg1Mu591zj50Jf/e8j/Zb/4nLX4o
	URKkFVq2Ov3LnZDZExXO/mI00ahjsFF7Ilr/O2jh3Ac3THeaRfqc1k17sdb+Qz1PZxpz/FW2
	sv8Z5x27uKftd1ucevPdt8bZxQJXL/jox69XWS6ZoHj8wX4FhX7tnJVPzvqb/3O3e73wUiTX
	V2WBVyd2P1+l4/P7RHeu2vOc2kDJzRtlr8Welzr3ZvbLc57/uJKnLzku8/ZR1s0dTXY7qwtb
	1kXzH+CyCxX83Hryzxqvv+ZfrXjs+6W3HjptVcQXcV/veNZebdG75+axPmd6te/rFJeYrF93
	mNIq05vlpQTvVohOX2a46OTnX8IOza+SGVff3+Q8JbydqfJBlhJLcUaioRZzUXEiAMu9VZIq
	AwAA
X-CMS-MailID: 20250205161051epcas5p26dda7521e6fe32f18d6ef155802573b7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250108054224epcas5p399f3d734f8d9f82e5ae75d183d1a5344
References: <CGME20250108054224epcas5p399f3d734f8d9f82e5ae75d183d1a5344@epcas5p3.samsung.com>
	<20250108055012.1938530-1-dev.tailor@samsung.com>
	<006401db73d6$2af35fb0$80da1f10$@samsung.com> <Z5zPpz6WAbPJX701@bogus>
	<6d4d93a5-9a03-4cc3-9ef4-ab64562560f3@kernel.org>

Hi Krzysztof

> -----Original Message-----
> From: Krzysztof Kozlowski <krzk=40kernel.org>
> Sent: Wednesday, February 5, 2025 9:22 PM
> To: Sudeep Holla <sudeep.holla=40arm.com>; Alim Akhtar
> <alim.akhtar=40samsung.com>
> Cc: 'Devang Tailor' <dev.tailor=40samsung.com>; robh=40kernel.org;
> krzk+dt=40kernel.org; conor+dt=40kernel.org; devicetree=40vger.kernel.org=
;
> linux-arm-kernel=40lists.infradead.org; linux-samsung-soc=40vger.kernel.o=
rg;
> linux-kernel=40vger.kernel.org; faraz.ata=40samsung.com
> Subject: Re: =5BPATCH v2=5D arm64: dts: add cpu cache information to
> ExynosAuto-v920
>=20
> On 31/01/2025 14:27, Sudeep Holla wrote:
> >>>
> >> =5Bsnip=5D
> >>  > +		l3_cache_cl0: l3-cache0 =7B
> >> You can add one node for cl0 and cl1, say =22l3_cache_cl0_cl1=22 and
> >> Remove the specific node for CL1, because both are same.
> >>
> >
> > What do you mean by =22both are same=22 ?
> > Do you mean both have exact same properties but are physically
> > different caches ? OR Do you mean it is just one shared cache ?
> >
> > If former, we still need distinct node to get the cacheinfo about
> > shareability correct. If this is about avoiding duplication of errors,
> > you can probably define some macro and avoid it, but we need 2 nodes
> > in the devicetree.
> >
> > If latter, you suggestion is correct.
>=20
> No answers here, so I drop this patch from my queue.
>=20
It took sometime to get the confirmation internally (because of new year ho=
liday)
Just replied to Sudeep. It will be great if you can consider this patch for=
 this cycle.=20
Thanks=21

> Best regards,
> Krzysztof

