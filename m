Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3C2288539
	for <linux-samsung-soc@vger.kernel.org>; Wed,  9 Jul 2025 10:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752055259; cv=none; b=P8Y0Fkk37VNhg1M8xy0ifFtKzdcvrGvj+BhOJ/sfR8mNXLGZBBx++6DaEbdwVQE6P7agtTSUiIG0CBHG4ajeFZYk5K9/SCleJvUlE9dx81OXTm2N+cM2krq9amPpVpqkE+BhHwvYkQXcMu48R9A2Oia27d39xnh6QqKwcxQVKzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752055259; c=relaxed/simple;
	bh=cimesBusUUV91WuSukFwoB37riuMSdtT5ntRgk2rp3U=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=jBfmktDnaj0Fxd3zNGLbhce55JT8yzzhbt4zNhj0jHYtqCw5iDcLpwDU90J3oj5ylWFt8Q3Kzgb7R+YLCCu6Mfv8GedpJkhmAoMQlDaxZnefZF8LIb2Op/HqGfccfzkQzZJUJs1YlPqyFWrAIMdjYPSQSXHNnw4a18fMZdqs3+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=dSN2X7Wc; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="dSN2X7Wc"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250709100056epoutp02c3b731b8c6b6d81664634e3e6854ae07~QjPkJd_RT1166311663epoutp02e
	for <linux-samsung-soc@vger.kernel.org>; Wed,  9 Jul 2025 10:00:56 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250709100056epoutp02c3b731b8c6b6d81664634e3e6854ae07~QjPkJd_RT1166311663epoutp02e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1752055256;
	bh=cimesBusUUV91WuSukFwoB37riuMSdtT5ntRgk2rp3U=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=dSN2X7WclO21MRD+00fqzdIAQPqNkJqga/ywHIIPNAMFno11BpKrnoXp36kv2NYYz
	 a3tOUk3tT59L5FmIeT3FGktatot/mLzC3+UiRuOAOzWmHHOFOGzaKt/YO9mWcz9Efw
	 vI4OPWf7/Jg4PxLi//yPzDdrcyUerCIXZMztNFdk=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250709100055epcas5p278a3a0658d2407780cbf48dc11bb00de~QjPjdukHC2819328193epcas5p2U;
	Wed,  9 Jul 2025 10:00:55 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.181]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4bcYQF3P8Qz6B9m5; Wed,  9 Jul
	2025 10:00:53 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250709085353epcas5p3e1e989544692330277c3096f40df8369~QiVBscay_1273512735epcas5p3n;
	Wed,  9 Jul 2025 08:53:53 +0000 (GMT)
Received: from INBRO001840 (unknown [107.122.3.105]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250709085350epsmtip25f40e8338ed740108c76c2bec86ac6d7~QiU_rvWW-2672826728epsmtip2M;
	Wed,  9 Jul 2025 08:53:50 +0000 (GMT)
From: "Pritam Manohar Sutar" <pritam.sutar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>
Cc: <vkoul@kernel.org>, <kishon@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <alim.akhtar@samsung.com>,
	<andre.draszik@linaro.org>, <peter.griffin@linaro.org>,
	<neil.armstrong@linaro.org>, <kauschluss@disroot.org>,
	<ivo.ivanov.ivanov1@gmail.com>, <m.szyprowski@samsung.com>,
	<s.nawrocki@samsung.com>, <linux-phy@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<rosa.pila@samsung.com>, <dev.tailor@samsung.com>, <faraz.ata@samsung.com>,
	<muhammed.ali@samsung.com>, <selvarasu.g@samsung.com>
In-Reply-To: <20250706-diamond-crab-of-will-72205e@krzk-bin>
Subject: RE: [PATCH v4 5/6] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 combo SS phy
Date: Wed, 9 Jul 2025 14:23:49 +0530
Message-ID: <07d501dbf0ae$ff2126a0$fd6373e0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJAgQZ9LFXBZrDskwNBYris6jFv1AJ630FZAevjVggA58dhDrM15xjg
Content-Language: en-in
X-CMS-MailID: 20250709085353epcas5p3e1e989544692330277c3096f40df8369
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250701120009epcas5p46bc2870446c499f9c0008c1d396650bb
References: <20250701120706.2219355-1-pritam.sutar@samsung.com>
	<CGME20250701120009epcas5p46bc2870446c499f9c0008c1d396650bb@epcas5p4.samsung.com>
	<20250701120706.2219355-6-pritam.sutar@samsung.com>
	<20250706-diamond-crab-of-will-72205e@krzk-bin>

Hi Krzysztof,

> -----Original Message-----
> From: Krzysztof Kozlowski <krzk=40kernel.org>
> Sent: 06 July 2025 03:14 PM
> To: Pritam Manohar Sutar <pritam.sutar=40samsung.com>
> Cc: vkoul=40kernel.org; kishon=40kernel.org; robh=40kernel.org;
> krzk+dt=40kernel.org; conor+dt=40kernel.org; alim.akhtar=40samsung.com;
> andre.draszik=40linaro.org; peter.griffin=40linaro.org; neil.armstrong=40=
linaro.org;
> kauschluss=40disroot.org; ivo.ivanov.ivanov1=40gmail.com;
> m.szyprowski=40samsung.com; s.nawrocki=40samsung.com; linux-
> phy=40lists.infradead.org; devicetree=40vger.kernel.org; linux-
> kernel=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org; linux-s=
amsung-
> soc=40vger.kernel.org; rosa.pila=40samsung.com; dev.tailor=40samsung.com;
> faraz.ata=40samsung.com; muhammed.ali=40samsung.com;
> selvarasu.g=40samsung.com
> Subject: Re: =5BPATCH v4 5/6=5D dt-bindings: phy: samsung,usb3-drd-phy: a=
dd
> ExynosAutov920 combo SS phy
>=20
> On Tue, Jul 01, 2025 at 05:37:05PM +0530, Pritam Manohar Sutar wrote:
> > This phy supports USB3.1 SSP+(10Gbps) protocol and is backwards
>=20
> Agian, this?
>=20
> > compatible to the USB3.0 SS(5Gbps). 'Add-on USB2.0' phy is required to
> > support USB2.0 HS(480Mbps), FS(12Mbps) and LS(1.5Mbps) data rates.
> > These two phys are combined to form a combo phy.
> >
> > Add a dedicated compatible string for USB combo SS phy found in this
> > SoC. The SoC requires two clocks, named =22phy=22 and =22ref=22 and var=
ious
> > power supplies (regulators) for the internal circuitry to work.
> > The required voltages are:
> > * avdd075_usb - 0.75v
> > * avdd18_usb20 - 1.8v
> > * avdd33_usb20 - 3.3v
>=20
> One more commitm message completely copy-pasted and completely
> uninforming. The voltages are irrelevant. Explain the architecture. This =
should be
> just one patch with proper full description.
>=20
> >
> > Add schema only for 'USB3.1 SSP+' SS phy in this commit.
>=20
> Why only? Add everything, describe everything, but not what voltages you =
have
> there but the architecture of the PHY.
>=20

Will combine patch 3 (combo HS phy) & 5(combo SS phy) to describe combo phy=
 and even will add some details as mentioned in cover letter.

> Best regards,
> Krzysztof


