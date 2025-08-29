Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A84722759C
	for <linux-samsung-soc@vger.kernel.org>; Fri, 29 Aug 2025 11:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756465413; cv=none; b=swaLRV6qICft5JyHEntcYwQtXxByYmgJwy5jj9sH1JaBHlhsdeo57xMvcmGdYRJRgvdKPb3WomJ/XEYT2Y0MmpjoKnemMxzpADDJsCCqToR+FpORw+OqKhfIRP9hcDe7XrBTmqKoLsgDurzA/gdmjWXhiP1EyIqXQ4LPQ+Cb7LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756465413; c=relaxed/simple;
	bh=sAfD61YI+xTSkIVMTjkTgZzonnwDmHjumiBkhLo5bV8=;
	h=From:To:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=XiXTi9xFZNm4O06PKO79qmw0cM8VSWyJN3pX3ZWZ1aGXDhzE97TqLgQaJ5kA1Hu/Md2K6NJR7JfKaOUff+Au7X4WW/QNhG0x7bfenZrKEUCWBe3x8icyw0J/3APuX+sro4aXLdkN6QnKwxijxwk4ZD0uFtwq9gNVsPn3Kud9Nj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=n9jJf6MH; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="n9jJf6MH"
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250829110328epoutp01abf892d441c5bd6194a49f8ab3c6d0bc~gN-uoYr9w2315023150epoutp01X
	for <linux-samsung-soc@vger.kernel.org>; Fri, 29 Aug 2025 11:03:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250829110328epoutp01abf892d441c5bd6194a49f8ab3c6d0bc~gN-uoYr9w2315023150epoutp01X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756465408;
	bh=sAfD61YI+xTSkIVMTjkTgZzonnwDmHjumiBkhLo5bV8=;
	h=From:To:In-Reply-To:Subject:Date:References:From;
	b=n9jJf6MHsFKcrK78NytuktaB4SmcryOFUXIOxRtP4pEVURbB5q+ZDOfJXCEjTEgxw
	 JkXavVZ3UBYu1Yqoo78nNvYm8Good6qlUufeDi07siRwYVOF18rvD/Va44elOd7Knj
	 65itL5j6B1HFAm8E5i2Fzhv99WcYxt3BcDBZyKts=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250829110328epcas5p257c51490cdc520405618846d7aa5b13c~gN-uPRhpK1936019360epcas5p2Q;
	Fri, 29 Aug 2025 11:03:28 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.95]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4cCwNv3bJhz3hhT8; Fri, 29 Aug
	2025 11:03:27 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250829110327epcas5p3e0703933f46b9e3f4aaad9fa131b395e~gN-tH_IPF1127711277epcas5p3J;
	Fri, 29 Aug 2025 11:03:27 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250829110325epsmtip1224013a76841ba45ab08918d957b5375~gN-rg90J11545615456epsmtip1V;
	Fri, 29 Aug 2025 11:03:25 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzysztof.kozlowski@linaro.org>, "'Ivaylo
 Ivanov'" <ivo.ivanov.ivanov1@gmail.com>, "'Rob Herring'" <robh@kernel.org>,
	"'Krzysztof Kozlowski'" <krzk+dt@kernel.org>, "'Conor Dooley'"
	<conor+dt@kernel.org>, "'Peter Griffin'" <peter.griffin@linaro.org>,
	=?UTF-8?Q?'Andr=C3=A9_Draszik'?= <andre.draszik@linaro.org>, "'Tudor
 Ambarus'" <tudor.ambarus@linaro.org>, <linux-fsd@tesla.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
In-Reply-To: <20250822121423.228500-5-krzysztof.kozlowski@linaro.org>
Subject: RE: [PATCH 1/4] arm64: dts: exynos5433: Add default GIC address
 cells
Date: Fri, 29 Aug 2025 16:33:24 +0530
Message-ID: <263b01dc18d4$8b9b33d0$a2d19b70$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQKqzywxdiAX7YwuokwQ4bOtBqeu5AJyWVpzssh3m/A=
Content-Language: en-us
X-CMS-MailID: 20250829110327epcas5p3e0703933f46b9e3f4aaad9fa131b395e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250822121435epcas5p1d9bf83ff79efccec244ba712479ef4b8
References: <CGME20250822121435epcas5p1d9bf83ff79efccec244ba712479ef4b8@epcas5p1.samsung.com>
	<20250822121423.228500-5-krzysztof.kozlowski@linaro.org>

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
=5BPATCH=201/4=5D=20arm64:=20dts:=20exynos5433:=20Add=20default=20GIC=20add=
ress=20cells=0D=0A>=20=0D=0A>=20Add=20missing=20address-cells=200=20to=20GI=
C=20interrupt=20node=20to=20silence=20W=3D1=0D=0A>=20warning:=0D=0A>=20=0D=
=0A>=20=20=20exynos5433-tm2-common.dtsi:1000.2-41:=20Warning=20(interrupt_m=
ap):=0D=0A>=20/soc=400/pcie=4015700000:interrupt-map:=0D=0A>=20=20=20=20=20=
Missing=20property=20'=23address-cells'=20in=20node=20/soc=400/interrupt-=
=0D=0A>=20controller=4011001000,=20using=200=20as=20fallbac=0D=0A>=20=0D=0A=
>=20Value=20'0'=20is=20correct=20because:=0D=0A>=201.=20GIC=20interrupt=20c=
ontroller=20does=20not=20have=20children,=202.=20interrupt-map=20property=
=0D=0A>=20(in=20PCI=20node)=20consists=20of=20five=20components=20and=0D=0A=
>=20=20=20=20the=20fourth=20component=20=22parent=20unit=20address=22,=20wh=
ich=20size=20is=20defined=20by=0D=0A>=20=20=20=20'=23address-cells'=20of=20=
the=20node=20pointed=20to=20by=20the=20interrupt-parent=0D=0A>=20=20=20=20c=
omponent,=20is=20not=20used=20(=3D0).=0D=0A>=20=0D=0A>=20Signed-off-by:=20K=
rzysztof=20Kozlowski=20<krzysztof.kozlowski=40linaro.org>=0D=0A>=20---=0D=
=0A=0D=0AReviewed-by:=20Alim=20Akhtar=20<alim.akhtar=40samsung.com>=0D=0A=
=0D=0A>=20=20arch/arm64/boot/dts/exynos/exynos5433.dtsi=20=7C=201=20+=0D=0A=
>=20=201=20file=20changed,=201=20insertion(+)=0D=0A>=20=0D=0A>=20diff=20--g=
it=20a/arch/arm64/boot/dts/exynos/exynos5433.dtsi=0D=0A>=20b/arch/arm64/boo=
t/dts/exynos/exynos5433.dtsi=0D=0A>=20index=200b9053b9b2b5..fa2029e280a5=20=
100644=0D=0A>=20---=20a/arch/arm64/boot/dts/exynos/exynos5433.dtsi=0D=0A>=
=20+++=20b/arch/arm64/boot/dts/exynos/exynos5433.dtsi=0D=0A>=20=40=40=20-93=
7,6=20+937,7=20=40=40=20reboot:=20syscon-reboot=20=7B=0D=0A>=20=0D=0A>=20=
=20=09=09gic:=20interrupt-controller=4011001000=20=7B=0D=0A>=20=20=09=09=09=
compatible=20=3D=20=22arm,gic-400=22;=0D=0A>=20+=09=09=09=23address-cells=
=20=3D=20<0>;=0D=0A>=20=20=09=09=09=23interrupt-cells=20=3D=20<3>;=0D=0A>=
=20=20=09=09=09interrupt-controller;=0D=0A>=20=20=09=09=09reg=20=3D=20<0x11=
001000=200x1000>,=0D=0A>=20--=0D=0A>=202.48.1=0D=0A=0D=0A=0D=0A
