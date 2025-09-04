Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4021A76BB
	for <linux-samsung-soc@vger.kernel.org>; Thu,  4 Sep 2025 10:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756981328; cv=none; b=CtPALaIEl+9O4/DkW0UQSx0Mk/AV6WRqJGYOLiX6O1558prFyFxJFAG7yVu6UHkQ3OwZuRnqbinZozKvqLaoboVvwvmZSTG7MV4glFrmhGtMEKn9tvGWrFQLIf941vF+Jk9hBbPe32iUxGwh6WcWJAPfn1pWBJ8yIMrFEBiCKBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756981328; c=relaxed/simple;
	bh=8tFDp5B828+ijVc2o8d07iFvW8uCL7mdBZj+JaNrshM=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=RKQzxgQ0ruHg2Z88DsAreTTKTqZTHFWIdjkWqdW3UO5NHKurILDVZ0lxC8ireD75gaCpD9FnMinMQvkNfGkQeDMIK84EuOOJTWcliLWPmkf0NK267H9mp0az6GBtiBDsz7KSkv3r1ijC2UskzS+XOdMpS+7GhYwTafhKIGHnvZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=dtC4k+RO; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="dtC4k+RO"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250904102204epoutp049bb0494140ff19284b9955d7abe512a1~iDTSnxES72796327963epoutp04-
	for <linux-samsung-soc@vger.kernel.org>; Thu,  4 Sep 2025 10:22:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250904102204epoutp049bb0494140ff19284b9955d7abe512a1~iDTSnxES72796327963epoutp04-
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756981324;
	bh=iSP1hOZ0AsVWU04bWbtB20mHDgaN9TSqIhbjaBRHRyQ=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=dtC4k+ROPg66f9lY1NsNI0wkpkKWkj1gTW5yRJduCxfBnOEsKH4wmdjUM/PyQn0SO
	 vEUC1TELplS2e5ut9rgeOU523Cht2Yp5bREFpQXb0+FMVgIWIPVjLC75CGrg0FBDCw
	 31FxD3UbtbGr3e9BLqrEgmgvP3KJ4K+ypQOG8iB4=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250904102203epcas5p2b0df51eeea6ec050252650f41b15b480~iDTR7ag6b1396913969epcas5p2r;
	Thu,  4 Sep 2025 10:22:03 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.93]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4cHbBL4fQ3z6B9m4; Thu,  4 Sep
	2025 10:22:02 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250904102201epcas5p2b0faaa8e8b9f42d99b4cfe51b76ad30b~iDTQVvWuh0469504695epcas5p2e;
	Thu,  4 Sep 2025 10:22:01 +0000 (GMT)
Received: from INBRO001840 (unknown [107.122.3.105]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250904102158epsmtip1ead7e955e4664fff710c39fa1f568ca0~iDTNWxioq1828118281epsmtip1H;
	Thu,  4 Sep 2025 10:21:58 +0000 (GMT)
From: "Pritam Manohar Sutar" <pritam.sutar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>
Cc: <vkoul@kernel.org>, <kishon@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <alim.akhtar@samsung.com>,
	<andre.draszik@linaro.org>, <peter.griffin@linaro.org>,
	<kauschluss@disroot.org>, <ivo.ivanov.ivanov1@gmail.com>,
	<igor.belwon@mentallysanemainliners.org>, <m.szyprowski@samsung.com>,
	<s.nawrocki@samsung.com>, <linux-phy@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<rosa.pila@samsung.com>, <dev.tailor@samsung.com>, <faraz.ata@samsung.com>,
	<muhammed.ali@samsung.com>, <selvarasu.g@samsung.com>
In-Reply-To: <87857202-b436-4476-9384-67566126d844@kernel.org>
Subject: RE: [PATCH v8 1/6] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 HS phy compatible
Date: Thu, 4 Sep 2025 15:51:57 +0530
Message-ID: <001001dc1d85$c0d56a60$42803f20$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIRMOVGdWg5oRjNsRBgEjzIeIB8IgGabj6EAmTXuDcB8lF0oAGjtHpaA19Hw4WzwQPd4A==
Content-Language: en-in
X-CMS-MailID: 20250904102201epcas5p2b0faaa8e8b9f42d99b4cfe51b76ad30b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250903072936epcas5p4a28d0e63c7f0792b516b0cbc68bf3a8e
References: <20250903073827.3015662-1-pritam.sutar@samsung.com>
	<CGME20250903072936epcas5p4a28d0e63c7f0792b516b0cbc68bf3a8e@epcas5p4.samsung.com>
	<20250903073827.3015662-2-pritam.sutar@samsung.com>
	<20250904-interesting-lovely-ringtail-38bbef@kuoka>
	<000001dc1d70$aebf7d80$0c3e7880$@samsung.com>
	<87857202-b436-4476-9384-67566126d844@kernel.org>

Hi Krzysztof,

> -----Original Message-----
> From: Krzysztof Kozlowski <krzk=40kernel.org>
> Sent: 04 September 2025 03:12 PM
> To: Pritam Manohar Sutar <pritam.sutar=40samsung.com>
> Cc: vkoul=40kernel.org; kishon=40kernel.org; robh=40kernel.org;
> krzk+dt=40kernel.org; conor+dt=40kernel.org; alim.akhtar=40samsung.com;
> andre.draszik=40linaro.org; peter.griffin=40linaro.org; kauschluss=40disr=
oot.org;
> ivo.ivanov.ivanov1=40gmail.com; igor.belwon=40mentallysanemainliners.org;
> m.szyprowski=40samsung.com; s.nawrocki=40samsung.com; linux-
> phy=40lists.infradead.org; devicetree=40vger.kernel.org; linux-
> kernel=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org; linux-s=
amsung-
> soc=40vger.kernel.org; rosa.pila=40samsung.com; dev.tailor=40samsung.com;
> faraz.ata=40samsung.com; muhammed.ali=40samsung.com;
> selvarasu.g=40samsung.com
> Subject: Re: =5BPATCH v8 1/6=5D dt-bindings: phy: samsung,usb3-drd-phy: a=
dd
> ExynosAutov920 HS phy compatible
>=20
> On 04/09/2025 09:51, Pritam Manohar Sutar wrote:
> > Hi Krzysztof,
> >
> >> -----Original Message-----
> >> From: Krzysztof Kozlowski <krzk=40kernel.org>
> >> Sent: 04 September 2025 12:18 PM
> >> To: Pritam Manohar Sutar <pritam.sutar=40samsung.com>
> >> Cc: vkoul=40kernel.org; kishon=40kernel.org; robh=40kernel.org;
> >> krzk+dt=40kernel.org; conor+dt=40kernel.org; alim.akhtar=40samsung.com=
;
> >> andre.draszik=40linaro.org; peter.griffin=40linaro.org;
> >> kauschluss=40disroot.org; ivo.ivanov.ivanov1=40gmail.com;
> >> igor.belwon=40mentallysanemainliners.org;
> >> m.szyprowski=40samsung.com; s.nawrocki=40samsung.com; linux-
> >> phy=40lists.infradead.org; devicetree=40vger.kernel.org; linux-
> >> kernel=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org;
> >> linux-samsung- soc=40vger.kernel.org; rosa.pila=40samsung.com;
> >> dev.tailor=40samsung.com; faraz.ata=40samsung.com;
> >> muhammed.ali=40samsung.com; selvarasu.g=40samsung.com
> >> Subject: Re: =5BPATCH v8 1/6=5D dt-bindings: phy: samsung,usb3-drd-phy=
:
> >> add
> >> ExynosAutov920 HS phy compatible
> >>
> >> On Wed, Sep 03, 2025 at 01:08:22PM +0530, Pritam Manohar Sutar wrote:
> >>> Document support for the USB20 phy found on the ExynosAutov920 SoC.
> >>> The
> >>> USB20 phy is functionally identical to that on the Exynos850 SoC, so
> >>> no driver changes are needed to support this phy. However, add a
> >>> dedicated compatible string for USB20 phy found in this SoC.
> >>>
> >>> Signed-off-by: Pritam Manohar Sutar <pritam.sutar=40samsung.com>
> >>
> >> You just dropped all tags without explaining why.
> >
> > Regretted inconvenience.
> >
> > There were significant changes in supplies' names in driver and
> > schemas (patch-set v8). This led to make changes in patch no 5.  And
> > review for these changes is needed.  Hence, removed RB tag in this patc=
h-set.
> >
> > There was a ask for the same https://lore.kernel.org/linux-
> phy/000401dc18cd=24ec02a1b0=24c407e510=24=40samsung.com/=23:=7E:text=3DLe=
t%20me%
> 20know%2C%20because%20of%20above%20changes%2C%20should%20be%20
> removing%20your%20%0A%27reviewed%2Dby%27%20tag%20from%20patch%
> 201%20and%203.
> >
>=20
>=20
> Where in the changelog you explained why you dropped the tags?

Along with supplies' names, there were similar commit messages=20
for patch no 1, 3 as patch no 5 (v7). (though, they were explaining=20
schema more than h/w). Changed commit messages of the=20
patch no 1, 3, 5 (v7) as per reference commits and would like=20
to get them reviewed again, so did not add RB for patch 1 and 3,
which you had given RB (in v7).=20

Forgot to add these details for dropping the RB tags in changelog.=20
Do I need to send v9 by retaining RB for patch 1 and 3?

>=20
> Best regards,
> Krzysztof


Thank you.

Regards,
Pritam

