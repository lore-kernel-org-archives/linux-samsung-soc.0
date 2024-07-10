Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821FCBA39
	for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Jul 2024 02:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720578433; cv=none; b=Wg0WKbst8vszqd6wYv5DWitIeMFtXgiGTISIlCPeZ0X5BQ8xUH+z2/k3i5GseNyBRhuijkYq5Jbi3f6DEg4QxpeMlN7+kIb0h2nCV+LwwRZPE4LeL232Cz8R7WJJW84iLDgCiakg/qKlVn4UI8xRF5+QU5cpEp0Bs445GzTnogg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720578433; c=relaxed/simple;
	bh=kPQDX/y5/+nhNgmf5b/2uKn6aE6aGrcNTzFk0RNiWso=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=SfXtweo/0rdhBxdCqiGV6HcNSx8VEHPNG6MgcGAmzleB+T35mClLvOJqY6l9WWYWrIVB+2E0y5HSIp23RO9Sxm6au36NdgTLS4EyN+ht2k/cZ6V94Ep2O37zN+YTKZGcSMRtG0za5LkSiyltnKpBCmQGhAw0rEtcF0+MSjov/IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Sa+oOeDx; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Sa+oOeDx"
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20240710022709epoutp02402ac54d1ad6b54fd828d362d09a8d10~guPcyOnZ91436614366epoutp02e
	for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Jul 2024 02:27:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20240710022709epoutp02402ac54d1ad6b54fd828d362d09a8d10~guPcyOnZ91436614366epoutp02e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1720578429;
	bh=/tJ6rT+Dg3kTu5oJFZBPOaXMCDyPW6Kt115XT6XCi+o=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=Sa+oOeDxpF3QSYoU/OxYiosc3Z7wAl3i1CiFbAaZEm13GbHi8CL/jdgo89HvvSr44
	 P5vsbQtmaWyMzby33q1cNh1YWi57a8GD0bDWB8vz8CO2gFtanqzVEGpP+Aqm9e5ESM
	 92siraRLnpxyG1qIJGR5R0B8usBTjzFnUzLtE1RQ=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTP id
	20240710022708epcas2p4a8fa9787aaf83db8b2d2df06289a8da7~guPcS_7RH1095610956epcas2p46;
	Wed, 10 Jul 2024 02:27:08 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.92]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4WJhZh2X5Fz4x9QG; Wed, 10 Jul
	2024 02:27:08 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
	epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
	3C.FE.09806.C71FD866; Wed, 10 Jul 2024 11:27:08 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20240710022707epcas2p3e8f64fded826f9a8dcb3183cddd87996~guPbJ-F2S2249422494epcas2p3x;
	Wed, 10 Jul 2024 02:27:07 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240710022707epsmtrp185066accd82ac2f0783c4cba86932a48~guPbIsxaM0506305063epsmtrp1d;
	Wed, 10 Jul 2024 02:27:07 +0000 (GMT)
X-AuditID: b6c32a47-c6bff7000000264e-dc-668df17c8d80
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	54.9A.19057.B71FD866; Wed, 10 Jul 2024 11:27:07 +0900 (KST)
Received: from KORCO118965 (unknown [10.229.18.201]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20240710022707epsmtip17dfb5d0517927e42a2fc9609d790b05e~guPa06Xgd2345223452epsmtip1v;
	Wed, 10 Jul 2024 02:27:07 +0000 (GMT)
From: "sunyeal.hong" <sunyeal.hong@samsung.com>
To: "'Jaewon Kim'" <jaewon02.kim@samsung.com>, "'Krzysztof Kozlowski'"
	<krzk@kernel.org>, "'Sylwester Nawrocki'" <s.nawrocki@samsung.com>,
	"'Chanwoo Choi'" <cw00.choi@samsung.com>, "'Alim Akhtar'"
	<alim.akhtar@samsung.com>, "'Michael	Turquette'" <mturquette@baylibre.com>,
	"'Stephen Boyd'" <sboyd@kernel.org>, "'Rob	Herring'" <robh@kernel.org>,
	"'Conor Dooley'" <conor+dt@kernel.org>
Cc: <linux-samsung-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <c4343994-bd0a-0786-964c-5d564393be7d@samsung.com>
Subject: RE: [PATCH v2 4/4] clk: samsung: add top clock support for Exynos
 Auto v920 SoC
Date: Wed, 10 Jul 2024 11:27:07 +0900
Message-ID: <000301dad270$a8fd8cd0$faf8a670$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJHtUpDsgLCeLIQdS8546uqgvLWdQHrL/DVAHE+qRECecG367DuxJAQ
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFJsWRmVeSWpSXmKPExsWy7bCmuW7Nx940g/tfeC0ezNvGZrFm7zkm
	i+tfnrNazD9yjtViR8MRVovz5zewW2x6fI3V4mPPPVaLy7vmsFnMOL+PyeLiKVeL/3t2sFsc
	ftPOavHv2kYWBz6P9zda2T02repk89i8pN6jb8sqRo/Pm+QCWKOybTJSE1NSixRS85LzUzLz
	0m2VvIPjneNNzQwMdQ0tLcyVFPISc1NtlVx8AnTdMnOA7lRSKEvMKQUKBSQWFyvp29kU5ZeW
	pCpk5BeX2CqlFqTkFJgX6BUn5haX5qXr5aWWWBkaGBiZAhUmZGf07L7AVjBZtGLXsW62Bsb9
	gl2MnBwSAiYSk5v+sncxcnEICexglJh6ZBIzhPOJUaK3bzmU841R4tvFLkaYltMrFjJBJPYy
	Suzbto8VwnnJKHHv8W+wKjYBfYnV3bfZQBIiAp3MEovP7WUEcZgF1jFKbJ55hB2kilPAXmLW
	8j1sILawQJRE67/9YN0sAqoSx/+cYwWxeQUsJS6s3swEYQtKnJz5hAXEZhaQl9j+dg4zxE0K
	Ej+fLgOrFxFwk5h8u58VokZEYnZnG1TNGQ6Jn+ftIGwXiX/rz0P9Iyzx6vgWdghbSuJlfxuU
	nS8x+fpbsD8lBBoYJa7964YaZC+x6MxPoCIOoAWaEut36YOYEgLKEkduQZ3GJ9Fx+C87RJhX
	oqNNCKJRTeLTlctQQ2Qkjp14xjyBUWkWksdmIXlsFpIHZiHsWsDIsopRLLWgODc9tdiowBge
	3cn5uZsYwYlYy30H44y3H/QOMTJxMB5ilOBgVhLhnX+jO02INyWxsiq1KD++qDQntfgQoykw
	qCcyS4km5wNzQV5JvKGJpYGJmZmhuZGpgbmSOO+91rkpQgLpiSWp2ampBalFMH1MHJxSDUwL
	TK//UNoVMCU9O18l2ffoQ41Xr5fpTFf78OCgw4XDVRonLNYdinN3uVRxMvx4TeSkdduO+mub
	BnJl7b1Ull4642flZiNd3+DZRva5EeH1iTdm3vp5q8A0Mo3X38Nw9Vv9D959WhFcJ9KN9ZrL
	HksH6uvbTtx90ijGwfLT3ID/qY/dpq/3/ral5Wv0Xr0DGxreMLd+W3+/WyBherHLKoMTc2S7
	ri7KutUkvMaIb/2P+7eKXFzvT884tGvVVMbURzblh7+czDBg3r7W4XP3mWuv1ZRNDhrf3MAq
	MIXb4/shzct2it8la0NEJm75bGEr9kMmW4330wZrqS28bVevzbLfzevStDXZ40225kLRla+U
	WIozEg21mIuKEwFjLDleTQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCIsWRmVeSWpSXmKPExsWy7bCSnG71x940g8+TFCwezNvGZrFm7zkm
	i+tfnrNazD9yjtViR8MRVovz5zewW2x6fI3V4mPPPVaLy7vmsFnMOL+PyeLiKVeL/3t2sFsc
	ftPOavHv2kYWBz6P9zda2T02repk89i8pN6jb8sqRo/Pm+QCWKO4bFJSczLLUov07RK4Mnp2
	X2ArmCxasetYN1sD437BLkZODgkBE4nTKxYygdhCArsZJY4dyIKIy0hsbPjPDmELS9xvOcLa
	xcgFVPOcUaJ39wxmkASbgL7E6u7bbCC2iEA/s8TDL+IgRcwCmxglzu2+yQbR8YNRYsm0drBR
	nAL2ErOW7wFKcHAIC0RIvF3EAxJmEVCVOP7nHCuIzStgKXFh9WYmCFtQ4uTMJywgNrOAtsTT
	m0+hbHmJ7W/nMENcpyDx8+kyVogj3CQm3+5nhagRkZjd2cY8gVF4FpJRs5CMmoVk1CwkLQsY
	WVYxSqYWFOem5xYbFhjlpZbrFSfmFpfmpesl5+duYgRHpJbWDsY9qz7oHWJk4mA8xCjBwawk
	wjv/RneaEG9KYmVValF+fFFpTmrxIUZpDhYlcd5vr3tThATSE0tSs1NTC1KLYLJMHJxSDUwJ
	HJOOM2Qvd7CJj6mRjDL7fNpE2up19MIlp96YWE19Op+Xe/KUw7f+6blEVO43K42OtvDYNetI
	yBK3xsf7Ny3cJiz0+Yfdm0uF7SmFJ3gzj7LmsPVebDGXt77yX7CccamP26aDMXEmXyTPmNex
	7Hv5/Nr9Btngqb67tAw1K3nfmT+et539wunT8pOUNh9aY7xDMssl5nkO45EzBYmmxvrtXLPv
	NiX/N2I77TZp0tEynRNeS8TlDGdLyz3cfm7ujbevLzx6G33/j79245Nw/Wj/JW4zZzLNTnN9
	vEoyoDrgwXuPS6zWpY+7gg9cmtHlJrVFZ8WFX093XBDfdfPtsfTZaXOtUxaGXHlpU3WB0X+6
	EktxRqKhFnNRcSIAw3P7vjcDAAA=
X-CMS-MailID: 20240710022707epcas2p3e8f64fded826f9a8dcb3183cddd87996
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240707231445epcas2p3f7d7412f507fa21493de6db04f7b5c7a
References: <20240707231331.3433340-1-sunyeal.hong@samsung.com>
	<CGME20240707231445epcas2p3f7d7412f507fa21493de6db04f7b5c7a@epcas2p3.samsung.com>
	<20240707231331.3433340-5-sunyeal.hong@samsung.com>
	<c4343994-bd0a-0786-964c-5d564393be7d@samsung.com>

Hello Jaewon,

> -----Original Message-----
> From: Jaewon Kim <jaewon02.kim@samsung.com>
> Sent: Monday, July 8, 2024 8:13 PM
> To: Sunyeal Hong <sunyeal.hong@samsung.com>; Krzysztof Kozlowski
> <krzk@kernel.org>; Sylwester Nawrocki <s.nawrocki@samsung.com>; Chanwoo
> Choi <cw00.choi@samsung.com>; Alim Akhtar <alim.akhtar@samsung.com>;
> Michael Turquette <mturquette@baylibre.com>; Stephen Boyd
> <sboyd@kernel.org>; Rob Herring <robh@kernel.org>; Conor Dooley
> <conor+dt@kernel.org>
> Cc: linux-samsung-soc@vger.kernel.org; linux-clk@vger.kernel.org;
> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> kernel@vger.kernel.org
> Subject: Re: [PATCH v2 4/4] clk: samsung: add top clock support for Exynos
> Auto v920 SoC
> 
> Hi Sunyeal
> 
> 
> On 7/8/24 08:13, Sunyeal Hong wrote:
> > This adds support for CMU_TOP which generates clocks for all the
> > function blocks such as CORE, HSI0/1/2, PERIC0/1 and so on. For
> > CMU_TOP, PLL_SHARED0,1,2,3,4 and 5 will be the sources of this block
> > and they will generate bus clocks.
> >
> > Signed-off-by: Sunyeal Hong <sunyeal.hong@samsung.com>
> > ---
> >   drivers/clk/samsung/Makefile             |    1 +
> >   drivers/clk/samsung/clk-exynosautov920.c | 1173 ++++++++++++++++++++++
> >   2 files changed, 1174 insertions(+)
> >   create mode 100644 drivers/clk/samsung/clk-exynosautov920.c
> >
> > diff --git a/drivers/clk/samsung/Makefile
> > b/drivers/clk/samsung/Makefile index 3056944a5a54..f704b0e11d08 100644
> > --- a/drivers/clk/samsung/Makefile
> > +++ b/drivers/clk/samsung/Makefile
> > @@ -25,3 +25,4 @@ obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-gs101.o
> >   obj-$(CONFIG_S3C64XX_COMMON_CLK)	+= clk-s3c64xx.o
> >   obj-$(CONFIG_S5PV210_COMMON_CLK)	+= clk-s5pv210.o clk-s5pv210-
> audss.o
> >   obj-$(CONFIG_TESLA_FSD_COMMON_CLK)	+= clk-fsd.o
> > +obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynosautov920.o
> 
> Must be sorted alphabetically.
> 
> plz move below clk-exynosautov9
> 
Okay, I will update.
> > diff --git a/drivers/clk/samsung/clk-exynosautov920.c
> > b/drivers/clk/samsung/clk-exynosautov920.c
> > new file mode 100644
> > index 000000000000..c24353bc04b7
> > --- /dev/null
> > +++ b/drivers/clk/samsung/clk-exynosautov920.c
> > @@ -0,0 +1,1173 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (c) 2024 Samsung Electronics Co., Ltd.
> > + * Author: Sunyeal Hong <sunyeal.hong@samsung.com>
> > + *
> > + * Common Clock Framework support for ExynosAuto V9 SoC.
> 
> There is some type.
> 
> (V9 -> V920)
> 
> 
> Thanks
> Jaewon Kim

I will edit and reflect your review.

Thanks,
Sunyeal Hong

