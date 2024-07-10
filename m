Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2132C59155
	for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Jul 2024 06:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720594754; cv=none; b=TttT//2XnEMUf17iASdua/l6cih6DVhXO6v/cR8hxCAEr7D/7UU6vkD5+5X32r0SY8KjIZUxnxngYQqeIJ3nc7aM5GWJCsyVTmnLbX+BSe6DZajYp9L8FNYBpvkghoIuDsbLof0GMfWas0GURICj/xp5kMOORg6pfwXbYCs8ZgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720594754; c=relaxed/simple;
	bh=nV5jIE+2AMLGXvB0BiaxonpdIBcsseaSPwEpPv+Ryq8=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=Ddz8oXYNUrsSZBj2GUjzJUVVLKFss7qE5M1ASAES/MZE2jWGfjW6gVLL3O30KX1JO3Upl2JCB46HLT+GdoIAsUKsO6vrmPf5XWLNI8ZOMF6oq8oE/EY7doMd3Z9L08QJTr1cR+I5Un/KECaY7tuoeZ/PQ+aatTTkm5IyXCcUfXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=PNLtbWDm; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="PNLtbWDm"
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20240710065910epoutp044eafbb984e698af5982142d2352a2965~gx88sJlo82917029170epoutp04A
	for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Jul 2024 06:59:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20240710065910epoutp044eafbb984e698af5982142d2352a2965~gx88sJlo82917029170epoutp04A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1720594750;
	bh=i68rsdjhN74gfURbEk83UFLc56Rz05uORnulGuQAY9M=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=PNLtbWDmckbE9XIZeZijonHpYsUAcWEjx6lzhyuy/lhKkpUsjAEiRGmzi2TerVc6F
	 LtDN5REo/+bUxiim7eLT19gv9tszb3DLI4kA5tswUOGbtyXG9s4jqMuhPcpC51s8RW
	 atNglyy/X1CbMX0TIXxb8QLLHoYV4x351EUUYGP8=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTP id
	20240710065909epcas2p13b0fcace1336d6b6da308f9370ee6ee6~gx878hbhq0868508685epcas2p13;
	Wed, 10 Jul 2024 06:59:09 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.90]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4WJpcY11jVz4x9Pw; Wed, 10 Jul
	2024 06:59:09 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
	epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
	8F.2A.09806.C313E866; Wed, 10 Jul 2024 15:59:09 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20240710065908epcas2p3cc1a8c3f755a62da93120a375f787b9f~gx87LiI970475404754epcas2p3V;
	Wed, 10 Jul 2024 06:59:08 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240710065908epsmtrp22c9b6c55a1273c426fc3f69797974577~gx87Ki-QD0236702367epsmtrp2j;
	Wed, 10 Jul 2024 06:59:08 +0000 (GMT)
X-AuditID: b6c32a47-c6bff7000000264e-bf-668e313c9c50
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	71.29.18846.C313E866; Wed, 10 Jul 2024 15:59:08 +0900 (KST)
Received: from KORCO118965 (unknown [10.229.18.201]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20240710065908epsmtip264fae288a733e20cfbdbd80636b1d988~gx865wmhw0897008970epsmtip20;
	Wed, 10 Jul 2024 06:59:08 +0000 (GMT)
From: "sunyeal.hong" <sunyeal.hong@samsung.com>
To: "'Alim Akhtar'" <alim.akhtar@samsung.com>, "'Krzysztof Kozlowski'"
	<krzk@kernel.org>, "'Sylwester Nawrocki'" <s.nawrocki@samsung.com>,
	"'Chanwoo Choi'" <cw00.choi@samsung.com>, "'Michael Turquette'"
	<mturquette@baylibre.com>, "'Stephen Boyd'" <sboyd@kernel.org>, "'Rob
 Herring'" <robh@kernel.org>, "'Conor Dooley'" <conor+dt@kernel.org>
Cc: <linux-samsung-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <015501dad271$30f54a10$92dfde30$@samsung.com>
Subject: RE: [PATCH v2 2/4] arm64: dts: exynos: add initial CMU clock nodes
 in Exynos Auto v920
Date: Wed, 10 Jul 2024 15:59:08 +0900
Message-ID: <008201dad296$a904ea90$fb0ebfb0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJHtUpDsgLCeLIQdS8546uqgvLWdQIAh4UhAdGvMNoB/Od1kAIfmP8eAl0shoCww2IzQA==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrKJsWRmVeSWpSXmKPExsWy7bCmqa6tYV+aQecLZosH87axWazZe47J
	4vqX56wW84+cY7U4f34Du8Wmx9dYLT723GO1uLxrDpvFjPP7mCwunnK1+L9nB7vF4TftrBb/
	rm1kceD1eH+jld1j06pONo/NS+o9+rasYvT4vEkugDUq2yYjNTEltUghNS85PyUzL91WyTs4
	3jne1MzAUNfQ0sJcSSEvMTfVVsnFJ0DXLTMH6EQlhbLEnFKgUEBicbGSvp1NUX5pSapCRn5x
	ia1SakFKToF5gV5xYm5xaV66Xl5qiZWhgYGRKVBhQnbG44fr2AtmiVccu5rdwHhQpIuRk0NC
	wETiz74ZrF2MXBxCAjsYJSZuPMYC4XxilJh36R8jnNO6tIUVpuV0/yNmiMRORokVR99Atbxk
	lJiw+SkTSBWbgL7E6u7bbCAJEYE7TBK31z0E28IssI5RYvPMI+wgVZwCVhJHTs8DmysskCjx
	+ckEsG4WAVWJJyfnsoHYvAKWEpNWf4GyBSVOznzCAmIzC2hLLFv4mhniJgWJn0+Xgc0REQiT
	6D//HqpGRGJ2ZxvYrRICezgkTu0/ywTR4CJx7f0MFghbWOLV8S3sELaUxOd3e9kg7HyJydff
	MkE0NzBKXPvXDbXNXmLRmZ9ADRxAGzQl1u/SBzElBJQljtyC2ssn0XH4LztEmFeio00IolFN
	4tOVy1BDZCSOnXjGPIFRaRaSz2Yh+WwWkg9mIexawMiyilEstaA4Nz212KjAGB7dyfm5mxjB
	6VfLfQfjjLcf9A4xMnEwHmKU4GBWEuGdf6M7TYg3JbGyKrUoP76oNCe1+BCjKTCsJzJLiSbn
	AzNAXkm8oYmlgYmZmaG5kamBuZI4773WuSlCAumJJanZqakFqUUwfUwcnFINTNH7uxU2fos6
	dPcmc7Y8w45GHtH8rL1e0slZoQkn1cRkVus+8HMTWHDTdE11tHthU86DTT/ElUSLS1xPTVWK
	LthWozFhDwfHOV+lA0mK8y/dcjWaFXjlR6R02LaMoES/37u13s5QV5F6qnXpG+t7js3c3fq1
	052mmzIX5GoH7ZXdJa91QPigXXpZv8fs6C8aJeVzV+hme/qIvBXy3BT/7fhcy6u3nlpvYtPU
	zLiQFGiRu/ClpseUK8du6NYE9Mhwz8yuWipamvzbRzh/+93rGl9ly65eSXG3lubvnHBfTifw
	1f2jHV6XTbNuTn/GsmWv/b7PIe3/U0/tttld1DvhnOaF2nymw9zB/6SNTDKUWIozEg21mIuK
	EwFjT8uFSAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprHIsWRmVeSWpSXmKPExsWy7bCSvK6NYV+awcxPMhYP5m1js1iz9xyT
	xfUvz1kt5h85x2px/vwGdotNj6+xWnzsucdqcXnXHDaLGef3MVlcPOVq8X/PDnaLw2/aWS3+
	XdvI4sDr8f5GK7vHplWdbB6bl9R79G1ZxejxeZNcAGsUl01Kak5mWWqRvl0CV8afS81sBReF
	Ky5MfczSwHiDv4uRk0NCwETidP8j5i5GLg4hge2MEs8+LmaCSMhIbGz4zw5hC0vcbznCClH0
	nFHi9Jr9LCAJNgF9idXdt9lAEiICj5gkPv/cxQ7iMAtsYpQ4t/smG0TLeSaJk1PWM4O0cApY
	SRw5PY8VxBYWiJd4++gdWJxFQFXiycm5bCA2r4ClxKTVX6BsQYmTM5+ArWMW0JZ4evMpnL1s
	4WtmiPsUJH4+XQY2U0QgTKL//HuoGhGJ2Z1tzBMYhWchGTULyahZSEbNQtKygJFlFaNoakFx
	bnpucoGhXnFibnFpXrpecn7uJkZwFGoF7WBctv6v3iFGJg7GQ4wSHMxKIrzzb3SnCfGmJFZW
	pRblxxeV5qQWH2KU5mBREudVzulMERJITyxJzU5NLUgtgskycXBKNTDxL7WfJxwUsEx4tQfv
	iWsOCqyZtqcu3PM1r3vl86Ra52LpTeNAHV2mywIVjRNumL9qyrlyOWWt0Y3gt78WPlSvS8/9
	62zg8W7K5TC+7XOjrb/PT99rJ2jpse1aRXOaA9tbcZMDdzbsX3pz06bG0EUG57Xc76xXyH47
	6Xbi/PQ5J9fmTNqdtPe3h9vOfZol7RcXbnrQacLXyhcosHQm44amDavv80SZZ75ctuJ98oY1
	NuvP2hqceLlAfPKMq+pekb+nnAzytImQj3lj2uRveFZh3h2ZA48m/9gY43TtH+PqMEZWyStL
	3hnYvWU3/9kpr+i480xfVJjB2rUWQr+ZtkhqbpQ5/Vpvv8zNa/Nemu86rMRSnJFoqMVcVJwI
	ANfPWjQxAwAA
X-CMS-MailID: 20240710065908epcas2p3cc1a8c3f755a62da93120a375f787b9f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240707231445epcas2p2cf78684e3cbcf8ed914a0d8e52115216
References: <20240707231331.3433340-1-sunyeal.hong@samsung.com>
	<CGME20240707231445epcas2p2cf78684e3cbcf8ed914a0d8e52115216@epcas2p2.samsung.com>
	<20240707231331.3433340-3-sunyeal.hong@samsung.com>
	<000101dad126$b964e2d0$2c2ea870$@samsung.com>
	<000101dad26f$0d0fc0f0$272f42d0$@samsung.com>
	<015501dad271$30f54a10$92dfde30$@samsung.com>

Hello Alim,

> -----Original Message-----
> From: Alim Akhtar <alim.akhtar=40samsung.com>
> Sent: Wednesday, July 10, 2024 11:31 AM
> To: 'sunyeal.hong' <sunyeal.hong=40samsung.com>; 'Krzysztof Kozlowski'
> <krzk=40kernel.org>; 'Sylwester Nawrocki' <s.nawrocki=40samsung.com>; 'Ch=
anwoo
> Choi' <cw00.choi=40samsung.com>; 'Michael Turquette'
> <mturquette=40baylibre.com>; 'Stephen Boyd' <sboyd=40kernel.org>; 'Rob
> Herring' <robh=40kernel.org>; 'Conor Dooley' <conor+dt=40kernel.org>
> Cc: linux-samsung-soc=40vger.kernel.org; linux-clk=40vger.kernel.org;
> devicetree=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org; lin=
ux-
> kernel=40vger.kernel.org
> Subject: RE: =5BPATCH v2 2/4=5D arm64: dts: exynos: add initial CMU clock
> nodes in Exynos Auto v920
>=20
> Hello Sunyeal,
>=20
> > -----Original Message-----
> > From: sunyeal.hong <sunyeal.hong=40samsung.com>
> >
> =5Bsnip=5D
> > > Subject: RE: =5BPATCH v2 2/4=5D arm64: dts: exynos: add initial CMU
> > > clock nodes in Exynos Auto v920
> > >
> > >
> > >
> > > > -----Original Message-----
> > > > From: Sunyeal Hong <sunyeal.hong=40samsung.com>
> > > > Sent: Monday, July 8, 2024 4:43 AM
> > > > To: Krzysztof Kozlowski <krzk=40kernel.org>; Sylwester Nawrocki
> > > > <s.nawrocki=40samsung.com>; Chanwoo Choi
> > <cw00.choi=40samsung.com>; Alim
> > > > Akhtar <alim.akhtar=40samsung.com>; Michael Turquette
> =5BSnip=5D
> > > > +		cmu_peric0: clock-controller=4010800000 =7B
> > > > +			compatible =3D =22samsung,exynosautov920-cmu-
> > > > peric0=22;
> > > > +			reg =3D <0x10800000 0x8000>;
> > > Please cross check the size of the register range, this looks to be
> > > more then what is needed.
> > >
> > In the case of preic0, the size is up to 0x7088. The CMU block SFR
> > area of =E2=80=8B=20ExynosAuto=20v920=20is=20generally=20specified=20up=
=20to=200x8000.=20There=0D=0A>=20>=20are=20differences=20for=20each=20block=
,=20but=20the=20settings=20are=20the=20same.=0D=0A>=20>=20Do=20you=20think=
=20it=20is=20necessary=20to=20change=20the=20actual=20size=20of=20each=20bl=
ock?=0D=0A>=20To=20avoid=20any=20overlap=20between=20difference=20SFR=20reg=
ion,=20better=20to=20mention=20the=0D=0A>=20exact=20size=20of=20the=20SFR=
=20region.=0D=0A>=20=0D=0AIn=20ExynosAuto,=20the=20SFR=20of=20each=20block=
=20has=20an=20offset=20of=200x10000.=20So=20I=20don't=20think=20SFR=20will=
=20be=20overlapped.=0D=0AIn=20the=20case=20of=20CMU=20SFR,=20there=20is=20n=
o=20size=20over=200x8000,=20so=20I=20think=20it=20would=20be=20better=20to=
=20maintain=20that=20value.=0D=0APlease=20give=20me=20your=20opinion=20agai=
n.=0D=0A>=20=5Bsnip=5D=0D=0A>=20>=20>=20>=20--=0D=0A>=20>=20>=20>=202.45.2=
=0D=0A>=20>=20>=0D=0A>=20>=20>=0D=0A>=20>=0D=0A>=20>=20Please=20review=20my=
=20answer=20again.=0D=0A>=20>=0D=0A>=20>=20Thanks,=0D=0A>=20>=20Sunyeal=20H=
ong=0D=0A>=20>=0D=0A>=20=0D=0A>=20=0D=0A=0D=0AThanks,=0D=0ASunyeal=20Hong=
=0D=0A=0D=0A
