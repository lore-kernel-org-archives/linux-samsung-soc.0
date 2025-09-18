Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B887930F532
	for <linux-samsung-soc@vger.kernel.org>; Thu, 18 Sep 2025 11:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758196524; cv=none; b=RGawn5DGoGPpKiWP0iGk0rXwzQOciNtfCRgULCAGrlv3gwh17sEXs/ZIh9OQHEqNy8+vqa89KhkkbmM5PchmMcNr6QnqhLj0vTvDsYr8rQhlyj/Jvv8QP9Tf6uEtSiFgwWMbhr56ex52umnjeZoW6w2QVPPkziWDndsiwti/bHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758196524; c=relaxed/simple;
	bh=7PRljzrL2AbNH8/oUYDBAYQlfyYcBzsbqqyUVlNoLhY=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=DjHewQ7dR51yYi0YV9ZQt9MznS4FMBnr80NTZ+kwLWfPe6x7NoMziLR5fScZQp1DZ8f+5ahp2lqr3TkQov1i69dVgdPVfuvcCrXBsnhemDEHXQvHDftmb5ilstFxTPdhlbC6Cm9NVYj0Opq3V5Y6+D6kWL0SW1IUJJjEBht/ipA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=S03ItJ3I; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="S03ItJ3I"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250918115518epoutp044c0dc3b0a3956fb2a74b48ba11c73d55~mXmsaMh8v0994309943epoutp04M
	for <linux-samsung-soc@vger.kernel.org>; Thu, 18 Sep 2025 11:55:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250918115518epoutp044c0dc3b0a3956fb2a74b48ba11c73d55~mXmsaMh8v0994309943epoutp04M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1758196518;
	bh=DN/3t4hL6cT5/e9+GaAketYE06VkieyzpyBena7YBAU=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=S03ItJ3IQdQQwzdY9s7ASFakivQ36sIUWXwLO61w8ftRsN53Tb2NXDysnHj+lNj8J
	 FWT2Q/YHjpqwMVS6gWSFjHJL6VFmuy/LWOi3HZQTEzz3ZvPuzdobYeajaewrFVsycQ
	 AWrqjgDRZ7QVjAYQm7x54iHahcVH9gbU7xDXqUfw=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250918115517epcas5p3c7dd05a1fae6fff0ce95db44751deea8~mXmrZwiaW3121231212epcas5p3M;
	Thu, 18 Sep 2025 11:55:17 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.88]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4cSDbS4F1Hz2SSKb; Thu, 18 Sep
	2025 11:55:16 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250918115516epcas5p14397d311bb7c6c1f2c0a60109d298bb7~mXmqAPTm12886628866epcas5p1E;
	Thu, 18 Sep 2025 11:55:16 +0000 (GMT)
Received: from INBRO001840 (unknown [107.122.3.105]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250918115511epsmtip15cafde6c107dd91d89f11e8293e860e4~mXmmGGj6Y0665806658epsmtip1c;
	Thu, 18 Sep 2025 11:55:11 +0000 (GMT)
From: "Pritam Manohar Sutar" <pritam.sutar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, <vkoul@kernel.org>,
	<kishon@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <alim.akhtar@samsung.com>,
	<andre.draszik@linaro.org>, <peter.griffin@linaro.org>,
	<kauschluss@disroot.org>, <ivo.ivanov.ivanov1@gmail.com>,
	<igor.belwon@mentallysanemainliners.org>, <m.szyprowski@samsung.com>,
	<s.nawrocki@samsung.com>
Cc: <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <rosa.pila@samsung.com>,
	<dev.tailor@samsung.com>, <faraz.ata@samsung.com>,
	<muhammed.ali@samsung.com>, <selvarasu.g@samsung.com>
In-Reply-To: <0df74c2b-31b9-4f29-97d3-b778c8e3eaf1@kernel.org>
Subject: RE: [PATCH v8 1/6] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 HS phy compatible
Date: Thu, 18 Sep 2025 17:25:10 +0530
Message-ID: <007801dc2893$18ed4a20$4ac7de60$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIRMOVGdWg5oRjNsRBgEjzIeIB8IgGabj6EAmTXuDcA7fJUJrQHWRvw
Content-Language: en-in
X-CMS-MailID: 20250918115516epcas5p14397d311bb7c6c1f2c0a60109d298bb7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250903072936epcas5p4a28d0e63c7f0792b516b0cbc68bf3a8e
References: <20250903073827.3015662-1-pritam.sutar@samsung.com>
	<CGME20250903072936epcas5p4a28d0e63c7f0792b516b0cbc68bf3a8e@epcas5p4.samsung.com>
	<20250903073827.3015662-2-pritam.sutar@samsung.com>
	<0df74c2b-31b9-4f29-97d3-b778c8e3eaf1@kernel.org>

Hi Krzysztof,

> -----Original Message-----
> From: Krzysztof Kozlowski <krzk=40kernel.org>
> Sent: 18 September 2025 08:15 AM
> To: Pritam Manohar Sutar <pritam.sutar=40samsung.com>; vkoul=40kernel.org=
;
> kishon=40kernel.org; robh=40kernel.org; krzk+dt=40kernel.org;
> conor+dt=40kernel.org; alim.akhtar=40samsung.com; andre.draszik=40linaro.=
org;
> peter.griffin=40linaro.org; kauschluss=40disroot.org;
> ivo.ivanov.ivanov1=40gmail.com; igor.belwon=40mentallysanemainliners.org;
> m.szyprowski=40samsung.com; s.nawrocki=40samsung.com
> Cc: linux-phy=40lists.infradead.org; devicetree=40vger.kernel.org; linux-
> kernel=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org; linux-s=
amsung-
> soc=40vger.kernel.org; rosa.pila=40samsung.com; dev.tailor=40samsung.com;
> faraz.ata=40samsung.com; muhammed.ali=40samsung.com;
> selvarasu.g=40samsung.com
> Subject: Re: =5BPATCH v8 1/6=5D dt-bindings: phy: samsung,usb3-drd-phy: a=
dd
> ExynosAutov920 HS phy compatible
>=20
> On 03/09/2025 16:38, Pritam Manohar Sutar wrote:
> > diff --git a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-
> phy.yaml b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-
> phy.yaml
> > index e906403208c0..8d8114eb5660 100644
> > --- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
> > +++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
> > =40=40 -34,6 +34,7 =40=40 properties:
> >        - samsung,exynos7870-usbdrd-phy
> >        - samsung,exynos850-usbdrd-phy
> >        - samsung,exynos990-usbdrd-phy
> > +      - samsung,exynosautov920-usbdrd-phy
> >
> >    clocks:
> >      minItems: 1
> > =40=40 -110,6 +111,15 =40=40 properties:
> >    vddh-usbdp-supply:
> >      description: VDDh power supply for the USB DP phy.
> >
> > +  dvdd-supply:
> > +    description: 0.75V power supply for the USB phy.
>=20
> So this is existing dvdd-usb20-supply.
>=20
> Same for all of the rest.
>=20

Yes, we have already discussed this and convergence was to use the=20
conventions which are mentioned in the Data-book. So, I updated the=20
supply names accordingly.=20

Please see the below communications for the same.=20

https://lore.kernel.org/linux-phy/83dc9435-5850-425d-b345-52e84ef9262c=40ke=
rnel.org/
https://lore.kernel.org/linux-phy/6e1c67d2-9bfa-442a-9d53-8c5970a2a9ef=40ke=
rnel.org/

> Best regards,
> Krzysztof

Thank you,

Regards,
Pritam

