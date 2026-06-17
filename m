Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02114399357
	for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Jun 2026 05:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781674729; cv=none; b=OS+5kmAMlvuVeR9PASYV5IbkiMmzU2YgPuLPjwq7TTnn1ZUhZcaU4EREhDpQYml/nQapdbpMbV+6aa2iQbeyuOLURmgAnmJqEP5FRu2RAns5X4ahiG5Fl7S1tnB5cbnqOzyObk5FyY4tFjIPSo8Y9FOokJogjXew+UCFaJJINMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781674729; c=relaxed/simple;
	bh=OaPq1O6MDi4D4DBxtibKpqpzzKzkQkUrys3yKPAAve0=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=GtgsDp1fmKITMHY6qZ6AangQj2toJlJkPDTAEO4S1Jljuf0tp/mqsaNpm6Ro2374Bx5GWfusJzbwPQtbMG9sXTwby241b2wwbKRAdL8H+XOZIsVdqtufuY7scmw5c9mexDwo5ktY5PUSLsAjHquxlDNWSQfGZs2gtBX6GdVJ+O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=N9sqzBRZ; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="N9sqzBRZ"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20260617053840epoutp0443ad1781fa42a53dc5ce36def27a6bf8~5x7gAXMXs0574605746epoutp04I
	for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Jun 2026 05:38:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20260617053840epoutp0443ad1781fa42a53dc5ce36def27a6bf8~5x7gAXMXs0574605746epoutp04I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1781674720;
	bh=Gz8vQff29nJELzRfscuT7CueAARMLh0cyeZkCiiSr9I=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=N9sqzBRZvAObe2N2iBfNxxc6FEVNlpfA/HjvruBFJVejYhNIDiWZWPyZzcwt87CeB
	 qYp1fIJN2/gWC3qAMK5lJkTQMkMycbGNQ9Oho36sy17laEIZBa43pctPjE5GmkYNPx
	 992T1Rtl2f2aAhg1vxuXbQphDZUYW+uzM2eXMKrA=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20260617053840epcas5p211ca33c9accb62c6e82a923adbd66dd6~5x7fo5yiQ2670226702epcas5p2X;
	Wed, 17 Jun 2026 05:38:40 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.95]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4ggCMM23frz6B9m6; Wed, 17 Jun
	2026 05:38:39 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20260617053838epcas5p19d736449ed87012bdca788003f4e4496~5x7eKNwiK0232302323epcas5p1Z;
	Wed, 17 Jun 2026 05:38:38 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20260617053837epsmtip212052e3ec7bf5298bf926d28ed7571c9~5x7c0ZYLt0897908979epsmtip2W;
	Wed, 17 Jun 2026 05:38:37 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Peter Griffin'" <peter.griffin@linaro.org>
Cc: <krzk@kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>,
	<linusw@kernel.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <hajun.sung@samsung.com>
In-Reply-To: <CADrjBPpyNymPXtYgdeOGtp1KDkdp9gTrBAEcJR89B+wwF8uUXw@mail.gmail.com>
Subject: RE: [PATCH v2 3/5] pinctrl: samsung: Add Exynos8855 pinctrl
 configuration
Date: Wed, 17 Jun 2026 11:08:35 +0530
Message-ID: <008d01dcfe1b$8c538c50$a4faa4f0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGWEf5gFzfJqjC43hWcQDFMYsOTVAGT6tp2AP5oUIcBL72Cmrax/7Ng
Content-Language: en-us
X-CMS-MailID: 20260617053838epcas5p19d736449ed87012bdca788003f4e4496
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260615083423epcas5p3acec08339e81e2d276d7953b3c6ee51a
References: <CGME20260615083423epcas5p3acec08339e81e2d276d7953b3c6ee51a@epcas5p3.samsung.com>
	<20260615085252.1964423-1-alim.akhtar@samsung.com>
	<20260615085252.1964423-4-alim.akhtar@samsung.com>
	<CADrjBPpyNymPXtYgdeOGtp1KDkdp9gTrBAEcJR89B+wwF8uUXw@mail.gmail.com>



> -----Original Message-----
> From: Peter Griffin <peter.griffin=40linaro.org>
> Sent: Monday, June 15, 2026 7:45 PM
> To: Alim Akhtar <alim.akhtar=40samsung.com>
> Cc: krzk=40kernel.org; robh=40kernel.org; conor+dt=40kernel.org;
> linusw=40kernel.org; linux-samsung-soc=40vger.kernel.org; linux-
> kernel=40vger.kernel.org; devicetree=40vger.kernel.org; linux-
> gpio=40vger.kernel.org; hajun.sung=40samsung.com
> Subject: Re: =5BPATCH v2 3/5=5D pinctrl: samsung: Add Exynos8855 pinctrl
> configuration
>=20
> Hi Alim,
>=20
> Thanks for your patch. It's great to see more Exynos SoCs being supported=
=21
>=20
Thanks Peter, more patches to follow.

> On Mon, 15 Jun 2026 at 09:34, Alim Akhtar <alim.akhtar=40samsung.com>
> wrote:
> >
> > Add pinctrl configuration for Exynos8855. The bank type macros are
> > reused from Exynos850 SoC.
> >
> > Signed-off-by: Alim Akhtar <alim.akhtar=40samsung.com>
> > ---
> >  .../pinctrl/samsung/pinctrl-exynos-arm64.c    =7C 123 ++++++++++++++++=
++
> >  drivers/pinctrl/samsung/pinctrl-samsung.c     =7C   2 +
> >  drivers/pinctrl/samsung/pinctrl-samsung.h     =7C   1 +
> >  3 files changed, 126 insertions(+)
> >
> > diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> > b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> > index fe9f92cb037e..db120ae4d847 100644
> > --- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> > +++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> > =40=40 -943,6 +943,129 =40=40 const struct samsung_pinctrl_of_match_dat=
a
> exynos850_of_data __initconst =3D =7B
> >         .num_ctrl       =3D ARRAY_SIZE(exynos850_pin_ctrl),
> >  =7D;
> >
>=20
> Are you sure you want to use E850 pinctrl macros and not the GS101 ones?
> The GS101 macros allow the fltcon offset to be specified, which I think i=
s
> required for all Exynos9 (including e850 SoC). Youngmin sent a series
> previously https://lore.kernel.org/lkml/20251202093613.852109-1-
> youngmin.nam=40samsung.com/
> fixing up some of this but it hasn't been re-spun in a while. In particul=
ar this
> patch https://lore.kernel.org/lkml/20251202093613.852109-4-
> youngmin.nam=40samsung.com/.
>=20
Thanks for pointing out, let me re-look into this, according will change.

> > +/* pin banks of exynos8855 pin-controller 0 (ALIVE) */ static const
> > +struct samsung_pin_bank_data exynos8855_pin_banks0=5B=5D __initconst =
=3D =7B
> > +       /* Must start with EINTG banks, ordered by EINT group number. *=
/
=5BSnip=5D
> > +static const struct samsung_pin_ctrl exynos8855_pin_ctrl=5B=5D __initc=
onst =3D =7B
> > +       =7B
> > +               /* pin-controller instance 0 ALIVE data */
> > +               .pin_banks      =3D exynos8855_pin_banks0,
> > +               .nr_banks       =3D ARRAY_SIZE(exynos8855_pin_banks0),
> > +               .eint_wkup_init =3D exynos_eint_wkup_init,
> > +               .eint_gpio_init =3D exynos_eint_gpio_init,
> > +       =7D, =7B
>=20
> With fltcon_offset specified, you could then use
> gs101_pinctrl_suspend/gs101_pinctrl_resume callbacks here.
>=20
Let me cross check with UM and will add accordingly.=20


