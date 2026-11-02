Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793646876;
	b=tz8B9VMeYnTa8ns4hjFTw9ywbUD+0OSVW3Gm4tyKeKIDcGs/Taaj5DkmzE+RXzkDYpgT
	 6tVgHghWvVV/XTK9JkbQJvBnrDAFd2ZHB7C6qC+bxHRFMG23OSMKNbqpGqDFoo21RrO/h
	 hGd+qWWAqKCgqFvhm+f0hXArMCb9XZx0aTqpcPMeXmCN7zK4+pAKvXmcZ/2/1SZathtlY
	 XUGSMYVdOTTTC9KB4PbjKgRfYRA8S3q39TjC3wKLOjrs/Yn54C53gV1bC7SATavSkvff9
	 6ez60Llnl65TFntJ0b4JtNjVbT+AqtKAAkHGR1ZDxBXH9Aj7rzaiAir/B9FGpZRy+3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793646876;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:X-Mailer:Thread-Index:Content-Language:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=K5vnM8YhB4kIhJqnDANi3dlcipt70T+QjZRu0IBl/g0=;
	b=UA+zYLLCj0wF3uapS5IZBnYU3plk3/sbCm4rIcbLtLBip53g1akIxKd9CayXKXlEuDCk
	 Hgsr1CbzPaZnkcKDjQ6faMVYg2LyfbQWnBswcthAtr9bBsBOOBai4xsdj3Z4+ESKoexYa
	 mnxyFAAL69Gdd/XCUoUAV1jxdD35bbniIaLpbQtZlQOX5MjvGl/bFJxHnbyw9hbFX8vXD
	 fLC3EagkDcwoh5DzB1ZPDeCiEM11tZi4PTuqOmfvCspyQRxzVVdLTxJib+3BBPBaGAJMg
	 IveM8zh0mxyEDzwczrxgbpbfWwMsa15Nr2L5lWtmyFK+mbzzczSqTd2rkgF/M1xMXkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=ekETOlMv;
	arc=none smtp.remote-ip=210.118.77.12
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E728E606A327
	for <linux-samsung-soc@vger.kernel.org>; Mon,  2 Nov 2026 19:14:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E728E606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=ekETOlMv
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261102191433euoutp020eb16aa226c87d09c237e2ff63506bbf~kUFP9ApME0304803048euoutp02f
	for <linux-samsung-soc@vger.kernel.org>; Mon,  2 Nov 2026 19:14:33 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261102191433euoutp020eb16aa226c87d09c237e2ff63506bbf~kUFP9ApME0304803048euoutp02f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793646873;
	bh=K5vnM8YhB4kIhJqnDANi3dlcipt70T+QjZRu0IBl/g0=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=ekETOlMvR9vpydy2eIaoNAz5KlfbKjyS86Myo14mxXMXqeTLQAJl8S9amQyADCe+u
	 vfc94yFZTJa57++NJUL8xlQanldvxSG/YlwhmY/YQBlr5yR686SdarpFEpLgTLSlWD
	 7+kpgZg1QKOkZzxGE3kt0rVBe00qN2+uHahtlee8=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261102191432eucas1p256fd745ae052f1039f94f890a7b1456d~kUFPsNo2B1897418974eucas1p2t;
	Mon,  2 Nov 2026 19:14:32 +0000 (GMT)
Received: from AMDN5751 (unknown [106.210.134.141]) by eusmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20261102191432eusmtip20a3287f66e83265d7cdaeb472b33180a~kUFPNnUSm0447204472eusmtip2_;
	Mon,  2 Nov 2026 19:14:32 +0000 (GMT)
From: "Sylwester Nawrocki" <s.nawrocki@samsung.com>
To: "'Marek Szyprowski'" <m.szyprowski@samsung.com>,
	<linux-samsung-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>
Cc: "'Krzysztof Kozlowski'" <krzk@kernel.org>, "'Chanwoo Choi'"
	<cw00.choi@samsung.com>, "'Peter Griffin'" <peter.griffin@linaro.org>,
	"'Alim	Akhtar'" <alim.akhtar@samsung.com>, "'Stephen Boyd'"
	<sboyd@kernel.org>, "'Brian	Masney'" <bmasney+clk@redhat.com>, "'Jerome
 Brunet'" <jbrunet+clk@baylibre.com>, "'Henrik Grimler'" <henrik@grimler.se>,
	<stable@vger.kernel.org>
In-Reply-To: <20261030075325.517182-3-m.szyprowski@samsung.com>
Subject: RE: [PATCH v3 2/3] clk: samsung: exynos5-subcmu: Use
 pm_runtime_get_sync() during probe
Date: Mon, 2 Nov 2026 20:14:32 +0100
Message-ID: <000101dd6afe$64582a80$2d087f80$@samsung.com>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQKpVTperXi7BFRv9rlREf4hmhkl4wHG2DCpAVSLecC1ancaoA==
Content-Language: pl
X-CMS-MailID: 20261102191432eucas1p256fd745ae052f1039f94f890a7b1456d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261030075334eucas1p14657a963949b4a32165d667f387a9389
X-EPHeader: CA
X-CMS-RootMailID: 20261030075334eucas1p14657a963949b4a32165d667f387a9389
References: <20261030075325.517182-1-m.szyprowski@samsung.com>
	<CGME20261030075334eucas1p14657a963949b4a32165d667f387a9389@eucas1p1.samsung.com>
	<20261030075325.517182-3-m.szyprowski@samsung.com>

> -----Original Message-----
> From: Marek Szyprowski <m.szyprowski=40samsung.com>
> Sent: pi=C4=85tek,=2030=20pa=C5=BAdziernika=202026=2008:53=0D=0A>=20To:=
=20linux-samsung-soc=40vger.kernel.org;=20linux-clk=40vger.kernel.org=0D=0A=
>=20Cc:=20Marek=20Szyprowski=20<m.szyprowski=40samsung.com>;=20Krzysztof=20=
Kozlowski=0D=0A>=20<krzk=40kernel.org>;=20Sylwester=20Nawrocki=20<s.nawrock=
i=40samsung.com>;=20Chanwoo=0D=0A>=20Choi=20<cw00.choi=40samsung.com>;=20Pe=
ter=20Griffin=20<peter.griffin=40linaro.org>;=20Alim=0D=0A>=20Akhtar=20<ali=
m.akhtar=40samsung.com>;=20Stephen=20Boyd=20<sboyd=40kernel.org>;=20Brian=
=0D=0A>=20Masney=20<bmasney+clk=40redhat.com>;=20Jerome=20Brunet=0D=0A>=20<=
jbrunet+clk=40baylibre.com>;=20Henrik=20Grimler=20<henrik=40grimler.se>;=0D=
=0A>=20stable=40vger.kernel.org=0D=0A>=20Subject:=20=5BPATCH=20v3=202/3=5D=
=20clk:=20samsung:=20exynos5-subcmu:=20Use=0D=0A>=20pm_runtime_get_sync()=
=20during=20probe=0D=0A>=20=0D=0A>=20The=20clocks=20are=20registered=20righ=
t=20after=20pm_runtime_get(),=20which=20only=0D=0A>=20schedules=20a=20resum=
e=20asynchronously=20and=20doesn't=20guarantee=20the=20device=20(and=0D=0A>=
=20its=20power=20domain)=20is=20active=20yet.=20Use=20pm_runtime_get_sync()=
=20to=20ensure=20the=0D=0A>=20power=20domain=20is=20really=20on=20while=20t=
he=20clock=20registers=20are=20accessed=20during=0D=0A>=20the=20registratio=
n.=0D=0A>=20=0D=0A>=20Fixes:=20b06a532bf1fa=20(=22clk:=20samsung:=20Add=20E=
xynos5=20sub-CMU=20clock=20driver=22)=0D=0A>=20Cc:=20stable=40vger.kernel.o=
rg=0D=0A>=20Signed-off-by:=20Marek=20Szyprowski=20<m.szyprowski=40samsung.c=
om>=0D=0A=0D=0AReviewed-by:=20Sylwester=20Nawrocki=20<s.nawrocki=40samsung.=
com>=0D=0A=0D=0A
