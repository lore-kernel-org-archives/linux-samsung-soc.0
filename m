Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3F223776
	for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Jul 2024 02:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720578897; cv=none; b=UCgF6b24JyszQ1MAVTi7imISw0LD7z1LF2E+7gHg+2GSs+RBZ5ReGWBt4QQnhBm+V5n6vBlTYvhvJst/WIkIV5JETQ0riLlqaniDmvNvIw3o8plsvVfqvIShlVfyJDfv39yZHlvBfBSeryMJAPEURLjL0arQ50ZK9s4mTvnJvyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720578897; c=relaxed/simple;
	bh=GQhZ9NiweAuXcUzMZDobgANyOOU4DoNB9IAhUaTU288=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=cvXlnhLH1yrZlug3DBT+ARpLRUJtjZVKckgUoAKzzaacHSQe/yxaxR8r6OufNzMGwYzyz/uRsqYEofkqQM0XpsbSd/mhpnY+PuikBu6JKzyhYstQlXOJQQrTyTvrsEo5q8RDLkcLFhx55hIgWNwJRoqjPz0AgL9JN2S6PFO4mk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=cxZCyDY8; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="cxZCyDY8"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20240710023453epoutp0301f82da768e7a0368e150d3352640f7e~guWNKe30t0773507735epoutp03L
	for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Jul 2024 02:34:53 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20240710023453epoutp0301f82da768e7a0368e150d3352640f7e~guWNKe30t0773507735epoutp03L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1720578893;
	bh=GQhZ9NiweAuXcUzMZDobgANyOOU4DoNB9IAhUaTU288=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=cxZCyDY8FdHvnGbWY4F+s4xcuNtZN5kuq1LzpaCKMDSTF0T+oVXgNoYC+CjDkC18Z
	 gNcOccN6U9b1DQ4lhrdU/zds2gMSPoZF0y9yTM9OJVKi4TmiwevbtBZFEWnXdM6Ewq
	 tO8XzR3Hh1iXEgY93Z9mjPy6Iurh0FSMQZ3IE4dc=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTP id
	20240710023453epcas5p1480efc2119468f7bee3f379b7fd6e9be~guWMx_ItE0967409674epcas5p1B;
	Wed, 10 Jul 2024 02:34:53 +0000 (GMT)
Received: from epsmges5p1new.samsung.com (unknown [182.195.38.181]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4WJhlb2Qzyz4x9Q2; Wed, 10 Jul
	2024 02:34:51 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
	epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	16.2A.11095.B43FD866; Wed, 10 Jul 2024 11:34:51 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20240710023450epcas5p144d272af968fa2897bd7a87f0e9d7b7a~guWKbAGgi0428204282epcas5p1Z;
	Wed, 10 Jul 2024 02:34:50 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240710023450epsmtrp12dd603a4386918c3f504e65c6d224533~guWKaHn8v0997209972epsmtrp1Y;
	Wed, 10 Jul 2024 02:34:50 +0000 (GMT)
X-AuditID: b6c32a49-423b770000012b57-30-668df34bfdce
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	9A.1C.18846.A43FD866; Wed, 10 Jul 2024 11:34:50 +0900 (KST)
Received: from INBRO002756 (unknown [107.122.12.5]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20240710023448epsmtip1bce226b48afaba14252ccadac227b492~guWIm4V5X2932829328epsmtip18;
	Wed, 10 Jul 2024 02:34:48 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'sunyeal.hong'" <sunyeal.hong@samsung.com>, "'Krzysztof Kozlowski'"
	<krzk@kernel.org>, "'Sylwester Nawrocki'" <s.nawrocki@samsung.com>,
	"'Chanwoo Choi'" <cw00.choi@samsung.com>, "'Michael Turquette'"
	<mturquette@baylibre.com>, "'Stephen Boyd'" <sboyd@kernel.org>, "'Rob
 Herring'" <robh@kernel.org>, "'Conor Dooley'" <conor+dt@kernel.org>
Cc: <linux-samsung-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <000201dad26f$b18c3690$14a4a3b0$@samsung.com>
Subject: RE: [PATCH v2 3/4] clk: samsung: clk-pll: Add support for pll_531x
Date: Wed, 10 Jul 2024 08:04:47 +0530
Message-ID: <015601dad271$bcd53e00$367fba00$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJHtUpDsgLCeLIQdS8546uqgvLWdQHhk3nlAbaaqcQDPX93AAGcPnKhsNHoffA=
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrOJsWRmVeSWpSXmKPExsWy7bCmpq735940g3ULBCzW7D3HZHH9y3NW
	i/lHzrFanD+/gd1i0+NrrBYfe+6xWlzeNYfNYsb5fUwWF0+5Wvzfs4Pd4vCbdlaLf9c2slg0
	LVvP5MDr8f5GK7vHplWdbB6bl9R79G1ZxejxeZNcAGtUtk1GamJKapFCal5yfkpmXrqtkndw
	vHO8qZmBoa6hpYW5kkJeYm6qrZKLT4CuW2YO0IlKCmWJOaVAoYDE4mIlfTubovzSklSFjPzi
	Elul1IKUnAKTAr3ixNzi0rx0vbzUEitDAwMjU6DChOyMeeeOsxT8FquY+PgfUwPjFuEuRk4O
	CQETiQu3ZjB1MXJxCAnsZpS482QOlPOJUeJo6z9GOKdvcicTTMvtCZNZIBI7GSXOfV/NDOG8
	YJS41NrCClLFJqArsWNxGxtIQkTgHpPEgx/tYIOZBdYxSmyeeYQdpIpTwEqi/U0zUDsHh7CA
	t8T71hyQMIuAqsT8L1+YQWxeAUuJlXeuskPYghInZz5hAbGZBbQlli18zQxxkoLEz6fLwBaL
	CPhJTD1+EapGXOLlUZBVXEA1Ozgktr06wgiyS0LAReL6XAWIXmGJV8e3sEPYUhIv+9ug7GyJ
	4xdnsUHYFRLdrR+h4vYSOx/dZAEZwyygKbF+lz7EKj6J3t9PmCCm80p0tAlBVKtKNL+7ygJh
	S0tM7O5mhbA9JA682cg0gVFxFpLHZiF5bBaSB2YhLFvAyLKKUTK1oDg3PbXYtMAwL7UcHuHJ
	+bmbGMEpWMtzB+PdBx/0DjEycTAeYpTgYFYS4Z1/oztNiDclsbIqtSg/vqg0J7X4EKMpMLQn
	MkuJJucDs0BeSbyhiaWBiZmZmYmlsZmhkjjv69a5KUIC6YklqdmpqQWpRTB9TBycUg1MMoJ1
	L8T39snrHatrYWm9fDzLrWbbah3bJa6rvrIt1PrfxbIztG3mezVvbg3GMi6doKCHHy9G+lRn
	XS1e+U/xqUQ7f7L9nQ7Ha6v/tj5u3OA72eO+xF+H4qsBCxZdmnl8pUSYPY8X7/sLHUfKZEJ3
	7plSyr/0WpqWH6vyrrVf9FSDH3Ff+Dyv9otqsqzS/fzsV9NbNd9wH1t5pK5d47FaibibuMAC
	pvwtxZOFFsSsnLVMoG5Z36kp7O6iGe/fH7zfYB/uf7lnocIsgxevb/77XXRJjmV/z5o31vfj
	GdUP2S4y3XJ938VFptEvRKXvPds/ccPCKws+sPfuUS1Z9nlXOR/bfs6jMhoG7oU7nmm8UGIp
	zkg01GIuKk4EAEObiUNKBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprDIsWRmVeSWpSXmKPExsWy7bCSnK7X5940gye/NS3W7D3HZHH9y3NW
	i/lHzrFanD+/gd1i0+NrrBYfe+6xWlzeNYfNYsb5fUwWF0+5Wvzfs4Pd4vCbdlaLf9c2slg0
	LVvP5MDr8f5GK7vHplWdbB6bl9R79G1ZxejxeZNcAGsUl01Kak5mWWqRvl0CV0bvhLNsBRPE
	Kn4d/MvcwHhcqIuRk0NCwETi9oTJLF2MXBxCAtsZJW78PskKkZCWuL5xAjuELSyx8t9zdoii
	Z4wSO4+eZAZJsAnoSuxY3MYGYosIPGGSuPShHKSIWWATo8S53TfZIDoWMklc2fEarINTwEqi
	/U0zkM3BISzgLfG+NQckzCKgKjH/yxewEl4BS4mVd66yQ9iCEidnPmEBsZkFtCWe3nwKZy9b
	CDFSQkBB4ufTZawQR/hJTD1+EapGXOLl0SPsExiFZyEZNQvJqFlIRs1C0rKAkWUVo2hqQXFu
	em5ygaFecWJucWleul5yfu4mRnAEagXtYFy2/q/eIUYmDsZDjBIczEoivPNvdKcJ8aYkVlal
	FuXHF5XmpBYfYpTmYFES51XO6UwREkhPLEnNTk0tSC2CyTJxcEo1MK2rn7WJOYXBMzlnFvOB
	jKJZz3KuR/or17Bu1Lwrojx/7R8J6SmRs3z6jW/xtKf/E13o98blupZNe+KfG8m5PQL/3hQH
	mwRNVD17cS9v4R7frM89qV2GpbNnnOjxyI+9Gzt5SShb9PMvd1V9Wqwj9rb2sBY+P+X4S3dL
	tqQKo/SaqJhLf1zvOeaqlQnffqXufsxpRd1txQ1/hC+/2J56KuTHslKva7tz/ou1ts6+f8fm
	IuuGeXzpLf3stv0V1g0zn1UmmUc/3crv8bHSZ7umVcb8poif3goLRX53hrHJP2FyndrgJSIy
	9fOapWd4pjq2TBeafq5y+corXKYZAZqaMsekeD79/GwQ927vAnFLJZbijERDLeai4kQAKJFF
	ni8DAAA=
X-CMS-MailID: 20240710023450epcas5p144d272af968fa2897bd7a87f0e9d7b7a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240707231445epcas2p18815fee7d176f63619d244d836ab64fc
References: <20240707231331.3433340-1-sunyeal.hong@samsung.com>
	<CGME20240707231445epcas2p18815fee7d176f63619d244d836ab64fc@epcas2p1.samsung.com>
	<20240707231331.3433340-4-sunyeal.hong@samsung.com>
	<000601dad12e$19ff3f30$4dfdbd90$@samsung.com>
	<000201dad26f$b18c3690$14a4a3b0$@samsung.com>

Hello Sunyeal,

> -----Original Message-----
> From: sunyeal.hong <sunyeal.hong=40samsung.com>
> Sent: Wednesday, July 10, 2024 7:50 AM
> To: 'Alim Akhtar' <alim.akhtar=40samsung.com>; 'Krzysztof Kozlowski'
> <krzk=40kernel.org>; 'Sylwester Nawrocki' <s.nawrocki=40samsung.com>;
> 'Chanwoo Choi' <cw00.choi=40samsung.com>; 'Michael Turquette'
> <mturquette=40baylibre.com>; 'Stephen Boyd' <sboyd=40kernel.org>; 'Rob
> Herring' <robh=40kernel.org>; 'Conor Dooley' <conor+dt=40kernel.org>
> Cc: linux-samsung-soc=40vger.kernel.org; linux-clk=40vger.kernel.org;
> devicetree=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org; lin=
ux-
> kernel=40vger.kernel.org
> Subject: RE: =5BPATCH v2 3/4=5D clk: samsung: clk-pll: Add support for pl=
l_531x
>=20
> Hello Alim,
>=20
> > -----Original Message-----
> > From: Alim Akhtar <alim.akhtar=40samsung.com>
> > Sent: Monday, July 8, 2024 8:58 PM
> > To: 'Sunyeal Hong' <sunyeal.hong=40samsung.com>; 'Krzysztof Kozlowski'
> > <krzk=40kernel.org>; 'Sylwester Nawrocki' <s.nawrocki=40samsung.com>;
> > 'Chanwoo Choi' <cw00.choi=40samsung.com>; 'Michael Turquette'
> > <mturquette=40baylibre.com>; 'Stephen Boyd' <sboyd=40kernel.org>; 'Rob
> > Herring' <robh=40kernel.org>; 'Conor Dooley' <conor+dt=40kernel.org>
> > Cc: linux-samsung-soc=40vger.kernel.org; linux-clk=40vger.kernel.org;
> > devicetree=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org;
> > linux- kernel=40vger.kernel.org
> > Subject: RE: =5BPATCH v2 3/4=5D clk: samsung: clk-pll: Add support for
> > pll_531x
> >
> > Hello Sunyeal,
> >
> > > -----Original Message-----
> > > From: Sunyeal Hong <sunyeal.hong=40samsung.com>
> > > Sent: Monday, July 8, 2024 4:44 AM
> > > To: Krzysztof Kozlowski <krzk=40kernel.org>; Sylwester Nawrocki
> > > <s.nawrocki=40samsung.com>; Chanwoo Choi
> <cw00.choi=40samsung.com>; Alim
> > > Akhtar <alim.akhtar=40samsung.com>; Michael Turquette
> > > <mturquette=40baylibre.com>; Stephen Boyd <sboyd=40kernel.org>; Rob
> > > Herring <robh=40kernel.org>; Conor Dooley <conor+dt=40kernel.org>
> > > Cc: linux-samsung-soc=40vger.kernel.org; linux-clk=40vger.kernel.org;
> > > devicetree=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org;
> > > linux- kernel=40vger.kernel.org; Sunyeal Hong
> > > <sunyeal.hong=40samsung.com>
> > > Subject: =5BPATCH v2 3/4=5D clk: samsung: clk-pll: Add support for
> > > pll_531x
> > >
> > > pll531x PLL is used in Exynos Auto v920 SoC for shared pll.
> > > pll531x: Integer/fractional PLL with mid frequency FVCO (800 to 3120
> > > MHz)
> > >
> > > PLL531x
> > > FOUT =3D (MDIV + F/2=5E32-F=5B31=5D) * FIN/(PDIV x 2=5ESDIV)
> > >
> > Any reason for not mentioning equation for integer PLL?
> >
> If the F value is 0, it operates as an integer PLL.
Thanks for clarification, it is good to mention the same in the commit mess=
age.=20

=5Bsnip=5D
> > > --
> > > 2.45.2
> >
>=20


