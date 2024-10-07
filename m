Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A10F18BB83
	for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Oct 2024 08:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728290372; cv=none; b=mkRSQYG3Hamh5+BF5sr3yRJLWHIAKDquu3OBtIDKdXaUJF45/PbwmjTS3svMP1iSPiBQXw2SHgTZYOmhv68q00TJAO9kycM+2Pn7wl/SXSZ/sXeFKYaAIuNI71HKy0En/pigATwTdqExn7sIi0s0Pxcwwz/w3uPxpLjHVQiWMz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728290372; c=relaxed/simple;
	bh=WCOdrGDsLGIiqFFiuT+0u8EblzmcKgUGhQiRtsMrLa4=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=RSr4OPZfEAXh3OU3XibN7T6MKQyLFPiVnuWUxB20Fz3WFeT8WLY56W/O0V+ciKciT0CSNaAcm+kyNc9dhqrmAupfJHNlNqbyeII1tQuGi191Eizvn7RaaZ2X1hWSEuTPbAX7JBIRcB6jV9npZasSFrmRFvqYHZ8Nauy4LplKpRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=SQwuWTGG; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="SQwuWTGG"
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20241007083927epoutp03047270292180fbf228d7b48625774a68~8Hu6nDaQP1024310243epoutp03f
	for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Oct 2024 08:39:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20241007083927epoutp03047270292180fbf228d7b48625774a68~8Hu6nDaQP1024310243epoutp03f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1728290367;
	bh=oJyTeOI31xg01zEi71YOR5TyTZkLUxjzCK7LhUkgqms=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=SQwuWTGGVv7DC9XndyqSZNM4zhokiYFoCkJ4UunsFKPCrElwLHNOBLFJA5rQ4rogA
	 DMzqXKjqWdAZ8IQ3oH4cufwDu3Rw2VU93CXGpjOiF86QUmbeBE65tYhs74dhxZdZNa
	 xY42Nuo/bY6Y/q8eyE74g1pFEONjNAdJX7VBPU08=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTP id
	20241007083926epcas2p3801cce95e30a538f23c82ab1310a1a8c~8Hu6EjrTR1601116011epcas2p3g;
	Mon,  7 Oct 2024 08:39:26 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.99]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4XMXdB3Bgwz4x9Pt; Mon,  7 Oct
	2024 08:39:26 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
	epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	69.FD.09396.E3E93076; Mon,  7 Oct 2024 17:39:26 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20241007083925epcas2p10d85918059a49c8b97d0d0a1b4786035~8Hu4w4Hye2828728287epcas2p1X;
	Mon,  7 Oct 2024 08:39:25 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20241007083925epsmtrp24966c152dbd0f5e832a196b01aff179c~8Hu4v5ER11447714477epsmtrp2m;
	Mon,  7 Oct 2024 08:39:25 +0000 (GMT)
X-AuditID: b6c32a45-6c5b7700000024b4-45-67039e3eaf00
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	12.F3.08229.D3E93076; Mon,  7 Oct 2024 17:39:25 +0900 (KST)
Received: from KORCO118965 (unknown [10.229.18.201]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20241007083925epsmtip22b2b3a3506648b9ab32d2c4347223715~8Hu4e4eTF0223502235epsmtip2K;
	Mon,  7 Oct 2024 08:39:25 +0000 (GMT)
From: "sunyeal.hong" <sunyeal.hong@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, "'Krzysztof Kozlowski'"
	<krzk+dt@kernel.org>, "'Rob Herring'" <robh@kernel.org>, "'Conor Dooley'"
	<conor+dt@kernel.org>, "'Alim Akhtar'" <alim.akhtar@samsung.com>,
	"'Sylwester	Nawrocki'" <s.nawrocki@samsung.com>, "'Chanwoo Choi'"
	<cw00.choi@samsung.com>, "'Michael Turquette'" <mturquette@baylibre.com>,
	"'Stephen Boyd'" <sboyd@kernel.org>
Cc: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>
In-Reply-To: <06fd4e7e-d401-49bb-81f1-47fcea2dbbee@kernel.org>
Subject: RE: [PATCH 2/3] clk: samsung: exynosautov920: add peric1, misc and
 hsi0/1 clock support
Date: Mon, 7 Oct 2024 17:39:24 +0900
Message-ID: <00a601db1894$6a074790$3e15d6b0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQFSCxBMLhmUc00YvRpkCeNGXSX0HwHNkDzvAdUnffwB72SclgF+0mDoAm3WOaGzQRhyYA==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrOJsWRmVeSWpSXmKPExsWy7bCmma7dPOZ0g3f7RS0ezNvGZrFm7zkm
	i+tfnrNazD9yjtXi5ax7bBbnz29gt9j0+Bqrxceee6wWl3fNYbOYcX4fk8XFU64W//fsYLc4
	/Kad1eLftY0sDnwe72+0sntsWtXJ5rF5Sb1H35ZVjB6fN8kFsEZl22SkJqakFimk5iXnp2Tm
	pdsqeQfHO8ebmhkY6hpaWpgrKeQl5qbaKrn4BOi6ZeYA3amkUJaYUwoUCkgsLlbSt7Mpyi8t
	SVXIyC8usVVKLUjJKTAv0CtOzC0uzUvXy0stsTI0MDAyBSpMyM44eOsHc8EK6YqV3dPYGxif
	inUxcnBICJhIvJvN1MXIxSEksINRYubreYwQzidGiUUXprNDON8YJabdnsLcxcgJ1vH48zRW
	EFtIYC+jRPdle4iil4wSb/ob2UASbAL6Equ7b7OBJEQEepgleuZOYAFxmAXWMUrs+rOFHaSK
	U8BOYsWOvWCjhAWSJHZOW8ECchSLgIrEnhv5IGFeAUuJ7l3X2CBsQYmTM5+wgNjMAtoSyxa+
	hrpIQeLn02WsIK0iAmESf097QJSISMzubGMGWSshcIZD4uTyl6wQ9S4S3T9vskPYwhKvjm+B
	sqUkPr/bywZh50tMvv6WCaK5gVHi2r9uqGX2EovO/GQHWcYsoCmxfpc+JByVJY7cgjqNT6Lj
	8F92iDCvREebEESjmsSnK5ehhshIHDvxjHkCo9IsJI/NQvLYLCQfzELYtYCRZRWjWGpBcW56
	arFRgSE8rpPzczcxglOwlusOxslvP+gdYmTiYDzEKMHBrCTCG7GGMV2INyWxsiq1KD++qDQn
	tfgQoykwpCcyS4km5wOzQF5JvKGJpYGJmZmhuZGpgbmSOO+91rkpQgLpiSWp2ampBalFMH1M
	HJxSDUyHJMOd3T4yqTcylParK2h63Zj076uA9Xm3esa2LV6HU7zrPyisV0nwlZDcwyYmecP0
	i9k3fqWbcybvnrrMJa3L/uFzBh23Kay7bPrsH6/pKPBokJ0wiZXT9fjvuanycQeUeGbP2+2g
	qLz4xHMTpukNYj6Zvit1VjMkSfvxVP+rerXSIZdtXUSVvNE5o+3fv9udCF+xdU5l+9mMhTkP
	32tppnLfZX2bF+1qdKQoNfibhPv0f9biv9zTz19cG/VK/v0PuZ/zvr+W4XqQNC+kNk5pu+b8
	LVOj3ZkqyzXWhF7w/Dr1AdP9Eret7Xm8MjklgXaBKTXscpYRmziXTjzCf7l+x44Sq1OK7Y08
	rmzPlFiKMxINtZiLihMBYdWTNkoEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKIsWRmVeSWpSXmKPExsWy7bCSvK7tPOZ0gw3NfBYP5m1js1iz9xyT
	xfUvz1kt5h85x2rxctY9Novz5zewW2x6fI3V4mPPPVaLy7vmsFnMOL+PyeLiKVeL/3t2sFsc
	ftPOavHv2kYWBz6P9zda2T02repk89i8pN6jb8sqRo/Pm+QCWKO4bFJSczLLUov07RK4Mj4f
	6GQsWCZVsX3zK6YGxseiXYycHBICJhKPP09j7WLk4hAS2M0osfPKKkaIhIzExob/7BC2sMT9
	liNQRc8ZJVYfa2AGSbAJ6Eus7r7NBpIQEZjELDHlxR0WEIdZYBOjxJaGl8wQLdeZJE5v+wI2
	i1PATmLFjr2sILawQILE7uZ9TF2MHBwsAioSe27kg4R5BSwlunddY4OwBSVOznzCAmIzC2hL
	9D5sZYSxly18zQxxnoLEz6fLWEHGiAiESfw97QFRIiIxu7ONeQKj8Cwkk2YhmTQLyaRZSFoW
	MLKsYpRMLSjOTc8tNiwwzEst1ytOzC0uzUvXS87P3cQIjkktzR2M21d90DvEyMTBeIhRgoNZ
	SYQ3Yg1juhBvSmJlVWpRfnxRaU5q8SFGaQ4WJXFe8Re9KUIC6YklqdmpqQWpRTBZJg5OqQam
	vCMNXjVpkx08/rHWfjqzhCN1qZHOw0+Wd+wmHSmMjNT8utkrfhmfmE9Sydlij1cnd2g7/v9u
	lzD7SLnb8eMMZbeyFqpNjfd6G6nZwdZVKD31jnJAR/E2d2ef+1ffcOlZzGbiS910Y5VlmdvC
	HmbOLZ2yhQGnWowaV+zvlp3XpZFYm2Lon1/fe+yCiND1qPTKE6L2+m8X3zp9x1rl63+pLxOT
	/zst6QpNaylsfm6jPLXzw2uN/jiVWTmOCbNTRTav6Ci7+2957/yZX3qVNaSd1W8cun9Basra
	yDu5Pbf2MD5Z0Lv18W8X/WvWXLFXjqY4129qqJTefbHrz0kjh8kW2hPXrUsxtE/7ucnjYJES
	S3FGoqEWc1FxIgBSSRHdOAMAAA==
X-CMS-MailID: 20241007083925epcas2p10d85918059a49c8b97d0d0a1b4786035
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240912103903epcas2p4fb9aaeafb223b63c57c2f0cac7f37c3d
References: <20240912103856.3330631-1-sunyeal.hong@samsung.com>
	<CGME20240912103903epcas2p4fb9aaeafb223b63c57c2f0cac7f37c3d@epcas2p4.samsung.com>
	<20240912103856.3330631-3-sunyeal.hong@samsung.com>
	<db9dc2ef-2c24-4f1b-82c8-316c347daf60@kernel.org>
	<00a501db188f$8a7142b0$9f53c810$@samsung.com>
	<06fd4e7e-d401-49bb-81f1-47fcea2dbbee@kernel.org>

Hello Krzysztof,

> -----Original Message-----
> From: Krzysztof Kozlowski <krzk=40kernel.org>
> Sent: Monday, October 7, 2024 5:07 PM
> To: sunyeal.hong <sunyeal.hong=40samsung.com>; 'Krzysztof Kozlowski'
> <krzk+dt=40kernel.org>; 'Rob Herring' <robh=40kernel.org>; 'Conor Dooley'
> <conor+dt=40kernel.org>; 'Alim Akhtar' <alim.akhtar=40samsung.com>; 'Sylw=
ester
> Nawrocki' <s.nawrocki=40samsung.com>; 'Chanwoo Choi' <cw00.choi=40samsung=
.com>;
> 'Michael Turquette' <mturquette=40baylibre.com>; 'Stephen Boyd'
> <sboyd=40kernel.org>
> Cc: devicetree=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org;
> linux-samsung-soc=40vger.kernel.org; linux-kernel=40vger.kernel.org; linu=
x-
> clk=40vger.kernel.org
> Subject: Re: =5BPATCH 2/3=5D clk: samsung: exynosautov920: add peric1, mi=
sc
> and hsi0/1 clock support
>=20
> On 07/10/2024 10:04, sunyeal.hong wrote:
> > Hello Krzysztof,
> >
> >> -----Original Message-----
> >> From: Krzysztof Kozlowski <krzk=40kernel.org>
> >> Sent: Monday, September 30, 2024 8:36 PM
> >> To: Sunyeal Hong <sunyeal.hong=40samsung.com>; Krzysztof Kozlowski
> >> <krzk+dt=40kernel.org>; Rob Herring <robh=40kernel.org>; Conor Dooley
> >> <conor+dt=40kernel.org>; Alim Akhtar <alim.akhtar=40samsung.com>;
> >> Sylwester Nawrocki <s.nawrocki=40samsung.com>; Chanwoo Choi
> >> <cw00.choi=40samsung.com>; Michael Turquette <mturquette=40baylibre.co=
m>;
> >> Stephen Boyd <sboyd=40kernel.org>
> >> Cc: devicetree=40vger.kernel.org; linux-arm-kernel=40lists.infradead.o=
rg;
> >> linux-samsung-soc=40vger.kernel.org; linux-kernel=40vger.kernel.org;
> >> linux- clk=40vger.kernel.org
> >> Subject: Re: =5BPATCH 2/3=5D clk: samsung: exynosautov920: add peric1,
> >> misc and hsi0/1 clock support
> >>
> >> On 12/09/2024 12:38, Sunyeal Hong wrote:
> >>> Like CMU_PERIC1, this provides clocks for USI09 =7E USI17, USI_I2C an=
d
> >> USI_I3C.
> >>> Like CMU_MISC, this provides clocks for MISC, GIC and OTP.
> >>> Like CMU_HSI0, this provides clocks for PCIE.
> >>> Like CMU_HSI1, this provides clocks for USB and MMC.
> >>>
> >>> Signed-off-by: Sunyeal Hong <sunyeal.hong=40samsung.com>
> >>> ---
> >>
> >> ...
> >>
> >>> +
> >>>  static int __init exynosautov920_cmu_probe(struct platform_device
> >>> *pdev)  =7B
> >>>  	const struct samsung_cmu_info *info; =40=40 -1154,6 +1431,19 =40=40=
 static
> >>> const struct of_device_id exynosautov920_cmu_of_match=5B=5D =3D =7B
> >>>  	=7B
> >>>  		.compatible =3D =22samsung,exynosautov920-cmu-peric0=22,
> >>>  		.data =3D &peric0_cmu_info,
> >>> +	=7D, =7B
> >>> +		 .compatible =3D =22samsung,exynosautov920-cmu-peric1=22,
> >>> +		 .data =3D &peric1_cmu_info,
> >>> +	=7D, =7B
> >>> +		 .compatible =3D =22samsung,exynosautov920-cmu-misc=22,
> >>> +		 .data =3D &misc_cmu_info,
> >>> +	=7D, =7B
> >>> +		.compatible =3D =22samsung,exynosautov920-cmu-hsi0=22,
> >>> +		.data =3D &hsi0_cmu_info,
> >>> +	=7D, =7B
> >>> +		.compatible =3D =22samsung,exynosautov920-cmu-hsi1=22,
> >>> +		.data =3D &hsi1_cmu_info,
> >>> +	=7D, =7B
> >>
> >> This is unrelated change. Please rebase.
> >>
> > Could you please explain in more detail the comment mentioned above?
>=20
> You were growing this list, didn't you? Then adding sentinel is unrelated=
.
>=20

I have confirmed that the sentinel is being applied duplicately. I will sen=
d you a patch after fixing it.

Best Regards,
sunyeal
>=20
> Best regards,
> Krzysztof
>=20


