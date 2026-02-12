Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0982F0C45
	for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Feb 2026 11:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770896470; cv=none; b=PwKfqqY5gpdJkV8GoNv/02Qoa9ejtNHSNavbvVALFzoBJzo5EE4bQ7xVbqrS9/fxkMnjBDx7Vk04LAwys6qEb8XC9x6L08lqxHFH//1rV5o9A3KirPUD0t0Ef2z9wvUxlsykQlpQrQIssa5G56Y2HK89qCjSCNJwgV0Y/wJDXTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770896470; c=relaxed/simple;
	bh=pHaG8ZjPrp6jHLvr56z4zIuYiiEbe25opbPue/thSpM=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=GrkhbQHR2OcqAxWvw2faEcvoo022Pt1EjyIqX2aIBAZ3+D0LR6P08pIug6iI+8/RDCARlW1iw9ElkBtqG2yWesWTr/TZ+bTVwTIDul4ZygCa46q1hA3cx3NtDJlRdtRDUfBFAmu+5EvKHRZ825jiNDm+WhqCPyIPYyqB3f0bclQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=l7q4JicQ; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="l7q4JicQ"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20260212114106epoutp04f2486e08d0a882d1afa88207ea76d3c1~TfPQhLYbe1199911999epoutp04c
	for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Feb 2026 11:41:06 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20260212114106epoutp04f2486e08d0a882d1afa88207ea76d3c1~TfPQhLYbe1199911999epoutp04c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1770896466;
	bh=Ase9xp9Kc9/jsnZ174Suydxg92duerBwfwT7Vhmzv8A=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=l7q4JicQDyE41yBQC3b7C9oVa2Wxo6EYNZWYbJG4TlrH0etyhkfUnP/cgjTXZAJB8
	 /DiupSopK4+m1GcHqoxMHKqFdl1ARNd38RcSveESJCPzKUK6zhVpAbFGfkRLSeEIZw
	 HvdnfM14k87zcNSWBe5aW8gE0ArwANn2Pn9XtZzY=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20260212114105epcas5p4f65105fa457ae55644df5c7b14c8e102~TfPPMnHZi0123101231epcas5p4V;
	Thu, 12 Feb 2026 11:41:05 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.87]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4fBYKD0NHpz2SSKY; Thu, 12 Feb
	2026 11:41:04 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20260212114103epcas5p1ec7d13f32afcb566a9e262a4b24a1e3a~TfPN0eJmP1615316153epcas5p17;
	Thu, 12 Feb 2026 11:41:03 +0000 (GMT)
Received: from INBRO007194 (unknown [107.122.3.105]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20260212114101epsmtip2f00e578354e624558cb0f6d56fe6b874~TfPMBqs5J1841218412epsmtip2W;
	Thu, 12 Feb 2026 11:41:01 +0000 (GMT)
From: <pritam.sutar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <alim.akhtar@samsung.com>
Cc: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<rosa.pila@samsung.com>, <dev.tailor@samsung.com>, <faraz.ata@samsung.com>,
	<muhammed.ali@samsung.com>, <selvarasu.g@samsung.com>
In-Reply-To: <15e8aac4-6633-49b0-87fb-4b29f62afb2f@kernel.org>
Subject: RE: [PATCH v2 3/3] arm64: dts: exynos: ExynosAutov920: Enable USB
 nodes
Date: Thu, 12 Feb 2026 17:10:59 +0530
Message-ID: <000101dc9c14$774a0190$65de04b0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQEa27yOGkcSyej7W4JCG0x5iKXFKwH8TUbRAqvnhIQBf1ky2gNZK3OcAkJh59y2pFfeMA==
Content-Language: en-us
X-CMS-MailID: 20260212114103epcas5p1ec7d13f32afcb566a9e262a4b24a1e3a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260122125136epcas5p2db0fa3d04671ddc915e60ae8c5bcfb98
References: <20260122130721.205664-1-pritam.sutar@samsung.com>
	<CGME20260122125136epcas5p2db0fa3d04671ddc915e60ae8c5bcfb98@epcas5p2.samsung.com>
	<20260122130721.205664-4-pritam.sutar@samsung.com>
	<6f381f88-3a51-4fc8-844c-41b167b07628@kernel.org>
	<000f01dc8c3e$2b6dcf30$82496d90$@samsung.com>
	<15e8aac4-6633-49b0-87fb-4b29f62afb2f@kernel.org>

Hi Krzysztof,

> -----Original Message-----
> From: Krzysztof Kozlowski <krzk=40kernel.org>
> Sent: Friday, January 23, 2026 1:36 PM
> To: Pritam Manohar Sutar <pritam.sutar=40samsung.com>; robh=40kernel.org;
> krzk+dt=40kernel.org; conor+dt=40kernel.org; alim.akhtar=40samsung.com
> Cc: devicetree=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org;=
 linux-
> samsung-soc=40vger.kernel.org; linux-kernel=40vger.kernel.org;
> rosa.pila=40samsung.com; dev.tailor=40samsung.com;
> faraz.ata=40samsung.com; muhammed.ali=40samsung.com;
> selvarasu.g=40samsung.com
> Subject: Re: =5BPATCH v2 3/3=5D arm64: dts: exynos: ExynosAutov920: Enabl=
e USB
> nodes
>=20
> On 23/01/2026 08:59, Pritam Manohar Sutar wrote:
> > Hi Krzysztof,
> >
> > Thank you for your feedback.
> >
> >> -----Original Message-----
> >> From: Krzysztof Kozlowski <krzk=40kernel.org>
> >> Sent: 22 January 2026 07:05 PM
> >> To: Pritam Manohar Sutar <pritam.sutar=40samsung.com>;
> robh=40kernel.org;
> >> krzk+dt=40kernel.org; conor+dt=40kernel.org; alim.akhtar=40samsung.com
> >> Cc: devicetree=40vger.kernel.org; linux-arm-kernel=40lists.infradead.o=
rg;
> >> linux- samsung-soc=40vger.kernel.org; linux-kernel=40vger.kernel.org;
> >> rosa.pila=40samsung.com; dev.tailor=40samsung.com;
> faraz.ata=40samsung.com;
> >> muhammed.ali=40samsung.com; selvarasu.g=40samsung.com
> >> Subject: Re: =5BPATCH v2 3/3=5D arm64: dts: exynos: ExynosAutov920:
> >> Enable USB nodes
> >>
> >> On 22/01/2026 14:07, Pritam Manohar Sutar wrote:
> >>> Enable USB PHY and DWC3 USB controllers' nodes.
> >>>
> >>> Signed-off-by: Pritam Manohar Sutar <pritam.sutar=40samsung.com>
> >>> ---
> >>>  .../boot/dts/exynos/exynosautov920-sadk.dts   =7C 21
> >> +++++++++++++++++++
> >>>  1 file changed, 21 insertions(+)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
> >>> b/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
> >>> index f90f7704597c..5896dd69334a 100644
> >>> --- a/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
> >>> +++ b/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
> >>> =40=40 -160,15 +160,20 =40=40 &xtcxo =7B
> >>>  &usbdrd31_ssphy =7B
> >>>  	dvdd-supply =3D <&dummy_regulator>;
> >>>  	vdd18-supply =3D <&dummy_regulator>;
> >>> +	status =3D =22okay=22;
> >>
> >> You just added the node in the previous patch, so why it cant be
> >> enavled there?
> >>
> >>>  =7D;
> >>>
> >>>  &usbdrd31_hsphy =7B
> >>>  	dvdd-supply =3D <&dummy_regulator>;
> >>>  	vdd18-supply =3D <&dummy_regulator>;
> >>>  	vdd33-supply =3D <&dummy_regulator>;
> >>> +	status =3D =22okay=22;
> >>>  =7D;
> >>>
> >>>  &usbdrd31_dwc3 =7B
> >>> +	dr_mode =3D =22otg=22;
> >>> +	usb-role-switch;
> >>> +	role-switch-default-mode =3D =22peripheral=22;
> >>
> >> Why did you add incomplete node in previous commit?
> >
> > The commit was added to align with the existing convention of
> > separating node addition and enabling logic in USB configurations.
> > This approach is
>=20
> There was never such convention for Qualcomm or Samsung. Do not make
> up fake conventions.
>=20
> > referenced from commits such as:
>=20
> No, it is not.
>=20
> >
> > https://lore.kernel.org/all/20250710-resends-july-exynos990-dt-v2-5-55
> > 033f73d1b0=40mentallysanemainliners.org/
> > https://lore.kernel.org/all/20240429-usb-dts-gs101-v2-2-7c1797c9db80=40=
l
> > inaro.org/
>=20
> Just look at these commits - they add complete node override to DTS. Not
> half node now and half node later to the DTS file=21
>=20
> >
> > Please let me know if this commit to be merged in previous commit.
>=20
> Just look at the commits there.
>=20

Got it, thank you for the highlighting. Will mention more details in commit
and update single patch to add and enable USB nodes.

> >
>=20
>=20
> Best regards,
> Krzysztof

Thank you,

Regards,
Pritam

