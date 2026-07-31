Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4078F34B43F
	for <linux-samsung-soc@vger.kernel.org>; Fri, 31 Jul 2026 06:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785479358; cv=none; b=n5+44FtpuTMLQDXCgqb3TDV4crdFhf0fwHpo8k8XoMUT3SzqiymQ0lmsCMDJ87EOXee1yRy2rltzzrspGr3UhTzL/ppTzVthqXy1FWRvxBoVQTuoXJeZu1tcHQ0w22c6p9MPzREd2fH5Q1qHjAAySCYlako3APy6NM9H3NvgVvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785479358; c=relaxed/simple;
	bh=4fvqKsvm1eyHGNWQHxglb3w7slSjtIMExKpTqKcLLwQ=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=kMzeuh/vK9V19WRPhCcGhXQni9F41b8Y4iSnluuVbS6nFQ88/VBn7PFNv8aztXej3T56NDkhlvPABbPskLA+uFLxsoVONtAOc0e2p5ZXap7/R4CuOxSxZZGD50C2uL9R3fO48QzUK88DleiuW4i/st/Kp4stMBpn8+iBPik+Jpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=rdlKk93X; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="rdlKk93X"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20260731062914epoutp02e6aa7d1f333612824b9a98bf3f9e7810~HTANLG_dI2754527545epoutp02d
	for <linux-samsung-soc@vger.kernel.org>; Fri, 31 Jul 2026 06:29:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20260731062914epoutp02e6aa7d1f333612824b9a98bf3f9e7810~HTANLG_dI2754527545epoutp02d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1785479354;
	bh=4fvqKsvm1eyHGNWQHxglb3w7slSjtIMExKpTqKcLLwQ=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=rdlKk93X5DBDiNI8cfcYyGhcZzX/6rSH1HMdTNu+3nxVzT2H4ov190gFF2wafu/yV
	 OYCwIMcHECORoh0NlG5fMf5hgLf2HaFPS2aD2ZIYfuQAw5nkhcSS7ShGX4quvcVIjc
	 yVrcVJoyaOxVR8BGdPS7BVixo6cB7abGINlP7Nbc=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20260731062913epcas5p17901cfc7098bdcdf15db8fe1cf98817f~HTAMKkcop2719527195epcas5p1g;
	Fri, 31 Jul 2026 06:29:13 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.90]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4hBGPN166dz6B9mR; Fri, 31 Jul
	2026 06:29:12 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20260731062911epcas5p13055bd03de39a582110a56fe3089659b~HTAKu25ie2713127131epcas5p1h;
	Fri, 31 Jul 2026 06:29:11 +0000 (GMT)
Received: from INBRO002198 (unknown [107.122.5.156]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20260731062909epsmtip135f52cd1226a69c6b1fd6a443b9da8f8~HTAIS8qol0207002070epsmtip1p;
	Fri, 31 Jul 2026 06:29:08 +0000 (GMT)
From: "Raghav Sharma" <raghav.s@samsung.com>
To: =?iso-8859-1?Q?'Uwe_Kleine-K=F6nig'?= <u.kleine-koenig@baylibre.com>
Cc: <krzk@kernel.org>, <s.nawrocki@samsung.com>, <cw00.choi@samsung.com>,
	<peter.griffin@linaro.org>, <alim.akhtar@samsung.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <bmasney@redhat.com>,
	<robh@kernel.org>, <conor+dt@kernel.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <hajun.sung@samsung.com>,
	<is.gandhi@samsung.com>, <ts.amit@samsung.com>, <pokala.reddy@samsung.com>
In-Reply-To: <amnz5qkX_zeeVUjU@monoceros>
Subject: RE: [PATCH 03/13] clk: samsung: exynos8855: add block top and peric
 clock support
Date: Fri, 31 Jul 2026 11:59:07 +0530
Message-ID: <04ae01dd20b5$e629a040$b27ce0c0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIRARWKMB8/axP+0I5R2y9G0OYjygJXZBUnAoCqj1sBW9GAbbXtymAg
Content-Language: en-us
X-CMS-MailID: 20260731062911epcas5p13055bd03de39a582110a56fe3089659b
X-Msg-Generator: CA
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260728115251epcas5p19aaf5fc01e0f847bc2adcec67bebda3a
References: <20260728121111.2077860-1-raghav.s@samsung.com>
	<CGME20260728115251epcas5p19aaf5fc01e0f847bc2adcec67bebda3a@epcas5p1.samsung.com>
	<20260728121111.2077860-4-raghav.s@samsung.com> <amnz5qkX_zeeVUjU@monoceros>



> -----Original Message-----
> From: Uwe Kleine-K=F6nig=20<u.kleine-koenig=40baylibre.com>=0D=0A>=20Sent=
:=20Wednesday,=20July=2029,=202026=206:08=20PM=0D=0A>=20To:=20raghav.s=20<r=
aghav.s=40samsung.com>=0D=0A>=20Cc:=20krzk=40kernel.org;=20s.nawrocki=40sam=
sung.com;=20cw00.choi=40samsung.com;=0D=0A>=20peter.griffin=40linaro.org;=
=20alim.akhtar=40samsung.com;=0D=0A>=20mturquette=40baylibre.com;=20sboyd=
=40kernel.org;=20bmasney=40redhat.com;=0D=0A>=20robh=40kernel.org;=20conor+=
dt=40kernel.org;=20linux-samsung-=0D=0A>=20soc=40vger.kernel.org;=20linux-c=
lk=40vger.kernel.org;=0D=0A>=20devicetree=40vger.kernel.org;=20linux-arm-ke=
rnel=40lists.infradead.org;=20linux-=0D=0A>=20kernel=40vger.kernel.org;=20h=
ajun.sung=40samsung.com;=0D=0A>=20is.gandhi=40samsung.com;=20ts.amit=40sams=
ung.com;=0D=0A>=20pokala.reddy=40samsung.com=0D=0A>=20Subject:=20Re:=20=5BP=
ATCH=2003/13=5D=20clk:=20samsung:=20exynos8855:=20add=20block=20top=20and=
=0D=0A>=20peric=20clock=20support=0D=0A>=20=0D=0A>=20Hello,=0D=0A>=20=0D=0A=
>=20On=20Tue,=20Jul=2028,=202026=20at=2005:41:01PM=20+0530,=20raghav.s=20wr=
ote:=0D=0A>=20>=20+=23include=20<linux/mod_devicetable.h>=0D=0A>=20>=20=5B.=
..=5D=0D=0A>=20>=20+=23include=20<linux/platform_device.h>=0D=0A>=20=0D=0A>=
=20<linux/platform_device.h>=20already=20makes=20sure=20that=20of_device_id=
=20is=0D=0Aavailable=0D=0A>=20and=20<linux/mod_devicetable.h>=20will=20go=
=20away=20soon.=0D=0A>=20=0D=0A>=20So=20please=20don't=20=23include=20the=
=20latter.=0D=0A>=20=0D=0A>=20Best=20regards=0D=0A>=20Uwe=0D=0A=0D=0AHi=20U=
we=0D=0AThanks=20for=20letting=20me=20know,=20I=20will=20remove=20this=20he=
ader=20from=20my=20code:=0D=0A<linux/mod_devicetable.h>=0D=0A=0D=0ARegards=
=0D=0ARaghav=0D=0A=0D=0A
