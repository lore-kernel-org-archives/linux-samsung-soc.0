From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: Update number of VIC
Date: Fri, 10 Sep 2010 21:18:42 +0900
Message-ID: <000001cb50e2$50f11940$f2d34bc0$%kim@samsung.com>
References: <1281697788-18018-1-git-send-email-kgene.kim@samsung.com>
 <AANLkTikyZHX-PmPx8DjyP6ar7wmyiP7Cf9-ttZQJXttZ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:59552 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752243Ab0IJMSa convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 10 Sep 2010 08:18:30 -0400
Received: from epmmp1 (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L8J00B8G66SY930@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 10 Sep 2010 21:18:28 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L8J00KAP66SRF@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 10 Sep 2010 21:18:28 +0900 (KST)
In-reply-to: <AANLkTikyZHX-PmPx8DjyP6ar7wmyiP7Cf9-ttZQJXttZ@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kyungmin Park' <kmpark@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, 'Russell King' <rmk@arm.linux.org.uk>

Kyungmin Park wrote:
>=20
> Even though it required. I still think ben's patch is better approach=
es.

Please let me know where it is...I couldn't find it.

> Talk to Ben again.
> And there's no answer from Russell this approaches can be accepted.
>=20
> And if you want to apply this patch, please apply my previous patch
> and then add other SoCs.
> http://marc.info/?l=3Dlinux-arm-kernel&m=3D127555986709819&w=3D2
>=20
Hmm...this stuff should be sent to upstream via Russell's tree not mine=
=2E
Anyway, will re-submit them soon.

> Thank you,
> Kyungmin Park
>=20
> On Fri, Aug 13, 2010 at 8:09 PM, Kukjin Kim <kgene.kim@samsung.com> w=
rote:
> > Update the number of VIC to handle the 3 or 4 VICs of
> > the S5PV210, S5P6442 and S5PC100.
> >
> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> > Cc: Ben Dooks <ben-linux@fluff.org>
> > Cc: Russell King <rmk@arm.linux.org.uk>
> > ---
> > =A0arch/arm/common/Kconfig | =A0 =A04 +++-
> > =A01 files changed, 3 insertions(+), 1 deletions(-)
> >
> > diff --git a/arch/arm/common/Kconfig b/arch/arm/common/Kconfig
> > index 0a34c81..b7c76a9 100644
> > --- a/arch/arm/common/Kconfig
> > +++ b/arch/arm/common/Kconfig
> > @@ -6,8 +6,10 @@ config ARM_VIC
> >
> > =A0config ARM_VIC_NR
> > =A0 =A0 =A0 =A0int
> > - =A0 =A0 =A0 default 2
> > =A0 =A0 =A0 =A0depends on ARM_VIC
> > + =A0 =A0 =A0 default 4 if ARCH_S5PV210
> > + =A0 =A0 =A0 default 3 if ARCH_S5P6442 || ARCH_S5PC100
> > + =A0 =A0 =A0 default 2
> > =A0 =A0 =A0 =A0help
> > =A0 =A0 =A0 =A0 =A0The maximum number of VICs available in the syst=
em, for
> > =A0 =A0 =A0 =A0 =A0power management.
> > --
> > 1.6.2.5
> >


Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
