Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8FC37F723
	for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Jun 2026 08:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781512635; cv=none; b=pXJrXN+/VKLcmr9gGqjFW3G1VBPhUzdALbU5XdYK39gZ8pYzHq4hcExnUsQfMI2RUWCKcKlYQ7BhVo21DZh8jouMcVw737aSwY+ZTPxJsY4OFZSwOBZEk4zz/HQh+xUh4RQIijryUPxAoI57MbfqbTkMjK32rJMTlRgJrBrnFio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781512635; c=relaxed/simple;
	bh=yYTWzS7Ky/MJ/d/Rikhm2+GNrz3ReI79+UHTdkiIRaE=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=i7UOSwpP5zDzq8+GzByjOYtQqPF2HVCrz40HOGrDf/r4DHkCpavYsM3iA+/MhmLbIUowLoy7W5ClFu86tXDH1AgykbsEYGe4f+sJxfG6MtNPOFyUpqVvO9EV2PzLxOl4kZUX30dpuBS2BiZp2a/5dMlgFmRJ6e4X1SvKsmX4NfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=RiQVknDY; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="RiQVknDY"
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20260615083708epoutp0429524dccfc6b39cbb5fc88154f22f86c~5NEv-vz1M2646026460epoutp04Q
	for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Jun 2026 08:37:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20260615083708epoutp0429524dccfc6b39cbb5fc88154f22f86c~5NEv-vz1M2646026460epoutp04Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1781512628;
	bh=yYTWzS7Ky/MJ/d/Rikhm2+GNrz3ReI79+UHTdkiIRaE=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=RiQVknDY+WeVe8D0gJ2qNB9r0r1NV0FjIRAR4j6Wwxoqgj7UzML3ESN3z6r4CCb5U
	 pcZ4pHB3fxZaXBBPbiOk0Icg9w6INB6TKVS1yDSVhPYk4wj8YG5TShXOh3EAE2/UZb
	 Su89NDCIf6glH6DtFeXpaovpLLf3RFHb2yDbvASc=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20260615083707epcas5p27dba444206395073aacdb4c2211e38bf~5NEvWmIHo1832318323epcas5p2n;
	Mon, 15 Jun 2026 08:37:07 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.88]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4gf3QC1SDkz6B9m4; Mon, 15 Jun
	2026 08:37:07 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20260615083706epcas5p1ab2362a3275e896c133dd893f6d2b172~5NEuPA_r83120931209epcas5p1F;
	Mon, 15 Jun 2026 08:37:06 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20260615083705epsmtip1a04a71a94c232044b04a2cc92466d675~5NEs0Bm6d0397303973epsmtip1j;
	Mon, 15 Jun 2026 08:37:05 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, "'Linus Walleij'"
	<linusw@kernel.org>
Cc: <peter.griffin@linaro.org>, <robh@kernel.org>, <conor+dt@kernel.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<hajun.sung@samsung.com>
In-Reply-To: <419fe57b-fed0-411d-8bd6-eb452e767784@kernel.org>
Subject: RE: [PATCH 5/5] MAINTAINERS: Add entry for Samsung Exynos8855 SoC
Date: Mon, 15 Jun 2026 14:07:03 +0530
Message-ID: <007f01dcfca2$25c7e0f0$7157a2d0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJYum4ZwFB4G57e/mAdy9OEA4w1FQFdc8KuAafn3wwBg/tdAAFp0QcwAHEVW1YBzLNk5rUGR0Zg
Content-Language: en-us
X-CMS-MailID: 20260615083706epcas5p1ab2362a3275e896c133dd893f6d2b172
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
	<007a01dcfc9d$aa94dd60$ffbe9820$@samsung.com>
	<0aa74645-d99d-4776-b3e6-e74fc0528f11@kernel.org>
	<419fe57b-fed0-411d-8bd6-eb452e767784@kernel.org>



> -----Original Message-----
> From: Krzysztof Kozlowski <krzk=40kernel.org>
> Sent: Monday, June 15, 2026 1:47 PM
> To: Alim Akhtar <alim.akhtar=40samsung.com>; 'Linus Walleij'
> <linusw=40kernel.org>
> Cc: peter.griffin=40linaro.org; robh=40kernel.org; conor+dt=40kernel.org;=
 linux-
> samsung-soc=40vger.kernel.org; linux-kernel=40vger.kernel.org;
> devicetree=40vger.kernel.org; linux-gpio=40vger.kernel.org;
> hajun.sung=40samsung.com
> Subject: Re: =5BPATCH 5/5=5D MAINTAINERS: Add entry for Samsung Exynos885=
5
> SoC
>=20
> On 15/06/2026 10:12, Krzysztof Kozlowski wrote:
> > On 15/06/2026 10:04, Alim Akhtar wrote:
> >> Thanks Linus for your review
> >>
> >>> -----Original Message-----
> >>> From: Linus Walleij <linusw=40kernel.org>
> >>> Sent: Monday, June 15, 2026 12:51 PM
> >>> To: Alim Akhtar <alim.akhtar=40samsung.com>
> >>> Cc: krzk=40kernel.org; peter.griffin=40linaro.org; robh=40kernel.org;
> >>> conor+dt=40kernel.org; linux-samsung-soc=40vger.kernel.org; linux-
> >>> kernel=40vger.kernel.org; devicetree=40vger.kernel.org; linux-
> >>> gpio=40vger.kernel.org; hajun.sung=40samsung.com
> >>> Subject: Re: =5BPATCH 5/5=5D MAINTAINERS: Add entry for Samsung
> >>> Exynos8855 SoC
> >>>
> >>> Hi Alim,
> >>>
> >>> On Fri, Jun 12, 2026 at 6:11=E2=80=AFPM=20Alim=20Akhtar=0D=0A>=20>>>=
=20<alim.akhtar=40samsung.com>=0D=0A>=20>>>=20wrote:=0D=0A>=20>>>=0D=0A>=20=
>>>>=20Add=20maintainers=20entry=20for=20the=20Samsung=20Exynos8855=20SoC=
=20based=0D=0A>=20>>>>=20platforms=0D=0A>=20>>>>=0D=0A>=20>>>>=20Signed-off=
-by:=20Alim=20Akhtar=20<alim.akhtar=40samsung.com>=0D=0A>=20>>>=20(...)=0D=
=0A>=20>>>>=20+SAMSUNG=20EXYNOS8855=20SoC=20SUPPORT=0D=0A>=20>>>>=20+M:=20=
=20=20=20=20Alim=20Akhtar=20<alim.akhtar=40samsung.com>=0D=0A>=20>>>>=20+L:=
=20=20=20=20=20linux-arm-kernel=40lists.infradead.org=20(moderated=20for=20=
non-=0D=0A>=20>>>=20subscribers)=0D=0A>=20>>>>=20+L:=20=20=20=20=20linux-sa=
msung-soc=40vger.kernel.org=0D=0A>=20>>>>=20+S:=20=20=20=20=20Maintained=0D=
=0A>=20>>>>=20+F:=20=20=20=20=20arch/arm64/boot/dts/exynos/exynos8855*=0D=
=0A>=20>>>=0D=0A>=20>>>=20If=20you=20really=20want=20to=20single=20out=20a=
=20single=20platform=20like=20this=20(and=20I=0D=0A>=20>>>=20don't=20even=
=20know=20if=20that=20is=20a=20good=20idea...=20how=20do=20you=20keep=20the=
=20big=0D=0A>=20>>>=20picture=20in=20mind?)=20you=20should=20probably=20wan=
t=20to=20also=20add=20a=20wildcard=0D=0A>=20>>>=20for=20all=20the=0D=0A>=20=
>>>=208855=20device=20tree=20files.=0D=0A>=20>>>=0D=0A>=20>>=20I=20am=20als=
o=20not=20sure,=20just=20followed=20what=20was=20done=20historically,=20oth=
er=0D=0A>=20>>=20Exynos8855=20file=20will=20get=20added=20once=20they=20are=
=20posted=20for=20review,=20e.g.=20clock=0D=0A>=20driver.=0D=0A>=20>>=20Let=
=20me=20discuss=20with=20Krzk=20during=20OSS=20(Mumbai)=20and=20see=20how=
=20do=20we=20handle=0D=0A>=20this=20or=20any=20other=20better=20ways.=0D=0A=
>=20>>=0D=0A>=20>=0D=0A>=20>=20You=20are=20Alim=20already=20reviewer=20for=
=20entire=20Samsung,=20so=20not=20sure=20if=20this=0D=0A>=20>=20is=20benefi=
cial=20but=20I=20also=20do=20not=20mind.=0D=0A>=20>=0D=0A>=20>=20For=20Exyn=
os850=20and=20Google=20GS101,=20these=20were=20added=20because=20folks=20wa=
nted=0D=0A>=20>=20to=20be=20involved=20in=20these=20specific=20bits.=20In=
=20the=20past=20I=20was=20voting=20for=0D=0A>=20>=20per-DTS=20file=20mainta=
iner=20entry=20and=20rejecting=20per-board=20maintainer=0D=0A>=20>=20entrie=
s.=20There=0D=0A>=20=0D=0A>=20Lemme=20clarify:=20=22voting=20for=20in-DTS=
=20file=20maintainer=20entry=22,=20so=20like=20we=20have=20for=0D=0A>=20DT=
=20bindings,=20which=20lists=20maintainers.=0D=0A>=20=0D=0ASounds=20interes=
ting=20to=20me,=20lets=20see=20what=20community=20thinks=20about=20this.=20=
=0D=0A=0D=0A=0D=0A
