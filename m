From: Jeongtae Park <jtp.park@samsung.com>
Subject: RE: [PATCH 0/4] ARM: S5PV210: Enable FIMC and MFC on SMDK C110 and
 V210 boards
Date: Tue, 10 Jan 2012 08:18:53 +0900
Message-ID: <01c301cccf25$0db1fdd0$2915f970$%park@samsung.com>
References: <1324893613-5469-1-git-send-email-sachin.kamat@linaro.org>
 <CAK9yfHyXazVh3weycF-FCHYtH==m4J-YtwnZfsAdfeAB9mBnkQ@mail.gmail.com>
 <028b01ccc5da$d0cbeeb0$7263cc10$%kim@samsung.com>
Reply-To: jtp.park@samsung.com
Mime-Version: 1.0
Content-Type: text/plain; charset=Windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:55007 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932953Ab2AIXS4 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Jan 2012 18:18:56 -0500
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LXK003MA0RISNC0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 10 Jan 2012 08:18:54 +0900 (KST)
Received: from jtppark ([12.23.121.105])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LXK003DB0RHZR40@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Tue, 10 Jan 2012 08:18:53 +0900 (KST)
In-reply-to: <028b01ccc5da$d0cbeeb0$7263cc10$%kim@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, sachin.kamat@linaro.org, 'Kukjin Kim' <kgene.kim@samsung.com>
Cc: 'Kamil Debski' <k.debski@samsung.com>

Hi Sachin,

thanks for the patch.
There is no issue for MFC.

Best regards,
/jtpark

> -----Original Message-----
> From: Kukjin Kim [mailto:kgene.kim@samsung.com]
> Sent: Thursday, December 29, 2011 12:35 PM
> To: 'Sachin Kamat'; linux-samsung-soc@vger.kernel.org
> Cc: jtp.park@samsung.com
> Subject: RE: [PATCH 0/4] ARM: S5PV210: Enable FIMC and MFC on SMDK C1=
10 and V210 boards
>=20
> Sachin Kamat wrote:
> >
> > Hi Kukjin,
> >
> > Please pick up the MFC patches (patches 1 & 2) from this series. I
> > will post a separate patch series for FIMC related changes.
> >
> (Cc'ed Jeongtae Park)
>=20
> Jeongtae, let me know your opinion on this MFC enabling patches.
>=20
> Thanks.
>=20
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
>=20
> > Regards
> > Sachin
> >
> > On 26 December 2011 15:30, Sachin Kamat <sachin.kamat@linaro.org> w=
rote:
> > > This patch series adds support for MFC and FIMC on SMDK C110 and =
V210
> > boards.
> > > It is based on Kukjin Kim's latest for-next branch.
> > >
> > > Sachin Kamat (4):
> > > =A0ARM: S5PV210: Enable MFC on SMDKV210
> > > =A0ARM: S5PV210: Enable MFC on SMDKC110
> > > =A0ARM: S5PV210: Enable FIMC on SMDKV210
> > > =A0ARM: S5PV210: Enable FIMC on SMDKC110
> > >
> > > =A0arch/arm/mach-s5pv210/Kconfig =A0 =A0 =A0 =A0 | =A0 =A08 +++++=
+++
> > > =A0arch/arm/mach-s5pv210/mach-smdkc110.c | =A0 14 ++++++++++++++
> > > =A0arch/arm/mach-s5pv210/mach-smdkv210.c | =A0 13 +++++++++++++
> > > =A03 files changed, 35 insertions(+), 0 deletions(-)
> > >
> > > --
> > > 1.7.4.1
> > >
> >
> >
> >
> > --
> > With warm regards,
> > Sachin
