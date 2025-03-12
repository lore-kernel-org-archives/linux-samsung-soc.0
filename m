Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0572222D6
	for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Mar 2025 09:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741770662; cv=none; b=oiHJI9l5jgaj5I1HpA7zwRt7q/AbmW4TorahkHW1P23mHjdcsd0N3dhJWcIneureQSKRaPEFSffB7VnD7Pmqy8EMQeyJBCxnk2R8WBw+tK9qJd+7z4Q7yL1YB9TzceIcDbNEpEu2J78Riuv7UG8NdJQf9/SrU5Emy3b+ufeqwy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741770662; c=relaxed/simple;
	bh=ibaXYPJKAhgwDwiXhVw8vdLoNbsbT6IikHyYR6E5xn8=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=t5uSqW12YFWQ4ZXvjYUHwm07kSgB3VegAa75cQfH2l0TH54dpxjbZyMCGzuLs6PqZFFVBfOVXkDyjirgjbhtDqYaNw38p5CxnPVVQYU/N3Drc0QXCuueEPug2axRXrLVAhPC2iQJ5C+4yCb2px/mCy6VzfIADzA68VD5SoBbtEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=VHiitqKh; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="VHiitqKh"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250312091058epoutp01498aa1a0b9a21672b1d11fb3b8e4169d~sAy98AvzN1174211742epoutp01F
	for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Mar 2025 09:10:58 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250312091058epoutp01498aa1a0b9a21672b1d11fb3b8e4169d~sAy98AvzN1174211742epoutp01F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1741770658;
	bh=JBa3dWFTD4SwgzxaWlFjlLz2e9bTlCRMLs4NNSBs44c=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=VHiitqKhcd32mvFwCzLdP4ddK2SIxAnZdOm6NnHNUsUkOtULZHhA4Y9QefflzqnVs
	 6HphhN5PC/xlUsZjL48+mTr1niocEB35xsS/Ngdn7fbsNzyow4lylDxwrwjvGWeST8
	 PkfGdRiTK5RW4Gr9KUa+QUWIPH7k88nh8Kf2qoKg=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTP id
	20250312091057epcas5p1de3ff8e28c0a711a6b79cfc56a535319~sAy9bP8Ru1919219192epcas5p1U;
	Wed, 12 Mar 2025 09:10:57 +0000 (GMT)
Received: from epsmges5p1new.samsung.com (unknown [182.195.38.181]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4ZCPxX098Tz4x9Pv; Wed, 12 Mar
	2025 09:10:56 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
	epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	A8.D9.20052.F9F41D76; Wed, 12 Mar 2025 18:10:55 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250312080817epcas5p1dcbafc369e65dbc9d0650dd2130f56e8~r-8PCtO980056700567epcas5p19;
	Wed, 12 Mar 2025 08:08:17 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250312080817epsmtrp172c94cadcd06d4a364afd8fef20551c8~r-8PBx_m92458424584epsmtrp1g;
	Wed, 12 Mar 2025 08:08:17 +0000 (GMT)
X-AuditID: b6c32a49-3d20270000004e54-e4-67d14f9fdbd2
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	72.CC.33707.0F041D76; Wed, 12 Mar 2025 17:08:16 +0900 (KST)
Received: from INBRO000519 (unknown [107.122.1.150]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250312080815epsmtip1851e3f39ebbf9dc070a9380d37eca7f4~r-8NKkUMq0762707627epsmtip15;
	Wed, 12 Mar 2025 08:08:15 +0000 (GMT)
From: "Faraz Ata" <faraz.ata@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, <alim.akhtar@samsung.com>,
	<dev.tailor@samsung.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>
Cc: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<rosa.pila@samsung.com>, <suyash.bitti@samsung.com>,
	<abhijeet.s23@samsung.com>
In-Reply-To: <5b68a9c2-9145-4131-9fa3-10810c51691f@kernel.org>
Subject: RE: [PATCH 2/2] arm64: dts: exynos: Add DT node for all UART ports
Date: Wed, 12 Mar 2025 13:37:57 +0530
Message-ID: <2aa201db9325$e8ef6e00$bace4a00$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQG4o3GQyN7Zi1+oRuvV8B0XiEe7kQMf9tKjAMPydvECHTlbErOE+bag
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIJsWRmVeSWpSXmKPExsWy7bCmpu58/4vpBjt6LS2+djhbPJi3jc1i
	zd5zTBb3dixjt5h/5ByrxctZ99gszp/fwG6x6fE1VovLu+awWcw4v4/J4v+eHewWX34+YLaY
	Pb/Ggddj06pONo/NS+o9+rasYvT4vEkugCUq2yYjNTEltUghNS85PyUzL91WyTs43jne1MzA
	UNfQ0sJcSSEvMTfVVsnFJ0DXLTMH6DglhbLEnFKgUEBicbGSvp1NUX5pSapCRn5xia1SakFK
	ToFJgV5xYm5xaV66Xl5qiZWhgYGRKVBhQnbG3V+T2ApaOCqOPJrP3MA4n62LkZNDQsBEYuqt
	NiCbi0NIYDejxIa386CcT4wSd3u+MME5izetZ4Fpmbv2EzNEYiejxLTuc1AtLxklNs/8xwxS
	xSagKXHn81OwdhGBZYwSXSePgbUwCzxhlGj7Np0dpIpTwE6i6ccGVhBbWMBbYv6KHiYQm0VA
	VeLx9AlANgcHr4ClxPfFaiBhXgFBiZMzn4CdwSygLbFs4WtmiJMUJH4+XcYKUi4i4Caxawo3
	RIm4xMujR9hB1koIbOGQ+LnqKhNEvYvEi/tLoHqFJV4d38IOYUtJvOxvg7J9JCYf/cYIMlNC
	IEPizloRiLC9xOoFZ8BWMQP9uH6XPkRYVmLqqXVMEGv5JHp/P4HaxCuxYx6MrSxxcs8eVghb
	UuLQ7ResExiVZiF5bBaSx2Yh+WAWwrYFjCyrGCVTC4pz01OLTQsM81LL4RGenJ+7iRGcdrU8
	dzDeffBB7xAjEwfjIUYJDmYlEd7VthfShXhTEiurUovy44tKc1KLDzGaAgN7IrOUaHI+MPHn
	lcQbmlgamJiZmZlYGpsZKonzNu9sSRcSSE8sSc1OTS1ILYLpY+LglGpgilkRxWMzpYVfO8WJ
	n8VludkrpQczvyxadMF2aSen5oLPn2bnVn9Wn5StWOy/Xi6mx/l1GifP1U3LpSt79WTmbr8e
	YLQ8Q/eWfoj5meue9W3s227dDFiVJ9n1YOV8o22Gv8OXJP6uW3Z8V3zw/62vOdwDPRY8VXHd
	G+7z3bLVzOmgsTnfZqaZZtUcHHO2KSqsl/mul58R+ux9Tu/XrIeMs0I3TCu7olZ4+0b4xjf+
	zg92Fnsf///+X9u+stqSs9MPSy1LKO78I5HHLPhq7Zdz17fomz07JSzpdWiHLYPj0iOTbZxX
	r/g1+YheqcTFpowIu5z3uw0ndHxw+DJR/96DYnY5w0fyK+qP+88/UfNhvxJLcUaioRZzUXEi
	ALwnMEtEBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprKIsWRmVeSWpSXmKPExsWy7bCSnO5Hh4vpBv2iFl87nC0ezNvGZrFm
	7zkmi3s7lrFbzD9yjtXi5ax7bBbnz29gt9j0+BqrxeVdc9gsZpzfx2Txf88OdosvPx8wW8ye
	X+PA67FpVSebx+Yl9R59W1YxenzeJBfAEsVlk5Kak1mWWqRvl8CVcXPPQtaCd+wVO369ZWtg
	7GTrYuTkkBAwkZi79hNzFyMXh5DAdkaJE2efMEEkJCUOP73LCmELS6z895wdoug5o8Tezk9g
	RWwCmhJ3Pj9lAkmICKwBSqyaCjaKWeAVo8TNA3tYIFo+Mko0XJ7JCNLCKWAn0fRjA9hcYQFv
	ifkresBGsQioSjyePgHI5uDgFbCU+L5YDSTMKyAocXLmExYQm1lAW6L3YSsjjL1s4WtmiPMU
	JH4+XcYK0ioi4Caxawo3RIm4xMujR9gnMArPQjJpFpJJs5BMmoWkZQEjyypG0dSC4tz03OQC
	Q73ixNzi0rx0veT83E2M4JjTCtrBuGz9X71DjEwcjIcYJTiYlUR4V9teSBfiTUmsrEotyo8v
	Ks1JLT7EKM3BoiTOq5zTmSIkkJ5YkpqdmlqQWgSTZeLglGpgmqjT9/LBl63X3n1oCXkh9UxO
	zVvg7d2kvSFT3oY/EOtN1j8WuVm//vbG8BuiYk6eF9gu6+v+PrK/JPOov9aFCQ1bMmpMlzD1
	zWTb0sg4ZcW5vhO90krN+dX3unpdJJafNxVRviq1aGmT7ZTvQQESm6rk5uxJKnrMHVIsy/I9
	vefgBeWmiCd/Vy+L32HvsHPdFYO3vE+9JqsGNDC+KZ+6sypltWuGY4T922R2tpVXxaI3u+lY
	TDQUrFgqZtgeMv/1h10HCxhF2g/HT56YV2YnmPRLwYDlH8uVtjlnhDbbc1xyD7p4/7umunSz
	gtjcrujKN+LzWXZXG5mGbXY9td5txs4DL+bob6kRPrDnmZK+EktxRqKhFnNRcSIAau0YtygD
	AAA=
X-CMS-MailID: 20250312080817epcas5p1dcbafc369e65dbc9d0650dd2130f56e8
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250312061058epcas5p3ccf293213fe883129358833572b17d92
References: <20250312061932.1797993-1-faraz.ata@samsung.com>
	<CGME20250312061058epcas5p3ccf293213fe883129358833572b17d92@epcas5p3.samsung.com>
	<20250312061932.1797993-2-faraz.ata@samsung.com>
	<5b68a9c2-9145-4131-9fa3-10810c51691f@kernel.org>

Hello Krzysztof

> -----Original Message-----
> On 12/03/2025 07:19, Faraz Ata wrote:
> > Universal Serial Interface (USI) supports three serial protocol like
> > uart, i2c and spi. ExynosAutov920 has 18 instances of USI.
> > Add all the USI DT node and subsequent uart nodes for all the instances=
.
> >
> > Signed-off-by: Faraz Ata <faraz.ata=40samsung.com>
> > ---
> >  .../arm64/boot/dts/exynos/exynosautov920.dtsi =7C 494
> > ++++++++++++++++++
> >  1 file changed, 494 insertions(+)
>=20
>=20
> Please do not combine DTS changes with serial patches, ever. DTS has to g=
o
> via separate tree.
>=20
Sure, while sending v2, I will send DT separately and serial driver change =
separately.
Thanks for your review.
> ...
>=20
=2E
=2E
=2E
> > +
> > +
>=20
> Just one blank line.
Sure will correct in v2.=20

>=20
> >  		pwm: pwm=40109b0000 =7B
> >  			compatible =3D =22samsung,exynosautov920-pwm=22,
> >  				     =22samsung,exynos4210-pwm=22;
>=20
>=20
> Best regards,
> Krzysztof

