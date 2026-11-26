Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.254.224.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795714528;
	b=p7a26EQOAlO0hexfFyWRORZeJk5vk5wOns9X83RMDC/+cv7h8kAAz3w0d3QPG8e4vl75
	 FN7otDJCUCqmeJtSjp0+eOrlXwkaTSZxrnwPY5uiI54QfRQBTgXA5RSI3QnzNjpHm/bre
	 vpSCt3CZ21jEeRfliXd9Tei0ZBloPfUtEkmVjkF9YxyrzRw6HvCD7bZDevjsiWHlDBW9P
	 DimDauYfBpia9IQ/R6UzWyov7zPVjXgKD0qIB7MQsvqmkMefHh9He6OzOv9DkXkUWE7nA
	 wNUal0o0IXYoo50EO0y/OwxkpmKJDU6d+In9g1+xEY7fQsjXa+qilMZnLLNdvnEn+wQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795714528;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Received:Received:From:To:Cc:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:X-Mailer:Thread-Index:
	 Content-Language:X-CMS-MailID:X-Msg-Generator:Content-Type:CMS-TYPE:
	 cpgsPolicy:X-CFilter-Loop:X-CMS-RootMailID:References;
	bh=14yM+1Yamm5IaEsMmCuWFx4OfLA0U2vaBLRIMDPYO1U=;
	b=cWdOnFTpzT+EqGaQdJKlMRfYvhB2fDX55yQbEDLfYZ0ZIIiaN3iOa7zr/TJnrgsvFVch
	 +JhkNrrTkE6Zl2Zu6s3WSmQllZBQURPq+lx9OJ+R4q2U8zMwDepvoaebRMkA0ovCdsw+W
	 touVOdhllfoSZKwaC3aA74JEncKHbyfSvoWewB/Ho5ki8hdP5u0H2IJv+ZNUUT4HfmfCE
	 iDL8wpIymhA0hnILslD39AKw/1bmxMpUtVT6cpmQBOfNmX47GjsirSoL8TkW2qXvpAy6S
	 rUYjq5U5zb3XX0JXTqgdM+DSyamxZwELujm2Ha2yD4FLw9jt5OkvevuMxtQPlBoMliw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=aLJJauJS;
	arc=none smtp.remote-ip=203.254.224.33
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14803606A321
	for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Nov 2026 17:35:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14803606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=aLJJauJS
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20261126173525epoutp03358eb351d63100ad40da2dfc8fb123d6~rqNizsEFX1145311453epoutp03e
	for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Nov 2026 17:35:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20261126173525epoutp03358eb351d63100ad40da2dfc8fb123d6~rqNizsEFX1145311453epoutp03e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1795714525;
	bh=14yM+1Yamm5IaEsMmCuWFx4OfLA0U2vaBLRIMDPYO1U=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=aLJJauJSeqNDvNfBVu7tJRuYcVRWtjCl9qTUTv6yaZlIeTnaQsGAH0h9SweogNWFD
	 iQVNy0fibJLCWMMlj1c7UXw5VIOHG/QSIEUdAVy8pV4ZNv353EKf2btaNIN/8q2DQB
	 FjPuc/68bCae5mGTjeGQVQKP9DRKv0/KJxBKoX70=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20261126173524epcas5p46903feb70672bfbdf94648993741fb9a~rqNh0hkSC2895928959epcas5p44;
	Thu, 26 Nov 2026 17:35:24 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.89]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4jb3bb175gz2SSKX; Thu, 26 Nov
	2026 17:35:23 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20261126173522epcas5p2518c8da061331e3cc701a8049530da95~rqNgRjAAK2027520275epcas5p2q;
	Thu, 26 Nov 2026 17:35:22 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20261126173520epsmtip11149f069be0767a3d84426c2390cf8eb~rqNeGBwwj2823428234epsmtip1g;
	Thu, 26 Nov 2026 17:35:19 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Peter Griffin'" <peter.griffin@linaro.org>, "'Raghav Sharma'"
	<raghav.s@samsung.com>
Cc: <krzk@kernel.org>, <s.nawrocki@samsung.com>, <cw00.choi@samsung.com>,
	<sboyd@kernel.org>, <bmasney+clk@redhat.com>, <jbrunet+clk@baylibre.com>,
	<robh@kernel.org>, <conor+dt@kernel.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <is.gandhi@samsung.com>,
	<ts.amit@samsung.com>, <pokala.reddy@samsung.com>
In-Reply-To: <CADrjBPrzHP_97OgAYacJKKqeCcp9FURoi6=Dmopk6nisTdEbdA@mail.gmail.com>
Subject: RE: [PATCH v3 08/14 RESEND] clk: samsung: exynos8855: add block
 peris clock support
Date: Thu, 26 Nov 2026 23:05:18 +0530
Message-ID: <000101dd7dcc$835c0830$8a141890$@samsung.com>
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
Thread-Index: AQHlWUtnqVICpCIeTIEFEh+EoBRnawGxlKqAArMGWkMCaFOU4Lb6fmOA
Content-Language: en-us
X-CMS-MailID: 20261126173522epcas5p2518c8da061331e3cc701a8049530da95
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261113104853epcas5p175c566a1ced2547e533c21b21e60e993
References: <CGME20261113104853epcas5p175c566a1ced2547e533c21b21e60e993@epcas5p1.samsung.com>
	<20261113110612.3265841-1-raghav.s@samsung.com>
	<20261113110612.3265841-9-raghav.s@samsung.com>
	<CADrjBPrzHP_97OgAYacJKKqeCcp9FURoi6=Dmopk6nisTdEbdA@mail.gmail.com>



> -----Original Message-----
> From: Peter Griffin <peter.griffin=40linaro.org>
> Sent: Friday, November 13, 2026 6:24 PM
> To: Raghav Sharma <raghav.s=40samsung.com>
> Cc: krzk=40kernel.org; s.nawrocki=40samsung.com; cw00.choi=40samsung.com;
> alim.akhtar=40samsung.com; sboyd=40kernel.org; bmasney+clk=40redhat.com;
> jbrunet+clk=40baylibre.com; robh=40kernel.org; conor+dt=40kernel.org; lin=
ux-
> samsung-soc=40vger.kernel.org; linux-clk=40vger.kernel.org;
> devicetree=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org; lin=
ux-
> kernel=40vger.kernel.org; is.gandhi=40samsung.com; ts.amit=40samsung.com;
> pokala.reddy=40samsung.com
> Subject: Re: =5BPATCH v3 08/14 RESEND=5D clk: samsung: exynos8855: add bl=
ock
> peris clock support
>=20
> Hi Raghav,
>=20
> On Fri, 13 Nov 2026 at 10:54, Raghav Sharma <raghav.s=40samsung.com>
> wrote:
> >
> > Register compatible and cmu_info data to support clocks.
> > CMU_PERIS, this provides clocks for PERIS
> >
> > Co-developed-by: Alim Akhtar <alim.akhtar=40samsung.com>
> > Signed-off-by: Alim Akhtar <alim.akhtar=40samsung.com>
> > Signed-off-by: Raghav Sharma <raghav.s=40samsung.com>
> > ---
> >  drivers/clk/samsung/clk-exynos8855.c =7C 97
> > ++++++++++++++++++++++++++++
> >  1 file changed, 97 insertions(+)
> >
> > diff --git a/drivers/clk/samsung/clk-exynos8855.c
> > b/drivers/clk/samsung/clk-exynos8855.c
> > index dcf58f2459b0..12b5ae54b560 100644
> > --- a/drivers/clk/samsung/clk-exynos8855.c
> > +++ b/drivers/clk/samsung/clk-exynos8855.c
> > =40=40 -18,7 +18,9 =40=40
> >  /* NOTE: Must be equal to the last clock ID increased by one */
> >  =23define CLKS_NR_TOP                     (CLKCMU_DOUT_G3D_HTU + 1)
> >  =23define CLKS_NR_PERIC                   (CLK_GOUT_USI_PERIC + 1)
> > +=23define CLKS_NR_PERIS                   (CLK_GOUT_WDT1_PERIS + 1)
> >
> > +=23define EXYNOS8855_PERIS_GATE_DBG_OFFSET      0x2004
> >  =23define EXYNOS8855_PERIC_GATE_DBG_OFFSET      0x2024
> >  =23define EXYNOS8855_TOP_GATE_DBG_OFFSET      0x20A0
> >
> > =40=40 -1092,6 +1094,98 =40=40 static const struct samsung_cmu_info
> peric_cmu_info __initconst =3D =7B
> >         .memclk_offset          =3D EXYNOS8855_MEMCLK_OFFSET,
> >  =7D;
> >
> > +/* ---- CMU_PERIS
> > +--------------------------------------------------------- */
> > +
> > +/* Register Offset definitions for CMU_PERIS (0x10030000) */
> > +=23define CMU_PERIS_PLL_CON0_MUX_CLKCMU_PERIS_NOC_USER
> 0x600
> > +=23define CMU_PERIS_CLK_CON_MUX_CLK_PERIS_GIC                    0x100=
0
> > +=23define CMU_PERIS_PLL_CON0_MUX_CLK_PERIS_GIC_USER
> 0x610
> > +=23define CMU_PERIS_CLK_CON_DIV_CLK_PERIS_NOCP                   0x180=
0
> > +=23define CMU_PERIS_CLK_CON_DIV_CLK_PERIS_OTP                    0x180=
4
> > +=23define
> CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_CMU_PERIS_IPCLKPORT_PCLK
> 0x201c
> > +=23define
> CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_SYSREG_PERIS_IPCLKPORT_P
> CLK  0x2040
> > +=23define
> CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_WDT0_IPCLKPORT_PCLK
> 0x2048
> > +=23define
> CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_WDT1_IPCLKPORT_PCLK
> 0x204c
> > +=23define CMU_PERIS_CONTROLLER_OPTION0_CMU_CTRL                  0x800
> > +
> > +static const unsigned long peris_clk_regs=5B=5D __initconst =3D =7B
> > +       CMU_PERIS_PLL_CON0_MUX_CLKCMU_PERIS_NOC_USER,
> > +       CMU_PERIS_CLK_CON_MUX_CLK_PERIS_GIC,
> > +       CMU_PERIS_PLL_CON0_MUX_CLK_PERIS_GIC_USER,
> > +       CMU_PERIS_CLK_CON_DIV_CLK_PERIS_NOCP,
> > +       CMU_PERIS_CLK_CON_DIV_CLK_PERIS_OTP,
> > +
> CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_CMU_PERIS_IPCLKPORT_PCLK,
> > +
> CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_SYSREG_PERIS_IPCLKPORT_P
> CLK,
> > +
> CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_WDT0_IPCLKPORT_PCLK,
> > +
> CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_WDT1_IPCLKPORT_PCLK,
> > +       CMU_PERIS_CONTROLLER_OPTION0_CMU_CTRL,
> > +=7D;
>=20
> Same comment about preserving register state from the bootloader when
> powering off/on PERIS block.
>=20
> > +
> > +/* List of parent clocks for Muxes in CMU_PERIS */
> > +PNAME(mout_clkcmu_peris_noc_user_p) =3D =7B =22oscclk=22,
> > +=22dout_clkcmu_peris_noc=22 =7D;
> > +PNAME(mout_clk_peris_gic_p) =3D =7B =22oscclk=22,
> > +=22mout_clkcmu_peris_gic_user=22 =7D;
> > +PNAME(mout_clkcmu_peris_gic_user_p) =3D =7B =22oscclk=22,
> > +=22dout_clkcmu_peris_gic=22 =7D;
> > +
> > +static const struct samsung_mux_clock peris_mux_clks=5B=5D __initconst=
 =3D =7B
> > +       MUX(CLK_MOUT_PERIS_NOC_USER, =22mout_clkcmu_peris_noc_user=22,
> > +           mout_clkcmu_peris_noc_user_p,
> CMU_PERIS_PLL_CON0_MUX_CLKCMU_PERIS_NOC_USER, 4, 1),
> > +       MUX(CLK_MOUT_PERIS_GIC, =22mout_clk_peris_gic=22,
> > +           mout_clk_peris_gic_p,
> CMU_PERIS_CLK_CON_MUX_CLK_PERIS_GIC, 0, 1),
> > +       MUX(CLK_MOUT_PERIS_GIC_USER, =22mout_clkcmu_peris_gic_user=22,
> > +           mout_clkcmu_peris_gic_user_p,
> > +CMU_PERIS_PLL_CON0_MUX_CLK_PERIS_GIC_USER, 4, 1), =7D;
> > +
> > +static const struct samsung_div_clock peris_div_clks=5B=5D __initconst=
 =3D =7B
> > +       DIV(CLK_DOUT_PERIS_NOCP, =22dout_clkcmu_peris_nocp=22,
> > +           =22mout_clkcmu_peris_noc_user=22,
> CMU_PERIS_CLK_CON_DIV_CLK_PERIS_NOCP,
> > +           0, 4),
> > +       DIV(CLK_DOUT_PERIS_OTP, =22dout_clkcmu_peris_otp=22,
> > +           =22oscclk=22, CMU_PERIS_CLK_CON_DIV_CLK_PERIS_OTP,
> > +           0, 4),
> > +=7D;
> > +
> > +static const struct samsung_gate_clock peris_gate_clks=5B=5D __initcon=
st =3D =7B
> > +       GATE(CLK_GOUT_CMU_PERIS, =22gout_cmu_peris=22,
> > +            =22dout_clkcmu_peris_nocp=22,
> > +
> CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_CMU_PERIS_IPCLKPORT_PCLK,
> > +            21, 0, 0),
> > +       GATE(CLK_GOUT_SYSREG_PERIS, =22gout_sysreg_peris=22,
> > +            =22dout_clkcmu_peris_nocp=22,
> > +
> CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_SYSREG_PERIS_IPCLKPORT_P
> CLK,
> > +            21, 0, 0),
> > +       GATE(CLK_GOUT_WDT0_PERIS, =22gout_wdt0_peris=22,
> > +            =22dout_clkcmu_peris_nocp=22,
> > +
> CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_WDT0_IPCLKPORT_PCLK,
> > +            21, 0, 0),
> > +       GATE(CLK_GOUT_WDT1_PERIS, =22gout_wdt1_peris=22,
> > +            =22dout_clkcmu_peris_nocp=22,
> > +
> CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_WDT1_IPCLKPORT_PCLK,
> > +            21, 0, 0),
>=20
> The Linux clock name strings look wrong here. It looks like you've genera=
lly
> followed the clk-gs101 clock name mangling in this series so it should be
> =22gout_<block-name>_<IP-clock-name>, but you have =22gout_IP-
> clock_name>-<block-name>=22. I know there is some =22name diversity=22 in=
-tree
> for various SoCs, but with new SoCs using auto clocks I would like to kee=
p the
> naming scheme following a similar style to clk-gs101.
>=20
> Also I guess with auto clocks now enabled from the start you may never
> need to expose all the CMU bus clocks, but I worry a bit you may have
> mangled the names here a bit too much. If you do need to expose extra
> gates you might get name collisions. For example in clk-gs101 we have bot=
h
>=20
> gout_apm_apm_usi0_uart_ipclk
> gout_apm_apm_usi0_uart_pclk
>=20
> So we kept the _pclk suffix in the Linux name to avoid a name collision.
>=20
Thanks for review, will change to gout_<block-name>_<IP-clock-name> convent=
ion=20
> Thanks,
>=20
> Peter

