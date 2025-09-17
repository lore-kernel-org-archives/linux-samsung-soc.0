Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF6512BE050
	for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Sep 2025 07:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758092869; cv=none; b=ssf7xmEJY62tf1d1R5JCL6L/2yzRPcZiXqE3aTif/BsppiDSu+INKqTtvz7RPWMOGJBbo2p7wd+v4KPEV/FEW1qDsEFiPI193/j4yJY/WxtzWdrap+pC9S+dInoTadMp2XTA1ZiqnmfCTXxslB0Rwls4n51/X/GhtqGw4pSz+kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758092869; c=relaxed/simple;
	bh=25mYkkbNo5dkgGxMHrf97VRhuH0HcwY5SglFwuDCXdo=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=XFarR4bjhrGutAj51zPaV9kSaJ1LvEimr8nrZQbrAgY2P995ETKaAYoYPbKGTj/fUjO1uZfXjSuqjrdoHW6dm2TXtSFzI2xEyl5xobvA6svdVpdklTz7qiEice8zCkvUef/sAtXaTJbzf9EgHgEcg9NlacnNwbYxMbWGiwsa4BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=RGWtcuUa; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="RGWtcuUa"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250917070744epoutp02c4506776b2f9c215e2fc4b5ecfa56490~mACVPTK5i0691406914epoutp02E
	for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Sep 2025 07:07:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250917070744epoutp02c4506776b2f9c215e2fc4b5ecfa56490~mACVPTK5i0691406914epoutp02E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1758092864;
	bh=p2X+j5SJAMEREJd1w3t8TYTfU2tuNXV8TS1mq8smvaI=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=RGWtcuUaLhY8WQoRtyFOqx/FJvfhMKjDYYPiIGcIN/rh/LOZiSE0ImM6Uz7pCYiSz
	 7pwIjapvnQQrI1V11HFsyxt9lvlqFOgaXCJ6smnF/lygHilO0iyzaHcz3LyHrJEhPM
	 ebnabodwTvetz6i9shXEWIpf0hNPG2O0ofuHlw/k=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250917070743epcas5p21e3006ddc5adb45dae44c3ad85d064da~mACT3guNG0339903399epcas5p2Y;
	Wed, 17 Sep 2025 07:07:43 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.92]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4cRVG61MTyz6B9m7; Wed, 17 Sep
	2025 07:07:42 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250917070741epcas5p3f40ff9cf54757eef08a6faa7451f4e2b~mACSKitQP0859608596epcas5p3-;
	Wed, 17 Sep 2025 07:07:41 +0000 (GMT)
Received: from INBRO001840 (unknown [107.122.3.105]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250917070737epsmtip204cd5a53ee83aea2bc9f33c333939bdd~mACOpKYWk2897628976epsmtip24;
	Wed, 17 Sep 2025 07:07:37 +0000 (GMT)
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
In-Reply-To: 
Subject: RE: [PATCH v8 1/6] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 HS phy compatible
Date: Wed, 17 Sep 2025 12:37:36 +0530
Message-ID: <054e01dc27a1$c2011120$46033360$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIRMOVGdWg5oRjNsRBgEjzIeIB8IgGabj6EAmTXuDcB8lF0oAGjtHpaA19Hw4WzwQPd4IAUON4A
Content-Language: en-in
X-CMS-MailID: 20250917070741epcas5p3f40ff9cf54757eef08a6faa7451f4e2b
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
> From: Pritam Manohar Sutar <pritam.sutar=40samsung.com>
> Sent: 04 September 2025 03:52 PM
> To: 'Krzysztof Kozlowski' <krzk=40kernel.org>
> Cc: 'vkoul=40kernel.org' <vkoul=40kernel.org>; 'kishon=40kernel.org'
> <kishon=40kernel.org>; 'robh=40kernel.org' <robh=40kernel.org>;
> 'krzk+dt=40kernel.org' <krzk+dt=40kernel.org>; 'conor+dt=40kernel.org'
> <conor+dt=40kernel.org>; 'alim.akhtar=40samsung.com'
> <alim.akhtar=40samsung.com>; 'andre.draszik=40linaro.org'
> <andre.draszik=40linaro.org>; 'peter.griffin=40linaro.org'
> <peter.griffin=40linaro.org>; 'kauschluss=40disroot.org' <kauschluss=40di=
sroot.org>;
> 'ivo.ivanov.ivanov1=40gmail.com' <ivo.ivanov.ivanov1=40gmail.com>;
> 'igor.belwon=40mentallysanemainliners.org'
> <igor.belwon=40mentallysanemainliners.org>; 'm.szyprowski=40samsung.com'
> <m.szyprowski=40samsung.com>; 's.nawrocki=40samsung.com'
> <s.nawrocki=40samsung.com>; 'linux-phy=40lists.infradead.org' <linux-
> phy=40lists.infradead.org>; 'devicetree=40vger.kernel.org'
> <devicetree=40vger.kernel.org>; 'linux-kernel=40vger.kernel.org' <linux-
> kernel=40vger.kernel.org>; 'linux-arm-kernel=40lists.infradead.org' <linu=
x-arm-
> kernel=40lists.infradead.org>; 'linux-samsung-soc=40vger.kernel.org' <lin=
ux-
> samsung-soc=40vger.kernel.org>; 'rosa.pila=40samsung.com'
> <rosa.pila=40samsung.com>; 'dev.tailor=40samsung.com'
> <dev.tailor=40samsung.com>; 'faraz.ata=40samsung.com'
> <faraz.ata=40samsung.com>; 'muhammed.ali=40samsung.com'
> <muhammed.ali=40samsung.com>; 'selvarasu.g=40samsung.com'
> <selvarasu.g=40samsung.com>
> Subject: RE: =5BPATCH v8 1/6=5D dt-bindings: phy: samsung,usb3-drd-phy: a=
dd
> ExynosAutov920 HS phy compatible
>=20
> Hi Krzysztof,
>=20
> > -----Original Message-----
> > From: Krzysztof Kozlowski <krzk=40kernel.org>
> > Sent: 04 September 2025 03:12 PM
> > To: Pritam Manohar Sutar <pritam.sutar=40samsung.com>
> > Cc: vkoul=40kernel.org; kishon=40kernel.org; robh=40kernel.org;
> > krzk+dt=40kernel.org; conor+dt=40kernel.org; alim.akhtar=40samsung.com;
> > andre.draszik=40linaro.org; peter.griffin=40linaro.org;
> > kauschluss=40disroot.org; ivo.ivanov.ivanov1=40gmail.com;
> > igor.belwon=40mentallysanemainliners.org;
> > m.szyprowski=40samsung.com; s.nawrocki=40samsung.com; linux-
> > phy=40lists.infradead.org; devicetree=40vger.kernel.org; linux-
> > kernel=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org;
> > linux-samsung- soc=40vger.kernel.org; rosa.pila=40samsung.com;
> > dev.tailor=40samsung.com; faraz.ata=40samsung.com;
> > muhammed.ali=40samsung.com; selvarasu.g=40samsung.com
> > Subject: Re: =5BPATCH v8 1/6=5D dt-bindings: phy: samsung,usb3-drd-phy:
> > add
> > ExynosAutov920 HS phy compatible
> >
> > On 04/09/2025 09:51, Pritam Manohar Sutar wrote:
> > > Hi Krzysztof,
> > >
> > >> -----Original Message-----
> > >> From: Krzysztof Kozlowski <krzk=40kernel.org>
> > >> Sent: 04 September 2025 12:18 PM
> > >> To: Pritam Manohar Sutar <pritam.sutar=40samsung.com>
> > >> Cc: vkoul=40kernel.org; kishon=40kernel.org; robh=40kernel.org;
> > >> krzk+dt=40kernel.org; conor+dt=40kernel.org; alim.akhtar=40samsung.c=
om;
> > >> andre.draszik=40linaro.org; peter.griffin=40linaro.org;
> > >> kauschluss=40disroot.org; ivo.ivanov.ivanov1=40gmail.com;
> > >> igor.belwon=40mentallysanemainliners.org;
> > >> m.szyprowski=40samsung.com; s.nawrocki=40samsung.com; linux-
> > >> phy=40lists.infradead.org; devicetree=40vger.kernel.org; linux-
> > >> kernel=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org;
> > >> linux-samsung- soc=40vger.kernel.org; rosa.pila=40samsung.com;
> > >> dev.tailor=40samsung.com; faraz.ata=40samsung.com;
> > >> muhammed.ali=40samsung.com; selvarasu.g=40samsung.com
> > >> Subject: Re: =5BPATCH v8 1/6=5D dt-bindings: phy: samsung,usb3-drd-p=
hy:
> > >> add
> > >> ExynosAutov920 HS phy compatible
> > >>
> > >> On Wed, Sep 03, 2025 at 01:08:22PM +0530, Pritam Manohar Sutar wrote=
:
> > >>> Document support for the USB20 phy found on the ExynosAutov920 SoC.
> > >>> The
> > >>> USB20 phy is functionally identical to that on the Exynos850 SoC,
> > >>> so no driver changes are needed to support this phy. However, add
> > >>> a dedicated compatible string for USB20 phy found in this SoC.
> > >>>
> > >>> Signed-off-by: Pritam Manohar Sutar <pritam.sutar=40samsung.com>
> > >>
> > >> You just dropped all tags without explaining why.
> > >
> > > Regretted inconvenience.
> > >
> > > There were significant changes in supplies' names in driver and
> > > schemas (patch-set v8). This led to make changes in patch no 5.  And
> > > review for these changes is needed.  Hence, removed RB tag in this pa=
tch-
> set.
> > >
> > > There was a ask for the same https://lore.kernel.org/linux-
> >
> phy/000401dc18cd=24ec02a1b0=24c407e510=24=40samsung.com/=23:=7E:text=3DLe=
t%20me%
> >
> 20know%2C%20because%20of%20above%20changes%2C%20should%20be%20
> >
> removing%20your%20%0A%27reviewed%2Dby%27%20tag%20from%20patch%
> > 201%20and%203.
> > >
> >
> >
> > Where in the changelog you explained why you dropped the tags?
>=20
> Along with supplies' names, there were similar commit messages for patch =
no 1,
> 3 as patch no 5 (v7). (though, they were explaining schema more than h/w)=
.
> Changed commit messages of the patch no 1, 3, 5 (v7) as per reference com=
mits
> and would like to get them reviewed again, so did not add RB for patch 1 =
and 3,
> which you had given RB (in v7).
>=20
> Forgot to add these details for dropping the RB tags in changelog.
> Do I need to send v9 by retaining RB for patch 1 and 3?
>=20

Gentle Reminder.=20

> >
> > Best regards,
> > Krzysztof
>=20
>=20
> Thank you.
>=20
> Regards,
> Pritam

Thank you,

Regards,
Pritam

