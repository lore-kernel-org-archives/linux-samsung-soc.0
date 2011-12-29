From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 0/4] ARM: S5PV210: Enable FIMC and MFC on SMDK C110 and
 V210 boards
Date: Thu, 29 Dec 2011 12:34:48 +0900
Message-ID: <028b01ccc5da$d0cbeeb0$7263cc10$%kim@samsung.com>
References: <1324893613-5469-1-git-send-email-sachin.kamat@linaro.org>
 <CAK9yfHyXazVh3weycF-FCHYtH==m4J-YtwnZfsAdfeAB9mBnkQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:14360 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752583Ab1L2Det convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Dec 2011 22:34:49 -0500
Received: from epcpsbgm1.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LWY00M514M0XL70@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 29 Dec 2011 12:34:48 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.114])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LWY00FP54M02000@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Thu, 29 Dec 2011 12:34:48 +0900 (KST)
In-reply-to: <CAK9yfHyXazVh3weycF-FCHYtH==m4J-YtwnZfsAdfeAB9mBnkQ@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: jtp.park@samsung.com

Sachin Kamat wrote:
>=20
> Hi Kukjin,
>=20
> Please pick up the MFC patches (patches 1 & 2) from this series. I
> will post a separate patch series for FIMC related changes.
>=20
(Cc'ed Jeongtae Park)

Jeongtae, let me know your opinion on this MFC enabling patches.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

> Regards
> Sachin
>=20
> On 26 December 2011 15:30, Sachin Kamat <sachin.kamat@linaro.org> wro=
te:
> > This patch series adds support for MFC and FIMC on SMDK C110 and V2=
10
> boards.
> > It is based on Kukjin Kim's latest for-next branch.
> >
> > Sachin Kamat (4):
> > =A0ARM: S5PV210: Enable MFC on SMDKV210
> > =A0ARM: S5PV210: Enable MFC on SMDKC110
> > =A0ARM: S5PV210: Enable FIMC on SMDKV210
> > =A0ARM: S5PV210: Enable FIMC on SMDKC110
> >
> > =A0arch/arm/mach-s5pv210/Kconfig =A0 =A0 =A0 =A0 | =A0 =A08 +++++++=
+
> > =A0arch/arm/mach-s5pv210/mach-smdkc110.c | =A0 14 ++++++++++++++
> > =A0arch/arm/mach-s5pv210/mach-smdkv210.c | =A0 13 +++++++++++++
> > =A03 files changed, 35 insertions(+), 0 deletions(-)
> >
> > --
> > 1.7.4.1
> >
>=20
>=20
>=20
> --
> With warm regards,
> Sachin
