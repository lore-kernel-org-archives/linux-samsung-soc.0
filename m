Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A3735280
	for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Nov 2024 06:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731998181; cv=none; b=ICdaF0X+4YNCma49zT7VBoAay81uxPH3gHHIJ4X7wj3TdGI9OOGLvfs6KejweUXiFutQ14Kc3PUhEgWalnuRFIQxS6qYtuowG9mE2b0WO/esrP3umU0kIlixHzcxbNsFH4gzSS2Jgf2bOQ/G/tzrO1C6bv9N4/uzInj4qj9IJl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731998181; c=relaxed/simple;
	bh=QRI08KO2EBQC1esk2uk48wDRR0f9VBlmQ+k7lnq+GsA=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=HlkYo3TNyX0swGXhsvDQqu5r+RZFIic4EtGXLeXffMZ8p6AVwWA2cJ+ciSN+DAff8s0GQjmuDjWc9hiS7BVjgKYMrWYeETwFmp38UalaTU+H68DWl2lEUsx2nZ9DS/cjMoi7sXC8xLU1pO0VbdZr6JsEZdMGKn+/U7BzoV2HbX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=XFG8Tg6P; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="XFG8Tg6P"
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20241119063617epoutp04d037a6d93ca5d1a30539950e0f32a003~JSyp-Eu-r2771927719epoutp04J
	for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Nov 2024 06:36:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20241119063617epoutp04d037a6d93ca5d1a30539950e0f32a003~JSyp-Eu-r2771927719epoutp04J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1731998177;
	bh=z6fB6oOpKr11TbqTDlmYWc7ziirro3vJHInqJcCAtQw=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=XFG8Tg6PNmLn1zhhQIuU0fzBMbjDhg2q5gstnfvf0Vhte527tbaGN6tfrY9q0U7zd
	 Z3po1wtqKeVXsJuyuIBmvImzr/6QJrMAp6wNfvK6w/oBVOcA92bBmJhZE/NC3NIwPE
	 X2/mrFrKjjDTyLrp0YHV7Zkp85//9nC+hWL1loUY=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTP id
	20241119063616epcas2p2a3626888f5a8940168e2f5dd706dc5ee~JSypbEqR52617826178epcas2p2d;
	Tue, 19 Nov 2024 06:36:16 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.89]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4XsvsD1l5cz4x9QL; Tue, 19 Nov
	2024 06:36:16 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
	epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
	1C.EC.07397.0E13C376; Tue, 19 Nov 2024 15:36:16 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20241119063615epcas2p1bcc7f36c73064d8aa5b94767bb228fdf~JSyoQCzUA2949729497epcas2p1C;
	Tue, 19 Nov 2024 06:36:15 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20241119063615epsmtrp1cdfecab1842b8d8da531ec135d739b5c~JSyoC54hv1801618016epsmtrp1o;
	Tue, 19 Nov 2024 06:36:15 +0000 (GMT)
X-AuditID: b6c32a47-9abfb70000011ce5-f6-673c31e0182c
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	2B.24.07371.FD13C376; Tue, 19 Nov 2024 15:36:15 +0900 (KST)
Received: from KORCO078619 (unknown [10.229.8.183]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20241119063615epsmtip1e60f0ad114b94cc42153ae42ec104332~JSynslddZ3006730067epsmtip1h;
	Tue, 19 Nov 2024 06:36:15 +0000 (GMT)
From: =?UTF-8?B?64KY7IaM7JuQL1NPV09OIE5B?= <sowon.na@samsung.com>
To: "'Alim Akhtar'" <alim.akhtar@samsung.com>
Cc: <robh@kernel.org>, <krzk@kernel.org>, <conor+dt@kernel.org>,
	<vkoul@kernel.org>, <kishon@kernel.org>, <krzk+dt@kernel.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-samsung-soc@vger.kernel.org>, "'Krzysztof Kozlowski'"
	<krzysztof.kozlowski@linaro.org>
In-Reply-To: <000001db3a42$c5a79b70$50f6d250$@samsung.com>
Subject: RE: [PATCH v3 1/3] dt-bindings: phy: Add ExynosAutov920 UFS PHY
 bindings
Date: Tue, 19 Nov 2024 15:36:14 +0900
Message-ID: <01cc01db3a4d$551bf530$ff53df90$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQKN54LK9wdlweRKh/1XLNX4aAwNFgFS5b/OAqaWsZ0BueJmj7ErLxsg
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCJsWRmVeSWpSXmKPExsWy7bCmue4DQ5t0g9Zp7BYP5m1js1iz9xyT
	xfwj51gtjrb+Z7Z4Oesem8X58xvYLfa+3spucXnXHDaLGef3MVn837OD3WLnnRPMDtwem1Z1
	snncubaHzaNvyypGj8+b5AJYorJtMlITU1KLFFLzkvNTMvPSbZW8g+Od403NDAx1DS0tzJUU
	8hJzU22VXHwCdN0yc4CuUlIoS8wpBQoFJBYXK+nb2RTll5akKmTkF5fYKqUWpOQUmBfoFSfm
	FpfmpevlpZZYGRoYGJkCFSZkZ3z8Pp2l4IVwxbktbYwNjMcEuhg5OSQETCR6vj1m6WLk4hAS
	2MEocWLOV3YI5xOjxNenk5ggnG+MEr0/tzLCtFzau4oNxBYS2Mso8X1TFETRC0aJde/mgBWx
	CThKrJz2lwnEFhHQlXhx5Q3YDmaBxUwSe/5cAktwClhJvJjwmQXEFhYIllgw4zcziM0ioCqx
	+sxWsBpeAUuJ2b/vQNmCEidnPgGrZxbQlli28DUzxEUKEj+fLmPtYuQAWuYmMeu5CESJiMTs
	zjZmkL0SAgc4JDpmf2UCqZEQcJGYuSIdolVY4tXxLewQtpTEy/42KDtfYv3Du2wQdoXE3UP/
	WSBse4lFZ36yg4xhFtCUWL9LH2KissSRW1CH8Ul0HP7LDhHmlehoE4JoVJLoOD+HCcKWkFj1
	YjLbBEalWUjemoXkrVlI7p+FsGsBI8sqRrHUguLc9NRiowJjeFQn5+duYgQnVy33HYwz3n7Q
	O8TIxMF4iFGCg1lJhLda1zpdiDclsbIqtSg/vqg0J7X4EKMpMKAnMkuJJucD03teSbyhiaWB
	iZmZobmRqYG5kjjvvda5KUIC6YklqdmpqQWpRTB9TBycUg1MISrhzy0rmv9ZPjije2eapqfZ
	t4LH62xXW8vuca7Q59lxY8q7dran7KoT5wlGms0RiLwW8XnlKbsuI8G3+s8OTTo6K7I4l0m5
	/1Xot8yvTUnSF20DeQ6caa09LDH18md5/f1tzaHqL3bZJm36uISrlt0nWTTsr/aOGJakin9i
	gmbZSftzpvwV+LP9bMdiq6KNX3jCKuK3PNp2pDsz6q5o0Sa3l/t+36wL3y8ay+Cxhr39tVJv
	aZxSxjx+DtHnP2YUVqzoi1lzoInf9zDHf49TvU8aH3ilSwmqpLpyc9WdSXBw/WL7kMEsrG/v
	BZ9d52R3XGJttNivt+q+R/SR3p0Hf0kFlaSuNJ78ymS+hLISS3FGoqEWc1FxIgBTmuxiNwQA
	AA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNIsWRmVeSWpSXmKPExsWy7bCSnO59Q5t0g+lHxC0ezNvGZrFm7zkm
	i/lHzrFaHG39z2zxctY9Novz5zewW+x9vZXd4vKuOWwWM87vY7L4v2cHu8XOOyeYHbg9Nq3q
	ZPO4c20Pm0ffllWMHp83yQWwRHHZpKTmZJalFunbJXBlPL3yn7FggXDFmyurWRsY//F3MXJy
	SAiYSFzau4qti5GLQ0hgN6PEzc7ZbBAJCYlvb/YwQdjCEvdbjrBCFD1jlPi97Bk7SIJNwFFi
	5bS/YEUiAroSL668YQEpYhZYyySx+f1+RoiO14wSzy7uAuvgFLCSeDHhMwuILSwQKNE16QAj
	iM0ioCqx+sxWsEm8ApYSs3/fgbIFJU7OfAJWzyygLdH7sJURxl628DUzxHkKEj+fLmOFOfXV
	8S3sELapxNv/nUBxDqDr3CRmPReBaBWRmN3ZxjyBUXQWkg2zkGyYhWTDLCQtCxhZVjFKphYU
	56bnJhsWGOallusVJ+YWl+al6yXn525iBMenlsYOxnvz/+kdYmTiYDzEKMHBrCTCW61rnS7E
	m5JYWZValB9fVJqTWnyIUZqDRUmc13DG7BQhgfTEktTs1NSC1CKYLBMHp1QD0y671tWFDhz5
	knUxTiJZGfeDasLag93jqoSeZudMPPpP/u/hkpPt/4I+VxeqL957dU20481QDtGda153fVfP
	//sj6vPl2E0ZmyOO1Rh9zrl3Qkpwre/p0wsu62+88/1iftKv/EktbjErt+203H32gODdHWtm
	xRb93bb4+M4vviYM+ye6XL1ooCiSt9jq1OmPt7LfuMUtWhGqezzFxk72Qcljrojo1BeRbb8f
	NDn2ljhwvpVZsqj44drv9+eFNOkx1ArMOn9jRfyc/TMzV7HWnvl1NraiuiOgZO9haY/eFjWT
	WXvdnnnIL7+pu+wCMKY2XKiUnmvb9SEgyyMv6t7X23fNr7H6pC1e/lLxt36tuhJLcUaioRZz
	UXEiAFdpS90+AwAA
X-CMS-MailID: 20241119063615epcas2p1bcc7f36c73064d8aa5b94767bb228fdf
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241118021011epcas2p21593217ccf58afddad5ce36f510e7cb6
References: <20241118021009.2858849-1-sowon.na@samsung.com>
	<CGME20241118021011epcas2p21593217ccf58afddad5ce36f510e7cb6@epcas2p2.samsung.com>
	<20241118021009.2858849-2-sowon.na@samsung.com>
	<000001db3a42$c5a79b70$50f6d250$@samsung.com>

Hi Alim,

On 11/19/24 2:21 PM, Alim Akhtar wrote:
> -----Original Message-----
> From: Alim Akhtar <alim.akhtar=40samsung.com>
> Sent: Tuesday, November 19, 2024 2:21 PM
> To: 'Sowon Na' <sowon.na=40samsung.com>; robh=40kernel.org; krzk=40kernel=
.org;
> conor+dt=40kernel.org; vkoul=40kernel.org; kishon=40kernel.org
> Cc: krzk+dt=40kernel.org; linux-kernel=40vger.kernel.org;
> devicetree=40vger.kernel.org; linux-samsung-soc=40vger.kernel.org; 'Krzys=
ztof
> Kozlowski' <krzysztof.kozlowski=40linaro.org>
> Subject: RE: =5BPATCH v3 1/3=5D dt-bindings: phy: Add ExynosAutov920 UFS =
PHY
> bindings
>=20
>=20
>=20
> > -----Original Message-----
> > From: Sowon Na <sowon.na=40samsung.com>
> > Sent: Monday, November 18, 2024 7:40 AM
> > To: robh=40kernel.org; krzk=40kernel.org; conor+dt=40kernel.org;
> > vkoul=40kernel.org; alim.akhtar=40samsung.com; kishon=40kernel.org
> > Cc: krzk+dt=40kernel.org; linux-kernel=40vger.kernel.org;
> > devicetree=40vger.kernel.org; linux-samsung-soc=40vger.kernel.org;
> > sowon.na=40samsung.com; Krzysztof Kozlowski
> > <krzysztof.kozlowski=40linaro.org>
> > Subject: =5BPATCH v3 1/3=5D dt-bindings: phy: Add ExynosAutov920 UFS PH=
Y
> > bindings
> >
> > Add samsung,exynosautov920-ufs-phy compatible for ExynosAuto v920 SoC.
> >
> > Signed-off-by: Sowon Na <sowon.na=40samsung.com>
> > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski=40linaro.org>
> > ---
> I am not sure how we can help you, you are keep missing to collect all th=
e
> tags
> https://lkml.org/lkml/2024/11/7/617
>=20
Really sorry for missing tags. I append it immediately, and will not miss a=
nymore.
Your review helps me a lot and makes my patch better. I applied all your re=
views to my patches.

Thank you a lot once again for your help.

> >  Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml =7C 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git
> > a/Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml
> > b/Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml
> > index f402e31bf58d..d70ffeb6e824 100644
> > --- a/Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml
> > +++ b/Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml
> > =40=40 -18,6 +18,7 =40=40 properties:
> >        - google,gs101-ufs-phy
> >        - samsung,exynos7-ufs-phy
> >        - samsung,exynosautov9-ufs-phy
> > +      - samsung,exynosautov920-ufs-phy
> >        - tesla,fsd-ufs-phy
> >
> >    reg:
> > --
> > 2.45.2
>=20


