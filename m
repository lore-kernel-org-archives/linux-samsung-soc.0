Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591DA2ECE86
	for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Feb 2026 11:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770896581; cv=none; b=gTw4UZ3q6WqwSAOP2qQKUysqqHduV1MAe4+N2mpsY7fBzh19T4gw6ekMnHndvxMxFaaGuLrjBPBAlGRlXtpC9x2tTPlYWLS8VqBKQHc/cJdQbzlq9O8ElAjD7gq4xYHBImL4lDUWEeNzeyDRsualYyVniIqWF3a7UEFKj5+DR90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770896581; c=relaxed/simple;
	bh=NChHVj/nD9Et9r1OQoP/njxF74Dg7jFDqepF8EuTtno=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=gWgWlTj5UpNu/EF+5TgFRQUNCD4zgukHmZKuytxbVLNg7wICHxQdcVwiFthwtwkunfFSZ6HwD5jOBU6kAjsuZSKCj//FDtjJnnWOag3XRUJ6D2AGhg/ZAzzXpMZQk+0PGAKCo4X2eSav6DvOq10F+7qMKzYjivBhPeOT9TbNkrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=V01GzbvO; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="V01GzbvO"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20260212114256epoutp02c348155afd5f21bc8de1566cc5266a4d~TfQ2xvdt00104401044epoutp02T
	for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Feb 2026 11:42:56 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20260212114256epoutp02c348155afd5f21bc8de1566cc5266a4d~TfQ2xvdt00104401044epoutp02T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1770896576;
	bh=wZFfPGxPusxBbKHt4baLlsQ9Gc0sz+hk6vgWNb44Ies=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=V01GzbvO6RXPWeFELqZ4TgxQ2BkCMKmDhQtUzVeDPu1ZNnFrTErZ4XwpSAdmRIChw
	 Nr1ZHTOZpf8lMbenCpHe2xD6zObpRm5ln8L8hegjbnt8xeOO9Lpn3/RVbNb0y3Z/Ta
	 v9wIsuRbeIqxElwI9811HND+cjMcYlQQl8C9L/IU=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20260212114255epcas5p3dd248c72347f12241748104d76a5dbb5~TfQ2UcD8p3128431284epcas5p39;
	Thu, 12 Feb 2026 11:42:55 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.95]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4fBYML5zPnz2SSKd; Thu, 12 Feb
	2026 11:42:54 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20260212114254epcas5p1be7875dbd00568aaa8fdd04e09393b08~TfQ1CnGqP1171011710epcas5p1Z;
	Thu, 12 Feb 2026 11:42:54 +0000 (GMT)
Received: from INBRO007194 (unknown [107.122.3.105]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20260212114252epsmtip10d8f76a2a65e756f0876745b57923b5a~TfQzLNkY_1223812238epsmtip1X;
	Thu, 12 Feb 2026 11:42:52 +0000 (GMT)
From: <pritam.sutar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <alim.akhtar@samsung.com>
Cc: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<rosa.pila@samsung.com>, <dev.tailor@samsung.com>, <faraz.ata@samsung.com>,
	<muhammed.ali@samsung.com>, <selvarasu.g@samsung.com>
In-Reply-To: <91adfc3d-1612-4bc8-8f4e-525141fd9e67@kernel.org>
Subject: RE: [PATCH v2 3/3] arm64: dts: exynos: ExynosAutov920: Enable USB
 nodes
Date: Thu, 12 Feb 2026 17:12:50 +0530
Message-ID: <000201dc9c14$b9502ab0$2bf08010$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQEa27yOGkcSyej7W4JCG0x5iKXFKwH8TUbRAqvnhIQBf1ky2gNZK3OcAfIgwmS2ptrFIA==
Content-Language: en-us
X-CMS-MailID: 20260212114254epcas5p1be7875dbd00568aaa8fdd04e09393b08
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
	<91adfc3d-1612-4bc8-8f4e-525141fd9e67@kernel.org>

Hi Krzysztof,

> -----Original Message-----
> From: Krzysztof Kozlowski <krzk=40kernel.org>
> Sent: Wednesday, January 28, 2026 1:07 PM
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
> > This approach is referenced from commits such as:
> >
> > https://lore.kernel.org/all/20250710-resends-july-exynos990-dt-v2-5-55
> > 033f73d1b0=40mentallysanemainliners.org/
> > https://lore.kernel.org/all/20240429-usb-dts-gs101-v2-2-7c1797c9db80=40=
l
> > inaro.org/
> >
> > Please let me know if this commit to be merged in previous commit.
>=20
>=20
> BTW, don't ever use AI to write code or code justifications. I will make =
note
> of it.
>=20

Sorry for the misunderstanding. Will consider this in future.=20
However, AI was used to correct spell and grammatic mistakes.

> Best regards,
> Krzysztof

Thank you,

Regards,
Pritam

