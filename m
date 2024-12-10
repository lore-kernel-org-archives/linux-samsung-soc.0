Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9E923DEBA
	for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Dec 2024 12:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733832482; cv=none; b=LvXoOOYPMlKg2v7WbqrZd9hufwn/9SC6QicShZHfcuR6uJIQPWjds6zzcrF+CTWrLzYJc6bonM4nNSP3E8okdfnuXjnErITh2ElaRiqSiLYYnMliEFcEqKUNIHodhvQBHOIFzf7Jp+rRVKkH98/l0w+XuFLsTkGDEi8CR129hJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733832482; c=relaxed/simple;
	bh=UNhtfmSoqk3uRMBLbhlytuiXOUrc3m7F5/pCnzIUpbg=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=VCPciCWsQYhveZeQIR2vKBiByt6uJ+Ckhk1ATyf4nNCnD0jJS6fbOLNdYIOQnF7yiA8CTtsIBG8IzfJHh0uSpJA6SmYgFnnIYCWvq5p9fZSy9yOjEuIcBpQQGmNEghpBRPcaBj8x4kW7ZH0FVbZ3waVoAhXn7AHp9FQ5BOCaPWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=OxgXmU0M; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="OxgXmU0M"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20241210120757epoutp01e4d0abef4ad90215eb797d18dd074978~Pz3PA7kIJ1015110151epoutp01I
	for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Dec 2024 12:07:57 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20241210120757epoutp01e4d0abef4ad90215eb797d18dd074978~Pz3PA7kIJ1015110151epoutp01I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1733832477;
	bh=UNhtfmSoqk3uRMBLbhlytuiXOUrc3m7F5/pCnzIUpbg=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=OxgXmU0MVnKFWVcieWorC6RhJ0tjrGuhS4Th+ttjilFU/vMVO64A3kh9NDoj6LUbP
	 GJzhUVgf6/0mUUOptKrsAjHeh1Vxbf6yPwk0vh6Ww4IGLi1uM3ufQnc487psV1Vkqp
	 uNVmN8MNTnW0r93xen3OY/kznHBd8G8HUSAHqbX8=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTP id
	20241210120757epcas5p2e893ed27fb4f5ffc88aa96c1a5359874~Pz3Okkq5u0595105951epcas5p2C;
	Tue, 10 Dec 2024 12:07:57 +0000 (GMT)
Received: from epsmges5p1new.samsung.com (unknown [182.195.38.177]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4Y6yDD0NT6z4x9Pt; Tue, 10 Dec
	2024 12:07:56 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
	epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	95.35.20052.B1F28576; Tue, 10 Dec 2024 21:07:55 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20241210115917epcas5p3912e9f7bb6e797d93e69f86cd8d1babf~PzvqP84oY0995609956epcas5p3F;
	Tue, 10 Dec 2024 11:59:17 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20241210115917epsmtrp2df26d7b110ff24eb78634bb1a18b6ff4~PzvqPDZi41861918619epsmtrp2L;
	Tue, 10 Dec 2024 11:59:17 +0000 (GMT)
X-AuditID: b6c32a49-3d20270000004e54-f3-67582f1bbf36
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	36.5C.18729.41D28576; Tue, 10 Dec 2024 20:59:16 +0900 (KST)
Received: from INBRO000519 (unknown [107.122.1.150]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20241210115915epsmtip103ecaa17a7dc8d127af390ed9619b3c5~PzvogUm9_0683806838epsmtip1R;
	Tue, 10 Dec 2024 11:59:15 +0000 (GMT)
From: "Faraz Ata" <faraz.ata@samsung.com>
To: "'Tudor Ambarus'" <tudor.ambarus@linaro.org>,
	<devicetree@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>,
	<krzk+dt@kernel.org>, <robh@kernel.org>
Cc: <linux-arm-kernel@lists.infradead.org>, <alim.akhtar@samsung.com>,
	<rosa.pila@samsung.com>, "'Peter Griffin'" <peter.griffin@linaro.org>,
	=?UTF-8?Q?'Andr=C3=A9_Draszik'?= <andre.draszik@linaro.org>, "'William
 McVicker'" <willmcvicker@google.com>, <kernel-team@android.com>
In-Reply-To: <07a4942c-023f-495e-a4b0-e451c949ad80@linaro.org>
Subject: RE: [PATCH] arm64: dts: exynosautov920: add DMA nodes
Date: Tue, 10 Dec 2024 17:29:13 +0530
Message-ID: <031001db4afa$f01614e0$d0423ea0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQFjpTq5mUG5UMRch2oPlNEF/ignPQHSFX3YAXFF3b2ztI8qcA==
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBJsWRmVeSWpSXmKPExsWy7bCmhq60fkS6wZ4zFhYP5m1js9jyajOL
	xfwj51gtdmwXsXg56x6bxabH11gtZpzfx2SxYcY/Fov/e3awW3z5+YDZ4tOtOItVn/4zOvB4
	bNu9jdVjwaZSj02rOtk87lzbw+axeUm9R9+WVYwenzfJBbBHZdtkpCampBYppOYl56dk5qXb
	KnkHxzvHm5oZGOoaWlqYKynkJeam2iq5+AToumXmAF2ppFCWmFMKFApILC5W0rezKcovLUlV
	yMgvLrFVSi1IySkwKdArTswtLs1L18tLLbEyNDAwMgUqTMjOmPSVvWC3QMW8W5eZGhjv8Hcx
	cnJICJhI/Gr4wN7FyMUhJLCbUWLFhseMEM4nRonGT/uhnG+MElsOnmeHaXm+9CUbRGIvo8SJ
	bfuhnJeMEjs39bKBVLEJaErc+fyUCcQWEVgAlPifA1LELDCLSeLR4+2sXYwcHJwCdhJ7/sWB
	1AgDmXNafjOD2CwCqhKN226AbeMVsJQ48+kjG4QtKHFy5hMWEJtZQFti2cLXzBAXKUj8fLoM
	bKSIgJPEmklWECXiEi+PHgH7TULgBIfEuwUfGCHqXSSu77nPBGELS7w6vgXqMymJz+/2skHY
	PhKTj35jBJkpIZAhcWetCETYXmL1gjNgq5iBXly/Sx8iLCsx9dQ6Joi1fBK9v59ATeeV2DEP
	xlaWOLlnDyuELSlx6PYL1gmMSrOQPDYLyWOzkHwwC2HbAkaWVYySqQXFuempxaYFhnmp5fDo
	Ts7P3cQITsJanjsY7z74oHeIkYmD8RCjBAezkggvh3douhBvSmJlVWpRfnxRaU5q8SFGU2Bo
	T2SWEk3OB+aBvJJ4QxNLAxMzMzMTS2MzQyVx3tetc1OEBNITS1KzU1MLUotg+pg4OKUamBrZ
	C06HaXuEnPJIP1l9/PMvoXCryaG+erqmn4t8dr+75WKwp6h+3csdATNCBPgKOFfbCX073ndE
	MfXOPnPOXQ0fLt1/tbc9x9DtVnjY2c2sPZy19rEn0zzy95Vl1zz58qVUNpvP+rXzpB2Z5yTP
	scVU/349xaeH4f7zwuRnn1875h886Lpj+aPLl841uj71ShI48fliR4aiWvHujMmqDPsvl5nG
	lzkr/9JyKvAVnhbwT63c/GLc1jShNy91IlkUJMJijm74ce589RGZ3eeb5hyrEdzEafUlYx7D
	ltts84vn/LMU7/KtMtvzQTVs3YPjd84Ys9XtW3Hm6KbvAatmP7aq/fKZNfe02xaNyz+SeJVY
	ijMSDbWYi4oTAVdRMm1LBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrEIsWRmVeSWpSXmKPExsWy7bCSnK6IbkS6weY/1hYP5m1js9jyajOL
	xfwj51gtdmwXsXg56x6bxabH11gtZpzfx2SxYcY/Fov/e3awW3z5+YDZ4tOtOItVn/4zOvB4
	bNu9jdVjwaZSj02rOtk87lzbw+axeUm9R9+WVYwenzfJBbBHcdmkpOZklqUW6dslcGVMabvA
	XLCSp6L1+Q/GBsapXF2MnBwSAiYSz5e+ZOti5OIQEtjNKHH3xF9GiISkxOGnd1khbGGJlf+e
	s0MUPWeU2Nu/iQ0kwSagKXHn81MmkISIwBJGiTmzpjCBJJgFFjBJzDxQBtGxl1Fi57Q3LF2M
	HBycAnYSe/7FgdQIA5lzWn4zg9gsAqoSjdtusIPYvAKWEmc+fWSDsAUlTs58wgIxU1ui92Er
	I4y9bOFrZojrFCR+Pl3GCjJeRMBJYs0kK4gScYmXR4+wT2AUnoVk0iwkk2YhmTQLScsCRpZV
	jJKpBcW56bnFhgWGeanlesWJucWleel6yfm5mxjB0ailuYNx+6oPeocYmTgYDzFKcDArifBy
	eIemC/GmJFZWpRblxxeV5qQWH2KU5mBREucVf9GbIiSQnliSmp2aWpBaBJNl4uCUamCSv7dZ
	Yp2IAJ/4qr2Rza43r1SeKL63nc3yTf6m5mnSJrFz7+sGKZ41FeoOuxPwlUNtbt/Rbq1HCaZa
	K628LW7+dFT5FRl9f82Fq82zJdJO7SyYpMPE2hj1fM1jd0ELAW0dc86IvaYSzc5xgcYxOZqn
	fuz4KLtLYg3rjE8lGx4vzalYEvmO8ZHD9herHh191rDb/smNNV7lV7wEJh5pcubrc/Xj0+MU
	fT+vQSRASM+vvtNkUtXb3atvGL/5uP/uTw2ZrQpzXtwsmemWUbv/gFoIW1bAqZdd7odLnm7s
	/LJzZrT5gZ+TqxYKWtS/jpm7fLfx2lhdg7mfj7Lf0GBI8BYLUD8W+H6a8oaD58UWJFsqsRRn
	JBpqMRcVJwIALprQCjUDAAA=
X-CMS-MailID: 20241210115917epcas5p3912e9f7bb6e797d93e69f86cd8d1babf
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241204122402epcas5p2412733eb46d495fadfa30e5af3c5ce83
References: <CGME20241204122402epcas5p2412733eb46d495fadfa30e5af3c5ce83@epcas5p2.samsung.com>
	<20241204122335.1578-1-faraz.ata@samsung.com>
	<07a4942c-023f-495e-a4b0-e451c949ad80@linaro.org>

Hi Tudor

> -----Original Message-----
> From: Tudor Ambarus <tudor.ambarus=40linaro.org>
> Sent: Monday, December 9, 2024 1:13 PM
> To: Faraz Ata <faraz.ata=40samsung.com>; devicetree=40vger.kernel.org; li=
nux-
> samsung-soc=40vger.kernel.org; krzk+dt=40kernel.org; robh=40kernel.org
> Cc: linux-arm-kernel=40lists.infradead.org; alim.akhtar=40samsung.com;
> rosa.pila=40samsung.com; Peter Griffin <peter.griffin=40linaro.org>; Andr=
=C3=A9=0D=0A>=20Draszik=20<andre.draszik=40linaro.org>;=20William=20McVicke=
r=0D=0A>=20<willmcvicker=40google.com>;=20kernel-team=40android.com=0D=0A>=
=20Subject:=20Re:=20=5BPATCH=5D=20arm64:=20dts:=20exynosautov920:=20add=20D=
MA=20nodes=0D=0A>=20=0D=0A>=20=0D=0A>=20=0D=0A>=20On=2012/4/24=2012:23=20PM=
,=20Faraz=20Ata=20wrote:=0D=0A>=20>=20ExynosAutov920=20SoC=20has=207=20DMA=
=20controllers.=20Two=20secure=20DMAC=0D=0A>=20>=20(SPDMA0=20&=20SPDMA1)=20=
and=20five=20non-secure=20DMAC=20(PDMA0=20to=20PDMA4).=0D=0A>=20>=20Adds=20=
the=20required=20dt=20node=20for=20the=20same.=0D=0A>=20=0D=0A>=20typos:=20=
s/adds/add,=20s/node/nodes=0D=0A>=20=0D=0AThanks=20for=20your=20review,=20w=
ill=20correct=20in=20the=20v2=0D=0A=0D=0A>=20Hi,=20Faraz=21=0D=0A>=20=0D=0A=
>=20Have=20you=20tested=20DMA=20on=20ExynosAutov920,=20did=20it=20work=20wi=
th=20the=20upstream=0D=0A>=20driver=20code?=0D=0A>=20=0D=0AYes,=20I=20teste=
d=20with=20dmatest=20for=20M2M=20for=20all=20channel,=20it=20is=20working=
=20as=20expected=20with=20mainline=20PL330=20driver.=20=0D=0A=0D=0A>=20I=20=
tried=20enabling=20it=20for=20GS101=20and=20I=20had=20some=20questions=20th=
at=20I=20couldn't=20answer,=0D=0A>=20and=20I=20moved=20forward=20in=20the=
=20meantime.=20Would=20you=20mind=20taking=20a=20look=20at:=0D=0A>=20=0D=0A=
>=20https://lore.kernel.org/linux-arm-kernel/e4089855-aca9-4993-bac6-=0D=0A=
>=20e59370cf7954=40linaro.org/=0D=0A>=20=0D=0AI=20am=20not=20sure=20about=
=20GS101=20architecture,=20will=20try=20to=20reachout=20internally=20to=20p=
eople=20who=20might=20be=20aware=20of=20this.=0D=0A=0D=0A>=20Thanks=20a=20t=
on=21=0D=0A>=20ta=0D=0A=0D=0A
