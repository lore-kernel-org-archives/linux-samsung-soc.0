Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371EE1170F
	for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jul 2024 03:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721876625; cv=none; b=heEjrjrX5E3ig5H1cNJZiirdgMUF7TJKIKsG1OKZizwdS3pdXSC0tId1z9fRxlrNJX4+si9FWQB3DZycmCsn+Nk+6+0Vr+B+5AklKq7ZSvYrA0sl3QTIEIBRfg5tiRllq18VqLFlCC5JwCHTGgayjmW2VWt4aHKrgTXt4hueosQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721876625; c=relaxed/simple;
	bh=FIfiT9fBE9cOC5yjlL/cVUjjJHrby/h9QoqoTmJXE3g=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=fP41V1AyVXwz28YEYc7AOFpmUoJOxMXG4s7vUwh3moR97tHNJ25zDNKKDk7Ywaw+CuVSv03T5dVbe2FjiTlzvqninJNz+MGMwKWV3+MNcUkbDllYSVQqcGzpqQK/Qi4GfBA3AwSid1kMsZXbFyApAlX8ABYoVRqN41eUddPdmpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=OEiLwmgx; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="OEiLwmgx"
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20240725030337epoutp02e9ea0a97286377ed242c5ff8f221c139~lVakuJ23U0684706847epoutp02O
	for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jul 2024 03:03:37 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20240725030337epoutp02e9ea0a97286377ed242c5ff8f221c139~lVakuJ23U0684706847epoutp02O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1721876617;
	bh=VMwqNOdlly1iq5gfNn8ldD97zmVJcunzGDUKLQTehas=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=OEiLwmgxRWbkK7C1qeUsTGKceBPvlLtEHMRiBJ7PGyME6AyzEZQlk7hbMc1b7yK+Z
	 CYPm4gpS3OPzvjml9uEAKPP7ckiO3XitJQxvSMsv/4tOn9YmItBTK6sjOgfPw9iRzs
	 rHwPW4yAJqm9N5sXKEUpOPXEdkp9BNxE65iVuOLk=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTP id
	20240725030337epcas2p1490c6af9d50e6224e0c73dd3dcf26826~lVakUQWwj3141531415epcas2p1P;
	Thu, 25 Jul 2024 03:03:37 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.102]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4WTwgr4Z94z4x9Q7; Thu, 25 Jul
	2024 03:03:36 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
	epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
	58.7F.10066.880C1A66; Thu, 25 Jul 2024 12:03:36 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20240725030336epcas2p1f6be07fd7e8000be03fe9e13ad371b4f~lVajScd_O0371403714epcas2p1i;
	Thu, 25 Jul 2024 03:03:36 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240725030336epsmtrp155ee46d8399fade7194c4457c12e1676~lVajRrM6D0462204622epsmtrp18;
	Thu, 25 Jul 2024 03:03:36 +0000 (GMT)
X-AuditID: b6c32a46-24fff70000002752-34-66a1c0888239
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	31.35.08456.780C1A66; Thu, 25 Jul 2024 12:03:35 +0900 (KST)
Received: from KORCO118965 (unknown [10.229.18.201]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20240725030335epsmtip15e14343892b99b0273496753ba4d3e7b~lVai7xHuZ0224802248epsmtip1z;
	Thu, 25 Jul 2024 03:03:35 +0000 (GMT)
From: "sunyeal.hong" <sunyeal.hong@samsung.com>
To: "'Rob Herring'" <robh@kernel.org>
Cc: "'Krzysztof Kozlowski'" <krzk@kernel.org>, "'Sylwester Nawrocki'"
	<s.nawrocki@samsung.com>, "'Chanwoo Choi'" <cw00.choi@samsung.com>, "'Alim
 Akhtar'" <alim.akhtar@samsung.com>, "'Michael Turquette'"
	<mturquette@baylibre.com>, "'Stephen Boyd'" <sboyd@kernel.org>, "'Conor
 Dooley'" <conor+dt@kernel.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
In-Reply-To: <035501dade31$55cc7f40$01657dc0$@samsung.com>
Subject: RE: [PATCH v4 1/4] dt-bindings: clock: add ExynosAuto v920 SoC CMU
 bindings
Date: Thu, 25 Jul 2024 12:03:35 +0900
Message-ID: <03b201dade3f$3d66e3b0$b834ab10$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQKlY5hu3bVCnsOExtpi/jJA6pOgwAIfj46DASLmYXQCkOemkQII707msDLORSA=
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrCJsWRmVeSWpSXmKPExsWy7bCmhW7HgYVpBjs+SVs8mLeNzWLN3nNM
	Fte/PGe1mH/kHKvF+fMb2C02Pb7GavGx5x6rxeVdc9gsZpzfx2Rx8ZSrxf89O9gtDr9pZ7X4
	d20jiwOvx/sbrewem1Z1snlsXlLv0bdlFaPH501yAaxR2TYZqYkpqUUKqXnJ+SmZeem2St7B
	8c7xpmYGhrqGlhbmSgp5ibmptkouPgG6bpk5QCcqKZQl5pQChQISi4uV9O1sivJLS1IVMvKL
	S2yVUgtScgrMC/SKE3OLS/PS9fJSS6wMDQyMTIEKE7Izni6byVYwy7hi2aGtzA2MLzW6GDk5
	JARMJKb9X87WxcjFISSwg1FiU+dORgjnE6PEuxWn2SGcb4wSZx7NYYVpadmzBapqL6PEuvur
	WSCcl4wS+6/vYQOpYhPQl1jdfRvMFhFQlWia9QCsiFngKbPEhv3n2UESnAJWEu0v54GNFRYI
	k9g6o4MRxGYBatg6/zhQAwcHr4ClxJIn8SBhXgFBiZMzn7CA2MwC2hLLFr5mhrhIQeLn02Ws
	ELv8JNq7njJC1IhIzO5sYwbZKyFwhEOip/MlC0SDi8TFQ3vZIGxhiVfHt7BD2FISL/vboOx8
	icnX3zJBNDcwSlz71w21zV5i0Zmf7CDHMQtoSqzfpQ9iSggoSxy5BXUbn0TH4b/sEGFeiY42
	IYhGNYlPVy5DDZGROHbiGfMERqVZSD6bheSzWUg+mIWwawEjyypGsdSC4tz01GKjAiN4bCfn
	525iBCdfLbcdjFPeftA7xMjEwXiIUYKDWUmE98mruWlCvCmJlVWpRfnxRaU5qcWHGE2BQT2R
	WUo0OR+Y/vNK4g1NLA1MzMwMzY1MDcyVxHnvtc5NERJITyxJzU5NLUgtgulj4uCUamBaravz
	tOPXskxhx+Z/PKLME/dsPuxUoLSRZVO+7+upEUlRcazrFS+vbsxt/ipR6OUetuuO4pOD0lst
	jlQWqfeue/ljWY7TXtHzpdlupR9domZVf2XWXM8guGJelMrHmgiOsgeJiVpb/4qmvWVb63Dk
	v8cup6U2j+OUTgW+izF57xcjs+23wYcXGbH6Ha7CQWZHLW6evmXy7UV4zCe2fezOiyzTyqVM
	5A7p5ouyzVniXNP3j88w9E1q5x+26y+jewpv/qn2eMPkVb6B5cD1pI0aEZwhxdN0/4U2Fs9/
	sPWSz9omv8124iqH/trWnj/Yu2pdt0WEStHHAIOPl2yXnNjumPCCmdt9AVPUMc1VK5RYijMS
	DbWYi4oTATZVhshHBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrAIsWRmVeSWpSXmKPExsWy7bCSnG77gYVpBqvOmlg8mLeNzWLN3nNM
	Fte/PGe1mH/kHKvF+fMb2C02Pb7GavGx5x6rxeVdc9gsZpzfx2Rx8ZSrxf89O9gtDr9pZ7X4
	d20jiwOvx/sbrewem1Z1snlsXlLv0bdlFaPH501yAaxRXDYpqTmZZalF+nYJXBmb9vWxFuwy
	qvh/ahVjA+Nf9S5GTg4JAROJlj1bGLsYuTiEBHYzSvS8/cgOkZCR2NjwH8oWlrjfcoQVoug5
	o8T0I99ZQRJsAvoSq7tvs4HYIgKqEk2zHrCAFDELvGeWmPnrEDtExzwmiQf314CN4hSwkmh/
	OQ+sW1ggRGLyolYmEJsFqHvr/ONA3RwcvAKWEkuexIOEeQUEJU7OfMICYjMLaEv0PmxlhLGX
	LXzNDHGdgsTPp8tYIY7wk2jvegpVIyIxu7ONeQKj8Cwko2YhGTULyahZSFoWMLKsYpRMLSjO
	Tc8tNiwwykst1ytOzC0uzUvXS87P3cQIjkQtrR2Me1Z90DvEyMTBeIhRgoNZSYT3yau5aUK8
	KYmVValF+fFFpTmpxYcYpTlYlMR5v73uTRESSE8sSc1OTS1ILYLJMnFwSjUwLTDYuPSmXWP/
	7T+cnz3f7my9daFd81ag9H0Z9nPRPhfDb+te+XVtjU56v/Osr8+nFPIdM1+vLuudu/Tir8lN
	k98tyPm3tSnjh+jjq2v+XI2usdZS2alyw3TevQeLC675sLvaSfNICfIvXnJARFe3kl8tW0Ox
	a6GCl+3k+Xc5BF/n3MrcbRbcNd3w/3Vb7QXeged7rrfzC20vm+q04erjrfaLcicpLfp0RmD/
	pzlc7XMCHfYeW7b1tH1gXjWnPMOMG65PNS5XKQWs7V6xInnGjEimFY0T5fouBN3b8+lplOfG
	0r1hk+95cTy7vFR5lc+drP5p5lVv+Dnc9v56NONkT/bHucvt+pW2srGoT5M+aa3EUpyRaKjF
	XFScCADuj6SZMwMAAA==
X-CMS-MailID: 20240725030336epcas2p1f6be07fd7e8000be03fe9e13ad371b4f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240722223340epcas2p4ab83b1e8dbc64eaaf32f4f8b7e3f015d
References: <20240722223333.1137947-1-sunyeal.hong@samsung.com>
	<CGME20240722223340epcas2p4ab83b1e8dbc64eaaf32f4f8b7e3f015d@epcas2p4.samsung.com>
	<20240722223333.1137947-2-sunyeal.hong@samsung.com>
	<20240723205714.GA1093352-robh@kernel.org>
	<035501dade31$55cc7f40$01657dc0$@samsung.com>

Hello Rob,

> -----Original Message-----
> From: sunyeal.hong <sunyeal.hong=40samsung.com>
> Sent: Thursday, July 25, 2024 10:24 AM
> To: 'Rob Herring' <robh=40kernel.org>
> Cc: 'Krzysztof Kozlowski' <krzk=40kernel.org>; 'Sylwester Nawrocki'
> <s.nawrocki=40samsung.com>; 'Chanwoo Choi' <cw00.choi=40samsung.com>; 'Al=
im
> Akhtar' <alim.akhtar=40samsung.com>; 'Michael Turquette'
> <mturquette=40baylibre.com>; 'Stephen Boyd' <sboyd=40kernel.org>; 'Conor
> Dooley' <conor+dt=40kernel.org>; linux-samsung-soc=40vger.kernel.org; lin=
ux-
> clk=40vger.kernel.org; devicetree=40vger.kernel.org; linux-arm-
> kernel=40lists.infradead.org; linux-kernel=40vger.kernel.org
> Subject: RE: =5BPATCH v4 1/4=5D dt-bindings: clock: add ExynosAuto v920 S=
oC
> CMU bindings
>=20
> Hello Rob,
>=20
> > -----Original Message-----
> > From: Rob Herring <robh=40kernel.org>
> > Sent: Wednesday, July 24, 2024 5:57 AM
> > To: Sunyeal Hong <sunyeal.hong=40samsung.com>
> > Cc: Krzysztof Kozlowski <krzk=40kernel.org>; Sylwester Nawrocki
> > <s.nawrocki=40samsung.com>; Chanwoo Choi <cw00.choi=40samsung.com>; Ali=
m
> > Akhtar <alim.akhtar=40samsung.com>; Michael Turquette
> > <mturquette=40baylibre.com>; Stephen Boyd <sboyd=40kernel.org>; Conor
> > Dooley <conor+dt=40kernel.org>; linux-samsung-soc=40vger.kernel.org;
> > linux- clk=40vger.kernel.org; devicetree=40vger.kernel.org; linux-arm-
> > kernel=40lists.infradead.org; linux-kernel=40vger.kernel.org
> > Subject: Re: =5BPATCH v4 1/4=5D dt-bindings: clock: add ExynosAuto v920
> > SoC CMU bindings
> >
> > On Tue, Jul 23, 2024 at 07:33:30AM +0900, Sunyeal Hong wrote:
> > > Add dt-schema for ExynosAuto v920 SoC clock controller.
> > > Add device tree clock binding definitions for below CMU blocks.
> > >
> > > - CMU_TOP
> > > - CMU_PERIC0
> > >
> > > Signed-off-by: Sunyeal Hong <sunyeal.hong=40samsung.com>
> > > ---
> > >  .../clock/samsung,exynosautov920-clock.yaml   =7C 115 +++++++++++
> > >  .../clock/samsung,exynosautov920.h            =7C 191 ++++++++++++++=
++++
> > >  2 files changed, 306 insertions(+)
> > >  create mode 100644
> > > Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock
> > > .y
> > > aml  create mode 100644
> > > include/dt-bindings/clock/samsung,exynosautov920.h
> > >
> > > diff --git
> > > a/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clo
> > > ck
> > > .yaml
> > > b/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clo
> > > ck
> > > .yaml
> > > new file mode 100644
> > > index 000000000000..90f9f17da959
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/clock/samsung,exynosautov920
> > > +++ -c
> > > +++ lock.yaml
> > > =40=40 -0,0 +1,115 =40=40
> > > +=23 SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.=
2
> > > +---
> > > +=24id:
> > > +https://protect2.fireeye.com/v1/url?k=3D9932a88e-c6ae81a4-993323c1-0=
0
> > > +0b
> > > +abe598f7-779f1e959ac8eab9&q=3D1&e=3D539edfa4-b4e4-460a-93f4-1e6f1703=
094
> > > +5&
> > > +u=3Dhttp%3A%2F%2Fdevicetree.org%2Fschemas%2Fclock%2Fsamsung%2Cexynos=
a
> > > +ut
> > > +ov920-clock.yaml%23
> > > +=24schema:
> > > +https://protect2.fireeye.com/v1/url?k=3D4dbf6fb9-12234693-4dbee4f6-0=
0
> > > +0b
> > > +abe598f7-363a2f64c69b9542&q=3D1&e=3D539edfa4-b4e4-460a-93f4-1e6f1703=
094
> > > +5&
> > > +u=3Dhttp%3A%2F%2Fdevicetree.org%2Fmeta-schemas%2Fcore.yaml%23
> > > +
> > > +title: Samsung ExynosAuto v920 SoC clock controller
> > > +
> > > +maintainers:
> > > +  - Sunyeal Hong <sunyeal.hong=40samsung.com>
> > > +  - Chanwoo Choi <cw00.choi=40samsung.com>
> > > +  - Krzysztof Kozlowski <krzk=40kernel.org>
> > > +  - Sylwester Nawrocki <s.nawrocki=40samsung.com>
> > > +
> > > +description: =7C
> > > +  ExynosAuto v920 clock controller is comprised of several CMU
> > > +units, generating
> > > +  clocks for different domains. Those CMU units are modeled as
> > > +separate device
> > > +  tree nodes, and might depend on each other. Root clocks in that
> > > +clock tree are
> > > +  two external clocks:: OSCCLK/XTCXO (38.4 MHz) and RTCCLK/XrtcXTI
> > (32768 Hz).
> > > +  The external OSCCLK must be defined as fixed-rate clock in dts.
> > > +
> > > +  CMU_TOP is a top-level CMU, where all base clocks are prepared
> > > + using PLLs and  dividers; all other clocks of function blocks
> > > + (other
> > > + CMUs) are usually  derived from CMU_TOP.
> > > +
> > > +  Each clock is assigned an identifier and client nodes can use
> > > + this identifier  to specify the clock which they consume. All
> > > + clocks available for usage  in clock consumer nodes are defined as
> > > + preprocessor macros in  'include/dt-
> > bindings/clock/samsung,exynosautov920.h' header.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - samsung,exynosautov920-cmu-top
> > > +      - samsung,exynosautov920-cmu-peric0
> > > +
> > > +  clocks:
> > > +    minItems: 1
> > > +    maxItems: 3
> > > +
> > > +  clock-names:
> > > +    minItems: 1
> > > +    maxItems: 3
> >
> > Move the descriptions and names here. Then in the if/then schemas just
> > set the number of items to 1 or 3 as appropriate.
> >
> > Rob
>=20
> Thank you for your review. I will update by reflecting the fixes.
>=20
> Thanks,
> Sunyeal Hong
>=20
>=20

I faced a new problem after modifying it as you reviewed.
For example, if I declare a new cmu block that uses only osclk and noc to d=
t, it seems that a problem occurs in check dtb.

- yaml
properties:
  compatible:
    enum:
      - samsung,exynosautov920-cmu-top
      - samsung,exynosautov920-cmu-peric0
	  - samsung,exynosautov920-cmu-misc

  clocks:
    minItems: 1
    items:
      - description: External reference clock (38.4 MHz)
      - description: Block IP clock (from CMU_TOP)
      - description: Block NOC clock (from CMU_TOP)

  clock-names:
    minItems: 1
    items:
      - const: oscclk
      - const: ip
      - const: noc

- dts
cmu_misc: clock-controller=4010020000 =7B
	compatible =3D =22samsung,exynosautov920-cmu-misc=22;
	reg =3D <0x10020000 0x8000>;
	=23clock-cells =3D <1>;

	clocks =3D <&xtcxo>,
		 <&cmu_top DOUT_CLKCMU_MISC_NOC>;
	clock-names =3D =22oscclk=22,
		      =22noc=22;
=7D;

In this case, can you tell me how to handle it?
And if a new clock item is added and a new cmu block uses only the clock it=
em added and oscclk, a problem may occur.

Thanks,
Sunyeal Hong.


