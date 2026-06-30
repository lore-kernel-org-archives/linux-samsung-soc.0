Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0F13EBF35
	for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Jun 2026 11:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782818922; cv=none; b=AJU14Q7fomryQiCNXrAX5fB/+2c/bc0MzD7sDj6JAVxV7BwW+w1kS6g0PJvWaS1FtAoRneVJglltXh54yf9qUEaWoPnvu22Qgjf3etkDNTm7c7svPGNcgtFsiz1Pd3WBrldGleON2RUzfw6qdxJH4Xd843v3VxGWxF3GIbTT0zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782818922; c=relaxed/simple;
	bh=WBlom0iDPCVsCjE864JxXWp8X0m3OrVlX25asskwS8g=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=EwDJv91oVtqHUWRQyNw8BiWSXHx4oYuvWbBvVV/OX5OjvV25/CILQJmKx6+uTxf8fIs+raqbcTmGzZrcvjbgL8pAiE61JxtHKiJtf7C0Dcbws+j/gXG4ei0lBYkLtsNdjRypkOEFEBkLKemUyTLeX85P/WnAQRddTAC8vUL4wmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=N8CMIt18; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="N8CMIt18"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20260630112838epoutp0157f0e4207d5484beb938d1729925c3c2~92Fw465mv1888918889epoutp01U
	for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Jun 2026 11:28:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20260630112838epoutp0157f0e4207d5484beb938d1729925c3c2~92Fw465mv1888918889epoutp01U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1782818918;
	bh=WBlom0iDPCVsCjE864JxXWp8X0m3OrVlX25asskwS8g=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=N8CMIt18qyqh4UyXXu6C2pgNITJJ3eLl/7VDzD0CpSERHQiRJMwiN7Jmlssm0yWb6
	 +Us5ntXEs0j374OaCF5zkXsDgxbhrpnHoOLZaO+faHvRo880HqpzkRw9FRERxHM3EE
	 6KyEDpAJ6Awe4ZEXTpsv2TxSHatLGCXmvS3UsMgo=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20260630112837epcas5p42699c74e7bdfdc08e7a387ecddd1610f~92FwTOXXd2430624306epcas5p4W;
	Tue, 30 Jun 2026 11:28:37 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.87]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4gqLW83pG4z6B9m9; Tue, 30 Jun
	2026 11:28:36 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20260630112836epcas5p49964fca2cb45fb07d2bbd7f3a7dfcbf1~92FvDdikf2430624306epcas5p4U;
	Tue, 30 Jun 2026 11:28:36 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20260630112833epsmtip1093e0631eef1002d20979d73c9441641~92FsWGGhq1723317233epsmtip1E;
	Tue, 30 Jun 2026 11:28:33 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, "'Peter Griffin'"
	<peter.griffin@linaro.org>
Cc: "'Denzeel Oliva'" <wachiturroxd150@gmail.com>, "'Sylwester Nawrocki'"
	<s.nawrocki@samsung.com>, "'Chanwoo Choi'" <cw00.choi@samsung.com>,
	"'Michael	Turquette'" <mturquette@baylibre.com>, "'Stephen Boyd'"
	<sboyd@kernel.org>, "'Brian	Masney'" <bmasney@redhat.com>, "'Rob Herring'"
	<robh@kernel.org>, "'Conor Dooley'" <conor+dt@kernel.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <b035916c-e985-4acf-930b-bb74814ae748@kernel.org>
Subject: RE: [PATCH v3 3/3] clk: samsung: exynos990: Fix PERIS gate clock
 parents
Date: Tue, 30 Jun 2026 16:58:31 +0530
Message-ID: <10d301dd0883$970925c0$c51b7140$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQEx4sfAWwy4gnk+MuXqAo8FFpNhngGTah19AjUYwH4DLBf1wQK+JwWqAckmQ8cBG1pq6bdIhjIw
Content-Language: en-us
X-CMS-MailID: 20260630112836epcas5p49964fca2cb45fb07d2bbd7f3a7dfcbf1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260629123246epcas5p2aab9da9ef417274bb0b70f74c386f7b4
References: <20260613-exynos990-peris-fix-v3-v3-0-2b230db78ae4@gmail.com>
	<20260613-exynos990-peris-fix-v3-v3-3-2b230db78ae4@gmail.com>
	<CGME20260629123246epcas5p2aab9da9ef417274bb0b70f74c386f7b4@epcas5p2.samsung.com>
	<CADrjBPpNQd6WgwVo-a3Mz74d1EptPm9D9BisLEmoFRsdUb3izw@mail.gmail.com>
	<0f1e01dd0844$01190c40$034b24c0$@samsung.com>
	<CADrjBPoZ4G09WGC_b59YWq3_EfTaPFyp0dD7VizKLYBW_eFk+A@mail.gmail.com>
	<b035916c-e985-4acf-930b-bb74814ae748@kernel.org>



> -----Original Message-----
> From: Krzysztof Kozlowski <krzk=40kernel.org>
> Sent: Tuesday, June 30, 2026 4:43 PM
> To: Peter Griffin <peter.griffin=40linaro.org>; Alim Akhtar
> <alim.akhtar=40samsung.com>
> Cc: Denzeel Oliva <wachiturroxd150=40gmail.com>; Sylwester Nawrocki
> <s.nawrocki=40samsung.com>; Chanwoo Choi <cw00.choi=40samsung.com>;
> Michael Turquette <mturquette=40baylibre.com>; Stephen Boyd
> <sboyd=40kernel.org>; Brian Masney <bmasney=40redhat.com>; Rob Herring
> <robh=40kernel.org>; Conor Dooley <conor+dt=40kernel.org>; linux-samsung-
> soc=40vger.kernel.org; linux-clk=40vger.kernel.org;
> devicetree=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org; lin=
ux-
> kernel=40vger.kernel.org
> Subject: Re: =5BPATCH v3 3/3=5D clk: samsung: exynos990: Fix PERIS gate c=
lock
> parents
>=20
> On 30/06/2026 13:02, Peter Griffin wrote:
> > Hi Alim,
> >
> > On Tue, 30 Jun 2026 at 04:53, Alim Akhtar <alim.akhtar=40samsung.com>
> wrote:
> >>
> >>
> >>
> >>> -----Original Message-----
> >>> From: Peter Griffin <peter.griffin=40linaro.org>
> >>> Sent: Monday, June 29, 2026 6:02 PM
> >>> To: Denzeel Oliva <wachiturroxd150=40gmail.com>
> >>> Cc: Krzysztof Kozlowski <krzk=40kernel.org>; Sylwester Nawrocki
> >>> <s.nawrocki=40samsung.com>; Chanwoo Choi
> <cw00.choi=40samsung.com>; Alim
> >>> Akhtar <alim.akhtar=40samsung.com>; Michael Turquette
> >>> <mturquette=40baylibre.com>; Stephen Boyd <sboyd=40kernel.org>; Brian
> >>> Masney <bmasney=40redhat.com>; Rob Herring <robh=40kernel.org>;
> Conor
> >>> Dooley <conor+dt=40kernel.org>; linux-samsung-soc=40vger.kernel.org;
> >>> linux- clk=40vger.kernel.org; devicetree=40vger.kernel.org; linux-arm=
-
> >>> kernel=40lists.infradead.org; linux-kernel=40vger.kernel.org
> >>> Subject: Re: =5BPATCH v3 3/3=5D clk: samsung: exynos990: Fix PERIS ga=
te
> >>> clock parents
> >>>
> >>> Hi Krysztof & Denzeel,
> >>>
> >>> On Sat, 13 Jun 2026 at 13:36, Denzeel Oliva
> >>> <wachiturroxd150=40gmail.com>
> >>> wrote:
> >>>>
> >>>> Correct eight PERIS gate clock parents to match the hardware clock
> >>>> tree and reorder the GIC mux parents so mout_peris_bus_user is the
> >>>> default source.
> >>>>
> >>>> Signed-off-by: Denzeel Oliva <wachiturroxd150=40gmail.com>
> >>>> ---
> >>>
> >>> Reviewed-by: Peter Griffin <peter.griffin=40linaro.org>
> >>>
> >>> =40Krysztof: I was thinking, maybe we should establish a new rule/bes=
t
> >>> practice for Samsung clock upstream submissions whereby patch
> >>> contributors should link to the downstream cal-if code for the SoC
> >>> after the --
> >>> - line. That would make reviewing the patches' correctness a bit
> >>> easier, as the downstream cal-if code would be readily available to t=
he
> reviewer.
> >>>
> >> We can leave this choice to the reviewer if they want to refer to
> downstream cal-if code.
> >
> > Generally I would like to, but I also don't have time to hunt around
> > the internet for a downstream kernel tree. My rationale was that the
> > submitter is most likely to know where the downstream code is, and is
> > likely using it for the upstream clock implementation. So, linking to
> > it as part of the submission should hopefully be fairly easy.
> >
> > If it is a Samsung SoC for which no public code is available that's
> > fine. I didn't intend this to be a hard requirement: =22you can't
> > upstream x,y,z unless you link to the cal-if code=22. I meant it more a=
s
> > =22best practice/guidance=22; if the cal-if code is publicly available,
> > linking to it would be a useful reference for reviewers.
>=20
> cal-if as vendor tree? Some contributors just base their work on downstre=
am
> GPL-compliance dumps from opensource.samsung.com, so not sure how
> that link would work.
>=20
Right, I am not against adding any best practice guideline, but I wonder on=
ly few of us will end up reviewing those patches.=20
And for other reviewer, cal-if will add more confusion as it is completely =
out of =7Btree / clk subsystem=7D interface.=20

> Best regards,
> Krzysztof

