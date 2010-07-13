From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2] ARM: s5pv210_defconfig: Update for removing
	s5pc110_defconfig
Date: Tue, 13 Jul 2010 15:17:58 +0900
Message-ID: <00fc01cb2253$27307c30$75917490$%kim@samsung.com>
References: <1278987726-10803-1-git-send-email-kgene.kim@samsung.com>
 <AANLkTilAKmCrHm5pZU5s6oJkSGGZyYihsnPsG4Z1uKFw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:32409 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750895Ab0GMGR6 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 13 Jul 2010 02:17:58 -0400
Received: from epmmp1 (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L5H00GPJG5UJF10@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 13 Jul 2010 15:17:54 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L5H003WEG5UNB@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 13 Jul 2010 15:17:54 +0900 (KST)
In-reply-to: <AANLkTilAKmCrHm5pZU5s6oJkSGGZyYihsnPsG4Z1uKFw@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kyungmin Park' <kmpark@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

Kyungmin Park wrote:
>=20
> Question?
>=20
> Are there difference between smdkc110 and smdkv210?

Yes.

The components on the board are different such as default LCD module,
external memory, connector, and so on.

>=20
> Thank you,
> Kyungmin Park
>=20
> On Tue, Jul 13, 2010 at 11:22 AM, Kukjin Kim <kgene.kim@samsung.com>
wrote:
> > Now that S5PC110 machines and S5PV210 machines can be built into
> > one kernel, update mach-s5pv210/Kconfig and s5pv210_defconfig.
> >
> > Tested on SMDKC110(S5PC110) and SMDKV210(S5PV210).
> > Note that GONI machine ID is not included in the kernel.
> >
> > Created and tested against linux-2.6.35-rc5.
> >
> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> > ---
> > Changes since v1:
> > - This patch re-based against linux-2.6.35-rc5 which includes
> > =A0'ARM: reduce defconfigs' from Uwe Kleine-Konig.
> >
> > =A0arch/arm/configs/s5pc110_defconfig | =A0 66
------------------------------------
> > =A0arch/arm/configs/s5pv210_defconfig | =A0 =A04 ++
> > =A0arch/arm/mach-s5pv210/Kconfig =A0 =A0 =A0| =A0 28 +++++++++-----=
-
> > =A03 files changed, 21 insertions(+), 77 deletions(-)
> > =A0delete mode 100644 arch/arm/configs/s5pc110_defconfig

(snip)


Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
