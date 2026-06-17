Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3C3395ACD
	for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Jun 2026 05:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781674900; cv=none; b=RQyxeMFw8kv4HRK5iiOX92KyWenspDqlyrHtfOYEqxKPlW2nkdER8UuddZTtaIeyd1XNyHGgobUc65noCkgCNA5uQ4PY7Lm0T8ju31MXJ1/j8Pn7beRrd3L7GC9/3MkUrJ9H7bxONGcFamNLcJOf/Sb1KNdEaLRua0pUVW0todk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781674900; c=relaxed/simple;
	bh=ZSuCL5t5XX8Xmpvwcd5FMwBZU0diNhqm+X1107ZiLxk=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=tQj7++ZUzP7Jmj22xGVIVnHlMS7C/mtrS4TF0APSRnjtRzS02ukdiqO7Gn92waGVi4WZ+2ZRw5ranfUKVxwpOi6aqLMrHI4YuwBzS7trflW9NPm2y87wLVQDu644AO3qGq3PEeT43vJ2+gWePmSuUzDT2BGFc4Cb2JVNK+syC1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=MPW4AKOM; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="MPW4AKOM"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20260617054135epoutp01c4df721270efadc9537f165be7e0c217~5x_C_OL290608506085epoutp01G
	for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Jun 2026 05:41:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20260617054135epoutp01c4df721270efadc9537f165be7e0c217~5x_C_OL290608506085epoutp01G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1781674895;
	bh=XEb09tuegWQKJOgPPfrzmIOTwZci+/S7ntkCWNIVpyM=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=MPW4AKOM+FdBkZo8+RF6/AXQF8/Krdb9nW/pu5vyZBhhT3rlENdPgm6m/YaapUfHq
	 hz8VUvWI0ctG9c51ka09ZYkwgIfhrSoDlZ40Ude60TjrODuZ11Y4EJG0Ut0W/OTlb4
	 Ai0+t84amo2F0WwpWfsaRAMNnfUKLjrKXyLIB4XE=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20260617054135epcas5p1ce66eee29b95261bceba63afdea6d944~5x_Cpbc-p0264202642epcas5p1n;
	Wed, 17 Jun 2026 05:41:35 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.93]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4ggCQj5Gkwz2SSKb; Wed, 17 Jun
	2026 05:41:33 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20260617054133epcas5p11f49326a4feacbc8ebe1ae5d2ebf7274~5x_AilJk23211332113epcas5p1E;
	Wed, 17 Jun 2026 05:41:33 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20260617054131epsmtip1c9d3604895987387c5bb18bbaf4a12f9~5x9-Iko_R1134811348epsmtip18;
	Wed, 17 Jun 2026 05:41:31 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Peter Griffin'" <peter.griffin@linaro.org>
Cc: <krzk@kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>,
	<linusw@kernel.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <hajun.sung@samsung.com>
In-Reply-To: <CADrjBPqS=d2Q02UhdpkSxHJ-RYe-hvurB-1meurTOLoUcUidFQ@mail.gmail.com>
Subject: RE: [PATCH v2 4/5] arm64: dts: exynos: add initial support for
 Samsung Exynos8855 smdk
Date: Wed, 17 Jun 2026 11:11:30 +0530
Message-ID: <008e01dcfe1b$f4409ec0$dcc1dc40$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQMGoMk1ThMrnj1axtfzUgH2Sg21+wGT6tp2AllkeGABYkkJwbPEeMvA
Content-Language: en-us
X-CMS-MailID: 20260617054133epcas5p11f49326a4feacbc8ebe1ae5d2ebf7274
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260615083428epcas5p15eb83d4d631296cf4863e330542cd7dc
References: <CGME20260615083428epcas5p15eb83d4d631296cf4863e330542cd7dc@epcas5p1.samsung.com>
	<20260615085252.1964423-1-alim.akhtar@samsung.com>
	<20260615085252.1964423-5-alim.akhtar@samsung.com>
	<CADrjBPqS=d2Q02UhdpkSxHJ-RYe-hvurB-1meurTOLoUcUidFQ@mail.gmail.com>

Hi Peter

> -----Original Message-----
> From: Peter Griffin <peter.griffin@linaro.org>
> Sent: Monday, June 15, 2026 8:07 PM
> To: Alim Akhtar <alim.akhtar@samsung.com>
> Cc: krzk@kernel.org; robh@kernel.org; conor+dt@kernel.org;
> linusw@kernel.org; linux-samsung-soc@vger.kernel.org; linux-
> kernel@vger.kernel.org; devicetree@vger.kernel.org; linux-
> gpio@vger.kernel.org; hajun.sung@samsung.com
> Subject: Re: [PATCH v2 4/5] arm64: dts: exynos: add initial support for
> Samsung Exynos8855 smdk
> 
> Hi Alim,
> 
> On Mon, 15 Jun 2026 at 09:34, Alim Akhtar <alim.akhtar@samsung.com>
> wrote:
> >
> > Add initial devicetree support for Samsung smdk board using
> > Exynos8855 SoC.
> 
> I think it would be worthwhile adding a more verbose description of the
> Exynos8855 SoC in the commit message e.g. a brief list of the major IPs on
> the SoC.
> 
Sure will add more details here 
> >
> > Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> [..]
> > diff --git a/arch/arm64/boot/dts/exynos/exynos8855-smdk.dts
> > b/arch/arm64/boot/dts/exynos/exynos8855-smdk.dts
> > new file mode 100644
> > index 000000000000..f5132bcaa47c
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/exynos/exynos8855-smdk.dts
> > @@ -0,0 +1,32 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Samsung Exynos8855 SMDK board device tree source
> > + *
> > + * Copyright (C) 2026 Samsung Electronics Co., Ltd.
> > + *
> > + * Device tree source file for WinLink's E850-96 board which is based
> > +on
> > + * Samsung Exynos8855 SoC.
> 
> E850-96 isn't based on the Exynos8855 SoC. I guess it's leftover from a
> copy/paste.
> 
Ah! My bad, will remove these, Thanks

> regards,
> 
> Peter 
> 
> 

