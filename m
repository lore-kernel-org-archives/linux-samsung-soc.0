Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9438F6C
	for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Jul 2024 02:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720578663; cv=none; b=InxHFOnKnfQoqsuhrj3a3bb0tWWh2Z9FcBe+JKWrAuolv974LlW0ZSNklyhcdNN9xUrHb45J0aNRqounZRXhYrygHs+h5dFqQD1sBpwDAdBThyZaj6XiexLhoyHUnC/hsqBupZLlnCegE8Qbp76/NvrlYhV7McZQWS1ncCWCdZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720578663; c=relaxed/simple;
	bh=mwptTxn28rWfskx29dt0gAdAArH0YgrYTZ4PFdnUQvg=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=JSdzI1pL0XhNxkmOQzP6CzIH/sqhDzeQTADGNLC10x1vLx78/qwAmudCcEfhVIm0Dmv0hmY/mIqUP2HKqHgt5Bt2RlJodlBUPjiOw4lBdcCMj1Xc0JdfE3zc50lxXvwEXmV/tfBivEBtctcn4eAU0mm/En58ORXI1b/zuQDyUwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=FmU5MR1L; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="FmU5MR1L"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20240710023059epoutp03695bf93cf42f83ad8ab4de92441ffade~guSymSFsJ0226402264epoutp03d
	for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Jul 2024 02:30:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20240710023059epoutp03695bf93cf42f83ad8ab4de92441ffade~guSymSFsJ0226402264epoutp03d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1720578659;
	bh=7tI7JoXgIfZYsfc1JpDRCyPoQBSqkIdfe1GtbFGzetE=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=FmU5MR1LTP1WzD1XNerB8zpxkytEQAPlP8JC1SxhxhaeUMWuIR/41cDddZ+TkT04a
	 /9KCruAgI7pWOSIcvjYDtA4/oOsj1Ne67I9Z0Lk03uCKYxqCeAF2Lk2rhebDhfZ9YG
	 YaRzdM/V7RE/LmA7c4hp3VakD2EecDfM1zkScABY=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTP id
	20240710023058epcas5p36ff27ccd56ff18d23b3d95da28028c5c~guSyGoUy80882708827epcas5p3E;
	Wed, 10 Jul 2024 02:30:58 +0000 (GMT)
Received: from epsmgec5p1new.samsung.com (unknown [182.195.38.180]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4WJhg4555Nz4x9QH; Wed, 10 Jul
	2024 02:30:56 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
	epsmgec5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	9F.26.07307.062FD866; Wed, 10 Jul 2024 11:30:56 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20240710023056epcas5p204fb5e155dab6395575b8717c06b247e~guSv844VM2654026540epcas5p2a;
	Wed, 10 Jul 2024 02:30:56 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240710023056epsmtrp16e0a30e21faf4d1459a6086c71b80424~guSv3IO3l0814108141epsmtrp1P;
	Wed, 10 Jul 2024 02:30:56 +0000 (GMT)
X-AuditID: b6c32a44-18dff70000011c8b-0f-668df2606012
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	0A.1B.19057.F52FD866; Wed, 10 Jul 2024 11:30:55 +0900 (KST)
Received: from INBRO002756 (unknown [107.122.12.5]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20240710023054epsmtip197c5c0bffc05c8219462aa9035e0b578~guSuC5OFx2525925259epsmtip1D;
	Wed, 10 Jul 2024 02:30:54 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'sunyeal.hong'" <sunyeal.hong@samsung.com>, "'Krzysztof Kozlowski'"
	<krzk@kernel.org>, "'Sylwester Nawrocki'" <s.nawrocki@samsung.com>,
	"'Chanwoo Choi'" <cw00.choi@samsung.com>, "'Michael Turquette'"
	<mturquette@baylibre.com>, "'Stephen Boyd'" <sboyd@kernel.org>, "'Rob
 Herring'" <robh@kernel.org>, "'Conor Dooley'" <conor+dt@kernel.org>
Cc: <linux-samsung-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <000101dad26f$0d0fc0f0$272f42d0$@samsung.com>
Subject: RE: [PATCH v2 2/4] arm64: dts: exynos: add initial CMU clock nodes
 in Exynos Auto v920
Date: Wed, 10 Jul 2024 08:00:52 +0530
Message-ID: <015501dad271$30f54a10$92dfde30$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJHtUpDsgLCeLIQdS8546uqgvLWdQIAh4UhAdGvMNoB/Od1kAIfmP8esNYBDcA=
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJJsWRmVeSWpSXmKPExsWy7bCmlm7Cp940g+vX1SzW7D3HZHH9y3NW
	i/lHzrFanD+/gd1i0+NrrBYfe+6xWlzeNYfNYsb5fUwWF0+5Wvzfs4Pd4vCbdlaLf9c2slg0
	LVvP5MDr8f5GK7vHplWdbB6bl9R79G1ZxejxeZNcAGtUtk1GamJKapFCal5yfkpmXrqtkndw
	vHO8qZmBoa6hpYW5kkJeYm6qrZKLT4CuW2YO0IlKCmWJOaVAoYDE4mIlfTubovzSklSFjPzi
	Elul1IKUnAKTAr3ixNzi0rx0vbzUEitDAwMjU6DChOyMhc3TmQve8lRcbW1hbmCcy93FyMkh
	IWAisXj3ApYuRi4OIYHdjBItJ5ezQzifGCU+dcyAcr4xSrzq3s4K07Kr+QozRGIvo8SPHfeh
	+l8wSkzYtQmsik1AV2LH4jY2kISIwD0miQc/2plAHGaBdYwSm2ceYQep4hSwkri38wILiC0s
	kCjx+ckEJhCbRUBVYs+MFmYQm1fAUmLRrlWsELagxMmZT8DqmQW0JZYtfM0McZOCxM+ny8Bq
	RAT8JI5tOM8MUSMu8fLoEbAnJAQOcEhcO/4cqsFF4uO6Y0wQtrDEq+Nb2CFsKYmX/W1QdrbE
	8Yuz2CDsConu1o9QcXuJnY9uAh3BAbRAU2L9Ln2IXXwSvb+fMIGEJQR4JTrahCCqVSWa311l
	gbClJSZ2d0OD0UPi+/UG9gmMirOQfDYLyWezkHwwC2HZAkaWVYySqQXFuempyaYFhnmp5fAo
	T87P3cQITsNaLjsYb8z/p3eIkYmD8RCjBAezkgjv/BvdaUK8KYmVValF+fFFpTmpxYcYTYHB
	PZFZSjQ5H5gJ8kriDU0sDUzMzMxMLI3NDJXEeV+3zk0REkhPLEnNTk0tSC2C6WPi4JRqYJqT
	tX7xjpL/Qq9bdq7tmWc5t/VEjlJ97tGJPW9TgtvOJ85KP+3+/ZZmRNifWz80e3PXiDFPuWL7
	fEOk0sllEVtuaa46Jr6x69/RlHeS/k4bN3GK8n+P3pNVG9D7+Ni+BzdfJP1zVz/y4sS6/y0d
	+35Ka/bWdSvsNfe+u9NMk71ykvAb794DG+9w9xtzvrH1XFTMxOC5bfk+ZetGD9XzLmKHHaxk
	RMXLw4pqJTyVpVZP297pp//tH0fw6XQd3gzFzR7/7kmuur5eaU/eg+e2YT9eTHqUwr+xvXET
	87YfHxPeGugc/iLZyLNQg6GceeeKYo24cy8mt+WdbRVJevlltpLXVRXzK7dW2jy6/OBkf5QS
	S3FGoqEWc1FxIgDSh8hyTAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprPIsWRmVeSWpSXmKPExsWy7bCSnG7Cp940g7U6Fmv2nmOyuP7lOavF
	/CPnWC3On9/AbrHp8TVWi48991gtLu+aw2Yx4/w+JouLp1wt/u/ZwW5x+E07q8W/axtZLJqW
	rWdy4PV4f6OV3WPTqk42j81L6j36tqxi9Pi8SS6ANYrLJiU1J7MstUjfLoEro/HoVtaCx1wV
	l1eJNzDu4Ohi5OSQEDCR2NV8hbmLkYtDSGA3o8SbuW+YIBLSEtc3TmCHsIUlVv57zg5R9IxR
	4tXW76wgCTYBXYkdi9vYQGwRgSdMEpc+lIMUMQtsYpQ4t/smG0THQiaJxdMPg43lFLCSuLfz
	AguILSwQL/H20TtmEJtFQFViz4wWMJtXwFJi0a5VrBC2oMTJmU/A6pkFtCWe3nwKZy9b+JoZ
	4jwFiZ9Pl7FCXOEncWzDeWaIGnGJl0ePsE9gFJ6FZNQsJKNmIRk1C0nLAkaWVYySqQXFuem5
	xYYFRnmp5XrFibnFpXnpesn5uZsYwXGopbWDcc+qD3qHGJk4GA8xSnAwK4nwzr/RnSbEm5JY
	WZValB9fVJqTWnyIUZqDRUmc99vr3hQhgfTEktTs1NSC1CKYLBMHp1QD0+VvucsS9QXvOD+Z
	karVtrLnx52Y9ZKKwdafBNa8yNoc9/oZ55nagvcMe76xJsrM/DF97faNx/svHrPw9pVSmCrg
	aZP78OPLWZpbs/nV3U+KFFofTJLvP33WJk8iobRvppqiaKfu3znckmqv3O3a+iLnrO9T7vHg
	/j/dP8/S9ecfqSsyk64fNFz3ReFKuvdh6UnV2l38R++93V9w58IbqZVbNfh/yJ6duCWCeU3y
	M/YjNxIMuJb9vvjUqyFy01unr8ccee0SS///6rZoYvrxl23tq7N6K9SnMvoubJ4duKz+yKlo
	WZc1s/Lse0s/hAod9d5bpXDA3nXBS9H6RfeXGn3YcCnogdeRGfKnat2W1SixFGckGmoxFxUn
	AgA6w1ntMgMAAA==
X-CMS-MailID: 20240710023056epcas5p204fb5e155dab6395575b8717c06b247e
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

Hello Sunyeal,

> -----Original Message-----
> From: sunyeal.hong <sunyeal.hong=40samsung.com>
>=20
=5Bsnip=5D
> > Subject: RE: =5BPATCH v2 2/4=5D arm64: dts: exynos: add initial CMU clo=
ck
> > nodes in Exynos Auto v920
> >
> >
> >
> > > -----Original Message-----
> > > From: Sunyeal Hong <sunyeal.hong=40samsung.com>
> > > Sent: Monday, July 8, 2024 4:43 AM
> > > To: Krzysztof Kozlowski <krzk=40kernel.org>; Sylwester Nawrocki
> > > <s.nawrocki=40samsung.com>; Chanwoo Choi
> <cw00.choi=40samsung.com>; Alim
> > > Akhtar <alim.akhtar=40samsung.com>; Michael Turquette
=5BSnip=5D
> > > +		cmu_peric0: clock-controller=4010800000 =7B
> > > +			compatible =3D =22samsung,exynosautov920-cmu-
> > > peric0=22;
> > > +			reg =3D <0x10800000 0x8000>;
> > Please cross check the size of the register range, this looks to be
> > more then what is needed.
> >
> In the case of preic0, the size is up to 0x7088. The CMU block SFR area o=
f =E2=80=8B=0D=0A>=20ExynosAuto=20v920=20is=20generally=20specified=20up=20=
to=200x8000.=20There=20are=20differences=0D=0A>=20for=20each=20block,=20but=
=20the=20settings=20are=20the=20same.=0D=0A>=20Do=20you=20think=20it=20is=
=20necessary=20to=20change=20the=20actual=20size=20of=20each=20block?=0D=0A=
To=20avoid=20any=20overlap=20between=20difference=20SFR=20region,=20better=
=20to=20mention=20the=20exact=20size=20of=20the=20SFR=20region.=0D=0A=0D=0A=
=5Bsnip=5D=0D=0A>=20>=20>=20--=0D=0A>=20>=20>=202.45.2=0D=0A>=20>=0D=0A>=20=
>=0D=0A>=20=0D=0A>=20Please=20review=20my=20answer=20again.=0D=0A>=20=0D=0A=
>=20Thanks,=0D=0A>=20Sunyeal=20Hong=0D=0A>=20=0D=0A=0D=0A=0D=0A
