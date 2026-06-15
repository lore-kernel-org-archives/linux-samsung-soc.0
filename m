Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1773C0A03
	for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Jun 2026 08:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781510713; cv=none; b=XIVgOKJ9VM6hxGHnz5qIJQNpRxYVUa2q8xX069Ok1B4K/uX/e/4dHfce1A+1jr/SZyZ3ETxcykxmczRjcjjEQUsUikFPEGfOjcv29jWzK7JxhIctRbH3GlcvEw0+ya9eVEEPbxlAFYrs2LvykZoTiHAmouRlaCTK9Sjo1IrxOp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781510713; c=relaxed/simple;
	bh=bVx/jDOnt13llMcfjd60CLseSlZQWqaWHYeakaAMc2o=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=QVfAGQO9s57I68p73jBcWLYa8d7fATDAsISYuccFOLICx2HVM2Rx+beL6a70ScZFdCKzcUUyTYXgLptIHM6bZeTThT/3dp+4B9PEAh47DiXeG0fiqIUoC9EtKnBB3km4o7TtwvOogCcR7l5Stwa8uaJyxB711l+MIjgG8vFOulo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=EsfwaGg7; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="EsfwaGg7"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20260615080503epoutp025045c79cfd21f8d65f031afba881afe5~5MovWRd7X2293922939epoutp02p
	for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Jun 2026 08:05:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20260615080503epoutp025045c79cfd21f8d65f031afba881afe5~5MovWRd7X2293922939epoutp02p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1781510703;
	bh=bVx/jDOnt13llMcfjd60CLseSlZQWqaWHYeakaAMc2o=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=EsfwaGg7L457+s8ZLYeYh+NjeERFnLEzWdTsQH/8UCb4LBiNJed0NJzKJMnjb86up
	 nKhKcIqzK5oyQGHrcs00v9i/69YBuNn/yo94jLm2ykLYS1MVUehXZsS3SFwr6Vb2n6
	 h0UOM+Ij9jMkasfEa/80JxGlkdT2khMIoe0OUPZA=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20260615080503epcas5p35553994bb8f7d3be24c29516080ec968~5Mou6Loct0252002520epcas5p3-;
	Mon, 15 Jun 2026 08:05:03 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.90]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4gf2jB3gCtz6B9m7; Mon, 15 Jun
	2026 08:05:02 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20260615080502epcas5p42e70f43116e861807a0527998adf8be3~5MottcCXy1008610086epcas5p45;
	Mon, 15 Jun 2026 08:05:02 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20260615080500epsmtip2369c86913d9268e10c98c53ab6a139b9~5MosXefMD1575515755epsmtip2D;
	Mon, 15 Jun 2026 08:05:00 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Linus Walleij'" <linusw@kernel.org>
Cc: <krzk@kernel.org>, <peter.griffin@linaro.org>, <robh@kernel.org>,
	<conor+dt@kernel.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <hajun.sung@samsung.com>
In-Reply-To: <CAD++jL=mQUJCqVyqK746UdkZCsO+2oeO1MCQM4F-_pSOfpuQuA@mail.gmail.com>
Subject: RE: [PATCH 5/5] MAINTAINERS: Add entry for Samsung Exynos8855 SoC
Date: Mon, 15 Jun 2026 13:34:59 +0530
Message-ID: <007a01dcfc9d$aa94dd60$ffbe9820$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJYum4ZwFB4G57e/mAdy9OEA4w1FQFdc8KuAafn3wwBg/tdALUjd9ag
Content-Language: en-us
X-CMS-MailID: 20260615080502epcas5p42e70f43116e861807a0527998adf8be3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260612161148epcas5p33904df90bd840d20a6db05622aaa28b8
References: <CGME20260612161148epcas5p33904df90bd840d20a6db05622aaa28b8@epcas5p3.samsung.com>
	<20260612163020.411761-1-alim.akhtar@samsung.com>
	<20260612163020.411761-6-alim.akhtar@samsung.com>
	<CAD++jL=mQUJCqVyqK746UdkZCsO+2oeO1MCQM4F-_pSOfpuQuA@mail.gmail.com>

Thanks Linus for your review

> -----Original Message-----
> From: Linus Walleij <linusw=40kernel.org>
> Sent: Monday, June 15, 2026 12:51 PM
> To: Alim Akhtar <alim.akhtar=40samsung.com>
> Cc: krzk=40kernel.org; peter.griffin=40linaro.org; robh=40kernel.org;
> conor+dt=40kernel.org; linux-samsung-soc=40vger.kernel.org; linux-
> kernel=40vger.kernel.org; devicetree=40vger.kernel.org; linux-
> gpio=40vger.kernel.org; hajun.sung=40samsung.com
> Subject: Re: =5BPATCH 5/5=5D MAINTAINERS: Add entry for Samsung Exynos885=
5
> SoC
>=20
> Hi Alim,
>=20
> On Fri, Jun 12, 2026 at 6:11=E2=80=AFPM=20Alim=20Akhtar=20<alim.akhtar=40=
samsung.com>=0D=0A>=20wrote:=0D=0A>=20=0D=0A>=20>=20Add=20maintainers=20ent=
ry=20for=20the=20Samsung=20Exynos8855=20SoC=20based=20platforms=0D=0A>=20>=
=0D=0A>=20>=20Signed-off-by:=20Alim=20Akhtar=20<alim.akhtar=40samsung.com>=
=0D=0A>=20(...)=0D=0A>=20>=20+SAMSUNG=20EXYNOS8855=20SoC=20SUPPORT=0D=0A>=
=20>=20+M:=20=20=20=20=20Alim=20Akhtar=20<alim.akhtar=40samsung.com>=0D=0A>=
=20>=20+L:=20=20=20=20=20linux-arm-kernel=40lists.infradead.org=20(moderate=
d=20for=20non-=0D=0A>=20subscribers)=0D=0A>=20>=20+L:=20=20=20=20=20linux-s=
amsung-soc=40vger.kernel.org=0D=0A>=20>=20+S:=20=20=20=20=20Maintained=0D=
=0A>=20>=20+F:=20=20=20=20=20arch/arm64/boot/dts/exynos/exynos8855*=0D=0A>=
=20=0D=0A>=20If=20you=20really=20want=20to=20single=20out=20a=20single=20pl=
atform=20like=20this=20(and=20I=20don't=20even=0D=0A>=20know=20if=20that=20=
is=20a=20good=20idea...=20how=20do=20you=20keep=20the=20big=20picture=20in=
=20mind?)=20you=0D=0A>=20should=20probably=20want=20to=20also=20add=20a=20w=
ildcard=20for=20all=20the=0D=0A>=208855=20device=20tree=20files.=0D=0A>=20=
=0D=0AI=20am=20also=20not=20sure,=20just=20followed=20what=20was=20done=20h=
istorically,=20other=20Exynos8855=20file=20will=20get=20added=20once=20they=
=0D=0Aare=20posted=20for=20review,=20e.g.=20clock=20driver.=0D=0ALet=20me=
=20discuss=20with=20Krzk=20during=20OSS=20(Mumbai)=20and=20see=20how=20do=
=20we=20handle=20this=20or=20any=20other=20better=20ways.=0D=0A=0D=0A=0D=0A=
>=20Yours,=0D=0A>=20Linus=20Walleij=0D=0A=0D=0A
