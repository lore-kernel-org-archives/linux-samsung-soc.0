From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 11/13] ARM: S5P64X0: Move SMDK6440 board file and Add
 SMDK6450 board file
Date: Thu, 02 Sep 2010 17:02:30 +0900
Message-ID: <004901cb4a75$33f2cb90$9bd862b0$%kim@samsung.com>
References: <1283324960-21629-1-git-send-email-kgene.kim@samsung.com>
 <1283324960-21629-12-git-send-email-kgene.kim@samsung.com>
 <AANLkTikXD9xz+mGz1QabwB91WdRX1oPeeOwa-juGdt6H@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:30324 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751187Ab0IBICc convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 2 Sep 2010 04:02:32 -0400
Received: from epmmp1 (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L84001QF0ZUV990@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 02 Sep 2010 17:02:18 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L8400HH60ZUQN@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 02 Sep 2010 17:02:18 +0900 (KST)
In-reply-to: <AANLkTikXD9xz+mGz1QabwB91WdRX1oPeeOwa-juGdt6H@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kyungmin Park' <kmpark@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

Kyungmin Park wrote:
>=20
> On Wed, Sep 1, 2010 at 4:09 PM, Kukjin Kim <kgene.kim@samsung.com> wr=
ote:
> > This patch moves smdk6440 board file from mach-s5p6440 into the new
> > mach-s5p64x0 directory and adds smdk6450 board file.
> >
> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> > ---
> > =A0.../{mach-s5p6440 =3D> mach-s5p64x0}/mach-smdk6440.c | =A0 87 ++=
++++----
> > =A0arch/arm/mach-s5p64x0/mach-smdk6450.c =A0 =A0 =A0 =A0 =A0 =A0 =A0=
| =A0182
> ++++++++++++++++++++
> > =A02 files changed, 234 insertions(+), 35 deletions(-)
> > =A0rename arch/arm/{mach-s5p6440 =3D> mach-s5p64x0}/mach-smdk6440.c=
 (66%)
> > =A0create mode 100644 arch/arm/mach-s5p64x0/mach-smdk6450.c
> >
> > diff --git a/arch/arm/mach-s5p6440/mach-smdk6440.c b/arch/arm/mach-
> s5p64x0/mach-smdk6440.c
> > similarity index 66%
> > rename from arch/arm/mach-s5p6440/mach-smdk6440.c
> > rename to arch/arm/mach-s5p64x0/mach-smdk6440.c
> > index 9202aaa..28de0a5 100644
> > --- a/arch/arm/mach-s5p6440/mach-smdk6440.c
> > +++ b/arch/arm/mach-s5p64x0/mach-smdk6440.c

(snip)

> > @@ -58,43 +59,60 @@
> >
> > =A0static struct s3c2410_uartcfg smdk6440_uartcfgs[] __initdata =3D=
 {
> > =A0 =A0 =A0 =A0[0] =3D {
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .hwport =A0 =A0 =A0=3D 0,
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0 =A0 =A0 =3D 0,
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ucon =A0 =A0 =A0 =A0=3D SMDK6440_UCO=
N_DEFAULT,
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ulcon =A0 =A0 =A0 =3D SMDK6440_ULCON=
_DEFAULT,
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ufcon =A0 =A0 =A0 =3D SMDK6440_UFCON=
_DEFAULT,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .hwport =A0 =A0 =A0 =A0 =3D 0,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0 =A0 =A0 =A0 =A0=3D 0,
> There's no place to use this flags, it's posted for long time. but yo=
u
> don't listen it.
> I hope delete it if not used.

Will be removed flags member after merging it in the mainline.

> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ucon =A0 =A0 =A0 =A0 =A0 =3D SMDK644=
0_UCON_DEFAULT,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ulcon =A0 =A0 =A0 =A0 =A0=3D SMDK644=
0_ULCON_DEFAULT,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ufcon =A0 =A0 =A0 =A0 =A0=3D SMDK644=
0_UFCON_DEFAULT,
> > =A0 =A0 =A0 =A0},

(snip)

> > +
> > +MACHINE_START(SMDK6450, "SMDK6450")
>=20
> I think you can make a single SMDK file.

Because the components on the board are different,
SMDK6440 and SMDK6450 need each machine file.

(snip)

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
