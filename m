From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 2/3] ARM: S5P: Add initial map for GPIO2 and GPIO3
Date: Mon, 23 Aug 2010 11:15:12 +0900
Message-ID: <005e01cb4269$081cb710$18562530$%kim@samsung.com>
References: <1282307628-5254-1-git-send-email-kgene.kim@samsung.com>
 <1282307628-5254-3-git-send-email-kgene.kim@samsung.com>
 <AANLkTimBMaVaZTEXG2HDYf1F98kYnRfWDn_BnT=pL85U@mail.gmail.com>
 <005401cb4258$bc135550$3439fff0$%kim@samsung.com>
 <AANLkTi=gnAthBXd0oyNzMySKt2Cv4C57kc2kM1LnCvAt@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:29657 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752713Ab0HWCPU convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 22 Aug 2010 22:15:20 -0400
Received: from epmmp1 (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L7L00BHR293BLC0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 23 Aug 2010 11:15:03 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L7L008R12921U@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 23 Aug 2010 11:15:03 +0900 (KST)
In-reply-to: <AANLkTi=gnAthBXd0oyNzMySKt2Cv4C57kc2kM1LnCvAt@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kyungmin Park' <kmpark@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, 'Jongpill Lee' <boyko.lee@samsung.com>

Kyungmin Park wrote:
>=20
> On Mon, Aug 23, 2010 at 9:18 AM, Kukjin Kim <kgene.kim@samsung.com> w=
rote:
> > Kyungmin Park wrote:
> >>
> >> NAK.
> >>
> > I don't know why I need your ack for this...if any opinions, just
comments
> > is enough.
>=20
> Okay I said in other word, I can't agree this patch.
>=20
> >
> >> This approach don't make a common GPIO framework. I already send t=
he
> >> common GPIO framework which send the base address to GPIO framewor=
k
> >> and handle it regradless GPIO is one or three.
> >>
> > I don't think that your that RFC GPIO patch is common GPIO framewor=
k.
> >
> >>
> >
http://lists.infradead.org/pipermail/linux-arm-kernel/2010-August/02251=
3.htm
> > l
> >>
> >> With this patch, we can use the common GPIO framework and remove t=
he
> >> VA_GPIO dependency.
> >>
> > Why do you think your patch is common?
>=20
> In another patch, you just write the driver strength with
> readl/writel. even though gpiolib already has interface,
> s5p_gpio_set_drvstr
>=20
I missed gpio driver strength driver. Will fix it.
But this issue is not regarding gpio driver strength.

> and how to you implement the gpio_to_irq at both GPIO and EINT?
>=20
Will sort it out.

> The "common" means GPIO related function should use the gpiolib
> functions only. No direct access.
>=20
It means don't need to use your previous patch which is just RFC regard=
ing
removing VA_GPIO.

> If your patch match these criteria then I'll ack your patch.
>=20
Hmm...

> All
> >
> >> Thank you,
> >> Kyungmin Park
> >>
> >> On Fri, Aug 20, 2010 at 9:33 PM, Kukjin Kim <kgene.kim@samsung.com=
>
wrote:
> >> > From: Jongpill Lee <boyko.lee@samsung.com>
> >> >
> >> > This patch adds initial map for GPIO2 and GPIO3.
> >> > S5PV310/S5PC210 has separated GPIO1, GPIO2 and GPIO3.
> >> >
> >> > Signed-off-by: Jongpill Lee <boyko.lee@samsung.com>
> >> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> >> > ---
> >> > =A0arch/arm/mach-s5pv310/cpu.c =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
10 ++++++++++
> >> > =A0arch/arm/plat-s5p/include/plat/map-s5p.h | =A0 =A02 ++
> >> > =A02 files changed, 12 insertions(+), 0 deletions(-)
> >> >
> >> > diff --git a/arch/arm/mach-s5pv310/cpu.c
b/arch/arm/mach-s5pv310/cpu.c
> >> > index 196c9f1..db4f55a 100644
> >> > --- a/arch/arm/mach-s5pv310/cpu.c
> >> > +++ b/arch/arm/mach-s5pv310/cpu.c
> >> > @@ -45,6 +45,16 @@ static struct map_desc s5pv310_iodesc[] __ini=
tdata
=3D
> > {
> >> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.pfn =A0 =A0 =A0 =A0 =A0 =A0=3D _=
_phys_to_pfn(S5PV310_PA_L2CC),
> >> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.length =A0 =A0 =A0 =A0 =3D SZ_4K=
,
> >> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.type =A0 =A0 =A0 =A0 =A0 =3D MT_=
DEVICE,
> >> > + =A0 =A0 =A0 }, {
> >> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .virtual =A0 =A0 =A0 =A0=3D (unsig=
ned long)S5P_VA_GPIO2,
> >> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __=
phys_to_pfn(S5PV310_PA_GPIO2),
> >> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .length =A0 =A0 =A0 =A0 =3D SZ_4K,
> >> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .type =A0 =A0 =A0 =A0 =A0 =3D MT_D=
EVICE,
> >> > + =A0 =A0 =A0 }, {
> >> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .virtual =A0 =A0 =A0 =A0=3D (unsig=
ned long)S5P_VA_GPIO3,
> >> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __=
phys_to_pfn(S5PV310_PA_GPIO3),
> >> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .length =A0 =A0 =A0 =A0 =3D SZ_256=
K,
> >> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .type =A0 =A0 =A0 =A0 =A0 =3D MT_D=
EVICE,
> >> > =A0 =A0 =A0 =A0},
> >> > =A0};
> >> >
> >> > diff --git a/arch/arm/plat-s5p/include/plat/map-s5p.h
b/arch/arm/plat-
> >> s5p/include/plat/map-s5p.h
> >> > index 54e9fb9..bc52595 100644
> >> > --- a/arch/arm/plat-s5p/include/plat/map-s5p.h
> >> > +++ b/arch/arm/plat-s5p/include/plat/map-s5p.h
> >> > @@ -15,6 +15,8 @@
> >> >
> >> > =A0#define S5P_VA_CHIPID =A0 =A0 =A0 =A0 =A0S3C_ADDR(0x00700000)
> >> > =A0#define S5P_VA_GPIO =A0 =A0 =A0 =A0 =A0 =A0S3C_ADDR(0x0050000=
0)
> >> > +#define S5P_VA_GPIO2 =A0 =A0 =A0 =A0 =A0 S3C_ADDR(0x00510000)
> >> > +#define S5P_VA_GPIO3 =A0 =A0 =A0 =A0 =A0 S3C_ADDR(0x00520000)
> >> > =A0#define S5P_VA_SYSTIMER =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S3C_AD=
DR(0x01200000)
> >> > =A0#define S5P_VA_SROMC =A0 =A0 =A0 =A0 =A0 S3C_ADDR(0x01100000)
> >> >
> >> > --
> >
> >


Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
