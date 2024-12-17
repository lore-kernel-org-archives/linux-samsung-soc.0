Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471B318035
	for <linux-samsung-soc@vger.kernel.org>; Tue, 17 Dec 2024 01:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734398976; cv=none; b=R3CA3qoqTOIfj5SFB1vKR0jLaPQrCJGOnv900ZW5tt3hNlgijM0SWV1n8mJ+XxHO2u0KJAw5ypqDQmdxB9anPe45l92GXGmjd4uMVjKEwRnUOsMGwpevqXWE9Hxfu6vvOdz3+QqXschbpQ5RJDRFNwTzfQdQPflySq0vHafNHHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734398976; c=relaxed/simple;
	bh=wpcHoOcYIOaa6emnw+AWzNeqd7KX+IW2SvptWOYO+v8=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=l9H0S6Xyn/TDM+m8v5uHKvKzR1zd7/k4qnHqM36qpJW8l3LffbXwEea5s6wYpwEUh0iEX4DOoxtYCkLA0QVHjv4MlenTEna5TKZzNEDBeXACUP1kDM/r+CX7Lm7qqB8d+Wbdf9tH3a98tNW83a4/YMsHd6BlL06DfomfV32Ejns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=QcQLKOJ3; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="QcQLKOJ3"
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20241217012931epoutp02f73aa495009aac3ef6dd00f0a3b0961c~R0qzZjuXi2582225822epoutp02H
	for <linux-samsung-soc@vger.kernel.org>; Tue, 17 Dec 2024 01:29:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20241217012931epoutp02f73aa495009aac3ef6dd00f0a3b0961c~R0qzZjuXi2582225822epoutp02H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1734398971;
	bh=UGmkPmQUidBIuYKKI9fgy8HdP95zF6NSlMy/pMEWJxU=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=QcQLKOJ3KmMnVisUpoWD9aB5sGSCohDrr8htjz6h+DQ/YOeW+hP+BVNXFoc2CnsFK
	 BCFPZz9NfVNFEQK7JbYFrQZqe/mKo5UMxzMWIB51Eu3LDa5WJZ/NH88O12QjRCKVho
	 dLn524oiAxLGlPBN4TNQWpPyPJUbsRYd8Orgt/S8=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTP id
	20241217012930epcas2p13a739f31a8ae2d882076e1f40a1a1798~R0qzAauE03081530815epcas2p1U;
	Tue, 17 Dec 2024 01:29:30 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.69]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4YBzkL0S7Wz4x9Q9; Tue, 17 Dec
	2024 01:29:30 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
	epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
	69.49.22105.9F3D0676; Tue, 17 Dec 2024 10:29:29 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20241217012929epcas2p143c323e728c1e22144579b7b827d4580~R0qxo5Rjr3081530815epcas2p1G;
	Tue, 17 Dec 2024 01:29:29 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20241217012929epsmtrp2047d7fd2a280f865e8912eb8b4016a55~R0qxoO4660834408344epsmtrp2H;
	Tue, 17 Dec 2024 01:29:29 +0000 (GMT)
X-AuditID: b6c32a47-fd1c970000005659-cd-6760d3f982ed
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	BD.4B.33707.9F3D0676; Tue, 17 Dec 2024 10:29:29 +0900 (KST)
Received: from KORCO078619 (unknown [10.229.8.183]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20241217012929epsmtip11ecba00ce3f580c8a57ce4d22c32be3f~R0qxXO2LM0333703337epsmtip16;
	Tue, 17 Dec 2024 01:29:29 +0000 (GMT)
From: =?utf-8?B?64KY7IaM7JuQL1NPV09OIE5B?= <sowon.na@samsung.com>
To: <robh@kernel.org>, <krzk@kernel.org>, <conor+dt@kernel.org>,
	<vkoul@kernel.org>, <alim.akhtar@samsung.com>, <kishon@kernel.org>
Cc: <krzk+dt@kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>
In-Reply-To: <20241118021009.2858849-1-sowon.na@samsung.com>
Subject: RE: [PATCH v3 0/3] Support ExynosAutov920 ufs phy driver
Date: Tue, 17 Dec 2024 10:29:29 +0900
Message-ID: <000001db5023$1ddaaf30$59900d90$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQEnffo+LGCDWdayZVn9ec1kNib2MAKN54LKtDzZ33A=
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprDJsWRmVeSWpSXmKPExsWy7bCmqe7PywnpBh339CwezNvGZrFm7zkm
	i/lHzrFaHG39z2zxctY9Novz5zewW1zeNYfNYsb5fUwW//fsYLfYeecEswOXx6ZVnWwefVtW
	MXp83iQXwByVbZORmpiSWqSQmpecn5KZl26r5B0c7xxvamZgqGtoaWGupJCXmJtqq+TiE6Dr
	lpkDdIuSQlliTilQKCCxuFhJ386mKL+0JFUhI7+4xFYptSAlp8C8QK84Mbe4NC9dLy+1xMrQ
	wMDIFKgwITvj/oOjrAVP+St6dl9ga2B8xtPFyMkhIWAi8ft4H0sXIxeHkMAORolJx5dBOZ8Y
	JTYcvsMM59x70MQI0/J9egMTRGIno8SryxfZIZwXjBKnzh5gBaliE3CUaHuwCGyWiEArUOLR
	LCCHg4NZoFZif6cJSA2ngI3E7M2r2EFsYaD6Oyc3s4HYLAKqEpsunwCbwytgKXH94WcWCFtQ
	4uTMJ2A2s4C2xLKFr5khLlKQ+Pl0GVi9iICVxLsfT5ghakQkZne2gb0gIbCUQ2Ji4w0WiAYX
	ida1vUwQtrDEq+Nb2CFsKYnP7/ayQdj5Eusf3oWyKyTuHvoP1WsvsejMT3aIXzQl1u/SBzEl
	BJQljtyCOo1PouPwX3aIMK9ER5sQRKOSRMf5OVBLJSRWvZjMNoFRaRaSx2YheWwWkgdmIexa
	wMiyilEstaA4Nz212KjAGB7Zyfm5mxjByVTLfQfjjLcf9A4xMnEwHmKU4GBWEuGtMYlNF+JN
	SaysSi3Kjy8qzUktPsRoCgzqicxSosn5wHSeVxJvaGJpYGJmZmhuZGpgriTOe691boqQQHpi
	SWp2ampBahFMHxMHp1QD0/Lkz0E6l7ON9R6Z+0s/kD1h/ijZNOBd16qnFRXcIm/WNk9b8PsN
	B8u3s10PZBirlvNPEZM4sqT9xbl5eq4Lp2udE/x3Q/xS7o/Hn2rZfj3apDux8mnmvZ5XGi+3
	W9YnLQ+/6n3mgNnxPS/Ee2Slb4uuZ7kjEK7GkscyxXR1V4ZTG3PoVP+sYMei53szTH2nR2dP
	UA+fZH+oaXnr2r+/cs5vu2pT2SreuyPNlHcqr7ofp8LiqfecFoTVXJ0wl3nCH+H/EwU35D79
	dOfD0pde54+YbEsMiq6bvqtw34V5WQuKT+eUm5zg3fbn9a4tEUdXbdGW1ohZk5yz8lTzc8NQ
	udbuVQpn3P+9Yb9hqLbg/j8lluKMREMt5qLiRAAjBZlALwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprHIsWRmVeSWpSXmKPExsWy7bCSnO7PywnpBid3iVk8mLeNzWLN3nNM
	FvOPnGO1ONr6n9ni5ax7bBbnz29gt7i8aw6bxYzz+5gs/u/ZwW6x884JZgcuj02rOtk8+ras
	YvT4vEkugDmKyyYlNSezLLVI3y6BK2PrnQ7GgsP8Fcu2bmNuYDzA08XIySEhYCLxfXoDUxcj
	F4eQwHZGiRVdS9khEhIS397sYYKwhSXutxxhhSh6xiixfP80ZpAEm4CjRNuDRSwgCRGBXkaJ
	8xNWs4AkmAUaGSUudrBBdAAljl1/zQaS4BSwkZi9eRXYCmGg7jsnN4PFWQRUJTZdPsEKYvMK
	WEpcf/iZBcIWlDg58wnUUG2JpzefwtnLFr5mhjhPQeLn02VgvSICVhLvfjxhhqgRkZjd2QZV
	YyrxdPI3Nph37j54yT6BUXQWkhWzkKyYhWTFLCSjFjCyrGIUTS0ozk3PTS4w1CtOzC0uzUvX
	S87P3cQIjkKtoB2My9b/1TvEyMTBeIhRgoNZSYS3xiQ2XYg3JbGyKrUoP76oNCe1+BCjNAeL
	kjivck5nipBAemJJanZqakFqEUyWiYNTqoEpndl/7+OFmWeVYjLMD0U81tkZWbuLSe3d9UdO
	jE8lOrVtmre+TNS2+y6upeGql6DBc+3h/Jf9IWKBzb/1OzsbV06Uttl3z1tiveFxV5vQ9f87
	Mh/fPP5u15vPyfzHnyZ+36C0JWDFEbFtS+bzqAY+snrG+d01Z+aPFO8lkTZTLX5+sX12x/G6
	+UNDfbPWo6lPAuVsXy83SHv7xUo5bep57eUKwVwlb3+4Ba6e+5B1OWvkQ1OX058PBB5I3Trr
	kdPetrM/z/205/pvduhje//7i4mPgzd2bpnBsTgo/VDNp++x7+7sbF73WmwSU/djDbZ1AaZx
	0jaZRYdXmRQZbZu9YN912a51Uy1EHvfNndCno8RSnJFoqMVcVJwIAOos6D4xAwAA
X-CMS-MailID: 20241217012929epcas2p143c323e728c1e22144579b7b827d4580
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241118021011epcas2p397736dd9e5c7d96d799716e09919c136
References: <CGME20241118021011epcas2p397736dd9e5c7d96d799716e09919c136@epcas2p3.samsung.com>
	<20241118021009.2858849-1-sowon.na@samsung.com>

Hi Krzysztof, Vinod,


> -----Original Message-----
> From: Sowon Na <sowon.na=40samsung.com>
> Sent: Monday, November 18, 2024 11:10 AM
> To: robh=40kernel.org; krzk=40kernel.org; conor+dt=40kernel.org;
> vkoul=40kernel.org; alim.akhtar=40samsung.com; kishon=40kernel.org
> Cc: krzk+dt=40kernel.org; linux-kernel=40vger.kernel.org;
> devicetree=40vger.kernel.org; linux-samsung-soc=40vger.kernel.org;
> sowon.na=40samsung.com
> Subject: =5BPATCH v3 0/3=5D Support ExynosAutov920 ufs phy driver
>=20
> This patchset introduces ExynosAuto v920 SoC ufs phy driver as Generic PH=
Y
> driver framework.
>=20
> Changes from v2:
> - simplify function name from samsung_exynosautov920_ufs_phy_wait_cdr_loc=
k
>   to exynosautov920_ufs_phy_wait_cdr_lock
> - return immediately after getting the CDR lock
> - add comment for wait CDR lock
>=20
> Changes from v1:
> - use exynosautov920 instead of exynosauto to specify
> - remove obvious comment
> - change soc name as ExynosAutov920 to keep consistent
> - use macros instead of magic numbers
> - specify function name
> - add error handling for CDR lock failure
>=20
> Sowon Na (3):
>   dt-bindings: phy: Add ExynosAutov920 UFS PHY bindings
>   phy: samsung-ufs: support ExynosAutov920 ufs phy driver
>   arm64: dts: exynosautov920: add ufs phy for ExynosAutov920 SoC
>=20
>  .../bindings/phy/samsung,ufs-phy.yaml         =7C   1 +
>  .../arm64/boot/dts/exynos/exynosautov920.dtsi =7C  11 ++
>  drivers/phy/samsung/Makefile                  =7C   1 +
>  drivers/phy/samsung/phy-exynosautov920-ufs.c  =7C 167 ++++++++++++++++++
>  drivers/phy/samsung/phy-samsung-ufs.c         =7C   9 +-
>  drivers/phy/samsung/phy-samsung-ufs.h         =7C   4 +
>  6 files changed, 190 insertions(+), 3 deletions(-)  create mode 100644
> drivers/phy/samsung/phy-exynosautov920-ufs.c
>=20
> --
> 2.45.2
>=20

I can't see these patches in -next, do let me know if anything is missing t=
o be addressed from myside.

Best regards,
Sowon Na.

