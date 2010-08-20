From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 10/14] ARM: S5PV310: Adds uart clocks
Date: Fri, 20 Aug 2010 15:58:47 +0900
Message-ID: <00aa01cb4035$385833e0$a9089ba0$%kim@samsung.com>
References: <1282140084-10265-1-git-send-email-kgene.kim@samsung.com>
 <1282140084-10265-11-git-send-email-kgene.kim@samsung.com>
 <AANLkTi=LexGc0WfjLUOdV9PFJciTckus81=j62zmDzEE@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:40233 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751504Ab0HTG7L convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 20 Aug 2010 02:59:11 -0400
Received: from epmmp1. (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L7F008EIVEKZZB0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 20 Aug 2010 15:59:08 +0900 (KST)
Received: from kgenekim (unknown [12.23.103.96])
 by mmp1.samsung.com (Sun Java(tm) System Messaging Server 7u3-15.01 64bit
 (built Feb 12 2010)) with ESMTPA id <0L7F00CYYVEJ2K80@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 20 Aug 2010 15:59:08 +0900 (KST)
In-reply-to: <AANLkTi=LexGc0WfjLUOdV9PFJciTckus81=j62zmDzEE@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'MyungJoo Ham' <myungjoo.ham@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Jongpill Lee' <boyko.lee@samsung.com>, ben-linux@fluff.org

MyungJoo Ham wrote:
>=20
> Hello,
>=20
Hi,

> Did you intentionally omit uart:0? Then, why uart:0 clock is not bein=
g
> registered while other uart clocks are?
>=20
Just missed...thanks for finding it.

Will fix it.

> On Wed, Aug 18, 2010 at 11:01 PM, Kukjin Kim <kgene.kim@samsung.com>
wrote:
> > From: Jongpill Lee <boyko.lee@samsung.com>
> >
> > This patch adds uart clocks for S5PV310/S5PC210.
> >
> > Signed-off-by: Jongpill Lee <boyko.lee@samsung.com>
> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> > ---
> > =A0arch/arm/mach-s5pv310/clock.c | =A0 37
> +++++++++++++++++++++++++++++++------
> > =A01 files changed, 31 insertions(+), 6 deletions(-)
> >
> > diff --git a/arch/arm/mach-s5pv310/clock.c
b/arch/arm/mach-s5pv310/clock.c
> > index 8728504..843f4d0 100644
> > --- a/arch/arm/mach-s5pv310/clock.c
> > +++ b/arch/arm/mach-s5pv310/clock.c
> > @@ -61,6 +61,11 @@ static int s5pv310_clk_ip_fsys_ctrl(struct clk *=
clk,
int
> enable)
> > =A0 =A0 =A0 =A0return s5p_gatectrl(S5P_CLKGATE_IP_FSYS, clk, enable=
);
> > =A0}
> >
> > +static int s5pv310_clk_ip_peril_ctrl(struct clk *clk, int enable)
> > +{
> > + =A0 =A0 =A0 return s5p_gatectrl(S5P_CLKGATE_IP_PERIL, clk, enable=
);
> > +}
> > +
> > =A0/* Core list of CMU_CPU side */
> >
> > =A0static struct clksrc_clk clk_mout_apll =3D {
> > @@ -257,11 +262,6 @@ static struct clksrc_clk clk_sclk_vpll =3D {
> > =A0 =A0 =A0 =A0.reg_src =A0 =A0 =A0 =A0=3D { .reg =3D S5P_CLKSRC_TO=
P0, .shift =3D 8, .size =3D 1
},
> > =A0};
> >
> > -static int s5pv310_clk_ip_peril_ctrl(struct clk *clk, int enable)
> > -{
> > - =A0 =A0 =A0 return s5p_gatectrl(S5P_CLKGATE_IP_PERIL, clk, enable=
);
> > -}
> > -
> > =A0static struct clk init_clocks_disable[] =3D {
> > =A0 =A0 =A0 =A0{
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.name =A0 =A0 =A0 =A0 =A0 =3D "timer=
s",
> > @@ -303,7 +303,32 @@ static struct clk init_clocks_disable[] =3D {
> > =A0};
> >
> > =A0static struct clk init_clocks[] =3D {
> > - =A0 =A0 =A0 /* Nothing here yet */
> > + =A0 =A0 =A0 {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "uart",
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D 1,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .enable =A0 =A0 =A0 =A0 =3D s5pv310_c=
lk_ip_peril_ctrl,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ctrlbit =A0 =A0 =A0 =A0=3D (1 << 1),
> > + =A0 =A0 =A0 }, {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "uart",
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D 2,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .enable =A0 =A0 =A0 =A0 =3D s5pv310_c=
lk_ip_peril_ctrl,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ctrlbit =A0 =A0 =A0 =A0=3D (1 << 2),
> > + =A0 =A0 =A0 }, {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "uart",
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D 3,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .enable =A0 =A0 =A0 =A0 =3D s5pv310_c=
lk_ip_peril_ctrl,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ctrlbit =A0 =A0 =A0 =A0=3D (1 << 3),
> > + =A0 =A0 =A0 }, {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "uart",
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D 4,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .enable =A0 =A0 =A0 =A0 =3D s5pv310_c=
lk_ip_peril_ctrl,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ctrlbit =A0 =A0 =A0 =A0=3D (1 << 4),
> > + =A0 =A0 =A0 }, {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "uart",
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D 5,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .enable =A0 =A0 =A0 =A0 =3D s5pv310_c=
lk_ip_peril_ctrl,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ctrlbit =A0 =A0 =A0 =A0=3D (1 << 5),
> > + =A0 =A0 =A0 }
> > =A0};
> >
> > =A0static struct clk *clkset_group_list[] =3D {
> > --
> > 1.6.2.5


Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
