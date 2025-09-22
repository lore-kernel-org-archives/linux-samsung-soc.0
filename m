Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42C9182D2
	for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Sep 2025 05:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758518827; cv=none; b=WXvq6mstVdcYSmhT5/j3vr4BJUAmUexCf0PmHQU7souXrf7nVv10pwt99ILj8v9X60il/0uAxdYLvteEuVSBT36WMrmm75cK//oCZU+4RhxgaABV5XGr644zTsEM2vQrU6KUqor43oghz7jKt3Tz7yBgIN9YmT4QPU9nqdUSdx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758518827; c=relaxed/simple;
	bh=EGIYu0nqeT2Xw4gfIZrcaK4dfnmDccVFWH/4Y+Jkdp0=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=jVvWYXHK/Yn6p0mettx7kQNr2MNroK5jKKRPaXDlOUaGQ8ZjdyJpIPpVHlPijndunD9lCJqId363j2Nr71hRNqQLv0fNs5DNDO3gH70rO8CA+y8E0stPENdiqeTkP0PAROk5QzVo8kK8hi4gP6z7oxR+fSX3zTGMpvebsed7ylo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=aCUYp4Dj; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="aCUYp4Dj"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250922052702epoutp04f2e7210cac2c780bb73485180a3a4909~ng41iH4YX0741007410epoutp04L
	for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Sep 2025 05:27:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250922052702epoutp04f2e7210cac2c780bb73485180a3a4909~ng41iH4YX0741007410epoutp04L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1758518822;
	bh=pRQ6VYbR+TQAl593qF3BM3VZfrCtT4hvJ2iIj2q2yDU=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=aCUYp4DjFdiTIF0q8RsM0LWfcvQMzwD40f0EMVU1gQqBJdv4oSshWByhIdy+vWqd/
	 hln+tqDppQVZ6jzJtSCixGbc2JKT0zokD6hjtFuOZI5Az1bNnlpTcLAaNKnNTt7igs
	 zEh1jzsfzxBwyZTF43UprNuatfQkhXFui7eD7uiU=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250922052701epcas5p10f94621bc5eaecb962b856c07434d0cb~ng40Tk9CU0734307343epcas5p1d;
	Mon, 22 Sep 2025 05:27:01 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.94]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4cVWnc2r61z6B9mC; Mon, 22 Sep
	2025 05:27:00 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250922052659epcas5p135d8f9832a768030fc87b2e412fdbbc7~ng4y0apWs2794327943epcas5p1_;
	Mon, 22 Sep 2025 05:26:59 +0000 (GMT)
Received: from INBRO001840 (unknown [107.122.3.105]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250922052653epsmtip16c0b78c7e54941680c78cef5ec4caaf1~ng4s6V2_y2099220992epsmtip1H;
	Mon, 22 Sep 2025 05:26:53 +0000 (GMT)
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
In-Reply-To: <02ef5180-ad56-45f0-a56f-87f442bf6793@kernel.org>
Subject: RE: [PATCH v8 1/6] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 HS phy compatible
Date: Mon, 22 Sep 2025 10:56:50 +0530
Message-ID: <007f01dc2b81$84ef19b0$8ecd4d10$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIRMOVGdWg5oRjNsRBgEjzIeIB8IgGabj6EAmTXuDcA7fJUJgHIrfZJAofpNyCz6rDlMA==
Content-Language: en-in
X-CMS-MailID: 20250922052659epcas5p135d8f9832a768030fc87b2e412fdbbc7
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
	<007801dc2893$18ed4a20$4ac7de60$@samsung.com>
	<02ef5180-ad56-45f0-a56f-87f442bf6793@kernel.org>

Hi Krzysztof,

> -----Original Message-----
> From: Krzysztof Kozlowski <krzk=40kernel.org>
> Sent: 19 September 2025 05:59 AM
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
> On 18/09/2025 20:55, Pritam Manohar Sutar wrote:
> >
> > Yes, we have already discussed this and convergence was to use the
> > conventions which are mentioned in the Data-book. So, I updated the
> > supply names accordingly.
> >
> > Please see the below communications for the same.
> >
> > https://lore.kernel.org/linux-phy/83dc9435-5850-425d-b345-52e84ef9262c
> > =40kernel.org/
> > https://lore.kernel.org/linux-phy/6e1c67d2-9bfa-442a-9d53-8c5970a2a9ef
> > =40kernel.org/
> Ah, ok, although next time I might ask the same, since commit msg does no=
t
> explain that.

Ok, will update commit message.=20
Please confirm the commit message if I updated it as below. =20

=22dt-bindings: phy: samsung,usb3-drd-phy: add ExynosAutov920 HS phy compat=
ible

Document support for the USB20 phy found on the ExynosAutov920 SoC. The
USB20 phy is functionally identical to that on the Exynos850 SoC, so no
driver changes are needed to support this phy. However, add a dedicated
compatible string for USB20 phy found in this SoC.

This phy needs 0.75v, 0.18v and 3.3v supplies for its internal=20
functionally. Power Supply's names are as per phy's User Data-Book.
These names, (dvdd, vdd18 and vdd33), are considered  for 0.75v, 1.8v=20
and 3.3v respectively. =20
=22

>=20
> I still cannot find constraints for the rest of properties, though.

Sorry I didn't get it completely. Can you please elaborate on the same?=20

Let me know if you want me to update the commit message=20
and send v9? And retain your RB on patch1 and patch3?

> Best regards,
> Krzysztof

Thank you.

Regards,
Pritam

