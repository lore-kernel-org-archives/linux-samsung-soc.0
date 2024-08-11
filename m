Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A30D14A4CC
	for <linux-samsung-soc@vger.kernel.org>; Sun, 11 Aug 2024 16:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723395314; cv=none; b=TDplr1lXDY2ckTmhjDiKuNdF2pWp4Fd8MmNxdKIWUnaUR+Lu2MEWVGyvAAP66NOjyr7G3Kok9aLDGj6q8pmGKvp1zMZvftws/1zZfv3/ux1ZR6TfKr6fys8o56owkr+0qCk+lP/YrBbA/j2burQEdcWNtC9LsjjGG+NfhjLy2o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723395314; c=relaxed/simple;
	bh=vHKPWfiQWvlSo4VoE8qHtUeppbgKxJPqBsnzf17dE1M=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=I8fYUXxHLnKnY7JI37obB1bSImXiw/5Lhm6SYfqjkLzSQa4/JccKtaNFMczcWnhAqSS7pknJhy4u6NSqzhTxsiusW4wx/896vSLbRIMXFjITJpT7xVErDpuLpyVy6j5M+nZ5n94hFfEczJbWb3/y5mpuh3y00EcTEO1QSXhM8ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Ng8k0Y8U; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Ng8k0Y8U"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20240811165504epoutp0402ac68e4c6f811264fe608f35eae4718~quuX8Xf2R2365623656epoutp04I
	for <linux-samsung-soc@vger.kernel.org>; Sun, 11 Aug 2024 16:55:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20240811165504epoutp0402ac68e4c6f811264fe608f35eae4718~quuX8Xf2R2365623656epoutp04I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1723395304;
	bh=hd+fiVs9oF1v/I8T9U+QYPDLsJffRXyK3AHnAirESvk=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=Ng8k0Y8UZs6ms0QLTdhbgNTV6xP+vkTyETuCFpUXRoui6So1jeNMYKXgYjdPhHjeo
	 RLI0pHhc4g6OjTyYv3hoJLqQFDXVSl55AxBAs0elRUwmy896Wd0fHob5UIYEtN+SU6
	 vPL2TcvJrS+94a9I6oFxK5kX8kiv97dhONaOo/58=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTP id
	20240811165502epcas5p30380bcb0d1bedc8adf60b5d8ad888a7d~quuWo54st2486024860epcas5p3q;
	Sun, 11 Aug 2024 16:55:02 +0000 (GMT)
Received: from epsmgec5p1-new.samsung.com (unknown [182.195.38.175]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4WhkKK1z97z4x9Pt; Sun, 11 Aug
	2024 16:55:01 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
	epsmgec5p1-new.samsung.com (Symantec Messaging Gateway) with SMTP id
	AD.28.19863.5ECE8B66; Mon, 12 Aug 2024 01:55:01 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20240811165500epcas5p32d48a528ec0b99b2867f7c27bdecc5a8~quuUI2HQD2970829708epcas5p3S;
	Sun, 11 Aug 2024 16:55:00 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240811165500epsmtrp27d587a693cfdf318892d5304e5336552~quuUIFhjG1434314343epsmtrp2G;
	Sun, 11 Aug 2024 16:55:00 +0000 (GMT)
X-AuditID: b6c32a50-c73ff70000004d97-8c-66b8ece547de
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	0C.03.08456.4ECE8B66; Mon, 12 Aug 2024 01:55:00 +0900 (KST)
Received: from INBRO002756 (unknown [107.122.12.5]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20240811165458epsmtip25e1cffbfb83e37a1cc3ab595ee5b69a1~quuSQOOD91628316283epsmtip2f;
	Sun, 11 Aug 2024 16:54:58 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, "'Sunyeal Hong'"
	<sunyeal.hong@samsung.com>, "'Sylwester Nawrocki'" <s.nawrocki@samsung.com>,
	"'Chanwoo Choi'" <cw00.choi@samsung.com>, "'Michael Turquette'"
	<mturquette@baylibre.com>, "'Stephen Boyd'" <sboyd@kernel.org>, "'Rob
 Herring'" <robh@kernel.org>, "'Conor Dooley'" <conor+dt@kernel.org>
Cc: <linux-samsung-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <db84ee7d-dfd8-4e15-9745-01b1a76566ad@kernel.org>
Subject: RE: [PATCH v5 1/4] dt-bindings: clock: add ExynosAuto v920 SoC CMU
 bindings
Date: Sun, 11 Aug 2024 22:24:56 +0530
Message-ID: <000a01daec0f$33ca4710$9b5ed530$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQF6vxHYtquPDfXNJNR6Q4M3hEm7ZwGgrKQGAnAwy/YBn8h2zbK1GALg
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrOJsWRmVeSWpSXmKPExsWy7bCmuu7TNzvSDN785bJYs/cck8X1L89Z
	LeYfOcdqcf78BnaLTY+vsVp87LnHanF51xw2ixnn9zFZXDzlavF/zw52i8Nv2lkt/l3byGLR
	tGw9kwOvx/sbrewem1Z1snlsXlLv0bdlFaPH501yAaxR2TYZqYkpqUUKqXnJ+SmZeem2St7B
	8c7xpmYGhrqGlhbmSgp5ibmptkouPgG6bpk5QCcqKZQl5pQChQISi4uV9O1sivJLS1IVMvKL
	S2yVUgtScgpMCvSKE3OLS/PS9fJSS6wMDQyMTIEKE7IzVr1+wFjwnK1i2ha2BsY1rF2MnBwS
	AiYSn1u/sYPYQgJ7GCUernXtYuQCsj8xSuxeOYMRIvGNUaLzKAtMw56HSxkhivYySnTtPcsK
	4bxglDjcOgWsg01AV2LH4jY2kISIwD0miY6J+1lAHGaBdYwSm2ceAVvIKWAnsWfnbTBbWCBM
	Yv/t6WA2i4CqROfq3WwgNq+ApUTntJ0sELagxMmZT8BsZgFtiWULXzND3KQg8fPpMrCHRATc
	JKafn8gIUSMu8fIoyC4uoJoDHBI7J/yCanCRmPNsKtRDwhKvjm9hh7ClJD6/28sGYWdLHL84
	C8qukOhu/QhVYy+x89FNoF4OoAWaEut36UPs4pPo/f2ECSQsIcAr0dEmBFGtKtH87irUJmmJ
	id3d0HD3kLixYyP7BEbFWUg+m4Xks1lIPpiFsGwBI8sqRqnUguLc9NRk0wJD3bzUcniEJ+fn
	bmIEp2CtgB2Mqzf81TvEyMTBeIhRgoNZSYS3OXxTmhBvSmJlVWpRfnxRaU5q8SFGU2B4T2SW
	Ek3OB2aBvJJ4QxNLAxMzMzMTS2MzQyVx3tetc1OEBNITS1KzU1MLUotg+pg4OKUamOYEnhL8
	fTzbIy1Az6jsEqeD5A5l3o3KCuuMt7hU8HQqX7goG+DN1uH9fOmn2VnH+aRuLfGwX612Ts7t
	65Mrkk4zL3npuU5L6dq+3i4/yGqjyY1C0eKX2SwKz40O5af8YDwi+Vir8ZJuh4HlJ9knM/j2
	L34ndFxyUVvFZ6v7Tbfvb77ttl1FT0NtZ4bak9sWIrOdBT6FTpkd+PfP12a3ojt/LuwLkJki
	FNW0rVdudkeGgqDQpU9ZL9fHLtO7dlbEm3+/9JuPN9JWGCst0TRNcD3cd+XQ/AT/N+t/2y+6
	IJky7XhvFfvExrYM1p5/Fx7ufbFsctD+FxOqVt45Jv/UpPVQxp4Dyv9Tf7z5Z2j5s1WJpTgj
	0VCLuag4EQDAeusxSgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrEIsWRmVeSWpSXmKPExsWy7bCSvO6TNzvSDBq+s1us2XuOyeL6l+es
	FvOPnGO1OH9+A7vFpsfXWC0+9txjtbi8aw6bxYzz+5gsLp5ytfi/Zwe7xeE37awW/65tZLFo
	WraeyYHX4/2NVnaPTas62Tw2L6n36NuyitHj8ya5ANYoLpuU1JzMstQifbsEroxbzw+xF9xm
	q1iw7QNLA+MC1i5GTg4JAROJPQ+XMnYxcnEICexmlOjds4kZIiEtcX3jBHYIW1hi5b/n7BBF
	zxgllu96CVbEJqArsWNxGxtIQkTgCZPEtZZNYKOYBTYxSpzbfZMNouU7o8S0P2cZQVo4Bewk
	9uy8DTZXWCBE4uehP2wgNouAqkTn6t1gNq+ApUTntJ0sELagxMmZT8BsZgFtid6HrYww9rKF
	r6FuVZD4+XQZ2EMiAm4S089PhKoRl3h59Aj7BEbhWUhGzUIyahaSUbOQtCxgZFnFKJlaUJyb
	nltsWGCUl1quV5yYW1yal66XnJ+7iREcjVpaOxj3rPqgd4iRiYPxEKMEB7OSCG9z+KY0Id6U
	xMqq1KL8+KLSnNTiQ4zSHCxK4rzfXvemCAmkJ5akZqemFqQWwWSZODilGpj2TWgrfrNmXU2F
	wJtVm/nrzx67uPTq5Fsn+1Zmtk6xuKeeFtjQHCaUZ1evX12Qx7CistFPZhXD7fsfg1OY70zM
	CQjZueDgSm+nN1cv1y/bEnf7X+jFY1UZgdf2v7Koj13B2cGU3WjxUizl5PGNRSZztodqCOSv
	+3PKpMA0YpXtWfHra47M6r1n8Esv9uDy79d+x62cVvKVoW/T9Fcblu86tdMu4H4ft8Oz9K1b
	TZmyJ8juj1cwYQmbMX3DLJUlW6/IXf0Vf1hXZ3lWD4PyK26T2U0bpnPPWmynZKrl2Nvp98wo
	KKt5dax/1t1J39bcKLi40fGF0Sx/iQrXZJcLjSWNpanXFpcs0Itf891hV3qiEktxRqKhFnNR
	cSIA23yVbDUDAAA=
X-CMS-MailID: 20240811165500epcas5p32d48a528ec0b99b2867f7c27bdecc5a8
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240730071227epcas2p278017961013950cd75c4266eda45c236
References: <20240730071221.2590284-1-sunyeal.hong@samsung.com>
	<CGME20240730071227epcas2p278017961013950cd75c4266eda45c236@epcas2p2.samsung.com>
	<20240730071221.2590284-2-sunyeal.hong@samsung.com>
	<db84ee7d-dfd8-4e15-9745-01b1a76566ad@kernel.org>

Hi Krzysztof

> -----Original Message-----
> From: Krzysztof Kozlowski <krzk=40kernel.org>
> Sent: Wednesday, July 31, 2024 2:57 PM
> To: Sunyeal Hong <sunyeal.hong=40samsung.com>; Sylwester Nawrocki
=5Bsnip=5D
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - samsung,exynosautov920-cmu-top
> > +      - samsung,exynosautov920-cmu-peric0
>=20
> Maybe I misinterpreted previous discussion, but I had impression that
> binding was incomplete and you wanted to add more devices?
>=20
There are other CMU controller blocks likes any other Exynos SoC.=20
Are you suggesting to add all of them?=20
In the above case cmu_top provides clocks to cmu_peric0.=20
And I think the subject patch Intension is to add binding for this clock tr=
ee.=20

> > +
> > +  clocks:
> > +    minItems: 1
=5Bsnip=5D
>=20
> Best regards,
> Krzysztof


