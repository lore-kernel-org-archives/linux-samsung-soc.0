Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E0141226D
	for <linux-samsung-soc@vger.kernel.org>; Fri, 10 Jul 2026 11:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783683499; cv=none; b=Df+QVycLd417g4GDZztt2TRazbQz3EQ0dgo0jwmoTHofE+Mspwm2Xga79nWjgCR3vJ7sFVUiaSe2+BgvJcX0fxeBDvgYIGlpKGCX6W3UGhEjQiU8L+YHhXIAq0Zlt0C2WBrq9mlFjFf02N3jddpyIVZ3KNUO8n4KhW1xBmZ7Fvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783683499; c=relaxed/simple;
	bh=X7pq3PyhM1o+IcurE1qdIIJe71ZzKZqVhCOunB17O7w=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=Rd6DJTnkw7g9hwhhCGpPanbkLISc6I2ahSnSCxS+GJ0e+F9QOqL19SLk/aZB4ErjZiUDdRTTCDJFYrFLUI0El37r3jsZ1RfJ9BOxrIzEE/ZdUUlpRYrHD5V3fq1cQ2P4/fP++uN+Q34kyI61/272rHtjfyuv35J1R6HmZGIsn5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=mgJlBoez; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="mgJlBoez"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20260710113802epoutp03ffa8dffe37a82200a70c17f469d6706a~A6q1csy-P2523225232epoutp03C
	for <linux-samsung-soc@vger.kernel.org>; Fri, 10 Jul 2026 11:38:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20260710113802epoutp03ffa8dffe37a82200a70c17f469d6706a~A6q1csy-P2523225232epoutp03C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1783683482;
	bh=BfsfxWnMvDHbHaU5VleFMtOa5AisCyr1aIft1Ku+Wz4=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=mgJlBoezVDK93yp3oAvOl+5PQ18Edl33ssGWuA4AvO4GPIa6xarv1+gzmlffDsbCn
	 VE/oiHgUbHP/A/EA6X0OCYxy2LAP4ic59DkfjjR6M69LawDG3yTwhVFxfJW2I7AOqq
	 v75HmHzVlAKfRBMw77BqMg6C9z8uoCZCipWvZXhU=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20260710113802epcas5p391861cea9a4c63274e786b6e52bad052~A6q00Vt0c2132921329epcas5p3M;
	Fri, 10 Jul 2026 11:38:02 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.94]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4gxVFP0dzGz2SSKY; Fri, 10 Jul
	2026 11:38:01 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20260710113800epcas5p2a5461c3d10e8c69add826fc62806d6e3~A6qy-C7ya0882308823epcas5p2x;
	Fri, 10 Jul 2026 11:38:00 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20260710113758epsmtip17831fbbbe17cf8bbc0feeb897f44aeee~A6qxpCEm20474004740epsmtip1f;
	Fri, 10 Jul 2026 11:37:58 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, "'Peter Griffin'"
	<peter.griffin@linaro.org>
Cc: <robh@kernel.org>, <conor+dt@kernel.org>, <linusw@kernel.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<hajun.sung@samsung.com>
In-Reply-To: <54c419d0-b0cb-4add-8d74-94a40804f33e@kernel.org>
Subject: RE: [PATCH v3 5/6] arm64: dts: exynos: add initial support for
 Samsung Exynos8855 smdk
Date: Fri, 10 Jul 2026 17:07:57 +0530
Message-ID: <152801dd1060$8f3baae0$adb300a0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQCQM7wiCxtRwyhZTDec7lkhalOHFwIex+rgAd5cQHMByjDVPgF/2VxQAn303Q8By1kGcQFci0CruJjxDHA=
Content-Language: en-us
X-CMS-MailID: 20260710113800epcas5p2a5461c3d10e8c69add826fc62806d6e3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260627165422epcas5p4e4c6bce0e2daa6d08a9ec18afde9ce0e
References: <CGME20260627165422epcas5p4e4c6bce0e2daa6d08a9ec18afde9ce0e@epcas5p4.samsung.com>
	<20260627171228.2687857-1-alim.akhtar@samsung.com>
	<20260627171228.2687857-6-alim.akhtar@samsung.com>
	<CADrjBPqYSTDExrBrYYf2z=23Ci8VqF9zXvbc+njDm1d4Ojrjrg@mail.gmail.com>
	<14cf01dd1052$4de88670$e9b99350$@samsung.com>
	<9eb6b0ef-cbc1-4b2f-b607-986f28ec46ee@kernel.org>
	<14e201dd1055$b7173940$2545abc0$@samsung.com>
	<54c419d0-b0cb-4add-8d74-94a40804f33e@kernel.org>



> -----Original Message-----
> From: Krzysztof Kozlowski <krzk=40kernel.org>
> Sent: Friday, July 10, 2026 3:55 PM
> To: Alim Akhtar <alim.akhtar=40samsung.com>; 'Peter Griffin'
> <peter.griffin=40linaro.org>
> Cc: robh=40kernel.org; conor+dt=40kernel.org; linusw=40kernel.org; linux-=
samsung-
> soc=40vger.kernel.org; linux-kernel=40vger.kernel.org;
> devicetree=40vger.kernel.org; linux-gpio=40vger.kernel.org;
> hajun.sung=40samsung.com
> Subject: Re: =5BPATCH v3 5/6=5D arm64: dts: exynos: add initial support f=
or Samsung
> Exynos8855 smdk
>=20
> On 10/07/2026 12:20, Alim Akhtar wrote:
> >
> >
> >> -----Original Message-----
> >> From: Krzysztof Kozlowski <krzk=40kernel.org>
> >> Sent: Friday, July 10, 2026 3:30 PM
> >> To: Alim Akhtar <alim.akhtar=40samsung.com>; 'Peter Griffin'
> >> <peter.griffin=40linaro.org>
> >> Cc: robh=40kernel.org; conor+dt=40kernel.org; linusw=40kernel.org;
> >> linux-samsung- soc=40vger.kernel.org; linux-kernel=40vger.kernel.org;
> >> devicetree=40vger.kernel.org; linux-gpio=40vger.kernel.org;
> >> hajun.sung=40samsung.com
> >> Subject: Re: =5BPATCH v3 5/6=5D arm64: dts: exynos: add initial suppor=
t
> >> for Samsung
> >> Exynos8855 smdk
> >>
> >> On 10/07/2026 11:55, Alim Akhtar wrote:
> >>>>> ---
> >>>>>  arch/arm64/boot/dts/exynos/Makefile           =7C   1 +
> >>>>>  .../boot/dts/exynos/exynos8855-pinctrl.dtsi   =7C 574
> ++++++++++++++++++
> >>>>>  .../arm64/boot/dts/exynos/exynos8855-smdk.dts =7C  32 +
> >>>>>  arch/arm64/boot/dts/exynos/exynos8855.dtsi    =7C 204 +++++++
> >>>>>  4 files changed, 811 insertions(+)  create mode 100644
> >>>>> arch/arm64/boot/dts/exynos/exynos8855-pinctrl.dtsi
> >>>>>  create mode 100644 arch/arm64/boot/dts/exynos/exynos8855-smdk.dts
> >>>>>  create mode 100644 arch/arm64/boot/dts/exynos/exynos8855.dtsi
> >>>>> +       =7D;
> >>> =5Bsnip=5D
> >>>>> +
> >>>>> +       oscclk: clock-oscclk =7B
> >>>>> +               compatible =3D =22fixed-clock=22;
> >>>>> +               clock-output-names =3D =22oscclk=22;
> >>>>> +               =23clock-cells =3D <0>;
> >>>>> +       =7D;
> >>>>
> >>>> Small nit, but I believe oscclk node should be ordered
> >>>> alpha-numerically by the node name. See
> >>>> https://docs.kernel.org/devicetree/bindings/dts-coding-
> >>>> style.html
> >>>>
> >>> Thanks, will update in v4
> >>
> >>
> >> The node feels ordered, no? clock before cpu?
> >>
> > Right, =22 ordered alpha-numerically by the node name=22
> >
> > Krzysztof, do you want to send v4 with all the reviewed-by tag collecte=
d?
>=20
> No need, there are no changes planned, right? I just give it a day or two=
 if Peter
> or someone wants to review this one in such case.
>=20
Sure, no changes for now.=20
Thanks=21

> Best regards,
> Krzysztof

