Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ECC410F4
	for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Nov 2024 05:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731993664; cv=none; b=tZj1IJQrNZ4a5KX+kP/ZS9Xv7I2OuZAMjHOPmeE8Ua/XyqBmP2NGi4XfizqTz4TcCSmzHtLCQgpunEiLzhC7Spnhm6DxrfVNlaiCAwE8tzIo6Mfp0TGfrQEDB/Yqu0by1Ev4NCdGfktA2gTA34H4GXbzb6eQCk40ozSAzKSVS4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731993664; c=relaxed/simple;
	bh=Ji+iTZt8yS5bcCcFKQv/QCaznbv75lDHxwCDMwX1RYs=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=UmcKfjs13cF8aGP4QKc+S2HAbTlLEpP4xZfO+keJAUEec5loCq/IJaNZ7b/NHf5YvgnJpxKvAF/POUJtVBOuTYBvNsEvGJAyF9DsvfY01wBatzD51elhq4nBN11lnDG6pcFPCyciE61L6Ex60Q1ZoNFXSRy0DVYBYG5947tvYAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=biypWUzb; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="biypWUzb"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20241119052052epoutp019671161b11073d49c578414a5a473aa1~JRwzx9_T11152211522epoutp01Z
	for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Nov 2024 05:20:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20241119052052epoutp019671161b11073d49c578414a5a473aa1~JRwzx9_T11152211522epoutp01Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1731993652;
	bh=KE2OfziJXtIhFb0dcW+ujlXzI19PnDvP6zbuStWt3Zs=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=biypWUzbKRuRcnb6FZWiJ9vh33BUspLWb/6t0XyqabGQhhEuOAVt1EMDEn5WFXT83
	 iMx7T4/X4hruWulhGXD982yuqrLu1XKcfY0SFxwR26fqH8426R0ZUbSUg7gJ93nmj/
	 KHRz5m8ovaWF+4eEjGQBFKmZ3e7vqBz0iEgyQXso=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTP id
	20241119052052epcas5p29d012eba4b1bbcef1f285c7d08141052~JRwzebd1E2178921789epcas5p2S;
	Tue, 19 Nov 2024 05:20:52 +0000 (GMT)
Received: from epsmges5p1new.samsung.com (unknown [182.195.38.174]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4XstB02Wlhz4x9QB; Tue, 19 Nov
	2024 05:20:40 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
	epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	03.E1.11160.8202C376; Tue, 19 Nov 2024 14:20:40 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20241119052039epcas5p2f7015f4b9c9e11b86a54c3943bc48ee2~JRwn-r_eh2177721777epcas5p2t;
	Tue, 19 Nov 2024 05:20:39 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20241119052039epsmtrp10824989f068cf5c82f9e975fe2ed019b~JRwn_1Lo_0501205012epsmtrp1d;
	Tue, 19 Nov 2024 05:20:39 +0000 (GMT)
X-AuditID: b6c32a49-c59fb70000012b98-e2-673c20283d46
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	65.E0.35203.7202C376; Tue, 19 Nov 2024 14:20:39 +0900 (KST)
Received: from INBRO002756 (unknown [107.122.12.5]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20241119052038epsmtip18d5e6db199b71aa93b0ca16e5b7a15ad~JRwmaVJBo1540115401epsmtip1V;
	Tue, 19 Nov 2024 05:20:38 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Sowon Na'" <sowon.na@samsung.com>, <robh@kernel.org>,
	<krzk@kernel.org>, <conor+dt@kernel.org>, <vkoul@kernel.org>,
	<kishon@kernel.org>
Cc: <krzk+dt@kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>,
	"'Krzysztof Kozlowski'" <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20241118021009.2858849-2-sowon.na@samsung.com>
Subject: RE: [PATCH v3 1/3] dt-bindings: phy: Add ExynosAutov920 UFS PHY
 bindings
Date: Tue, 19 Nov 2024 10:50:36 +0530
Message-ID: <000001db3a42$c5a79b70$50f6d250$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQKN54LK9wdlweRKh/1XLNX4aAwNFgFS5b/OAqaWsZ2xOOodYA==
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrFJsWRmVeSWpSXmKPExsWy7bCmuq6Ggk26wcMuQYs1e88xWcw/co7V
	4mjrf2aLl7PusVmcP7+B3WLv663sFpd3zWGzmHF+H5PF/z072C1+/zzEZLHzzglmB26PTas6
	2TzuXNvD5tG3ZRWjx+dNcgEsUdk2GamJKalFCql5yfkpmXnptkrewfHO8aZmBoa6hpYW5koK
	eYm5qbZKLj4Bum6ZOUBXKSmUJeaUAoUCEouLlfTtbIryS0tSFTLyi0tslVILUnIKTAr0ihNz
	i0vz0vXyUkusDA0MjEyBChOyM96eOc1esJGnYvfLWSwNjCe5uhg5OSQETCT2LFvB3MXIxSEk
	sJtRYl/TQ2aQhJDAJ0aJ4+s1IBLfGCV+/25lhel4dOI5G0RiL6PEopunWCCcF4wS03qns4FU
	sQnoSuxY3AZWJSIwkVFi+/O/TCAOs8BORomFc7uBHA4OTgEbiSPb/UEahAWCJRbM+A22m0VA
	VeLBwr1gg3gFLCUaXt9khbAFJU7OfMICYjMLaEssW/iaGeIkBYmfT5eB1YgIOElsO7WdDaJG
	XOLl0SPsIHslBFZySJzaOhOqwUVi4YeNUP8IS7w6voUdwpaSeNnfBmVnSxy/OIsNwq6Q6G79
	CBW3l9j56CYLyP3MApoS63fpQ+zik+j9/QTsLQkBXomONiGIalWJ5ndXWSBsaYmJ3d1QWz0k
	jt5YxzaBUXEWks9mIflsFpIPZiEsW8DIsopRMrWgODc9tdi0wDAvtRwe4cn5uZsYwYlWy3MH
	490HH/QOMTJxMB5ilOBgVhLhrda1ThfiTUmsrEotyo8vKs1JLT7EaAoM7onMUqLJ+cBUn1cS
	b2hiaWBiZmZmYmlsZqgkzvu6dW6KkEB6YklqdmpqQWoRTB8TB6dUAxPvuezWZ6/5z17TDVz6
	QbBuof1NpvNTGOufrL6XdtVy6uTjhvMZnl/WFZhboa7vwHW5rnz/vqJ5TM8O+0e5WCT8U2fb
	m357y66aWzxe0hNVvfJ3mJe/8q0xrhS7/bZmmZf4kwk5yZE6LQkxTJvPbDDb9GL+94iNq3Xy
	w+2dZVbzKTAcO/o1U2VH61tDi3DlZwzKb5aYi9ezKngvcJuUcCpcwW2O09t3Ww9dXRTl4Jnv
	YbO+JLEvUSl3W0LenhTzSFvjeOmozXzagkc0rDTDtmsdLtz+46ZqkdRXR1n/huw2za28l/Mn
	+f4Xu7LBYnKdTHTbnlvTTC3e3rf+Pn3pGwO2hvtXZrEdEDmotvQEsxJLcUaioRZzUXEiAFDN
	n4s9BAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprMIsWRmVeSWpSXmKPExsWy7bCSnK66gk26wd8DJhZr9p5jsph/5Byr
	xdHW/8wWL2fdY7M4f34Du8Xe11vZLS7vmsNmMeP8PiaL/3t2sFv8/nmIyWLnnRPMDtwem1Z1
	snncubaHzaNvyypGj8+b5AJYorhsUlJzMstSi/TtErgynnctZi/o4KmYvkezgXEeVxcjJ4eE
	gInEoxPP2boYuTiEBHYzShxq/scKkZCWuL5xAjuELSyx8t9zdoiiZ4wS3es3ghWxCehK7Fjc
	BtYtIjCdUWLfmh/MIA6zwF5GiV8nuqBagJzL018AORwcnAI2Eke2+4N0CwsESnRNOsAIYrMI
	qEo8WLiXDcTmFbCUaHh9kxXCFpQ4OfMJC4jNLKAt8fTmUzh72cLXzBDnKUj8fLoMrF5EwEli
	26ntbBA14hIvjx5hn8AoPAvJqFlIRs1CMmoWkpYFjCyrGCVTC4pz03OLDQsM81LL9YoTc4tL
	89L1kvNzNzGC401Lcwfj9lUf9A4xMnEwHmKU4GBWEuGt1rVOF+JNSaysSi3Kjy8qzUktPsQo
	zcGiJM4r/qI3RUggPbEkNTs1tSC1CCbLxMEp1cAkVTP301ET7bc3Jtlero79mrOE90kA+0aO
	a5p/tG9eLCvS9E5gW+Xb1FqhvvKpkhQf56niJT9Nalf/WG6j8//OkQcTl+Y1688KsZNeulRQ
	uPnxutPG8jOTT5oalM85lDvpynI7XoNVr+P14yY9+fnh2dwPubOn+dTaFnn23z33jcvQ9lRV
	2dPPskn2b2z0O4vPxwXMi/By/PdyYU7uGRY99uuHrL7NeyqwsbP/VfjKN0ZHHfldDjL2rSt8
	+F89zL55hcvkQBbWm79+H+pZ9daqadYPnnmFC09uUZhm4mVuvaw7suGE1fnJ+bwGloc56491
	/uxd8eVnReTvyZKB35euqtnSe5dv6cYqd3vdHdovlFiKMxINtZiLihMBAUpZTyYDAAA=
X-CMS-MailID: 20241119052039epcas5p2f7015f4b9c9e11b86a54c3943bc48ee2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241118021011epcas2p21593217ccf58afddad5ce36f510e7cb6
References: <20241118021009.2858849-1-sowon.na@samsung.com>
	<CGME20241118021011epcas2p21593217ccf58afddad5ce36f510e7cb6@epcas2p2.samsung.com>
	<20241118021009.2858849-2-sowon.na@samsung.com>



> -----Original Message-----
> From: Sowon Na <sowon.na=40samsung.com>
> Sent: Monday, November 18, 2024 7:40 AM
> To: robh=40kernel.org; krzk=40kernel.org; conor+dt=40kernel.org;
> vkoul=40kernel.org; alim.akhtar=40samsung.com; kishon=40kernel.org
> Cc: krzk+dt=40kernel.org; linux-kernel=40vger.kernel.org;
> devicetree=40vger.kernel.org; linux-samsung-soc=40vger.kernel.org;
> sowon.na=40samsung.com; Krzysztof Kozlowski
> <krzysztof.kozlowski=40linaro.org>
> Subject: =5BPATCH v3 1/3=5D dt-bindings: phy: Add ExynosAutov920 UFS PHY
> bindings
>=20
> Add samsung,exynosautov920-ufs-phy compatible for ExynosAuto v920 SoC.
>=20
> Signed-off-by: Sowon Na <sowon.na=40samsung.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski=40linaro.org>
> ---
I am not sure how we can help you, you are keep missing to collect all the =
tags
https://lkml.org/lkml/2024/11/7/617

>  Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml =7C 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml
> b/Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml
> index f402e31bf58d..d70ffeb6e824 100644
> --- a/Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml
> =40=40 -18,6 +18,7 =40=40 properties:
>        - google,gs101-ufs-phy
>        - samsung,exynos7-ufs-phy
>        - samsung,exynosautov9-ufs-phy
> +      - samsung,exynosautov920-ufs-phy
>        - tesla,fsd-ufs-phy
>=20
>    reg:
> --
> 2.45.2


