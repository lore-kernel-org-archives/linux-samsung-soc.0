Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.254.224.24
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795707854;
	b=oYXUL7NoD2UaQJsuzQ/NqABgNYTDL9NGdu38R7B1G+pe+Gu/iFI5xMZ0fBwQ2SJxQ79G
	 e1V8bH03/wV1vRMggcbvXyy3OCos1uPPLnajruAusvLbLzdkWHg30K1ElGOqzx2VhDCaa
	 zepEgnudWg6+13mtLVRprzSXRaH3QJzJ3URHSctKQGjCEmg7Ks1qpJ0Nq53EOrLBVVPCP
	 y3+95V/1a7nFeDdouo0XqbOQk/8KDnQbt7OlEN4YjdzHXAjacj3p8VNnZ5mS7OOudDnzv
	 5khMB3Ur7+AYChw1c+C7QlVuP6gC9DUuBiCq9CAEjV4bmCDws8PkLtBU8Js5VUw3+mA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795707854;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Received:Received:From:To:Cc:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:X-Mailer:Thread-Index:
	 Content-Language:X-CMS-MailID:X-Msg-Generator:Content-Type:CMS-TYPE:
	 cpgsPolicy:X-CFilter-Loop:X-CMS-RootMailID:References;
	bh=8/2RIhr8qmshbZKgEJCspHFVA0yAW1nZUYa6uqR0kME=;
	b=gfjVvb5QQXvjSYsZHDLYqORFWrx9XeAK3ygm/l+qyuspEwgbDCLbq9sz9u6qQYYJUV/7
	 3RQa9miTXd4fbtaJNPDRceKFmJPe83Sl4V5VLY2+cBMVUOgkSy0EHvh6HE+6/ucAdkA2K
	 aamqZ9WDZA/wV4ib+lfI78aHmwPqDZlcAYqv05w3qPW19mmNUq0Ghcbz3K886+Zal14dt
	 jDdZYNVquBdlWefkw/ThZfvuFS5EaGQfh9J0EsZUBK2gdI2aJd4eupCN1THojylbywy+d
	 6u7AdPvw/c8BHwip9+SvMgWYdmgn9+uutvomtpRzsqLp5x1tzxAwnz6lJPnB5IAyh6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=JWQa9tC3;
	arc=none smtp.remote-ip=203.254.224.24
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB594606A323
	for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Nov 2026 15:44:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB594606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=JWQa9tC3
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20261126154405epoutp0126fc321e2a08a499a056af6e3b7fa69e~rosWPzdWY0988509885epoutp01v
	for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Nov 2026 15:44:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20261126154405epoutp0126fc321e2a08a499a056af6e3b7fa69e~rosWPzdWY0988509885epoutp01v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1795707845;
	bh=8/2RIhr8qmshbZKgEJCspHFVA0yAW1nZUYa6uqR0kME=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=JWQa9tC3hIYmABN1K4WRN6wkGJGddPkodHlJJt86Jp/0UqF003YbiGqUPDTHpLLb0
	 0wxn5GgH3X4m+hICFb4JQO3Gy5ttEoaz7dNEGHKXlpQ7mfB9XqNKIbOJ+UyftjP742
	 Zy5JIJ4Jxf+fCveKWWMHwp6Yqmo9MbRVp3N5Nm7k=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20261126154404epcas5p4e452e034245d3db160e74d05e3d3fa25~rosU_XgKJ2602626026epcas5p4z;
	Thu, 26 Nov 2026 15:44:04 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.86]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4jb17738Qxz2SSKZ; Thu, 26 Nov
	2026 15:44:03 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20261126154402epcas5p27608ba8f724eda55014b644b1d4e711a~rosTdxN3V1258512585epcas5p2p;
	Thu, 26 Nov 2026 15:44:02 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20261126154400epsmtip1969fb94ad98af9b6cd6c1014143ba1f8~rosRRzx0r0927909279epsmtip1D;
	Thu, 26 Nov 2026 15:44:00 +0000 (GMT)
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
In-Reply-To: <CADrjBPoAVMdxgU4P+shh+9O5rGJp+m3sRQMDd2c-7zbJ8qhiBQ@mail.gmail.com>
Subject: RE: [PATCH v3 07/14 RESEND] clk: samsung: exynos8855: add block top
 and peric clock support
Date: Thu, 26 Nov 2026 21:13:58 +0530
Message-ID: <000001dd7dbc$f5fa2d00$e1ee8700$@samsung.com>
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
Thread-Index: AQIXbjCFvuM775FMvx+V85gotW/ScAGxlKqAAw1MM3IBhutM2LaaJbZw
Content-Language: en-us
X-CMS-MailID: 20261126154402epcas5p27608ba8f724eda55014b644b1d4e711a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261113104850epcas5p4ef9292af100475b1f12a2601bf5e1a84
References: <CGME20261113104850epcas5p4ef9292af100475b1f12a2601bf5e1a84@epcas5p4.samsung.com>
	<20261113110612.3265841-1-raghav.s@samsung.com>
	<20261113110612.3265841-8-raghav.s@samsung.com>
	<CADrjBPoAVMdxgU4P+shh+9O5rGJp+m3sRQMDd2c-7zbJ8qhiBQ@mail.gmail.com>

Hi Peter

> -----Original Message-----
> From: Peter Griffin <peter.griffin=40linaro.org>
> Sent: Friday, November 13, 2026 5:36 PM
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
> Subject: Re: =5BPATCH v3 07/14 RESEND=5D clk: samsung: exynos8855: add bl=
ock
> top and peric clock support
>=20
> Hi Raghav,
>=20
> Nice to see you got the auto clock mode working on this SoC. Great Work=
=21
> See some inline comments below
>=20
> On Fri, 13 Nov 2026 at 10:53, Raghav Sharma <raghav.s=40samsung.com>
> wrote:
> >
> > Register compatible and cmu_info data to support clocks.
> > CMU_TOP & CMU_PERIC, these provide clocks for TOP & PERIC
> >
> > Co-developed-by: Alim Akhtar <alim.akhtar=40samsung.com>
> > Signed-off-by: Alim Akhtar <alim.akhtar=40samsung.com>
> > Signed-off-by: Raghav Sharma <raghav.s=40samsung.com>
> > ---
> >  drivers/clk/samsung/Makefile         =7C    1 +
> >  drivers/clk/samsung/clk-exynos8855.c =7C 1130
> > ++++++++++++++++++++++++++
> >  2 files changed, 1131 insertions(+)
> >  create mode 100644 drivers/clk/samsung/clk-exynos8855.c
> >
> > diff --git a/drivers/clk/samsung/Makefile
> > b/drivers/clk/samsung/Makefile index b3e994bd525d..99c2c304ff48 100644
> > --- a/drivers/clk/samsung/Makefile
> > +++ b/drivers/clk/samsung/Makefile
> > =40=40 -29,6 +29,7 =40=40 obj-=24(CONFIG_EXYNOS_ARM64_COMMON_CLK) +=3D
> > clk-exynos8895.o
> >  obj-=24(CONFIG_EXYNOS_ARM64_COMMON_CLK)  +=3D clk-exynos990.o
> >  obj-=24(CONFIG_EXYNOS_ARM64_COMMON_CLK)  +=3D clk-exynosautov9.o
> >  obj-=24(CONFIG_EXYNOS_ARM64_COMMON_CLK)  +=3D clk-
> exynosautov920.o
> > +obj-=24(CONFIG_EXYNOS_ARM64_COMMON_CLK)  +=3D clk-exynos8855.o
> >  obj-=24(CONFIG_EXYNOS_ARM64_COMMON_CLK)  +=3D clk-gs101.o
> >  obj-=24(CONFIG_EXYNOS_ACPM_CLK)          +=3D clk-acpm.o
> >  obj-=24(CONFIG_S3C64XX_COMMON_CLK)       +=3D clk-s3c64xx.o
> > diff --git a/drivers/clk/samsung/clk-exynos8855.c
> > b/drivers/clk/samsung/clk-exynos8855.c
> > new file mode 100644
> > index 000000000000..dcf58f2459b0
> > --- /dev/null
> > +++ b/drivers/clk/samsung/clk-exynos8855.c
> > =40=40 -0,0 +1,1130 =40=40
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (c) 2026 Samsung Electronics Co., Ltd.
> > + * Author: Raghav Sharma <raghav.s=40samsung.com>
> > + *
> > + * Common Clock Framework support for Exynos 8855 SoC.
> > + */
> > +
> > +=23include <linux/clk-provider.h>
> > +=23include <linux/of.h>
> > +=23include <linux/platform_device.h>
> > +
> > +=23include <dt-bindings/clock/samsung,exynos8855.h>
> > +
> > +=23include =22clk.h=22
> > +=23include =22clk-exynos-arm64.h=22
> > +
> > +/* NOTE: Must be equal to the last clock ID increased by one */
> > +=23define CLKS_NR_TOP                     (CLKCMU_DOUT_G3D_HTU + 1)
> > +=23define CLKS_NR_PERIC                   (CLK_GOUT_USI_PERIC + 1)
> > +
> > +=23define EXYNOS8855_PERIC_GATE_DBG_OFFSET      0x2024
> > +=23define EXYNOS8855_TOP_GATE_DBG_OFFSET      0x20A0
> > +
> > +=23define EXYNOS8855_DRCG_EN_OFFSET       0x104
> > +=23define EXYNOS8855_MEMCLK_OFFSET        0x108
> > +
> > +/* ---- CMU_TOP
> > +--------------------------------------------------------- */
> > +
> > +/* Register Offset definitions for CMU_TOP (0x13900000) */
> > +/* PLL */
>=20
> IIUC in clk-pll.c you are using PLL_LOCKTIME_PLL_SHARED* - 4 for the
> PLL_CON8 register offset? I was expecting to see those registers defined
> here
>=20
Sure will update this in v4

> > +=23define PLL_LOCKTIME_PLL_SHARED0                            0x8
> > +=23define PLL_LOCKTIME_PLL_SHARED1                            0x10
> > +=23define PLL_LOCKTIME_PLL_SHARED2                            0x18
> > +=23define PLL_LOCKTIME_PLL_MMC                                 0x20
> > +=23define PLL_LOCKTIME_PLL_SHARED3                            0x28
> > +=23define PLL_LOCKTIME_PLL_SHARED4                            0x38
> > +=23define PLL_LOCKTIME_PLL_MIF_SWITCH                         0x30
> > +=23define PLL_CON0_PLL_MMC                                    0x1c0
> > +=23define PLL_CON3_PLL_MMC                                    0x1cc
> > +=23define PLL_CON0_PLL_SHARED0                                0x100
> > +=23define PLL_CON3_PLL_SHARED0                                0x10c
> > +=23define PLL_CON0_PLL_SHARED1                                0x140
> > +=23define PLL_CON3_PLL_SHARED1                                0x14c
> > +=23define PLL_CON0_PLL_SHARED2                                0x180
> > +=23define PLL_CON3_PLL_SHARED2                                0x18c
> > +=23define PLL_CON0_PLL_SHARED3                                0x200
> > +=23define PLL_CON3_PLL_SHARED3                                0x20c
> > +=23define PLL_CON0_PLL_SHARED4                                0x280
> > +=23define PLL_CON3_PLL_SHARED4                                0x28c
> > +=23define PLL_CON0_PLL_MIF_SWITCH                             0x240
> > +=23define PLL_CON3_PLL_MIF_SWITCH                             0x24c
> > +
> > +/* MUX & DIV */
> > +=23define CMU_TOP_CLK_CON_MUX_CLKCMU_AUD_CPU                   0x1000
> > +=23define CMU_TOP_CLK_CON_MUX_CLKCMU_AUD_NOC
> 0x1004
> > +=23define CMU_TOP_CLK_CON_MUX_CLKCMU_CPUCL0_SWITCH
> 0x1008
> > +=23define CMU_TOP_CLK_CON_MUX_CLKCMU_CPUCL0_NOCP
> 0x100c
> > +=23define CMU_TOP_CLK_CON_MUX_CLKCMU_DSU_SWITCH
> 0x1010
> > +=23define CMU_TOP_CLK_CON_MUX_CLKCMU_CPUCL1_SWITCH
> 0x1014
> > +=23define CMU_TOP_CLK_CON_MUX_CLKCMU_CIS_CLK0                  0x1018
> > +=23define CMU_TOP_CLK_CON_MUX_CLKCMU_CIS_CLK1                  0x101c
> > +=23define CMU_TOP_CLK_CON_MUX_CLKCMU_CIS_CLK2                  0x1020
> > +=23define CMU_TOP_CLK_CON_MUX_CLKCMU_CIS_CLK3                  0x1024
> > +=23define CMU_TOP_CLK_CON_MUX_CLKCMU_CIS_CLK4                  0x1028
> > +=23define CMU_TOP_CLK_CON_MUX_CLKCMU_CMU_BOOST_TOP
> 0x102c
> > +=23define CMU_TOP_CLK_CON_MUX_CLKCMU_CMU_BOOST
> 0x1030
> > +=23define CMU_TOP_CLK_CON_MUX_CLKCMU_CMU_BOOST_CPU
> 0x1034
> > +=23define CMU_TOP_CLK_CON_MUX_CLKCMU_CMU_BOOST_MIF0
> 0x1038
> > +=23define CMU_TOP_CLK_CON_MUX_CLKCMU_CSIS_NOC                  0x103c
> > +=23define CMU_TOP_CLK_CON_MUX_CLKCMU_CSTAT_NOC
> 0x1040
> > +=23define CMU_TOP_CLK_CON_MUX_CLKCMU_CSTAT_BYRP
> 0x1044
> > +=23define CMU_TOP_CLK_CON_MUX_CLKCMU_DPU_NOC                   0x1048
> > +=23define CMU_TOP_CLK_CON_MUX_CLKCMU_G3DCORE_SWITCH
> 0x104c
> > +=23define CMU_TOP_CLK_CON_MUX_CLKCMU_M2M_NOC
> 0x1058
> > +=23define CMU_TOP_CLK_CON_MUX_CLKCMU_M2M_JPEG
> 0x105c
> > +=23define CMU_TOP_CLK_CON_MUX_CLKCMU_M2M_GDC
> 0x1060
> > +=23define CMU_TOP_CLK_CON_MUX_CLKCMU_MIF1_NOCP
> 0x1064
> > +=23define CMU_TOP_CLK_CON_MUX_CLKCMU_MFC_NOC
> 0x1068
> > +=23define CMU_TOP_CLK_CON_MUX_CLKCMU_MIF0_NOCP
> 0x106c
> > +=23define CMU_TOP_CLK_CON_MUX_CLKCMU_NOCL0_NOC
> 0x1070
> > +=23define CMU_TOP_CLK_CON_MUX_CLKCMU_NOCL1A_NOC
> 0x1074
> > +=23define CMU_TOP_CLK_CON_MUX_CLKCMU_PERIC_NOC
> 0x1078
> > +=23define CMU_TOP_CLK_CON_MUX_CLKCMU_PERIC_MMC_CARD
> 0x107c
> > +=23define CMU_TOP_CLK_CON_MUX_CLKCMU_PERIC_IP                  0x1080
> > +=23define CMU_TOP_CLK_CON_DIV_CLKCMU_AUD_CPU                   0x1800
> > +=23define CMU_TOP_CLK_CON_DIV_CLKCMU_AUD_NOC                   0x1804
> > +=23define CMU_TOP_CLK_CON_DIV_CLKCMU_CPUCL0_SWITCH
> 0x1808
> > +=23define CMU_TOP_CLK_CON_DIV_CLKCMU_CPUCL0_NOCP
> 0x180c
> > +=23define CMU_TOP_CLK_CON_DIV_CLKCMU_DSU_SWITCH
> 0x1810
> > +=23define CMU_TOP_CLK_CON_DIV_CLKCMU_CPUCL1_SWITCH
> 0x1814
> > +=23define CMU_TOP_CLK_CON_DIV_CLKCMU_CIS_CLK0                  0x1818
> > +=23define CMU_TOP_CLK_CON_DIV_CLKCMU_CIS_CLK1                  0x181c
> > +=23define CMU_TOP_CLK_CON_DIV_CLKCMU_CIS_CLK2                  0x1820
> > +=23define CMU_TOP_CLK_CON_DIV_CLKCMU_CIS_CLK3                  0x1824
> > +=23define CMU_TOP_CLK_CON_DIV_CLKCMU_CIS_CLK4                  0x1828
> > +=23define CMU_TOP_CLK_CON_DIV_CLKCMU_CMU_BOOST_TOP
> 0x182c
> > +=23define CMU_TOP_CLK_CON_DIV_CLKCMU_CMU_BOOST
> 0x1830
> > +=23define CMU_TOP_CLK_CON_DIV_CLKCMU_CSIS_NOC                  0x1834
> > +=23define CMU_TOP_CLK_CON_DIV_CLKCMU_CMU_BOOST_CPU
> 0x1838
> > +=23define CMU_TOP_CLK_CON_DIV_CLKCMU_CMU_BOOST_MIF0
> 0x183c
> > +=23define CMU_TOP_CLK_CON_DIV_CLKCMU_CSTAT_NOC                 0x1840
> > +=23define CMU_TOP_CLK_CON_DIV_CLKCMU_CSTAT_BYRP                0x1844
> > +=23define CMU_TOP_CLK_CON_DIV_CLKCMU_DPU_NOC                   0x1848
> > +=23define CMU_TOP_CLK_CON_DIV_CLKCMU_G3DCORE_SWITCH
> 0x184c
> > +=23define CMU_TOP_CLK_CON_DIV_CLKCMU_M2M_NOC                   0x1858
> > +=23define CMU_TOP_CLK_CON_DIV_CLKCMU_M2M_JPEG                  0x185c
> > +=23define CMU_TOP_CLK_CON_DIV_CLKCMU_M2M_GDC                   0x1860
> > +=23define CMU_TOP_CLK_CON_DIV_CLKCMU_MIF1_NOCP                 0x1864
> > +=23define CMU_TOP_CLK_CON_DIV_CLKCMU_MFC_NOC                   0x1868
> > +=23define CMU_TOP_CLK_CON_DIV_CLKCMU_MIF0_NOCP                 0x186c
> > +=23define CMU_TOP_CLK_CON_DIV_CLKCMU_NOCL0_NOC                 0x1870
> > +=23define CMU_TOP_CLK_CON_DIV_CLKCMU_NOCL1A_NOC
> 0x1874
> > +=23define CMU_TOP_CLK_CON_DIV_CLKCMU_PERIC_NOC                 0x1878
> > +=23define CMU_TOP_CLK_CON_DIV_CLKCMU_PERIC_MMC_CARD
> 0x187c
> > +=23define CMU_TOP_CLK_CON_DIV_CLKCMU_PERIC_IP                 0x1880
> > +=23define CMU_TOP_CLK_CON_MUX_CLKCMU_PERIS_GIC                 0x10c4
> > +=23define CMU_TOP_CLK_CON_MUX_CLKCMU_PERIS_NOC                 0x10c8
> > +=23define CMU_TOP_CLK_CON_DIV_CLKCMU_PERIS_GIC                 0x18c0
> > +=23define CMU_TOP_CLK_CON_DIV_CLKCMU_PERIS_NOC                 0x18c4
> > +=23define CMU_TOP_CLK_CON_MUX_CLKCMU_HSI_NOC                   0x1050
> > +=23define CMU_TOP_CLK_CON_MUX_CLKCMU_HSI_UFS_EMBD
> 0x1054
> > +=23define CMU_TOP_CLK_CON_DIV_CLKCMU_HSI_NOC                   0x1850
> > +=23define CMU_TOP_CLK_CON_DIV_CLKCMU_HSI_UFS_EMBD
> 0x1854
> > +=23define CMU_TOP_CLK_CON_MUX_CLKCMU_RGBP_NOC
> 0x1084
> > +=23define CMU_TOP_CLK_CON_MUX_CLKCMU_YUVP_NOC
> 0x1090
> > +=23define CMU_TOP_CLK_CON_MUX_CLKCMU_ALIVE_NOC
> 0x1094
> > +=23define CMU_TOP_CLK_CON_MUX_CLKCMU_CSIS_DCPHY
> 0x1098
> > +=23define CMU_TOP_CLK_CON_MUX_CLKCMU_CSIS_OIS                  0x109c
> > +=23define CMU_TOP_CLK_CON_MUX_CLKCMU_ICPU_NOCD_0
> 0x10a0
> > +=23define CMU_TOP_CLK_CON_MUX_CLKCMU_ICPU_NOCD_1
> 0x10a4
> > +=23define CMU_TOP_CLK_CON_MUX_CLKCMU_GNPU0_NOC
> 0x10ac
> > +=23define CMU_TOP_CLK_CON_MUX_CLKCMU_GNPU0_XMAA
> 0x10b0
> > +=23define CMU_TOP_CLK_CON_MUX_CLKCMU_SDMA_NOC
> 0x10b4
> > +=23define CMU_TOP_CLK_CON_MUX_CLKCMU_DNC_HTU                   0x10b8
> > +=23define CMU_TOP_CLK_CON_MUX_CLKCMU_DNC_NOC                   0x10bc
> > +=23define CMU_TOP_CLK_CON_MUX_CLKCMU_PSP_NOC                   0x10c0
> > +=23define CMU_TOP_CLK_CON_MUX_CLKCMU_G3D_NOCP
> 0x10cc
> > +=23define CMU_TOP_CLK_CON_MUX_CLKCMU_USI_NOC                   0x10d0
> > +=23define CMU_TOP_CLK_CON_MUX_CLKCMU_USI_IP                    0x10d4
> > +=23define CMU_TOP_CLK_CON_MUX_CLKCMU_CPUCL0_DBG_NOC
> 0x10d8
> > +=23define CMU_TOP_CLK_CON_MUX_CLKCMU_BOOST_RCO
> 0x10dc
> > +=23define CMU_TOP_CLK_CON_MUX_CLKCMU_MIF0_SWITCH
> 0x10e0
> > +=23define CMU_TOP_CLK_CON_MUX_CLKCMU_MIF1_SWITCH
> 0x10e4
> > +=23define CMU_TOP_CLK_CON_MUX_CLKCMU_NOCL1B_NOC
> 0x10e8
> > +=23define CMU_TOP_CLK_CON_MUX_CLKCMU_CPUCL2_SWITCH
> 0x10ec
> > +=23define CMU_TOP_CLK_CON_MUX_CLKCMU_CMU_BOOST_MIF1
> 0x10f0
> > +=23define CMU_TOP_CLK_CON_MUX_CLKCMU_CSTAT_MCSC
> 0x10f4
> > +=23define CMU_TOP_CLK_CON_MUX_CLKCMU_G3D_HTU                   0x10f8
> > +=23define CMU_TOP_CLK_CON_DIV_CLKCMU_RGBP_NOC                  0x1884
> > +=23define CMU_TOP_CLK_CON_DIV_CLKCMU_YUVP_NOC                  0x1890
> > +=23define CMU_TOP_CLK_CON_DIV_CLKCMU_ALIVE_NOC                 0x1894
> > +=23define CMU_TOP_CLK_CON_DIV_CLKCMU_CSIS_DCPHY                0x1898
> > +=23define CMU_TOP_CLK_CON_DIV_CLKCMU_CSIS_OIS                  0x189c
> > +=23define CMU_TOP_CLK_CON_DIV_CLKCMU_ICPU_NOCD_0
> 0x18a0
> > +=23define CMU_TOP_CLK_CON_DIV_CLKCMU_ICPU_NOCD_1
> 0x18a4
> > +=23define CMU_TOP_CLK_CON_DIV_CLKCMU_GNPU0_NOC
> 0x18a8
> > +=23define CMU_TOP_CLK_CON_DIV_CLKCMU_GNPU0_XMAA
> 0x18ac
> > +=23define CMU_TOP_CLK_CON_DIV_CLKCMU_SDMA_NOC                  0x18b0
> > +=23define CMU_TOP_CLK_CON_DIV_CLKCMU_DNC_HTU                   0x18b4
> > +=23define CMU_TOP_CLK_CON_DIV_CLKCMU_DNC_NOC                   0x18b8
> > +=23define CMU_TOP_CLK_CON_DIV_CLKCMU_PSP_NOC                   0x18bc
> > +=23define CMU_TOP_CLK_CON_DIV_CLKCMU_G3D_NOCP                  0x18c8
> > +=23define CMU_TOP_CLK_CON_DIV_CLKCMU_USI_NOC                   0x18cc
> > +=23define CMU_TOP_CLK_CON_DIV_CLKCMU_USI_IP                    0x18d0
> > +=23define CMU_TOP_CLK_CON_DIV_CLKCMU_CPUCL0_DBG_NOC
> 0x18d4
> > +=23define CMU_TOP_CLK_CON_DIV_CLKCMU_NOCL1B_NOC
> 0x18d8
> > +=23define CMU_TOP_CLK_CON_DIV_CLKCMU_CPUCL2_SWITCH
> 0x18dc
> > +=23define CMU_TOP_CLK_CON_DIV_CLKCMU_CMU_BOOST_MIF1
> 0x18e0
> > +=23define CMU_TOP_CLK_CON_DIV_CLKCMU_CSTAT_MCSC
> 0x18e4
> > +=23define CMU_TOP_CLK_CON_DIV_CLKCMU_G3D_HTU                   0x18e8
> > +=23define CMU_TOP_CLK_CON_MUX_CLKCMU_USB_NOC                   0x1088
> > +=23define CMU_TOP_CLK_CON_MUX_CLKCMU_USB_USB20DRD
> 0x108c
> > +=23define CMU_TOP_CLK_CON_DIV_CLKCMU_USB_NOC                   0x1888
> > +=23define CMU_TOP_CLK_CON_DIV_CLKCMU_USB_USB20DRD
> 0x188c
> > +=23define CMU_TOP_CONTROLLER_OPTION0_CMU_CTRL                  0x800
> > +
> > +static const unsigned long top_clk_regs=5B=5D __initconst =3D =7B
> > +       PLL_LOCKTIME_PLL_MMC,
>=20
> and also here
>=20
Sure
> > +       PLL_LOCKTIME_PLL_SHARED0,
> > +       PLL_LOCKTIME_PLL_SHARED1,
> > +       PLL_LOCKTIME_PLL_SHARED2,
>=20
> =5B..=5D
>=20
=5Bsnip=5D
> > +
>=20
> If you don't define all registers (like QCH, etc.) in the CMUs that can b=
e
> powered off, enabling power domains on this SoC might cause you to lose
> state configured by the bootloader (and quite possibly also suffer weird =
hard
> to debug timing/clock issues when enabling power management).
>=20
> Since auto clock mode is now used (and QCH registers are used by auto
> mode), I think it makes sense to define all the CMU registers that need t=
heir
> state preserved here.
>=20
Sure, will add QCH related register in v4

> Thanks,
>=20
> Peter

