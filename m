Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0042C21A94F
	for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Apr 2025 08:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746002679; cv=none; b=krZgvb9W0Hpgl9R96AgL9YR6Zp5EABG8kAq5U6NbP2YUE5cYPj7RzzFb54v1xtP98vvSGJNcZQo/wP35yNHklVx/YmcAofEVBA1MmNJtnKp3N9Txlr9u38NI1EoVEhWPZCC5GCyqzaJu2gLvW/Sb6kFRTOciS2chYT7Zfz0hwD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746002679; c=relaxed/simple;
	bh=+vmijnahmzqgvBOY0vSFX0jDJzO9B2yPyewutBO/kKI=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=nYHrydlUiaqg3fWZ9iShKQjV4DHUKmCg8o3eNZTrn18jIJyVOJZF1sudIYL0oqhvnXln0F7dJmxs4DJsAXb38zPykMbm4D7pb3QbENGPCSRmacmHIh6QZl5aOTCUDZqW6xrwI4dirqElQ2pHwhR9OVFRwCNHUBb7GnE5azNNzro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=QuzRoyMy; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="QuzRoyMy"
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250430084434epoutp04112d3f26fd9e08e7675380e12c3a629e~7DC6WFCYW2051920519epoutp04K
	for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Apr 2025 08:44:34 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250430084434epoutp04112d3f26fd9e08e7675380e12c3a629e~7DC6WFCYW2051920519epoutp04K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1746002674;
	bh=+vmijnahmzqgvBOY0vSFX0jDJzO9B2yPyewutBO/kKI=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=QuzRoyMy4s1E0Yxy3E2erMCKXV5XcXhfeA549uW7YETfEikXj9TF4rPygc4uUDN2M
	 jdKjuTa9/P4TT68iMq46YU9OGF0/9YYqzeYmfaGhxwcXYmWJQp2SZk4i0MTu4hseeq
	 98yY83AikXZvkAtBi5lhX4h1eIGW8J2e/Ro/ziAI=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20250430084433epcas2p27e1db1c7198c4324ab807ce33e41371d~7DC5gvq1W0138101381epcas2p2k;
	Wed, 30 Apr 2025 08:44:33 +0000 (GMT)
Received: from epcas2p4.samsung.com (unknown [182.195.36.101]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4ZnW2T3bzzz2SSKr; Wed, 30 Apr
	2025 08:44:33 +0000 (GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20250430084432epcas2p49ec3562a8e09555b3c1de9bd84e5fb8f~7DC4fP_el2366723667epcas2p4C;
	Wed, 30 Apr 2025 08:44:32 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250430084432epsmtrp2f9a6eeaf557de57d66e880627510c49e~7DC4eXuv51265712657epsmtrp2F;
	Wed, 30 Apr 2025 08:44:32 +0000 (GMT)
X-AuditID: b6c32a2a-d57fe70000002265-5c-6811e2f04d9d
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	3E.C1.08805.0F2E1186; Wed, 30 Apr 2025 17:44:32 +0900 (KST)
Received: from KORCO115296 (unknown [12.36.150.221]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250430084432epsmtip2969e7c98e0532399bb9136e22ac75a64~7DC4R7PHd3272732727epsmtip2V;
	Wed, 30 Apr 2025 08:44:32 +0000 (GMT)
From: =?UTF-8?B?7IaQ7Iug?= <shin.son@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>
Cc: "'Sylwester Nawrocki'" <s.nawrocki@samsung.com>, "'Chanwoo Choi'"
	<cw00.choi@samsung.com>, "'Alim Akhtar'" <alim.akhtar@samsung.com>,
	"'Michael	Turquette'" <mturquette@baylibre.com>, "'Stephen Boyd'"
	<sboyd@kernel.org>, "'Rob	Herring'" <robh@kernel.org>, "'Conor Dooley'"
	<conor+dt@kernel.org>, "'Sunyeal Hong'" <sunyeal.hong@samsung.com>,
	<linux-samsung-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <20250430-wonderful-meticulous-groundhog-cbe6e1@kuoka>
Subject: RE: [PATCH v2 3/4] clk: samsung: exynosautov920: Fix incorrect
 CLKS_NR_CPUCL0 definition
Date: Wed, 30 Apr 2025 17:44:31 +0900
Message-ID: <04c801dbb9ac$17eb1f40$47c15dc0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AQKVz8E4gWpx1pKf+PhrDO9dWLB9vQKrOtICAhAmCl4B8oDt7rISRXng
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGIsWRmVeSWpSXmKPExsWy7bCSvO6HR4IZBitnalo8mLeNzWLN3nNM
	Fte/PGe1mH/kHKvF+fMb2C02Pb7GavGx5x6rxeVdc9gsZpzfx2Rx8ZSrxf89O9gtDr9pZ7X4
	d20ji0XTsvVMDnwe72+0sntsWtXJ5rF5Sb1H35ZVjB6fN8kFsEZx2aSk5mSWpRbp2yVwZbTt
	esBcMF+woqN5IlMD42G+LkZODgkBE4l5j9YxdjFycQgJ7GaUWDZhNhtEQkLi8IwJjBC2sMT9
	liOsEEXPGSX+LZ/GApJgEzCUWPVjOxOILSKgK7H5xnJ2kCJmgWksEm/390J1fGKUuHlrGztI
	FaeAs0T/3UZmEFtYIFHi0u7vYOtYBFQlFuxZyQpi8wpYSsz7/wjKFpQ4OfMJ2DZmAW2J3oet
	jDD2soWvmSHOU5DY/ekoK8QVbhKbWp+yQ9SISMzubGOewCg8C8moWUhGzUIyahaSlgWMLKsY
	JVMLinPTc4sNC4zyUsv1ihNzi0vz0vWS83M3MYKjUktrB+OeVR/0DjEycTAeYpTgYFYS4Z10
	SzBDiDclsbIqtSg/vqg0J7X4EKM0B4uSOO+3170pQgLpiSWp2ampBalFMFkmDk6pBqbT59et
	kfHiZ7ZdpvE7IDlyopzKWyWVppZdYROdDe/lTduxnTk/8KzKs/c6Z+beu/Xw68mI6mdM4jHX
	Qq6fjQkT9FNeO8Euf+Lh6Rek9to5MT9+eP7qvnUiZ6yaz1hHzrZYsaOPu/UD40fHwz6bWB0+
	MW1zj+OecETB9re02lyFO3ZLXZ3vTvPSfbX6ovDGFbUr3qw6v9LIfwqL/VLFm2t2zTma8p7z
	pyibQ/h63iWzjnsGrv7tXMykOXVmWmCVyTzpWWeUfq1LLzgzLW528sSYPk7lsw/jT71rvbJw
	q6D7xym2M+cwc290EBB2yF193ca95f+qYMFqTddr26VdftbbXjY5MFPbIdWnq37Z3ovqSizF
	GYmGWsxFxYkAAiBDMjkDAAA=
X-CMS-MailID: 20250430084432epcas2p49ec3562a8e09555b3c1de9bd84e5fb8f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250428113558epcas2p1f2980cbc58f71dde78a9529e2b85ac20
References: <20250428113517.426987-1-shin.son@samsung.com>
	<CGME20250428113558epcas2p1f2980cbc58f71dde78a9529e2b85ac20@epcas2p1.samsung.com>
	<20250428113517.426987-4-shin.son@samsung.com>
	<20250430-wonderful-meticulous-groundhog-cbe6e1@kuoka>

Hello Krzysztof Kozlowski,

> -----Original Message-----
> From: Krzysztof Kozlowski =5Bmailto:krzk=40kernel.org=5D
> Sent: Wednesday, April 30, 2025 4:26 PM
> To: Shin Son <shin.son=40samsung.com>
> Cc: Sylwester Nawrocki <s.nawrocki=40samsung.com>; Chanwoo Choi
> <cw00.choi=40samsung.com>; Alim Akhtar <alim.akhtar=40samsung.com>; Micha=
el
> Turquette <mturquette=40baylibre.com>; Stephen Boyd <sboyd=40kernel.org>;=
 Rob
> Herring <robh=40kernel.org>; Conor Dooley <conor+dt=40kernel.org>; Sunyea=
l
> Hong <sunyeal.hong=40samsung.com>; linux-samsung-soc=40vger.kernel.org; l=
inux-
> clk=40vger.kernel.org; devicetree=40vger.kernel.org; linux-arm-
> kernel=40lists.infradead.org; linux-kernel=40vger.kernel.org
> Subject: Re: =5BPATCH v2 3/4=5D clk: samsung: exynosautov920: Fix incorre=
ct
> CLKS_NR_CPUCL0 definition
>=20
> On Mon, Apr 28, 2025 at 08:35:16PM GMT, Shin Son wrote:
> > The CLKS_NR_CPUCL0 macro was incorrectly defined based on a wrong clock
> ID.
> > It mistakenly referenced CLK_DOUT_CLUSTER0_PERIPHCLK, which
> > corresponds to a cluster peripheral clock, not the last clock ID for
> CPUCL0 as intended.
> >
> > This patch corrects the definition to use CLK_DOUT_CPUCL0_NOCP + 1,
>=20
> Please do not use =22This commit/patch/change=22, but imperative mood. Se=
e
> longer explanation here:
> https://protect2.fireeye.com/v1/url?k=3D2e90faf7-4f1befd2-2e9171b8-
> 74fe485cbff6-28bf0169b8fd9187&q=3D1&e=3Ddfbde4e5-fe38-4140-aa45-
> b3362eb2dc00&u=3Dhttps%3A%2F%2Felixir.bootlin.com%2Flinux%2Fv5.17.1%2Fsou=
rce
> %2FDocumentation%2Fprocess%2Fsubmitting-patches.rst%23L95
>=20
> > properly matching the last clock ID for CPUCL0 as intended.
> >
> > This error was due to confusion with the hardware diagram, and this
> > patch ensures that the number of clocks for CPUCL0 is correctly defined=
.
>=20
> Fixes: 59636ec89c2c (=22clk: samsung: exynosautov920: add cpucl0 clock
> support=22)
>=20
>=20
> And proper order - fixes are *ALWAYS* before new features.
>=20
> Best regards,
> Krzysztof

Thank you for applying my patches.
I appreciate your feedback, and I=E2=80=99ll=20make=20sure=20to=20improve=
=20those=20parts=20in=20the=20future.=0D=0A=0D=0AHave=20a=20great=20day.=0D=
=0A=0D=0ABest=20regards,=0D=0AShin=20Son.=0D=0A=0D=0A
