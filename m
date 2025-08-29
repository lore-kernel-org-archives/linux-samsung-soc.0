Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66EE43128AF
	for <linux-samsung-soc@vger.kernel.org>; Fri, 29 Aug 2025 11:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756465263; cv=none; b=H/fXoXzZ9sBXCYX4HP1FrJJ+T4XHdufm1ZlyZiOwUTX8My6TRhpbXAivArO1K4OPtcjPHgKLsnaXGeDwQYRUN0kL6oUSTRlaKiNaL1KR+5DTBUba1sQvhSL14lypxbf6JR6rKPeepwprel5L4p16jhg3D2FtNe896VbS8/Ci1kA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756465263; c=relaxed/simple;
	bh=aPgQdRftW+MPJm/ScWqWeD+k9GOL06cZoXpzePwzSYI=;
	h=From:To:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=Qv5T1E+6SbcX10ImFt2FYF3KJuwVjI26W0xLZIr32yrO6sdPdfAjVUTFAzLMrR3fJxCmLAee3csCyCcEsZx6tDRjAbpiZr7PB4SR4mb/5117S/T7iaNBZ7L31FlTf3EFPQxVK/N36auwd2O+Qt1/eOOBa/nXwOK0tqWgPxw1fq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=REASU3wD; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="REASU3wD"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250829110059epoutp02a69a2a1b52784276f224f280a8f24c63~gN9jpfwwR0858708587epoutp02i
	for <linux-samsung-soc@vger.kernel.org>; Fri, 29 Aug 2025 11:00:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250829110059epoutp02a69a2a1b52784276f224f280a8f24c63~gN9jpfwwR0858708587epoutp02i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756465259;
	bh=aPgQdRftW+MPJm/ScWqWeD+k9GOL06cZoXpzePwzSYI=;
	h=From:To:In-Reply-To:Subject:Date:References:From;
	b=REASU3wDLBTazBjUUN6CSV10k3nzQPDf9/XjvmttU7nF5FGTy5HB6N5CTf2n5SZka
	 0/ZFIFQ3AgQEfWjaZPGZJZ4Ql1vtr+dwhbfPMHgj4vLYbM7M1uh1JmjfyRa3SL1/pL
	 eNN9dj9nkuEotOcfmMkUKauYx/6Wmad6rwMFXYco=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250829110058epcas5p115d5fa830820191971707c8d7cc6ab89~gN9jEzUgw3096530965epcas5p1X;
	Fri, 29 Aug 2025 11:00:58 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.86]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4cCwL20y3zz6B9m8; Fri, 29 Aug
	2025 11:00:58 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250829110056epcas5p1de7c054c261d077f66688e4539ea63d1~gN9hJ8fZY3099430994epcas5p1K;
	Fri, 29 Aug 2025 11:00:56 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250829110055epsmtip23b5c3d53b927185e53c3c59a2a8c9789~gN9fhcY7a0750007500epsmtip2q;
	Fri, 29 Aug 2025 11:00:54 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzysztof.kozlowski@linaro.org>, "'Ivaylo
 Ivanov'" <ivo.ivanov.ivanov1@gmail.com>, "'Rob Herring'" <robh@kernel.org>,
	"'Krzysztof Kozlowski'" <krzk+dt@kernel.org>, "'Conor Dooley'"
	<conor+dt@kernel.org>, "'Peter Griffin'" <peter.griffin@linaro.org>,
	=?UTF-8?Q?'Andr=C3=A9_Draszik'?= <andre.draszik@linaro.org>, "'Tudor
 Ambarus'" <tudor.ambarus@linaro.org>, <linux-fsd@tesla.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
In-Reply-To: <20250822121423.228500-7-krzysztof.kozlowski@linaro.org>
Subject: RE: [PATCH 3/4] arm64: dts: fsd: Add default GIC address cells
Date: Fri, 29 Aug 2025 16:30:53 +0530
Message-ID: <263901dc18d4$32051700$960f4500$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJyWVpz9P/Dzbtkobqw1IWAkgYZWwJfCO3YAL3x8o+zNA2QIA==
Content-Language: en-us
X-CMS-MailID: 20250829110056epcas5p1de7c054c261d077f66688e4539ea63d1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250822121438epcas5p48dd8463382036e86f1422300427b2189
References: <20250822121423.228500-5-krzysztof.kozlowski@linaro.org>
	<CGME20250822121438epcas5p48dd8463382036e86f1422300427b2189@epcas5p4.samsung.com>
	<20250822121423.228500-7-krzysztof.kozlowski@linaro.org>

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
=5BPATCH=203/4=5D=20arm64:=20dts:=20fsd:=20Add=20default=20GIC=20address=20=
cells=0D=0A>=20=0D=0A>=20Add=20missing=20address-cells=200=20to=20GIC=20int=
errupt=20node.=20=20Value=20'0'=20is=20correct=0D=0A>=20because=20GIC=20int=
errupt=20controller=20does=20not=20have=20children.=0D=0A>=20=0D=0A>=20Sign=
ed-off-by:=20Krzysztof=20Kozlowski=20<krzysztof.kozlowski=40linaro.org>=0D=
=0A>=20---=0D=0AReviewed-by:=20Alim=20Akhtar=20<alim.akhtar=40samsung.com>=
=0D=0A=0D=0A>=20=20arch/arm64/boot/dts/tesla/fsd.dtsi=20=7C=201=20+=0D=0A>=
=20=201=20file=20changed,=201=20insertion(+)=0D=0A>=20=0D=0A>=20diff=20--gi=
t=20a/arch/arm64/boot/dts/tesla/fsd.dtsi=0D=0A>=20b/arch/arm64/boot/dts/tes=
la/fsd.dtsi=0D=0A>=20index=20a5ebb3f9b18f..5b06e2667b89=20100644=0D=0A>=20-=
--=20a/arch/arm64/boot/dts/tesla/fsd.dtsi=0D=0A>=20+++=20b/arch/arm64/boot/=
dts/tesla/fsd.dtsi=0D=0A>=20=40=40=20-363,6=20+363,7=20=40=40=20soc:=20soc=
=400=20=7B=0D=0A>=20=0D=0A>=20=20=09=09gic:=20interrupt-controller=40104000=
00=20=7B=0D=0A>=20=20=09=09=09compatible=20=3D=20=22arm,gic-v3=22;=0D=0A>=
=20+=09=09=09=23address-cells=20=3D=20<0>;=0D=0A>=20=20=09=09=09=23interrup=
t-cells=20=3D=20<3>;=0D=0A>=20=20=09=09=09interrupt-controller;=0D=0A>=20=
=20=09=09=09reg=20=3D=20<0x0=200x10400000=200x0=200x10000>,=20/*=20GICD=20*=
/=0D=0A>=20--=0D=0A>=202.48.1=0D=0A=0D=0A=0D=0A
