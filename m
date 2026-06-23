Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3033CFF71
	for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Jun 2026 10:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782211452; cv=none; b=F8SrTXTLRVR7k4JOeKJ4palp0LjllYpRXyl8NF7cecFPifEU+FYda1HGUD6YbQE+jquNXOVs7ciQ8Bduqr2tNw/8DFH4EFor9XAv/hRK5nW6t5dGES/xIRt5+L9h21E2nDNbVoZKD4JzdikqnvZC5fSLbDKn/LAo82mWzmrE8vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782211452; c=relaxed/simple;
	bh=q425o3ZOVGkqH42YjwrhP9FimssVNj4/5jXO26HkfYk=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=V3L5BwtozQJyFzy/ZXosM+VqsM+dvR3yu08FoaSEHlH+QEaR3lNRVUaN8yDsvlVZj18KUabERTAA8TQ744PmDArZikogHa0DSSz7dxhMCZ6ixFUZbEreRewxWITE+2bul2GJt11BE+b/FGUiVC/Ig14VaXsbCb/RW0mNzuqb/FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=O8bBb+LK; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="O8bBb+LK"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20260623104407epoutp04aa1455af8b40795c09b0638c7a3b875b~7r957ah2A1574615746epoutp04Z
	for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Jun 2026 10:44:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20260623104407epoutp04aa1455af8b40795c09b0638c7a3b875b~7r957ah2A1574615746epoutp04Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1782211447;
	bh=q425o3ZOVGkqH42YjwrhP9FimssVNj4/5jXO26HkfYk=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=O8bBb+LKaINuOMoKEIDtdhOY6taPAnaffwW3J+TqQLfAhQa1OrP8r/bfAb5d0YDdI
	 fNsamdyXJcOgDzuHCRKZ/LdYg27sooi+EE/RymMzrT1ec/DCurmIL7JSI2sC4eMJSU
	 pJdmoVk9LpYMwgth6dS4C5Cm3nPykEqTKWMu5D1Q=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20260623104407epcas5p2d20f73182001a4cfcc57458ebcc83f5c~7r95jgrCJ2474024740epcas5p2E;
	Tue, 23 Jun 2026 10:44:07 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.87]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4gl1s21nNVz3hhT4; Tue, 23 Jun
	2026 10:44:06 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20260623104405epcas5p302102767e75793af0a9e5ed200f20d37~7r94HmiO30450004500epcas5p3D;
	Tue, 23 Jun 2026 10:44:05 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20260623104404epsmtip1dcc11df089a4d0df0054da0d26a8efe4~7r92q68982855328553epsmtip1n;
	Tue, 23 Jun 2026 10:44:04 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>
Cc: <peter.griffin@linaro.org>, <robh@kernel.org>, <conor+dt@kernel.org>,
	<linusw@kernel.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <hajun.sung@samsung.com>
In-Reply-To: <20260617-favorite-bobcat-of-ecstasy-02f62f@quoll>
Subject: RE: [PATCH v2 2/5] dt-binding: pinctrl: samsung: Add
 exynos8855-pinctrl compatible
Date: Tue, 23 Jun 2026 16:14:02 +0530
Message-ID: <073601dd02fd$366f05d0$a34d1170$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGT6tp2RZIxrt3emHnypoZ6+CNYOwKaRXyAAp5zvu0CT5skxLah4aPQ
Content-Language: en-us
X-CMS-MailID: 20260623104405epcas5p302102767e75793af0a9e5ed200f20d37
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260615083419epcas5p48c6b192d1abcbd5411f0958aa9b83237
References: <20260615085252.1964423-1-alim.akhtar@samsung.com>
	<CGME20260615083419epcas5p48c6b192d1abcbd5411f0958aa9b83237@epcas5p4.samsung.com>
	<20260615085252.1964423-3-alim.akhtar@samsung.com>
	<20260617-favorite-bobcat-of-ecstasy-02f62f@quoll>

Hi Krzysztof

> -----Original Message-----
> From: Krzysztof Kozlowski <krzk=40kernel.org>
> Sent: Wednesday, June 17, 2026 3:50 PM
> To: Alim Akhtar <alim.akhtar=40samsung.com>
> Cc: peter.griffin=40linaro.org; robh=40kernel.org; conor+dt=40kernel.org;
> linusw=40kernel.org; linux-samsung-soc=40vger.kernel.org; linux-
> kernel=40vger.kernel.org; devicetree=40vger.kernel.org; linux-
> gpio=40vger.kernel.org; hajun.sung=40samsung.com
> Subject: Re: =5BPATCH v2 2/5=5D dt-binding: pinctrl: samsung: Add exynos8=
855-
> pinctrl compatible
>=20
> On Mon, Jun 15, 2026 at 02:22:49PM +0530, Alim Akhtar wrote:
> > Document pin controller support on Exynos8855 SoC.
> >
> > Signed-off-by: Alim Akhtar <alim.akhtar=40samsung.com>
> > ---
>=20
> No wakeup-eint?
>=20
Yes, in next version, will update samsung,pinctrl-wakeup-interrupt.yaml wit=
h wakeup-eint entry
Thanks


