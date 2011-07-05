From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/7] DMA: PL330: Add support runtime PM for PL330 DMAC
Date: Tue, 05 Jul 2011 16:26:19 +0900
Message-ID: <00c001cc3ae4$d82464c0$886d2e40$%kim@samsung.com>
References: <1309781915-31549-1-git-send-email-kgene.kim@samsung.com>
 <1309781915-31549-2-git-send-email-kgene.kim@samsung.com>
 <CAGOxZ50KGjHM6hUJQ1uEJsQqAzZ7aV+TcYRyhDB=sWQvtTDTxg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:18820 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753971Ab1GEH0Z convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Jul 2011 03:26:25 -0400
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LNU007YSNBE2RP0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 05 Jul 2011 16:26:24 +0900 (KST)
Received: from kgenekim ([12.23.119.139])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LNU00IFJNBZCA@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 05 Jul 2011 16:26:24 +0900 (KST)
In-reply-to: <CAGOxZ50KGjHM6hUJQ1uEJsQqAzZ7aV+TcYRyhDB=sWQvtTDTxg@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Alim Akhtar' <alim.akhtar@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Vinod Koul' <vinod.koul@intel.com>, 'Dan Williams' <dan.j.williams@intel.com>, 'Grant Likely' <grant.likely@secretlab.ca>, 'Jassi Brar' <jassisinghbrar@gmail.com>, 'Liam Girdwood' <lrg@ti.com>, 'Mark Brown' <broonie@opensource.wolfsonmicro.com>, 'Boojin Kim' <boojin.kim@samsung.com>

Alim Akhtar wrote:
> > + =A0 =A0 =A0 /* enable dma clk */
> > + =A0 =A0 =A0 clk =3D clk_get(&adev->dev, "dma");
>=20
> Does this really needed here?
> AFAIR, amba_get_enable_pclk() does the same thing, provided clock nam=
e
> as "apb_pclk"
> please have a look at drivers/amba/bus.c
>=20
As I know, you can access Samsung datasheet, please check it.

Actually, the 'apb_pclk' should be dummy clock on current S5P SoCs so c=
an't
use it now.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
