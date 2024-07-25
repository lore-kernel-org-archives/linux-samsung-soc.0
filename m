Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A5446B8
	for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jul 2024 01:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721870650; cv=none; b=pCBsB275Gnt5FWjkhythO6XCqi9wUDlg8Ae5x/4JM7fjTKz0BshJJmDOI6VuC84fjyncVhjdxVGxHVzVPK7wjK4CGBCb2colDXiiy9j4ZRrz3siiSIj0qBpsNRFKEB5W3fHpWzYUt3+nq+gcOadLdvy/UDc5emAyVn/vGTdpyO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721870650; c=relaxed/simple;
	bh=TTQhyDFIawMrhSJfk2WTmVpePeTw76wVqnbPEGFFgQI=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=jDpD7+t39qQ173VceAlq9vO0CUVQYBV/RFhcXN0b+4blAcJWsp+Y5pColCyd/A2T1vEnxjSD5Hc8uN7KRyZuPfIDuMlBihcosfQGD1mt5WPn2SOErk4to81SLeAqDUbFJnlBtXZh4okRQb75Qy/OqPaEJUbiOPeSqHLyyQAjuk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Py9flYZp; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Py9flYZp"
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20240725012405epoutp04cc225ec3c22b18804e8ea651877a0e6a~lUDq7OYYZ1487014870epoutp04A
	for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jul 2024 01:24:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20240725012405epoutp04cc225ec3c22b18804e8ea651877a0e6a~lUDq7OYYZ1487014870epoutp04A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1721870645;
	bh=lcWowJqwataLcGPqJpSkB8xS8AWW/FBVdgQ4G5S6bgs=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=Py9flYZpNA2wWZJZXSbpWG6b2KzlY0cJ1zAGY3g8HCHghahJXA9yEVscJx4fyjghR
	 00Vy2LEcnmlhC8Uq7wBFbz91vHJUDK9HKQ/rl+A6RVpp62oYCh1JX+RIKzQTFVw7sK
	 ln6fIKBBmN0dkt2T5EVEfHoL6Rw3dM6sBZtwwkMU=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTP id
	20240725012405epcas2p45f051bcea24f3df053b8b7ec54206e06~lUDqbGwTx1893918939epcas2p4a;
	Thu, 25 Jul 2024 01:24:05 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.70]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4WTtT04Hxfz4x9QB; Thu, 25 Jul
	2024 01:24:04 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
	epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
	36.08.10066.439A1A66; Thu, 25 Jul 2024 10:24:04 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20240725012404epcas2p1b6d7c9f8813400a5b18c985699ab6450~lUDpXhTkU2864428644epcas2p14;
	Thu, 25 Jul 2024 01:24:04 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240725012403epsmtrp2e992e48f3a24828aaa384136d19390a4~lUDpPYAHJ1657516575epsmtrp2A;
	Thu, 25 Jul 2024 01:24:03 +0000 (GMT)
X-AuditID: b6c32a46-ae0cca8000002752-7c-66a1a934fcb6
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	6E.77.08964.339A1A66; Thu, 25 Jul 2024 10:24:03 +0900 (KST)
Received: from KORCO118965 (unknown [10.229.18.201]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20240725012403epsmtip2ef95cdc89e8bd2586fdd092d6311c1b0~lUDpAeOxE2622826228epsmtip2e;
	Thu, 25 Jul 2024 01:24:03 +0000 (GMT)
From: "sunyeal.hong" <sunyeal.hong@samsung.com>
To: "'Rob Herring'" <robh@kernel.org>
Cc: "'Krzysztof Kozlowski'" <krzk@kernel.org>, "'Sylwester Nawrocki'"
	<s.nawrocki@samsung.com>, "'Chanwoo Choi'" <cw00.choi@samsung.com>, "'Alim
 Akhtar'" <alim.akhtar@samsung.com>, "'Michael Turquette'"
	<mturquette@baylibre.com>, "'Stephen Boyd'" <sboyd@kernel.org>, "'Conor
 Dooley'" <conor+dt@kernel.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
In-Reply-To: <20240723205714.GA1093352-robh@kernel.org>
Subject: RE: [PATCH v4 1/4] dt-bindings: clock: add ExynosAuto v920 SoC CMU
 bindings
Date: Thu, 25 Jul 2024 10:24:03 +0900
Message-ID: <035501dade31$55cc7f40$01657dc0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQKlY5hu3bVCnsOExtpi/jJA6pOgwAIfj46DASLmYXQCkOemkbBC/cjA
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIJsWRmVeSWpSXmKPExsWy7bCmma7JyoVpBkuWylk8mLeNzWLN3nNM
	Fte/PGe1mH/kHKvF+fMb2C02Pb7GavGx5x6rxeVdc9gsZpzfx2Rx8ZSrxf89O9gtDr9pZ7X4
	d20jiwOvx/sbrewem1Z1snlsXlLv0bdlFaPH501yAaxR2TYZqYkpqUUKqXnJ+SmZeem2St7B
	8c7xpmYGhrqGlhbmSgp5ibmptkouPgG6bpk5QCcqKZQl5pQChQISi4uV9O1sivJLS1IVMvKL
	S2yVUgtScgrMC/SKE3OLS/PS9fJSS6wMDQyMTIEKE7IzDkxfx1JwX6Hi3YdexgbGZ1JdjJwc
	EgImEvsO/mEBsYUEdjBK3LlV1sXIBWR/YpTovTiXHcL5xihxpeMfK1zHpDfMEIm9jBJPTs9k
	hHBeMkq0tjQwgVSxCehLrO6+zQZiiwioSjTNesACUsQs8JRZYsP+80Bz2Tk4Bcwl/vCAlAgL
	hElsndHBCGKzAJWvWrCAHcTmFbCUmHP5FxuELShxcuYTsFOZBeQltr+dwwxxkILEz6fLWCFW
	uUmsn/6FCaJGRGJ2ZxvYoRICRzgkNnzoAnI4gBwXidn7BCB6hSVeHd/CDmFLSXx+t5cNws6X
	mHz9LRNEbwOjxLV/3VDL7CUWnfnJDjKHWUBTYv0ufYiRyhJHbkGdxifRcfgvO0SYV6KjTQii
	UU3i05XLUENkJI6deMY8gVFpFpLHZiF5bBaSB2Yh7FrAyLKKUSy1oDg3PbXYqMAIHtXJ+bmb
	GMFpV8ttB+OUtx/0DjEycTAeYpTgYFYS4X3yam6aEG9KYmVValF+fFFpTmrxIUZTYFBPZJYS
	Tc4HJv68knhDE0sDEzMzQ3MjUwNzJXHee61zU4QE0hNLUrNTUwtSi2D6mDg4pRqY2HZ+Klhh
	dvFi46ETG1z8jx9IsFG113zrHP7eObRF9cU6awmbi1OXHJyyWaZWibe9xP5aOddnfodmG6bs
	n+ueaG08/V50jlHD5GlZd64aeZ1Mse6a8tLTnO+PyZNrp1+Xct37f0pew/rQ1D5GvSWKb/Ln
	vHov1z7RmyGfKyL4Z9ml0keTDFl/sC47/WR98b7X7Tunem6t6MuUjbj5fO1XUTmZ+qeJHg33
	tkxaIp6zxN10w6Jfs2fpeUo2hXJ+3/7esehAqY7r0Tq+r+kOXXMn+y45OU8451urTMn25/+V
	yqPdi1tmdqxaJe0uPiOz2q+c0YNpzpILT0xiRZ3XZdXIfvKNE0t2LbnVHrxL6IeSEktxRqKh
	FnNRcSIAkkoNY0QEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprLIsWRmVeSWpSXmKPExsWy7bCSvK7xyoVpBst+6ls8mLeNzWLN3nNM
	Fte/PGe1mH/kHKvF+fMb2C02Pb7GavGx5x6rxeVdc9gsZpzfx2Rx8ZSrxf89O9gtDr9pZ7X4
	d20jiwOvx/sbrewem1Z1snlsXlLv0bdlFaPH501yAaxRXDYpqTmZZalF+nYJXBkHpq9jKbiv
	UPHuQy9jA+MzqS5GTg4JAROJfZPeMHcxcnEICexmlHgzYyYrREJGYmPDf3YIW1jifssRVoii
	54wSr34vZgRJsAnoS6zuvs0GYosIqEo0zXrAAlLELPCeWWLmr0PsEB0fGCV+ztoBlGHn4BQw
	l/jDA1IvLBAiMXlRKxOIzQLUu2rBArBlvAKWEnMu/2KDsAUlTs58AtTJATRTT6JtI9haZgF5
	ie1v5zBD3KYg8fPpMlaIE9wk1k//wgRRIyIxu7ONeQKj8Cwkk2YhTJqFZNIsJB0LGFlWMUqm
	FhTnpucWGxYY5qWW6xUn5haX5qXrJefnbmIEx6CW5g7G7as+6B1iZOJgPMQowcGsJML75NXc
	NCHelMTKqtSi/Pii0pzU4kOM0hwsSuK84i96U4QE0hNLUrNTUwtSi2CyTBycUg1MLqs+W19g
	Pv7qdYed0rmO8ln8RUebL5iY3NI98/F06scFXoIfVc1uX82fusdlXmOcoWRVRua+P+YtZU2X
	/i5fl/xf2nrn/22r3KwOOHheV73JEq8WslxdLIX9vTRPzOQj06+tsY46p1T1U+Ly6ij2BZ+d
	Q3qrSzffM/D89uBdRs0tx4k1nSFXrOS4Zy5Z+SdSyLLcNKXVjSkvIu/4rJXz9qbHC6eVFm/u
	awo4rFF44a1yqMQGSd0f6tPKFh486b6370FggWQm46MEhnNMkbsLW3p2pphlBJvZGMj7n5n6
	/+7tv3+t57/dKv/fySNxtYPxmoOTQg4EnvBQ/bX7hLuizZt5H/J/zbtSHzt9AfMzJZbijERD
	Leai4kQA7i7zMjADAAA=
X-CMS-MailID: 20240725012404epcas2p1b6d7c9f8813400a5b18c985699ab6450
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

Hello Rob,

> -----Original Message-----
> From: Rob Herring <robh@kernel.org>
> Sent: Wednesday, July 24, 2024 5:57 AM
> To: Sunyeal Hong <sunyeal.hong@samsung.com>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>; Sylwester Nawrocki
> <s.nawrocki@samsung.com>; Chanwoo Choi <cw00.choi@samsung.com>; Alim
> Akhtar <alim.akhtar@samsung.com>; Michael Turquette
> <mturquette@baylibre.com>; Stephen Boyd <sboyd@kernel.org>; Conor Dooley
> <conor+dt@kernel.org>; linux-samsung-soc@vger.kernel.org; linux-
> clk@vger.kernel.org; devicetree@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org; linux-kernel@vger.kernel.org
> Subject: Re: [PATCH v4 1/4] dt-bindings: clock: add ExynosAuto v920 SoC
> CMU bindings
> 
> On Tue, Jul 23, 2024 at 07:33:30AM +0900, Sunyeal Hong wrote:
> > Add dt-schema for ExynosAuto v920 SoC clock controller.
> > Add device tree clock binding definitions for below CMU blocks.
> >
> > - CMU_TOP
> > - CMU_PERIC0
> >
> > Signed-off-by: Sunyeal Hong <sunyeal.hong@samsung.com>
> > ---
> >  .../clock/samsung,exynosautov920-clock.yaml   | 115 +++++++++++
> >  .../clock/samsung,exynosautov920.h            | 191 ++++++++++++++++++
> >  2 files changed, 306 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.y
> > aml  create mode 100644
> > include/dt-bindings/clock/samsung,exynosautov920.h
> >
> > diff --git
> > a/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock
> > .yaml
> > b/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock
> > .yaml
> > new file mode 100644
> > index 000000000000..90f9f17da959
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/samsung,exynosautov920-c
> > +++ lock.yaml
> > @@ -0,0 +1,115 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> > +---
> > +$id:
> > +https://protect2.fireeye.com/v1/url?k=9932a88e-c6ae81a4-993323c1-000b
> > +abe598f7-779f1e959ac8eab9&q=1&e=539edfa4-b4e4-460a-93f4-1e6f17030945&
> > +u=http%3A%2F%2Fdevicetree.org%2Fschemas%2Fclock%2Fsamsung%2Cexynosaut
> > +ov920-clock.yaml%23
> > +$schema:
> > +https://protect2.fireeye.com/v1/url?k=4dbf6fb9-12234693-4dbee4f6-000b
> > +abe598f7-363a2f64c69b9542&q=1&e=539edfa4-b4e4-460a-93f4-1e6f17030945&
> > +u=http%3A%2F%2Fdevicetree.org%2Fmeta-schemas%2Fcore.yaml%23
> > +
> > +title: Samsung ExynosAuto v920 SoC clock controller
> > +
> > +maintainers:
> > +  - Sunyeal Hong <sunyeal.hong@samsung.com>
> > +  - Chanwoo Choi <cw00.choi@samsung.com>
> > +  - Krzysztof Kozlowski <krzk@kernel.org>
> > +  - Sylwester Nawrocki <s.nawrocki@samsung.com>
> > +
> > +description: |
> > +  ExynosAuto v920 clock controller is comprised of several CMU units,
> > +generating
> > +  clocks for different domains. Those CMU units are modeled as
> > +separate device
> > +  tree nodes, and might depend on each other. Root clocks in that
> > +clock tree are
> > +  two external clocks:: OSCCLK/XTCXO (38.4 MHz) and RTCCLK/XrtcXTI
> (32768 Hz).
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
> bindings/clock/samsung,exynosautov920.h' header.
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
> 
> Move the descriptions and names here. Then in the if/then schemas just set
> the number of items to 1 or 3 as appropriate.
> 
> Rob

Thank you for your review. I will update by reflecting the fixes.

Thanks,
Sunyeal Hong


