Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56BE17FD
	for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Jul 2024 09:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720605475; cv=none; b=dE4H3LdOTN/A23Ud+1jVaghw+QkrTWIjkkdPOAK4zqgDPX7WLkunYg1MtqQO8X59RqsYNEdEzVzNGTfRbUyqu0jIJzwimEsXnl41UhP7ME0yhteIh1jr0XmyNvXXggH9RSRJoGyTvnBYIZhlC7xVJ82GqodCjssiMPTpVQkYfUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720605475; c=relaxed/simple;
	bh=xVZi0iLGudkOIuB4XzeHC34UD3wH4DnCHvG0+eHABTQ=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=dRRekwIMCxCI/cKoS0JICJm0FR07E0kQDr+y3/YN3lhYMNxrp2u+idlxXBvJ63oVG1n3BFBsoi9VP3g2eO4PYC9Kag07nbzMjaN3MLMx6EqKMhjPwCBYwI23sn7ZU7jLJhDo3PDHdCByLaSqUa0NbJYRdXlDg8AK2vFmy6Iu8kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=eREA2i2F; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="eREA2i2F"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20240710095751epoutp04b10a28f55620f91d25925d08ead741fc~g0Y9NKB5C0853808538epoutp04Q
	for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Jul 2024 09:57:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20240710095751epoutp04b10a28f55620f91d25925d08ead741fc~g0Y9NKB5C0853808538epoutp04Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1720605471;
	bh=JxbHmjLatBBZpFuTF7JHphb3E2iEBvBjSfI2mWimbx4=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=eREA2i2FD2xQcuefw3wOD2KuTt0EN+tmSsYHK2F39Vk34vUp7Qw3NJBv+kxK5gUlr
	 vYKWjfoT2rfIXGKTuvy3AFk5fktyEcOxwLeSz6zJ5EYA9jLtza9WwfZoZoM0YhKIRX
	 b0DbCh9U3b31l9f400Leo9l0heqLC85xrBMUKZYc=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTP id
	20240710095750epcas5p4b7eee589feb24aaaf81cf454dc0e7827~g0Y8RWOO41559315593epcas5p4k;
	Wed, 10 Jul 2024 09:57:50 +0000 (GMT)
Received: from epsmges5p1new.samsung.com (unknown [182.195.38.181]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4WJtZh3p66z4x9Q2; Wed, 10 Jul
	2024 09:57:48 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
	epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	5B.B8.11095.C1B5E866; Wed, 10 Jul 2024 18:57:48 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20240710095747epcas5p405037d30712d4ad4df1a6ff64d633a9b~g0Y6NlSLR1559315593epcas5p4W;
	Wed, 10 Jul 2024 09:57:47 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240710095747epsmtrp13cc42b448c7099c09eb1c98b6577c8ff~g0Y6M5S6A0325703257epsmtrp1z;
	Wed, 10 Jul 2024 09:57:47 +0000 (GMT)
X-AuditID: b6c32a49-423b770000012b57-80-668e5b1caa98
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	30.7E.18846.B1B5E866; Wed, 10 Jul 2024 18:57:47 +0900 (KST)
Received: from INBRO002756 (unknown [107.122.12.5]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20240710095745epsmtip2c07bb2c951828ca997ea5075404d6dcb~g0Y4YURDq1828118281epsmtip2H;
	Wed, 10 Jul 2024 09:57:45 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'sunyeal.hong'" <sunyeal.hong@samsung.com>, "'Krzysztof Kozlowski'"
	<krzk@kernel.org>, "'Sylwester Nawrocki'" <s.nawrocki@samsung.com>,
	"'Chanwoo Choi'" <cw00.choi@samsung.com>, "'Michael Turquette'"
	<mturquette@baylibre.com>, "'Stephen Boyd'" <sboyd@kernel.org>, "'Rob
 Herring'" <robh@kernel.org>, "'Conor Dooley'" <conor+dt@kernel.org>
Cc: <linux-samsung-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <008201dad296$a904ea90$fb0ebfb0$@samsung.com>
Subject: RE: [PATCH v2 2/4] arm64: dts: exynos: add initial CMU clock nodes
 in Exynos Auto v920
Date: Wed, 10 Jul 2024 15:27:44 +0530
Message-ID: <019501dad2af$9e03a640$da0af2c0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJHtUpDsgLCeLIQdS8546uqgvLWdQIAh4UhAdGvMNoB/Od1kAIfmP8eAl0shoACR46YgrCxWO0A
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrOJsWRmVeSWpSXmKPExsWy7bCmpq5MdF+awbEJ4hZr9p5jsrj+5Tmr
	xfwj51gtzp/fwG6x6fE1VouPPfdYLS7vmsNmMeP8PiaLi6dcLf7v2cFucfhNO6vFv2sbWSya
	lq1ncuD1eH+jld1j06pONo/NS+o9+rasYvT4vEkugDUq2yYjNTEltUghNS85PyUzL91WyTs4
	3jne1MzAUNfQ0sJcSSEvMTfVVsnFJ0DXLTMH6EQlhbLEnFKgUEBicbGSvp1NUX5pSapCRn5x
	ia1SakFKToFJgV5xYm5xaV66Xl5qiZWhgYGRKVBhQnbG1mPzmAqWyVesXXeCvYHxgHQXIyeH
	hICJxPmPk9lAbCGB3YwS178mdDFyAdmfGCWe7tkHlQByHuwVg2m48WwSK0TRTkaJVd/WsUE4
	LxglPp97zghSxSagK7FjcRtYQkTgHpPEgx/tTCAOs8A6RonNM4+wg1RxClhJfP10FaxDWCBR
	4vOTCUwgNouAqsSh7fuYQWxeAUuJQy/fMELYghInZz5hAbGZBbQlli18zQxxk4LEz6fLWEFs
	EYEoiQt/5zNC1IhLvDwKsosLqGYPh8TTP5+hGlwktva8Y4WwhSVeHd/CDmFLSbzsb4OysyWO
	X5zFBmFXSHS3foSK20vsfHQT6AgOoAWaEut36UPs4pPo/f2ECSQsIcAr0dEmBFGtKtH87ioL
	hC0tMbG7G2qrh8T36w3sExgVZyH5bBaSz2Yh+WAWwrIFjCyrGCVTC4pz01OLTQsM81LL4RGe
	nJ+7iRGcgrU8dzDeffBB7xAjEwfjIUYJDmYlEd75N7rThHhTEiurUovy44tKc1KLDzGaAoN7
	IrOUaHI+MAvklcQbmlgamJiZmZlYGpsZKonzvm6dmyIkkJ5YkpqdmlqQWgTTx8TBKdXAVO+4
	6taqa9PORpZZPToQ8DqwqVB8d+UjvfecC+cktj3fnROillossqzHkuNP45fjexpv5Dyfa1gr
	ab9dwPbuoxVKkdMldhu/U/I/ffb4Iad/gpPMPE82+/672FD/2WBm4IM3XhZeax5qr+IqvcU/
	7+Hz/paLhW5/dR6eMe57E/Xs9ubaOrb7Ll7H/55mK/pte7JKMcdX5dsPhRd/mvLstknazl5w
	mGtGbqv4qrKQipZJrzJbvS4Uf5vysequ2yPHY2oyJZfv/a04JdihHvYqIFdE78lDpu85c49t
	nvO4SnxHWav8rZyrE7S4VthOZ6tWzVu6e6ue2/FY+YoDD805JBQn8ac21B2VYZS0E+d3U2Ip
	zkg01GIuKk4EACVWqBNKBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprNIsWRmVeSWpSXmKPExsWy7bCSvK50dF+awbVXOhZr9p5jsrj+5Tmr
	xfwj51gtzp/fwG6x6fE1VouPPfdYLS7vmsNmMeP8PiaLi6dcLf7v2cFucfhNO6vFv2sbWSya
	lq1ncuD1eH+jld1j06pONo/NS+o9+rasYvT4vEkugDWKyyYlNSezLLVI3y6BK+PFvCtMBU+k
	Ks7sPsLUwLhHtIuRk0NCwETixrNJrCC2kMB2RokXEwUg4tIS1zdOYIewhSVW/nvODlHzjFFi
	3w9uEJtNQFdix+I2NhBbROAJk8SlD+VdjFwczAKbGCXO7b7JBuIICfxlkrj98DAjSBWngJXE
	109XwWxhgXiJt4/eMYPYLAKqEoe27wOzeQUsJQ69fMMIYQtKnJz5hAXEZhbQlnh68ymcvWzh
	a2aI6xQkfj5dxgpxRZTEhb/zGSFqxCVeHj3CPoFReBaSUbOQjJqFZNQsJC0LGFlWMYqmFhTn
	pucmFxjqFSfmFpfmpesl5+duYgTHn1bQDsZl6//qHWJk4mA8xCjBwawkwjv/RneaEG9KYmVV
	alF+fFFpTmrxIUZpDhYlcV7lnM4UIYH0xJLU7NTUgtQimCwTB6dUA1Pv7u5cFwE7wZ2nkxnL
	e7T/WPcbL7BsvH7qe8j/ZadCvzSvuPhAo2LThRib1wu2/umNl9jkKbgodM7fgm91H80fz62K
	1szafTRjy5WI2pX1Py+KO9/wS3z0t+T0duapy1pm5rTvWbd/98sNxZHuLxZ43Ho049oWIUHG
	0rfWP8yTrNWvXmHIsA+4ufOlmOzzhs974vUEmm3XffC3mXpt7QYmo4nCC5XUTjfyM9zYJV8Z
	73Tx/amGvAU9fw5+Vf+9xGG/hecz/2tW6t+UNoUdiA2e8mevbWfEm9OMxZVFVtvUlp6VvPLg
	zoTNH73fei/c3dv+vPeV3Zmi5vBXe1+brMvbbXVBvMrMQOPDuYmxR869UmIpzkg01GIuKk4E
	AEduEP4uAwAA
X-CMS-MailID: 20240710095747epcas5p405037d30712d4ad4df1a6ff64d633a9b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240707231445epcas2p2cf78684e3cbcf8ed914a0d8e52115216
References: <20240707231331.3433340-1-sunyeal.hong@samsung.com>
	<CGME20240707231445epcas2p2cf78684e3cbcf8ed914a0d8e52115216@epcas2p2.samsung.com>
	<20240707231331.3433340-3-sunyeal.hong@samsung.com>
	<000101dad126$b964e2d0$2c2ea870$@samsung.com>
	<000101dad26f$0d0fc0f0$272f42d0$@samsung.com>
	<015501dad271$30f54a10$92dfde30$@samsung.com>
	<008201dad296$a904ea90$fb0ebfb0$@samsung.com>



> -----Original Message-----
> From: sunyeal.hong <sunyeal.hong=40samsung.com>
> Sent: Wednesday, July 10, 2024 12:29 PM
> To: 'Alim Akhtar' <alim.akhtar=40samsung.com>; 'Krzysztof Kozlowski'
> <krzk=40kernel.org>; 'Sylwester Nawrocki' <s.nawrocki=40samsung.com>;
> 'Chanwoo Choi' <cw00.choi=40samsung.com>; 'Michael Turquette'
> <mturquette=40baylibre.com>; 'Stephen Boyd' <sboyd=40kernel.org>; 'Rob
> Herring' <robh=40kernel.org>; 'Conor Dooley' <conor+dt=40kernel.org>
> Cc: linux-samsung-soc=40vger.kernel.org; linux-clk=40vger.kernel.org;
> devicetree=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org; lin=
ux-
> kernel=40vger.kernel.org
> Subject: RE: =5BPATCH v2 2/4=5D arm64: dts: exynos: add initial CMU clock=
 nodes
> in Exynos Auto v920
>=20
> Hello Alim,
>=20
> > -----Original Message-----
> > From: Alim Akhtar <alim.akhtar=40samsung.com>
> > Sent: Wednesday, July 10, 2024 11:31 AM
> > To: 'sunyeal.hong' <sunyeal.hong=40samsung.com>; 'Krzysztof Kozlowski'
> > <krzk=40kernel.org>; 'Sylwester Nawrocki' <s.nawrocki=40samsung.com>;
> > 'Chanwoo Choi' <cw00.choi=40samsung.com>; 'Michael Turquette'
> > <mturquette=40baylibre.com>; 'Stephen Boyd' <sboyd=40kernel.org>; 'Rob
> > Herring' <robh=40kernel.org>; 'Conor Dooley' <conor+dt=40kernel.org>
> > Cc: linux-samsung-soc=40vger.kernel.org; linux-clk=40vger.kernel.org;
> > devicetree=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org;
> > linux- kernel=40vger.kernel.org
> > Subject: RE: =5BPATCH v2 2/4=5D arm64: dts: exynos: add initial CMU clo=
ck
> > nodes in Exynos Auto v920
> >
> > Hello Sunyeal,
> >
> > > -----Original Message-----
> > > From: sunyeal.hong <sunyeal.hong=40samsung.com>
> > >
> > =5Bsnip=5D
> > > > Subject: RE: =5BPATCH v2 2/4=5D arm64: dts: exynos: add initial CMU
> > > > clock nodes in Exynos Auto v920
> > > >
> > > >
> > > >
> > > > > -----Original Message-----
> > > > > From: Sunyeal Hong <sunyeal.hong=40samsung.com>
> > > > > Sent: Monday, July 8, 2024 4:43 AM
> > > > > To: Krzysztof Kozlowski <krzk=40kernel.org>; Sylwester Nawrocki
> > > > > <s.nawrocki=40samsung.com>; Chanwoo Choi
> > > <cw00.choi=40samsung.com>; Alim
> > > > > Akhtar <alim.akhtar=40samsung.com>; Michael Turquette
> > =5BSnip=5D
> > > > > +		cmu_peric0: clock-controller=4010800000 =7B
> > > > > +			compatible =3D =22samsung,exynosautov920-
> cmu-
> > > > > peric0=22;
> > > > > +			reg =3D <0x10800000 0x8000>;
> > > > Please cross check the size of the register range, this looks to
> > > > be more then what is needed.
> > > >
> > > In the case of preic0, the size is up to 0x7088. The CMU block SFR
> > > area of =E2=80=8B=20ExynosAuto=20v920=20is=20generally=20specified=20=
up=20to=200x8000.=20There=0D=0A>=20>=20>=20are=20differences=20for=20each=
=20block,=20but=20the=20settings=20are=20the=20same.=0D=0A>=20>=20>=20Do=20=
you=20think=20it=20is=20necessary=20to=20change=20the=20actual=20size=20of=
=20each=20block?=0D=0A>=20>=20To=20avoid=20any=20overlap=20between=20differ=
ence=20SFR=20region,=20better=20to=20mention=0D=0A>=20>=20the=20exact=20siz=
e=20of=20the=20SFR=20region.=0D=0A>=20>=0D=0A>=20In=20ExynosAuto,=20the=20S=
FR=20of=20each=20block=20has=20an=20offset=20of=200x10000.=20So=20I=20don't=
=0D=0A>=20think=20SFR=20will=20be=20overlapped.=0D=0A>=20In=20the=20case=20=
of=20CMU=20SFR,=20there=20is=20no=20size=20over=200x8000,=20so=20I=20think=
=20it=20would=20be=0D=0A>=20better=20to=20maintain=20that=20value.=0D=0A>=
=20Please=20give=20me=20your=20opinion=20again.=0D=0AOk,=20you=20keep=20siz=
e=20as=200x8000=0D=0A=0D=0A>=20>=20=5Bsnip=5D=0D=0A>=20>=20>=20>=20>=20--=
=0D=0A>=20>=20>=20>=20>=202.45.2=0D=0A>=20>=20>=20>=0D=0A>=20>=20>=20>=0D=
=0A>=20>=20>=0D=0A>=20>=20>=20Please=20review=20my=20answer=20again.=0D=0A>=
=20>=20>=0D=0A>=20>=20>=20Thanks,=0D=0A>=20>=20>=20Sunyeal=20Hong=0D=0A>=20=
>=20>=0D=0A>=20>=0D=0A>=20>=0D=0A>=20=0D=0A>=20Thanks,=0D=0A>=20Sunyeal=20H=
ong=0D=0A>=20=0D=0A=0D=0A=0D=0A
