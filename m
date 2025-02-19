Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6839C1DDC11
	for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Feb 2025 11:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739963627; cv=none; b=U1eVzxxYrSl+om2ulHJRWYO17UAHDjslaRnjxZ9EAVpMC+FrCJNYF1RYJT5P9r6FVuHaVa2el5ai6sHBAbq05PNpET/1AH2z2DHs9vSMK1U0/UhcnHSMkbyYEAeovfwZRXwysGD4M09wJc8y/C/yG/FKiL3ohSTfoA9eVDsVma8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739963627; c=relaxed/simple;
	bh=0dMvZpkMqAf5szJMQQWz9hZIxQuXcUu2H3721CUqrQs=;
	h=From:To:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=RCcVopEfcGLziaypUmTrkYU1tFJs//qDbuF9C452tOSFod684BKSzl8q4EOGr/f8HwJYBZOYYPwp//HRovxNViCnSnY1gohBpTCrxHo3AdcZaILGlIS3IQYcvwX2myEjk8xpnIMRWXMX6F9ZQl/EV3TB4YrnqiTv923UnULAZxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=n6SRoUbC; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="n6SRoUbC"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250219111342epoutp031948f843b8f58c1850af0d74fec1635d~ll7ITr2N_0927709277epoutp03s
	for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Feb 2025 11:13:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250219111342epoutp031948f843b8f58c1850af0d74fec1635d~ll7ITr2N_0927709277epoutp03s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1739963622;
	bh=0dMvZpkMqAf5szJMQQWz9hZIxQuXcUu2H3721CUqrQs=;
	h=From:To:In-Reply-To:Subject:Date:References:From;
	b=n6SRoUbCj2+tD/mL42uRULbQbROD/zyrjQyHTvsBjyvx9nSOTq/lPIqaGWs0jiBWE
	 2b3L1PpiyrIxRtBCx4N3YtZzr8PF0Ri9GAXO4Fi0qqY+f5rPfOuJdARs7IHtJ+WPHa
	 t+hjMeGkUF0fMdpKldRUZaHCzg+KxTEvew3V03wY=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTP id
	20250219111341epcas5p2c4c156a585441c71a1d0353081da2f6c~ll7HmUk950392603926epcas5p28;
	Wed, 19 Feb 2025 11:13:41 +0000 (GMT)
Received: from epsmgec5p1new.samsung.com (unknown [182.195.38.178]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4YyYfq67llz4x9Pw; Wed, 19 Feb
	2025 11:13:39 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
	epsmgec5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	12.07.19710.3ECB5B76; Wed, 19 Feb 2025 20:13:39 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250219111339epcas5p14e032bd5012501f1d233b8b3d1ad6787~ll7FvMJNa0313203132epcas5p1q;
	Wed, 19 Feb 2025 11:13:39 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250219111339epsmtrp2e00d203ad34ab3cc0bda6149a7c59e4a~ll7FucTfk0712207122epsmtrp2F;
	Wed, 19 Feb 2025 11:13:39 +0000 (GMT)
X-AuditID: b6c32a44-36bdd70000004cfe-1b-67b5bce3a95f
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	54.DD.18729.3ECB5B76; Wed, 19 Feb 2025 20:13:39 +0900 (KST)
Received: from INBRO002756 (unknown [107.111.84.9]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250219111337epsmtip262aef9ade6732725607180a6f93f56e5~ll7EBMYyO0205602056epsmtip2q;
	Wed, 19 Feb 2025 11:13:37 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzysztof.kozlowski@linaro.org>, "'Peter
 Griffin'" <peter.griffin@linaro.org>, =?UTF-8?Q?'Andr=C3=A9_Draszik'?=
	<andre.draszik@linaro.org>, "'Tudor Ambarus'" <tudor.ambarus@linaro.org>,
	"'Rob Herring'" <robh@kernel.org>, "'Krzysztof	Kozlowski'"
	<krzk+dt@kernel.org>, "'Conor Dooley'" <conor+dt@kernel.org>,
	<linux-fsd@tesla.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <20250219085726.70824-1-krzysztof.kozlowski@linaro.org>
Subject: RE: [PATCH 1/2] arm64: dts: exynos: gs101: Change labels to
 lower-case
Date: Wed, 19 Feb 2025 16:43:36 +0530
Message-ID: <0a8c01db82bf$53954ee0$fabfeca0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQD7+/KmEPmGt2fnlavaRogKLr3OSgH4fj3DtP3Cb4A=
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMJsWRmVeSWpSXmKPExsWy7bCmuu7jPVvTDb4t0bfY8mozi8WaveeY
	LOYfOcdq8XLWPTaLva+3sltsenyN1eLhq3CLy7vmsFnMOL+PyWLDjH8sFv/37GC3+HQrzoHH
	Y9OqTjaPO9f2sHlsXlLv8a9pLrvH501yAaxR2TYZqYkpqUUKqXnJ+SmZeem2St7B8c7xpmYG
	hrqGlhbmSgp5ibmptkouPgG6bpk5QMcpKZQl5pQChQISi4uV9O1sivJLS1IVMvKLS2yVUgtS
	cgpMCvSKE3OLS/PS9fJSS6wMDQyMTIEKE7IzZr6awlSwjati57HD7A2MPzm7GDk5JARMJE5e
	6WTvYuTiEBLYzShx9/kjFgjnE6PEvx9LWSGcb4wSZxt/McO0PPjxmRkisZdR4tH+NqiWF4wS
	1+7dB6tiE9CV2LG4jQ0kISLwj1midckeNpAEp4CLxPOX/ewgtrBAoMS9eTNZQGwWAVWJXTvu
	MoLYvAKWEif2vGaGsAUlTs58AlbDLKAtsWzha6gzFCR+Pl3GCmKLCFhJrGm5zQRRIy7x8ugR
	sI8kBJZySByY9JMdosFFYsuFNywQtrDEq+NboOJSEp/f7WWDsKsl1m+YB1XTwSjRuL0GwraX
	2PnoJlCcA2iBpsT6XfoQu/gken8/YQIJSwjwSnS0CUFUq0o0v7sKNUVaYmJ3NyuE7SHxcNEu
	aJBOZ5To2PKUZQKjwiwkb85C8uYsJO/MQti8gJFlFaNkakFxbnpqsmmBYV5qOTzKk/NzNzGC
	U6+Wyw7GG/P/6R1iZOJgPMQowcGsJMLbVr8lXYg3JbGyKrUoP76oNCe1+BCjKTDsJzJLiSbn
	A5N/Xkm8oYmlgYmZmZmJpbGZoZI4b/POlnQhgfTEktTs1NSC1CKYPiYOTqkGpoDbrLKtcl2m
	6iuFDI+FB/6co9jWfzd7MfMut04ehoQn95c5XclbviEh6fm617wF8gtPZ0pMKxHKvGR31+HF
	vuoNC7aouJmUnv77//tp2X++T5ZoB2W9P6sV6Zcz+8u22o8PRHosbuw4PW3bkdu77IumTZVM
	Cnd8KX774fo9QTM+T//XW3zAKeTp6Yi0Vl3h/oKw7+waW7U/dL9e0zJt+ZNQlesam4xyP/pL
	+It2Pl32sfk2V+7WjS1vNrVNmpYzNd7yEzvjieP3tR9Ybdy1QPIzt7RmS1PQ/F+fv+7I2v/g
	009N9/C3Hyyin06dv0nWXnxK2oUHjq5vm56u2auWq29rJX3i80FZz92Mto/8JCWVWIozEg21
	mIuKEwGMfY6hRgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupjkeLIzCtJLcpLzFFi42LZdlhJXvfxnq3pBt3XBC22vNrMYrFm7zkm
	i/lHzrFavJx1j81i7+ut7BabHl9jtXj4Ktzi8q45bBYzzu9jstgw4x+Lxf89O9gtPt2Kc+Dx
	2LSqk83jzrU9bB6bl9R7/Guay+7xeZNcAGsUl01Kak5mWWqRvl0CV8bJLdOZCuZwVDzfupql
	gXEiexcjJ4eEgInEgx+fmbsYuTiEBHYzSrz4/5oJIiEtcX3jBKgiYYmV/56zQxQ9Y5ToW74G
	LMEmoCuxY3EbG4gtItDGIrFzYzZE0VRGifuvjzOCJDgFXCSev+wHaxAW8Jd4cWYv2AYWAVWJ
	XTvugtXwClhKnNjzmhnCFpQ4OfMJC4jNLKAt0fuwlRHGXrYQokZCQEHi59NlrBCLrSTWtNxm
	gqgRl3h59Aj7BEahWUhGzUIyahaSUbOQtCxgZFnFKJlaUJybnltsWGCYl1quV5yYW1yal66X
	nJ+7iREcZVqaOxi3r/qgd4iRiYPxEKMEB7OSCG9b/ZZ0Id6UxMqq1KL8+KLSnNTiQ4zSHCxK
	4rziL3pThATSE0tSs1NTC1KLYLJMHJxSDUyrvIzbxUWSl6tY71qj6GO/y9RhetbfJEvvaLaE
	+a/TNumukTF8fbNnperMrqklcsY9bVZy0zpeZV4tsPu09o/mcouQbh3hC6diX+yVdglatDyn
	+caJC48PHzzy5+71R2/WHu18zp1mmflvrcP+oD1fGvOVhf1nXb++tsFuRtti0bexS2KeM1qf
	3vKl7GB3sUSDdTuvQbJ4mtvbK5sZFv+vP+s9MVVP/Cv7dW8WK+vbVyxvt+T+X9R5mu2f8mnu
	sN1+HFEWLMttVgvou7Gn1Er8nNPRte+Y142E8nSbCfV/52z8yPFB9+TtjsuGEg5/GK9IST5u
	PsSjUD9Ze7lKcSz3xcUC7Lc9FP5WzS6sOarEUpyRaKjFXFScCACocSW/IQMAAA==
X-CMS-MailID: 20250219111339epcas5p14e032bd5012501f1d233b8b3d1ad6787
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250219085733epcas5p1daa87b1a68552e70bea4ae52f4bf1998
References: <CGME20250219085733epcas5p1daa87b1a68552e70bea4ae52f4bf1998@epcas5p1.samsung.com>
	<20250219085726.70824-1-krzysztof.kozlowski@linaro.org>

Hi Krzysztof

> -----Original Message-----
> From: Krzysztof Kozlowski <krzysztof.kozlowski=40linaro.org>
> Sent: Wednesday, February 19, 2025 2:27 PM
> To: Peter Griffin <peter.griffin=40linaro.org>; Andr=C3=A9=20Draszik=0D=
=0A>=20<andre.draszik=40linaro.org>;=20Tudor=20Ambarus=20<tudor.ambarus=40l=
inaro.org>;=0D=0A>=20Rob=20Herring=20<robh=40kernel.org>;=20Krzysztof=20Koz=
lowski=20<krzk+dt=40kernel.org>;=0D=0A>=20Conor=20Dooley=20<conor+dt=40kern=
el.org>;=20Alim=20Akhtar=0D=0A>=20<alim.akhtar=40samsung.com>;=20linux-fsd=
=40tesla.com;=20linux-arm-=0D=0A>=20kernel=40lists.infradead.org;=20linux-s=
amsung-soc=40vger.kernel.org;=0D=0A>=20devicetree=40vger.kernel.org;=20linu=
x-kernel=40vger.kernel.org=0D=0A>=20Cc:=20Krzysztof=20Kozlowski=20<krzyszto=
f.kozlowski=40linaro.org>=0D=0A>=20Subject:=20=5BPATCH=201/2=5D=20arm64:=20=
dts:=20exynos:=20gs101:=20Change=20labels=20to=20lower-case=0D=0A>=20=0D=0A=
>=20DTS=20coding=20style=20expects=20labels=20to=20be=20lowercase.=20=20No=
=20functional=20impact.=0D=0A>=20Verified=20with=20comparing=20decompiled=
=20DTB=20(dtx_diff=20and=20fdtdump+diff).=0D=0A>=20=0D=0A>=20Signed-off-by:=
=20Krzysztof=20Kozlowski=20<krzysztof.kozlowski=40linaro.org>=0D=0A>=20---=
=0D=0A=0D=0AReviewed-by:=20Alim=20Akhtar=20<alim.akhtar=40samsung.com>=0D=
=0A=0D=0A=0D=0A
