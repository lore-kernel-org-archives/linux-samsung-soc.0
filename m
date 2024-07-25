Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF1F29CA
	for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jul 2024 06:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721889320; cv=none; b=C+o4G+2hhjPhPxfQ+hurv/ubcflndpd8KfuRZI5dy75SJfGelIGwkM2BuxkNOXzxlW/OIx3iVbrFITrAFWKgoFEpytcdKE7ZMbJPsupFp8l8qL1EdSm5gGLdi4YuXB7G0S8iKe1sUrKUYSJpisH7g02glIhTnJQ7vh4OE5y+QJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721889320; c=relaxed/simple;
	bh=Ek5ERHgI1iO9w5HVm6sxeF1OesLTA687BnzXt4xrCHQ=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=jhb7yB0RU5BBMAcCVDCgz8EgBZFzZPv9mliuwQsTvb28JYciEVS/e00eOzOq+/BV4G6+q8mdYlb2/x/LhIGoqFY1tTIyAJJ8Ds02KI56Q98kvJ3fu5fBO+tZ/LIyU05y9c9sndaGj/PLf5UDUbjlBvpGlxR7qpWeBDOdzf2qjOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Y0OO69AW; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Y0OO69AW"
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20240725063516epoutp0286cf719e0bea0868452e9e67c1d17dd0~lYTXBzmS61170111701epoutp02H
	for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jul 2024 06:35:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20240725063516epoutp0286cf719e0bea0868452e9e67c1d17dd0~lYTXBzmS61170111701epoutp02H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1721889316;
	bh=Q/JMOXNCI9IdUHR/uZKFylmAXlUN/kcQ+9IuABUEBvU=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=Y0OO69AW0vHD7U3wSKpOzxN6AKwUVWeWS6ttFKPgswP2UBmzR+FTKgZZmd0Dvp0D0
	 Yh41cMaUhCGlIsk62ToT5HczY3qPT1g3KVuppGiwrkfwl8kz9uVWC7LFbyw0x7kG/B
	 T4PNJ+psOAcfT8qjkznV7weDzdMUxIm3J0qRLel0=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTP id
	20240725063515epcas2p4155ab51c7d628eb495bc982f500917dc~lYTWmyqqT1591615916epcas2p4Q;
	Thu, 25 Jul 2024 06:35:15 +0000 (GMT)
Received: from epsmgec2p1.samsung.com (unknown [182.195.36.99]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4WV1N26ppXz4x9Q1; Thu, 25 Jul
	2024 06:35:14 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
	epsmgec2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	21.69.08901.222F1A66; Thu, 25 Jul 2024 15:35:14 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20240725063514epcas2p33cc67418bd936a63d962c537e115b9d7~lYTVfetAc1527215272epcas2p3B;
	Thu, 25 Jul 2024 06:35:14 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240725063514epsmtrp2ed5d2a671999752d747211735a0f25bf~lYTVegRgg0045000450epsmtrp2w;
	Thu, 25 Jul 2024 06:35:14 +0000 (GMT)
X-AuditID: b6c32a43-a0fff700000022c5-2b-66a1f222c37a
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	E1.C9.08964.222F1A66; Thu, 25 Jul 2024 15:35:14 +0900 (KST)
Received: from KORCO118965 (unknown [10.229.18.201]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20240725063514epsmtip2ed131260699e7af5f09a30fb6eba5e02~lYTVLydhz1744317443epsmtip2N;
	Thu, 25 Jul 2024 06:35:14 +0000 (GMT)
From: "sunyeal.hong" <sunyeal.hong@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, "'Rob Herring'"
	<robh@kernel.org>
Cc: "'Sylwester Nawrocki'" <s.nawrocki@samsung.com>, "'Chanwoo Choi'"
	<cw00.choi@samsung.com>, "'Alim Akhtar'" <alim.akhtar@samsung.com>,
	"'Michael	Turquette'" <mturquette@baylibre.com>, "'Stephen Boyd'"
	<sboyd@kernel.org>, "'Conor Dooley'" <conor+dt@kernel.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <bf6cd1c9-d60a-4ef1-89f3-5d28e003ce2d@kernel.org>
Subject: RE: [PATCH v4 1/4] dt-bindings: clock: add ExynosAuto v920 SoC CMU
 bindings
Date: Thu, 25 Jul 2024 15:35:13 +0900
Message-ID: <03ef01dade5c$ce407820$6ac16860$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQKlY5hu3bVCnsOExtpi/jJA6pOgwAIfj46DASLmYXQCkOemkQII707mAaDCc8MCEkcIaLAVdPGg
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMJsWRmVeSWpSXmKPExsWy7bCmma7Sp4VpBtN3GFo8mLeNzWLN3nNM
	Fte/PGe1mH/kHKvF+fMb2C02Pb7GavGx5x6rxeVdc9gsZpzfx2Rx8ZSrxf89O9gtDr9pZ7X4
	d20jiwOvx/sbrewem1Z1snlsXlLv0bdlFaPH501yAaxR2TYZqYkpqUUKqXnJ+SmZeem2St7B
	8c7xpmYGhrqGlhbmSgp5ibmptkouPgG6bpk5QCcqKZQl5pQChQISi4uV9O1sivJLS1IVMvKL
	S2yVUgtScgrMC/SKE3OLS/PS9fJSS6wMDQyMTIEKE7Izdj+dwF5wWqri58tm1gbGx8JdjBwc
	EgImEoe3+3QxcnEICexglLj24BIzhPOJUaLp0i9GCOcbo8SGBeeYuhg5wTrO7TnADpHYyyjx
	79c8qJaXjBKn325hBaliE9CXWN19mw3EFhEIkti2bQ0LSBGzwC5miZ7d3cwgCU4BO4lzCz+C
	2cICYRJbZ3QwghzFIqAqca9VCiTMK2ApsX1tGzuELShxcuYTFhCbWUBbYtnC18wQFylI/Hy6
	jBViV5TEw1kNbBA1IhKzO9vAjpMQOMAhsefLFnaIBheJlXf/QtnCEq+Ow8SlJD6/28sGYedL
	TL7+lgmiuQEYMv+6obbZSyw685Md5FBmAU2J9bv0IQGpLHHkFtRtfBIdh/+yQ4R5JTrahCAa
	1SQ+XbkMNURG4tiJZ8wTGJVmIflsFpLPZiH5YBbCrgWMLKsYxVILinPTU5ONCgzhkZ2cn7uJ
	EZx6tZx3MF6Z/0/vECMTB+MhRgkOZiUR3mX3F6YJ8aYkVlalFuXHF5XmpBYfYjQFBvVEZinR
	5Hxg8s8riTc0sTQwMTMzNDcyNTBXEue91zo3RUggPbEkNTs1tSC1CKaPiYNTqoFpJmdGs9qV
	3EXvdm5e2fza9O/nxN+C4Y9+2BX//XTPaM4uF7sJP28eXX3DTHnH+c9bVrdI318UEsB3oIhv
	3dLpr+vs8jbpPfIM9NrxWH/pzRvbzt1gODt3QemC5KUqK443fLKSN1X+yS2t/WvyBuk3D0Wb
	pcTfcbHxrq+Jna9iqXfvyv9zCwz2WzyUbJooeruez/90zusvU27UWHF9mT27PEVTcvnl4Olt
	22uEnqZP8hPIeXDXpn17TBYjw6Xjj7YbChuErntevsWMb1JJEvOMRGuOXSe+OzdV64j1uM+M
	ubrNsDv5htvXrzd0Hi9gj10pzC6tnPZpltuH2wJS+Wtb1xptMLj1cGfJlbiZQebrOJVYijMS
	DbWYi4oTAWD0/IxGBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrAIsWRmVeSWpSXmKPExsWy7bCSvK7Sp4VpBstecVs8mLeNzWLN3nNM
	Fte/PGe1mH/kHKvF+fMb2C02Pb7GavGx5x6rxeVdc9gsZpzfx2Rx8ZSrxf89O9gtDr9pZ7X4
	d20jiwOvx/sbrewem1Z1snlsXlLv0bdlFaPH501yAaxRXDYpqTmZZalF+nYJXBlHdy1mLWiQ
	qri6bxpbA+M04S5GTg4JAROJc3sOsHcxcnEICexmlNjYsZkZIiEjsbHhPzuELSxxv+UIK0TR
	c0aJVx+vsIAk2AT0JVZ332YDsUUEgiS2/X8EVsQscIhZ4kffZBaIjn9MEtc3nGICqeIUsJM4
	t/Aj2AphgRCJyYtageIcHCwCqhL3WqVAwrwClhLb17axQ9iCEidnPgFbxiygLdH7sJURxl62
	8DXUpQoSP58uY4U4Ikri4awGNogaEYnZnW3MExiFZyEZNQvJqFlIRs1C0rKAkWUVo2RqQXFu
	em6xYYFhXmq5XnFibnFpXrpecn7uJkZwJGpp7mDcvuqD3iFGJg7GQ4wSHMxKIrzL7i9ME+JN
	SaysSi3Kjy8qzUktPsQozcGiJM4r/qI3RUggPbEkNTs1tSC1CCbLxMEp1cBk2ru5Q1AtVstw
	sle8ptACp/UW+gaCVmrT/I0VOKZkWGxxzNseM0HvsPDr/fV9L3atqJp78on/pbM3U7WPhgoI
	Z3LLhtREVfh9WtM+WegEe3T5lJcajxNcwpcwVG5kLL98ZfL/r3JpVWtPM93cf1KgIz33ovcr
	3fDZJs0P9d/v3Ch93cBY/bVee0eXtdTCgtw+xSmn3riuWVi9VYAp74lnydxyB/XEZc7bHzAc
	4TCYuumWVF7+8rC5L3oaShSWFoY7u2z8rxjx4/bJN5uufj5qfYh3/77zm585WjtnPd+s//bl
	xbCNcutiJIUmL+Q9lmF85rkNV+vkXYxurefPOO7iOOPz4Wyo/ta9rsGpO6uUWIozEg21mIuK
	EwEzQAaBMwMAAA==
X-CMS-MailID: 20240725063514epcas2p33cc67418bd936a63d962c537e115b9d7
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
	<03b201dade3f$3d66e3b0$b834ab10$@samsung.com>
	<bf6cd1c9-d60a-4ef1-89f3-5d28e003ce2d@kernel.org>

Hello Krzysztof,

> -----Original Message-----
> From: Krzysztof Kozlowski <krzk=40kernel.org>
> Sent: Thursday, July 25, 2024 3:21 PM
> To: sunyeal.hong <sunyeal.hong=40samsung.com>; 'Rob Herring'
> <robh=40kernel.org>
> Cc: 'Sylwester Nawrocki' <s.nawrocki=40samsung.com>; 'Chanwoo Choi'
> <cw00.choi=40samsung.com>; 'Alim Akhtar' <alim.akhtar=40samsung.com>; 'Mi=
chael
> Turquette' <mturquette=40baylibre.com>; 'Stephen Boyd' <sboyd=40kernel.or=
g>;
> 'Conor Dooley' <conor+dt=40kernel.org>; linux-samsung-soc=40vger.kernel.o=
rg;
> linux-clk=40vger.kernel.org; devicetree=40vger.kernel.org; linux-arm-
> kernel=40lists.infradead.org; linux-kernel=40vger.kernel.org
> Subject: Re: =5BPATCH v4 1/4=5D dt-bindings: clock: add ExynosAuto v920 S=
oC
> CMU bindings
>=20
> On 25/07/2024 05:03, sunyeal.hong wrote:
>=20
> > - dts
> > cmu_misc: clock-controller=4010020000 =7B
> > 	compatible =3D =22samsung,exynosautov920-cmu-misc=22;
> > 	reg =3D <0x10020000 0x8000>;
> > 	=23clock-cells =3D <1>;
> >
> > 	clocks =3D <&xtcxo>,
> > 		 <&cmu_top DOUT_CLKCMU_MISC_NOC>;
> > 	clock-names =3D =22oscclk=22,
> > 		      =22noc=22;
> > =7D;
> >
> > In this case, can you tell me how to handle it?
> > And if a new clock item is added and a new cmu block uses only the cloc=
k
> item added and oscclk, a problem may occur.
>=20
> The same problem was in your original version, so why suddenly it appeare=
d?
>=20
> Anyway, why clock would be missing? You just wrote in the bindings that
> there is such input clock.
>=20
> Best regards,
> Krzysztof
>=20

If I reflect Rob's review, it will be changed as below.

- yaml
properties:
  compatible:
    enum:
      - samsung,exynosautov920-cmu-top
      - samsung,exynosautov920-cmu-peric0

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

  =22=23clock-cells=22:
    const: 1

  reg:
    maxItems: 1

if:
    properties:
      compatible:
        enum:
          - samsung,exynosautov920-cmu-misc

  then:
    properties:
      clocks:
        minItems: 2
        maxItems: 2

      clock-names:
        minItems: 2
        maxItems: 2

- device tree
cmu_misc: clock-controller=4010020000 =7B
	compatible =3D =22samsung,exynosautov920-cmu-misc=22;
	reg =3D <0x10020000 0x8000>;
	=23clock-cells =3D <1>;

	clocks =3D <&xtcxo>,
		 <&cmu_top DOUT_CLKCMU_MISC_NOC>;
	clock-names =3D =22oscclk=22,
		      =22noc=22;
=7D;

In this case, ip should be used after oscclk, but misc does not use ip, so =
there is a problem in dt check.

The code of v4 version has clock items for each block, so there was no prob=
lem like this.
- yaml(v4)

  if:
    properties:
      compatible:
        contains:
          const: samsung,exynosautov920-cmu-misc

  then:
    properties:
      clocks:
        items:
          - description: External reference clock (38.4 MHz)
          - description: CMU_MISC NOC clock (from CMU_MISC)

      clock-names:
        items:
          - const: oscclk
          - const: noc

If there is anything I misunderstand, please guide me.

Thanks,
Sunyeal Hong.

