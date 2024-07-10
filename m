Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62C515E88
	for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Jul 2024 02:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720577458; cv=none; b=R87bW3OXtx4sE1ct/my7tzfXB7kD5s686+G6aaMazK3TpMdfqVNQhJsiUbnAOLvnsfmD4QiBlJ91rXO0F7zG7sB4fMJiUz1YF+uuvP5h0Mv/PMedIQ3HfJDfj4ypwkgFM9LuJWyIK0mFmqsgIk5cUKCi2UVAknwPdWyoy8ps8/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720577458; c=relaxed/simple;
	bh=j5SUz3CTzqZ5KPXCF79ZAMIcfKGOMlcvDHyUhyxEd+I=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=sDnzScvi38hI8SgKnpGqflynJhD9MpZZ5RIt2zSWTW/T08Ek6ylAzx0TsgxcsQgDEV3ddMwh7Nzt0P6cojHEdS/HRQoO3+GuDNDebewjiWmBaC1dH9FZa8diBTYtxaoPk816LxcC8ioNcZX181JBXrx/wh6QkucixMErdv7SfE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=NpHEC2kS; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="NpHEC2kS"
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20240710021047epoutp01c4f5795726d862290eef117bfb28915d~guBKr_4OB0844708447epoutp012
	for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Jul 2024 02:10:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20240710021047epoutp01c4f5795726d862290eef117bfb28915d~guBKr_4OB0844708447epoutp012
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1720577448;
	bh=zhV1mj3ESdqw+Dll+VEagMSYECkklSZLtZx4BxBMZl0=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=NpHEC2kSO0mjzepht/SzNvlhkb9hART3LogyqUd9RlPd3jnhbDKf+nxgpb4Flzjja
	 cfqEX9B2TO8WQgMKeIFhIJJ5ZCm3O+v6XZCv/1hsqv+V90fNuaf1jYDyqxCiMy9fHL
	 GAKCecE+QaEADtSD5bgSEGWQWJbsAp3aZUsFbDQE=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTP id
	20240710021047epcas2p187a9cc458b1bf901006aa947a91642c2~guBKLaSUF1785417854epcas2p1f;
	Wed, 10 Jul 2024 02:10:47 +0000 (GMT)
Received: from epsmgec2p1-new.samsung.com (unknown [182.195.36.91]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4WJhCp65Xjz4x9Q8; Wed, 10 Jul
	2024 02:10:46 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
	epsmgec2p1-new.samsung.com (Symantec Messaging Gateway) with SMTP id
	0C.13.25328.6ADED866; Wed, 10 Jul 2024 11:10:46 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20240710021045epcas2p1d0732c0ac526df3e75dc543e0d3f8b10~guBI0n66T2260522605epcas2p1G;
	Wed, 10 Jul 2024 02:10:45 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240710021045epsmtrp1ceb999d4a941850d33dfc293ff139357~guBIzQpoA2843328433epsmtrp15;
	Wed, 10 Jul 2024 02:10:45 +0000 (GMT)
X-AuditID: b6c32a4d-d53ff700000262f0-6b-668deda6f510
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	D0.57.29940.5ADED866; Wed, 10 Jul 2024 11:10:45 +0900 (KST)
Received: from KORCO118965 (unknown [10.229.18.201]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20240710021045epsmtip2a5a227ba136a8af44580d17ffa50491d~guBIk8_QT3038530385epsmtip2j;
	Wed, 10 Jul 2024 02:10:45 +0000 (GMT)
From: "sunyeal.hong" <sunyeal.hong@samsung.com>
To: "'Alim Akhtar'" <alim.akhtar@samsung.com>, "'Krzysztof Kozlowski'"
	<krzk@kernel.org>, "'Sylwester Nawrocki'" <s.nawrocki@samsung.com>,
	"'Chanwoo Choi'" <cw00.choi@samsung.com>, "'Michael Turquette'"
	<mturquette@baylibre.com>, "'Stephen Boyd'" <sboyd@kernel.org>, "'Rob
 Herring'" <robh@kernel.org>, "'Conor Dooley'" <conor+dt@kernel.org>
Cc: <linux-samsung-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <000001dad121$bf3c0a80$3db41f80$@samsung.com>
Subject: RE: [PATCH v2 1/4] dt-bindings: clock: add Exynos Auto v920 SoC CMU
 bindings
Date: Wed, 10 Jul 2024 11:10:45 +0900
Message-ID: <000001dad26e$5fdf5bc0$1f9e1340$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJHtUpDsgLCeLIQdS8546uqgvLWdQE7Blz4AfM7P5wBaRtFEbDwtSEg
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrOJsWRmVeSWpSXmKPExsWy7bCmqe6yt71pBuceaFk8mLeNzWLN3nNM
	Fte/PGe1mH/kHKvF+fMb2C02Pb7GavGx5x6rxeVdc9gsZpzfx2Rx8ZSrxf89O9gtDr9pZ7X4
	d20jiwOvx/sbrewem1Z1snlsXlLv0bdlFaPH501yAaxR2TYZqYkpqUUKqXnJ+SmZeem2St7B
	8c7xpmYGhrqGlhbmSgp5ibmptkouPgG6bpk5QCcqKZQl5pQChQISi4uV9O1sivJLS1IVMvKL
	S2yVUgtScgrMC/SKE3OLS/PS9fJSS6wMDQyMTIEKE7Iz7k3fylpwtLTiwe6jbA2MX2K7GDk5
	JARMJM6c3scMYgsJ7GGUOLvHsIuRC8j+xCjx/+hsdgjnG6PEpL+rgarYwTrWpkCE9zJKbF/3
	jxXCeckocf3kO1aQSWwC+hKru2+zgSREBO4wSdxe9xCsillgHaPE5plH2EGqOAWsJJre3gTr
	EBYIl/h7YgJYnEVAVWLv8t+MIDavgKXEy+4mKFtQ4uTMJywgNrOAtsSyha+ZIX5QkPj5dBnY
	HBEBN4m2zVfZIWpEJGZ3tjGDLJYQOMAhcePPChaIBheJ6SdusELYwhKvjm9hh7ClJF72t0HZ
	+RKTr79lgmhuYJS49q8bapu9xKIzP4GKOIA2aEqs36UPYkoIKEscuQV1G59Ex+G/7BBhXomO
	NiGIRjWJT1cuQw2RkTh24hnzBEalWUg+m4Xks1lIPpiFsGsBI8sqRqnUguLc9NRkowJD3bzU
	cniEJ+fnbmIEp2At3x2Mr9f/1TvEyMTBeIhRgoNZSYR3/o3uNCHelMTKqtSi/Pii0pzU4kOM
	psDwnsgsJZqcD8wCeSXxhiaWBiZmZobmRqYG5krivPda56YICaQnlqRmp6YWpBbB9DFxcEo1
	MFXP25LVc3pv+Py9pQfWWFYJfPaRdv21tD/L4NFkr0Xe0iuXyu/i/nfm9iEVn7yXxzw8Uux/
	X/C/slPoNbuX8qXowmdbHzdGOdyb76mRO5NFyXFu70rPbWc/ZTJqXXztNNmC5eqblPwjC+fv
	V10UZnHq6u23P2dPqxQqFi34ceB80PbGPJ3JWznO6jieuW4iP8n4iMuSUt2kmWfKopgnrnRY
	ZvvY4ZR66iz1a3Et+QUTkm7fstdTX7T/wuc98zYIzN1d8/2k5UnPL/9+CgmFnRJrXy++Zf8P
	xeaWp4xL8t4q50kaHPS/fn17k+aZ1ER3iwOvK5t/cs0T2fdkrdHRhiKHtuad3Vfk907dufXJ
	pB+3lFiKMxINtZiLihMBdb+APkoEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrAIsWRmVeSWpSXmKPExsWy7bCSvO7St71pBv8mmlg8mLeNzWLN3nNM
	Fte/PGe1mH/kHKvF+fMb2C02Pb7GavGx5x6rxeVdc9gsZpzfx2Rx8ZSrxf89O9gtDr9pZ7X4
	d20jiwOvx/sbrewem1Z1snlsXlLv0bdlFaPH501yAaxRXDYpqTmZZalF+nYJXBmXpv9kL3hU
	WPHrziSmBsb2qC5Gdg4JAROJtSldjFwcQgK7GSU2LH3I0sXICRSWkdjY8J8dwhaWuN9yhBWi
	6DmjRO+zG4wgCTYBfYnV3bfZQBIiAo+YJD7/3MUO4jALbGKUOLf7JhtEy2dGiW9dr1hBWjgF
	rCSa3t4Es4UFQiX+3joBNopFQFVi7/LfYDavgKXEy+4mKFtQ4uTMJ2A3MQtoSzy9+RTOXrbw
	NTPEfQoSP58uA5spIuAm0bb5KjtEjYjE7M425gmMwrOQjJqFZNQsJKNmIWlZwMiyilEytaA4
	Nz232LDAMC+1XK84Mbe4NC9dLzk/dxMjOBK1NHcwbl/1Qe8QIxMH4yFGCQ5mJRHe+Te604R4
	UxIrq1KL8uOLSnNSiw8xSnOwKInzir/oTRESSE8sSc1OTS1ILYLJMnFwSjUwTX626O+31s64
	/UIfNkTtaG/dnRt9rOm36+LVST8yPXdfF76WwxHRN61oWvUsv+3lM3Xe9RorB/TEf3S62rfj
	qoN6vO/GNaGce6M9ZA3bP2w7/klt4fUpogYBL8rOzYv2sjzEWm3vfKG9f2nzPCXGv9p2Fc6X
	Iu31Prr/eWzDvpVx7avy7NX9Jx9VHzQ4MVf8hOvtD/v/8l6MWvB58fWC9oXOvK9KefT+Vhw7
	NHfv/fvOHtrnfk3Xb4ww+Re25uBJriMGDWwiT7ufmubprZX305+lqJJ5hun/Hv3WqSbn6590
	rvYL14oxfCsa0CeX/Xl9pNGib/mTWnV4L63t+99d9Idng+Vspl1XF4pEh6eVK7EUZyQaajEX
	FScCAIyKAXszAwAA
X-CMS-MailID: 20240710021045epcas2p1d0732c0ac526df3e75dc543e0d3f8b10
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240707231444epcas2p17d7c9842f0acaff0cc352d5c15f38e73
References: <20240707231331.3433340-1-sunyeal.hong@samsung.com>
	<CGME20240707231444epcas2p17d7c9842f0acaff0cc352d5c15f38e73@epcas2p1.samsung.com>
	<20240707231331.3433340-2-sunyeal.hong@samsung.com>
	<000001dad121$bf3c0a80$3db41f80$@samsung.com>

Hello Alim,

> -----Original Message-----
> From: Alim Akhtar <alim.akhtar=40samsung.com>
> Sent: Monday, July 8, 2024 7:30 PM
> To: 'Sunyeal Hong' <sunyeal.hong=40samsung.com>; 'Krzysztof Kozlowski'
> <krzk=40kernel.org>; 'Sylwester Nawrocki' <s.nawrocki=40samsung.com>; 'Ch=
anwoo
> Choi' <cw00.choi=40samsung.com>; 'Michael Turquette'
> <mturquette=40baylibre.com>; 'Stephen Boyd' <sboyd=40kernel.org>; 'Rob
> Herring' <robh=40kernel.org>; 'Conor Dooley' <conor+dt=40kernel.org>
> Cc: linux-samsung-soc=40vger.kernel.org; linux-clk=40vger.kernel.org;
> devicetree=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org; lin=
ux-
> kernel=40vger.kernel.org
> Subject: RE: =5BPATCH v2 1/4=5D dt-bindings: clock: add Exynos Auto v920 =
SoC
> CMU bindings
>=20
> Hello Sunyeal
>=20
> > -----Original Message-----
> > From: Sunyeal Hong <sunyeal.hong=40samsung.com>
> > Sent: Monday, July 8, 2024 4:43 AM
> > To: Krzysztof Kozlowski <krzk=40kernel.org>; Sylwester Nawrocki
> > <s.nawrocki=40samsung.com>; Chanwoo Choi <cw00.choi=40samsung.com>; Ali=
m
> > Akhtar <alim.akhtar=40samsung.com>; Michael Turquette
> > <mturquette=40baylibre.com>; Stephen Boyd <sboyd=40kernel.org>; Rob
> > Herring <robh=40kernel.org>; Conor Dooley <conor+dt=40kernel.org>
> > Cc: linux-samsung-soc=40vger.kernel.org; linux-clk=40vger.kernel.org;
> > devicetree=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org;
> > linux- kernel=40vger.kernel.org; Sunyeal Hong <sunyeal.hong=40samsung.c=
om>
> > Subject: =5BPATCH v2 1/4=5D dt-bindings: clock: add Exynos Auto v920 So=
C
> > CMU bindings
> >
> > Add dt-schema for Exynos Auto v920 SoC clock controller.
> Prefer to have Exynos Auto -> ExynosAuto to match with the naming
> convention and the UM.
>=20
Okay, I will update.
> > Add device tree clock binding definitions for below CMU blocks.
> >
> > - CMU_TOP
> > - CMU_PERIC0
> >
> > Signed-off-by: Sunyeal Hong <sunyeal.hong=40samsung.com>
> > ---
> >  .../clock/samsung,exynosautov920-clock.yaml   =7C 115 +++++++++++
> >  .../clock/samsung,exynosautov920.h            =7C 191 ++++++++++++++++=
++
> >  2 files changed, 306 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/clock/samsung,exynosautov920-
> > clock.yaml
> >  create mode 100644 include/dt-bindings/clock/samsung,exynosautov920.h
> >
> > diff --git
> > a/Documentation/devicetree/bindings/clock/samsung,exynosautov920-
> > clock.yaml
> > b/Documentation/devicetree/bindings/clock/samsung,exynosautov920-
> > clock.yaml
> > new file mode 100644
> > index 000000000000..ade74d6e90c0
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/samsung,exynosautov920-
> > clo
> > +++ ck.yaml
> > =40=40 -0,0 +1,115 =40=40
> > +=23 SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> > +---
> > +=24id:
> > +http://devicetree.org/schemas/clock/samsung,exynosautov920-
> > clock.yaml=23
> > +=24schema: http://devicetree.org/meta-schemas/core.yaml=23
> > +
> > +title: Samsung Exynos Auto v920 SoC clock controller
> > +
> > +maintainers:
> > +  - Sunyeal Hong <sunyeal.hong=40samsung.com>
> > +  - Chanwoo Choi <cw00.choi=40samsung.com>
> > +  - Krzysztof Kozlowski <krzk=40kernel.org>
> > +  - Sylwester Nawrocki <s.nawrocki=40samsung.com>
> > +
> > +description: =7C
> > +  Exynos Auto v920 clock controller is comprised of several CMU
> > +units, generating
> > +  clocks for different domains. Those CMU units are modeled as
> > +separate device
> > +  tree nodes, and might depend on each other. Root clocks in that
> > +clock tree are
> > +  two external clocks:: OSCCLK/XTCXO (38.4 MHz) and RTCCLK/XrtcXTI
> > (32768 Hz).
> > +  The external OSCCLK must be defined as fixed-rate clock in dts.
> > +
> > +  CMU_TOP is a top-level CMU, where all base clocks are prepared
> > + using PLLs and  dividers; all other clocks of function blocks (other
> > + CMUs) are usually  derived from CMU_TOP.
> > +
> > +  Each clock is assigned an identifier and client nodes can use this
> > + identifier  to specify the clock which they consume. All clocks
> > + available for usage  in clock consumer nodes are defined as
> > + preprocessor macros in  'include/dt-
> > bindings/clock/samsung,exynosautov920.h' header.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - samsung,exynosautov920-cmu-top
> > +      - samsung,exynosautov920-cmu-peric0
> > +
> > +  clocks:
> > +    minItems: 1
> > +    maxItems: 3
> > +
> > +  clock-names:
> > +    minItems: 1
> > +    maxItems: 3
> > +
> > +  =22=23clock-cells=22:
> > +    const: 1
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: samsung,exynosautov920-cmu-top
> > +
> > +    then:
> > +      properties:
> > +        clocks:
> > +          items:
> > +            - description: External reference clock (38.4 MHz)
> > +
> > +        clock-names:
> > +          items:
> > +            - const: oscclk
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: samsung,exynosautov920-cmu-peric0
> > +
> > +    then:
> > +      properties:
> > +        clocks:
> > +          items:
> > +            - description: External reference clock (38.4 MHz)
> > +            - description: CMU_PERIC0 NOC clock (from CMU_TOP)
> > +            - description: CMU_PERIC0 IP clock (from CMU_TOP)
> > +
> > +        clock-names:
> > +          items:
> > +            - const: oscclk
> > +            - const: noc
> > +            - const: ip
> These are too generic name, please add peric0_noc and peric0_ip, and this
> is to match with the UM.
> I am sure in future you would like to add other IPs like USI, I2C etc for
> the peric0 block
Like Jaewon and Rob's reviews, I think it's right to use a general clock na=
me.
> > +
> > +required:
> > +  - compatible
> > +  - =22=23clock-cells=22
> > +  - clocks
> > +  - clock-names
> > +  - reg
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  =23 Clock controller node for CMU_PERIC0
> > +  - =7C
> > +    =23include <dt-bindings/clock/samsung,exynosautov920.h>
> > +
> > +    cmu_peric0: clock-controller=4010800000 =7B
> > +        compatible =3D =22samsung,exynosautov920-cmu-peric0=22;
> > +        reg =3D <0x10800000 0x8000>;
> > +        =23clock-cells =3D <1>;
> > +
> > +        clocks =3D <&xtcxo>,
> > +                 <&cmu_top DOUT_CLKCMU_PERIC0_NOC>,
> > +                 <&cmu_top DOUT_CLKCMU_PERIC0_IP>;
> > +        clock-names =3D =22oscclk=22,
> > +                      =22noc=22,
> > +                      =22ip=22;
> > +    =7D;
> > +
> > +...
> > diff --git a/include/dt-bindings/clock/samsung,exynosautov920.h
> > b/include/dt-bindings/clock/samsung,exynosautov920.h
> > new file mode 100644
> > index 000000000000..9daa617c3636
> > --- /dev/null
> > +++ b/include/dt-bindings/clock/samsung,exynosautov920.h
> > =40=40 -0,0 +1,191 =40=40
> > +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> > +/*
> > + * Copyright (c) 2024 Samsung Electronics Co., Ltd.
> > + * Author: Sunyeal Hong <sunyeal.hong=40samsung.com>
> > + *
> > + * Device Tree binding constants for Exynos Auto V920 clock controller=
.
> > + */
> > +
> > +=23ifndef _DT_BINDINGS_CLOCK_EXYNOSAUTOV920_H
> > +=23define _DT_BINDINGS_CLOCK_EXYNOSAUTOV920_H
> > +
> > +/* CMU_TOP */
> > +=23define FOUT_SHARED0_PLL		1
> > +=23define FOUT_SHARED1_PLL		2
> > +=23define FOUT_SHARED2_PLL		3
> > +=23define FOUT_SHARED3_PLL		4
> > +=23define FOUT_SHARED4_PLL		5
> > +=23define FOUT_SHARED5_PLL		6
> > +=23define FOUT_MMC_PLL			7
> > +
> > +/* MUX in CMU_TOP */
> > +=23define MOUT_SHARED0_PLL		101
> > +=23define MOUT_SHARED1_PLL		102
> > +=23define MOUT_SHARED2_PLL		103
> > +=23define MOUT_SHARED3_PLL		104
> > +=23define MOUT_SHARED4_PLL		105
> > +=23define MOUT_SHARED5_PLL		106
> > +=23define MOUT_MMC_PLL			107
> > +=23define MOUT_CLKCMU_CMU_BOOST		108
> > +=23define MOUT_CLKCMU_CMU_CMUREF		109
> > +=23define MOUT_CLKCMU_ACC_NOC		110
> > +=23define MOUT_CLKCMU_ACC_ORB		111
> > +=23define MOUT_CLKCMU_APM_NOC		112
> > +=23define MOUT_CLKCMU_AUD_CPU		113
> > +=23define MOUT_CLKCMU_AUD_NOC		114
> > +=23define MOUT_CLKCMU_CPUCL0_SWITCH	115
> > +=23define MOUT_CLKCMU_CPUCL0_CLUSTER	116
> > +=23define MOUT_CLKCMU_CPUCL0_DBG		117
> > +=23define MOUT_CLKCMU_CPUCL1_SWITCH	118
> > +=23define MOUT_CLKCMU_CPUCL1_CLUSTER	119
> > +=23define MOUT_CLKCMU_CPUCL2_SWITCH	120
> > +=23define MOUT_CLKCMU_CPUCL2_CLUSTER	121
> > +=23define MOUT_CLKCMU_DNC_NOC		122
> > +=23define MOUT_CLKCMU_DPTX_NOC		123
> > +=23define MOUT_CLKCMU_DPTX_DPGTC		124
> > +=23define MOUT_CLKCMU_DPTX_DPOSC		125
> > +=23define MOUT_CLKCMU_DPUB_NOC		126
> > +=23define MOUT_CLKCMU_DPUB_DSIM		127
> > +=23define MOUT_CLKCMU_DPUF0_NOC		128
> > +=23define MOUT_CLKCMU_DPUF1_NOC		129
> > +=23define MOUT_CLKCMU_DPUF2_NOC		130
> > +=23define MOUT_CLKCMU_DSP_NOC		131
> > +=23define MOUT_CLKCMU_G3D_SWITCH		132
> > +=23define MOUT_CLKCMU_G3D_NOCP		133
> > +=23define MOUT_CLKCMU_GNPU_NOC		134
> > +=23define MOUT_CLKCMU_HSI0_NOC		135
> > +=23define MOUT_CLKCMU_HSI1_NOC		136
> > +=23define MOUT_CLKCMU_HSI1_USBDRD		137
> > +=23define MOUT_CLKCMU_HSI1_MMC_CARD	138
> > +=23define MOUT_CLKCMU_HSI2_NOC		139
> > +=23define MOUT_CLKCMU_HSI2_NOC_UFS	140
> > +=23define MOUT_CLKCMU_HSI2_UFS_EMBD	141
> > +=23define MOUT_CLKCMU_HSI2_ETHERNET	142
> > +=23define MOUT_CLKCMU_ISP_NOC		143
> > +=23define MOUT_CLKCMU_M2M_NOC		144
> > +=23define MOUT_CLKCMU_M2M_JPEG		145
> > +=23define MOUT_CLKCMU_MFC_MFC		146
> > +=23define MOUT_CLKCMU_MFC_WFD		147
> > +=23define MOUT_CLKCMU_MFD_NOC		148
> > +=23define MOUT_CLKCMU_MIF_SWITCH		149
> > +=23define MOUT_CLKCMU_MIF_NOCP		150
> > +=23define MOUT_CLKCMU_MISC_NOC		151
> > +=23define MOUT_CLKCMU_NOCL0_NOC		152
> > +=23define MOUT_CLKCMU_NOCL1_NOC		153
> > +=23define MOUT_CLKCMU_NOCL2_NOC		154
> > +=23define MOUT_CLKCMU_PERIC0_NOC		155
> > +=23define MOUT_CLKCMU_PERIC0_IP		156
> > +=23define MOUT_CLKCMU_PERIC1_NOC		157
> > +=23define MOUT_CLKCMU_PERIC1_IP		158
> > +=23define MOUT_CLKCMU_SDMA_NOC		159
> > +=23define MOUT_CLKCMU_SNW_NOC		160
> > +=23define MOUT_CLKCMU_SSP_NOC		161
> > +=23define MOUT_CLKCMU_TAA_NOC		162
> > +
> > +/* DIV in CMU_TOP */
> > +=23define DOUT_SHARED0_DIV1		201
> > +=23define DOUT_SHARED0_DIV2		202
> > +=23define DOUT_SHARED0_DIV3		203
> > +=23define DOUT_SHARED0_DIV4		204
> > +=23define DOUT_SHARED1_DIV1		205
> > +=23define DOUT_SHARED1_DIV2		206
> > +=23define DOUT_SHARED1_DIV3		207
> > +=23define DOUT_SHARED1_DIV4		208
> > +=23define DOUT_SHARED2_DIV1		209
> > +=23define DOUT_SHARED2_DIV2		210
> > +=23define DOUT_SHARED2_DIV3		211
> > +=23define DOUT_SHARED2_DIV4		212
> > +=23define DOUT_SHARED3_DIV1		213
> > +=23define DOUT_SHARED3_DIV2		214
> > +=23define DOUT_SHARED3_DIV3		215
> > +=23define DOUT_SHARED3_DIV4		216
> > +=23define DOUT_SHARED4_DIV1		217
> > +=23define DOUT_SHARED4_DIV2		218
> > +=23define DOUT_SHARED4_DIV3		219
> > +=23define DOUT_SHARED4_DIV4		220
> > +=23define DOUT_SHARED5_DIV1		221
> > +=23define DOUT_SHARED5_DIV2		222
> > +=23define DOUT_SHARED5_DIV3		223
> > +=23define DOUT_SHARED5_DIV4		224
> > +=23define DOUT_CLKCMU_CMU_BOOST		225
> > +=23define DOUT_CLKCMU_ACC_NOC		226
> > +=23define DOUT_CLKCMU_ACC_ORB		227
> > +=23define DOUT_CLKCMU_APM_NOC		228
> > +=23define DOUT_CLKCMU_AUD_CPU		229
> > +=23define DOUT_CLKCMU_AUD_NOC		230
> > +=23define DOUT_CLKCMU_CPUCL0_SWITCH	231
> > +=23define DOUT_CLKCMU_CPUCL0_CLUSTER	232
> > +=23define DOUT_CLKCMU_CPUCL0_DBG		233
> > +=23define DOUT_CLKCMU_CPUCL1_SWITCH	234
> > +=23define DOUT_CLKCMU_CPUCL1_CLUSTER	235
> > +=23define DOUT_CLKCMU_CPUCL2_SWITCH	236
> > +=23define DOUT_CLKCMU_CPUCL2_CLUSTER	237
> > +=23define DOUT_CLKCMU_DNC_NOC		238
> > +=23define DOUT_CLKCMU_DPTX_NOC		239
> > +=23define DOUT_CLKCMU_DPTX_DPGTC		240
> > +=23define DOUT_CLKCMU_DPTX_DPOSC		241
> > +=23define DOUT_CLKCMU_DPUB_NOC		242
> > +=23define DOUT_CLKCMU_DPUB_DSIM		243
> > +=23define DOUT_CLKCMU_DPUF0_NOC		244
> > +=23define DOUT_CLKCMU_DPUF1_NOC		245
> > +=23define DOUT_CLKCMU_DPUF2_NOC		246
> > +=23define DOUT_CLKCMU_DSP_NOC		247
> > +=23define DOUT_CLKCMU_G3D_SWITCH		248
> > +=23define DOUT_CLKCMU_G3D_NOCP		249
> > +=23define DOUT_CLKCMU_GNPU_NOC		250
> > +=23define DOUT_CLKCMU_HSI0_NOC		251
> > +=23define DOUT_CLKCMU_HSI1_NOC		252
> > +=23define DOUT_CLKCMU_HSI1_USBDRD		253
> > +=23define DOUT_CLKCMU_HSI1_MMC_CARD	254
> > +=23define DOUT_CLKCMU_HSI2_NOC		255
> > +=23define DOUT_CLKCMU_HSI2_NOC_UFS	256
> > +=23define DOUT_CLKCMU_HSI2_UFS_EMBD	257
> > +=23define DOUT_CLKCMU_HSI2_ETHERNET	258
> > +=23define DOUT_CLKCMU_ISP_NOC		259
> > +=23define DOUT_CLKCMU_M2M_NOC		260
> > +=23define DOUT_CLKCMU_M2M_JPEG		261
> > +=23define DOUT_CLKCMU_MFC_MFC		262
> > +=23define DOUT_CLKCMU_MFC_WFD		263
> > +=23define DOUT_CLKCMU_MFD_NOC		264
> > +=23define DOUT_CLKCMU_MIF_NOCP		265
> > +=23define DOUT_CLKCMU_MISC_NOC		266
> > +=23define DOUT_CLKCMU_NOCL0_NOC		267
> > +=23define DOUT_CLKCMU_NOCL1_NOC		268
> > +=23define DOUT_CLKCMU_NOCL2_NOC		269
> > +=23define DOUT_CLKCMU_PERIC0_NOC		270
> > +=23define DOUT_CLKCMU_PERIC0_IP		271
> > +=23define DOUT_CLKCMU_PERIC1_NOC		272
> > +=23define DOUT_CLKCMU_PERIC1_IP		273
> > +=23define DOUT_CLKCMU_SDMA_NOC		274
> > +=23define DOUT_CLKCMU_SNW_NOC		275
> > +=23define DOUT_CLKCMU_SSP_NOC		276
> > +=23define DOUT_CLKCMU_TAA_NOC		277
> > +
> > +/* CMU_PERIC0 */
> > +=23define CLK_MOUT_PERIC0_IP_USER		1
> > +=23define CLK_MOUT_PERIC0_NOC_USER	2
> > +=23define CLK_MOUT_PERIC0_USI00_USI	3
> > +=23define CLK_MOUT_PERIC0_USI01_USI	4
> > +=23define CLK_MOUT_PERIC0_USI02_USI	5
> > +=23define CLK_MOUT_PERIC0_USI03_USI	6
> > +=23define CLK_MOUT_PERIC0_USI04_USI	7
> > +=23define CLK_MOUT_PERIC0_USI05_USI	8
> > +=23define CLK_MOUT_PERIC0_USI06_USI	9
> > +=23define CLK_MOUT_PERIC0_USI07_USI	10
> > +=23define CLK_MOUT_PERIC0_USI08_USI	11
> > +=23define CLK_MOUT_PERIC0_USI_I2C		12
> > +=23define CLK_MOUT_PERIC0_I3C		13
> > +
> > +=23define CLK_DOUT_PERIC0_USI00_USI	14
> > +=23define CLK_DOUT_PERIC0_USI01_USI	15
> > +=23define CLK_DOUT_PERIC0_USI02_USI	16
> > +=23define CLK_DOUT_PERIC0_USI03_USI	17
> > +=23define CLK_DOUT_PERIC0_USI04_USI	18
> > +=23define CLK_DOUT_PERIC0_USI05_USI	19
> > +=23define CLK_DOUT_PERIC0_USI06_USI	20
> > +=23define CLK_DOUT_PERIC0_USI07_USI	21
> > +=23define CLK_DOUT_PERIC0_USI08_USI	22
> > +=23define CLK_DOUT_PERIC0_USI_I2C		23
> > +=23define CLK_DOUT_PERIC0_I3C		24
> > +
> > +=23endif /* _DT_BINDINGS_CLOCK_EXYNOSAUTOV920_H */
> > --
> > 2.45.2
>=20

If there is anything you would like to review further, please check it out.

Thanks,
Sunyeal Hong

