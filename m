Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B0B313537
	for <linux-samsung-soc@vger.kernel.org>; Fri, 29 Aug 2025 11:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756465465; cv=none; b=IZqquXBqAWJ6YQBglqostgRX66hek3O8193nzNrk3u064etvRN6AG2CmbXO8wPb3/nRO/pV4C0MspnzCvfut3Cd26jzkjpgNerB+E/eTW00xif9dO5AohDyR+0OFrZy6oVEeHN7sq+aIdcLOrDHDci97PdjoGhWH9UM8Cv3xna4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756465465; c=relaxed/simple;
	bh=7L7tIxp28iHdwGx+yyV8tn2ybILyzU3KKi9eUDFzJnQ=;
	h=From:To:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=UNXZbLnHucgkql2wWROnaafcZ3os9DKZN5vnyWcYbwiZc9EFZJoPttzPcEL0JpgZ8+QoB0mw2KyMwSyixTStd11pHSGMCNRyjjFw4b1TKMfqUFYtaOaGrMjIHXQkkBq+9LoiNBDzfdO0sEsSyIFrS8lxdrvX/YNjEnfQvyYZwcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=VORTWOy2; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="VORTWOy2"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250829110420epoutp014d42b279a0bd82fdfd69ef2162b16cee~gOAfI2gtA2346423464epoutp01j
	for <linux-samsung-soc@vger.kernel.org>; Fri, 29 Aug 2025 11:04:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250829110420epoutp014d42b279a0bd82fdfd69ef2162b16cee~gOAfI2gtA2346423464epoutp01j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756465460;
	bh=7L7tIxp28iHdwGx+yyV8tn2ybILyzU3KKi9eUDFzJnQ=;
	h=From:To:In-Reply-To:Subject:Date:References:From;
	b=VORTWOy224KaeLooY5g47tq5zVTcMTcGosppxHtcA4QJEbcxpjdptFnswY29OrEV/
	 A3CUi2jLxPWhrcmZV0m3Fkd/kEkfjS8uLKPABntkm/Cq/iK5nA3rTayTswacSo1yKI
	 u4dJEL8qxiyrbgr1J6cXsxU1GzqSFPzrpvJ2Ki7o=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250829110420epcas5p357d652ed6ae1444487ef4e97d369560e~gOAeocNpJ1820418204epcas5p3r;
	Fri, 29 Aug 2025 11:04:20 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.90]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4cCwPv3vfTz3hhT9; Fri, 29 Aug
	2025 11:04:19 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250829110418epcas5p183ad72839fc6cce33835ddf0c9bde53b~gOAdcM9D92447624476epcas5p1d;
	Fri, 29 Aug 2025 11:04:18 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250829110417epsmtip21ab963b0b3d34a58966d8d60e6db17c9~gOAb1AUNn0933009330epsmtip2e;
	Fri, 29 Aug 2025 11:04:17 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzysztof.kozlowski@linaro.org>, "'Ivaylo
 Ivanov'" <ivo.ivanov.ivanov1@gmail.com>, "'Rob Herring'" <robh@kernel.org>,
	"'Krzysztof Kozlowski'" <krzk+dt@kernel.org>, "'Conor Dooley'"
	<conor+dt@kernel.org>, "'Peter Griffin'" <peter.griffin@linaro.org>,
	=?UTF-8?Q?'Andr=C3=A9_Draszik'?= <andre.draszik@linaro.org>, "'Tudor
 Ambarus'" <tudor.ambarus@linaro.org>, <linux-fsd@tesla.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
In-Reply-To: <20250822121423.228500-8-krzysztof.kozlowski@linaro.org>
Subject: RE: [PATCH 4/4] arm64: dts: exynos2200: Add default GIC address
 cells
Date: Fri, 29 Aug 2025 16:34:16 +0530
Message-ID: <263c01dc18d4$aa870120$ff950360$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJyWVpz9P/Dzbtkobqw1IWAkgYZWwJZwFW7ARdQs12zMW310A==
Content-Language: en-us
X-CMS-MailID: 20250829110418epcas5p183ad72839fc6cce33835ddf0c9bde53b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250822121440epcas5p2d67b57b6b165f1f555bea881145cc9db
References: <20250822121423.228500-5-krzysztof.kozlowski@linaro.org>
	<CGME20250822121440epcas5p2d67b57b6b165f1f555bea881145cc9db@epcas5p2.samsung.com>
	<20250822121423.228500-8-krzysztof.kozlowski@linaro.org>

Hi Krzysztof

> -----Original Message-----
> From: Krzysztof Kozlowski <krzysztof.kozlowski=40linaro.org>
> Sent: Friday, August 22, 2025 5:44 PM
> To: Ivaylo Ivanov <ivo.ivanov.ivanov1=40gmail.com>; Rob Herring
> <robh=40kernel.org>; Krzysztof Kozlowski <krzk+dt=40kernel.org>; Conor
> Dooley <conor+dt=40kernel.org>; Alim Akhtar <alim.akhtar=40samsung.com>;
> Peter Griffin <peter.griffin=40linaro.org>; Andr=C3=A9=20Draszik=0D=0A>=
=20<andre.draszik=40linaro.org>;=20Tudor=20Ambarus=20<tudor.ambarus=40linar=
o.org>;=0D=0A>=20linux-fsd=40tesla.com;=20linux-arm-kernel=40lists.infradea=
d.org;=20linux-samsung-=0D=0A>=20soc=40vger.kernel.org;=20devicetree=40vger=
.kernel.org;=20linux-=0D=0A>=20kernel=40vger.kernel.org=0D=0A>=20Cc:=20Krzy=
sztof=20Kozlowski=20<krzysztof.kozlowski=40linaro.org>=0D=0A>=20Subject:=20=
=5BPATCH=204/4=5D=20arm64:=20dts:=20exynos2200:=20Add=20default=20GIC=20add=
ress=20cells=0D=0A>=20=0D=0A>=20Add=20missing=20address-cells=200=20to=20GI=
C=20interrupt=20node.=20=20Value=20'0'=20is=20correct=0D=0A>=20because=20GI=
C=20interrupt=20controller=20does=20not=20have=20children.=0D=0A>=20=0D=0A>=
=20Signed-off-by:=20Krzysztof=20Kozlowski=20<krzysztof.kozlowski=40linaro.o=
rg>=0D=0A>=20---=0D=0AReviewed-by:=20Alim=20Akhtar=20<alim.akhtar=40samsung=
.com>=0D=0A=0D=0A=0D=0A
