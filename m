From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/3] arm: s5pv210: GONI: add support for framebuffer
Date: Wed, 14 Jul 2010 19:26:12 +0900
Message-ID: <001401cb233e$fe80ceb0$fb826c10$%kim@samsung.com>
References: <1278321416-32524-1-git-send-email-m.szyprowski@samsung.com>
 <1278321416-32524-2-git-send-email-m.szyprowski@samsung.com>
 <006301cb2320$822639e0$8672ada0$%kim@samsung.com>
 <00bf01cb2326$705e9fd0$511bdf70$%szyprowski@samsung.com>
 <AANLkTinFFwWBQ3ZgjBBDVHrfVUCg3kjVjkHYURn3Jr4m@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:45724 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754592Ab0GNK0J convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Jul 2010 06:26:09 -0400
Received: from epmmp1 (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L5J0027IMBJ6A20@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 14 Jul 2010 19:26:07 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L5J006N8MBJNI@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 14 Jul 2010 19:26:07 +0900 (KST)
In-reply-to: <AANLkTinFFwWBQ3ZgjBBDVHrfVUCg3kjVjkHYURn3Jr4m@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kyungmin Park' <kyungmin.park@samsung.com>, 'Marek Szyprowski' <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, 'Maurus Cuelenaere' <mcuelenaere@gmail.com>, ben-linux@fluff.org, 'Andrew Morton' <akpm@linux-foundation.org>, linux-arm-kernel@lists.infradead.org

Kyungmin Park wrote:
>=20
> On Wed, Jul 14, 2010 at 4:30 PM, Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
> > Hello,
> >
> > On Wednesday, July 14, 2010 8:48 AM Kukjin Kim wrote:
> >
> >> Marek Szyprowski wrote:
> >> >
> >> > This patch adds required platform definitions to enable s3c-fb
> >> > driver on GONI board. One framebuffer window in 480x800x16bpp mo=
de is
> >> > defined.
> >> >
> >> > Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> >> > Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> >> > ---
> >> > =A0arch/arm/mach-s5pv210/Kconfig =A0 =A0 | =A0 =A02 +
> >> > =A0arch/arm/mach-s5pv210/mach-goni.c | =A0 39
> >> > +++++++++++++++++++++++++++++++++++++
> >> > =A02 files changed, 41 insertions(+), 0 deletions(-)
> >> >
> >> > diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-
> >> s5pv210/Kconfig
> >> > index 5e88941..8ab4bb0 100644
> >> > --- a/arch/arm/mach-s5pv210/Kconfig
> >> > +++ b/arch/arm/mach-s5pv210/Kconfig
> >> > @@ -59,6 +59,8 @@ config MACH_GONI
> >> > =A0 =A0 bool "GONI"
> >> > =A0 =A0 select CPU_S5PV210
> >> > =A0 =A0 select ARCH_SPARSEMEM_ENABLE
> >> > + =A0 select S5PV210_SETUP_FB_24BPP
> >> > + =A0 select S3C_DEV_FB
> >> > =A0 =A0 select S5PC110_DEV_ONENAND
> >> > =A0 =A0 help
> >> > =A0 =A0 =A0 Machine support for Samsung GONI board
> >> > diff --git a/arch/arm/mach-s5pv210/mach-goni.c
> >> b/arch/arm/mach-s5pv210/mach-
> >> > goni.c
> >> > index 88c38e3..05b4a1a 100644
> >> > --- a/arch/arm/mach-s5pv210/mach-goni.c
> >> > +++ b/arch/arm/mach-s5pv210/mach-goni.c
> >> > @@ -12,6 +12,9 @@
> >> > =A0#include <linux/types.h>
> >> > =A0#include <linux/init.h>
> >> > =A0#include <linux/serial_core.h>
> >> > +#include <linux/fb.h>
> >> > +#include <linux/delay.h>
> >>
> >> need linux/delay.h in here?
> >>
> >> > +#include <linux/clk.h>
> >>
> >> same...need linux/clk.h?
> >>
> >> >
> >> > =A0#include <asm/mach/arch.h>
> >> > =A0#include <asm/mach/map.h>
> >> > @@ -20,11 +23,15 @@
> >> >
> >> > =A0#include <mach/map.h>
> >> > =A0#include <mach/regs-clock.h>
> >> > +#include <mach/regs-fb.h>
> >> > +#include <mach/gpio.h>
> >>
> >> linux/gpio.h
> >
> > Ok.
> >
> >> >
> >> > +#include <plat/gpio-cfg.h>
> >> > =A0#include <plat/regs-serial.h>
> >> > =A0#include <plat/s5pv210.h>
> >> > =A0#include <plat/devs.h>
> >> > =A0#include <plat/cpu.h>
> >> > +#include <plat/fb.h>
> >> >
> >> > =A0/* Following are default values for UCON, ULCON and UFCON UAR=
T
> registers
> >> */
> >> > =A0#define S5PV210_UCON_DEFAULT =A0 =A0 =A0 (S3C2410_UCON_TXILEV=
EL
> | =A0 =A0 =A0 =A0\
> >> > @@ -73,7 +80,35 @@ static struct s3c2410_uartcfg goni_uartcfgs[]
> >> __initdata =3D {
> >> > =A0 =A0 },
> >> > =A0};
> >> >
> >> > +/* Frame Buffer */
> >>
> >> No need this comment because we know _fb_ means frame buffer...
> >
> > Comments in the source code are imho always welcome. As you know
mach-*.c
> files
> > grows to very large sizes and it is much easier to read them if all
definitions
> > and items are grouped and commented with a header on top of them (w=
ith
such
> > comments you easily can notice where one group starts and ends with=
out
> reading
> > the code).
> >
> >> > +static struct s3c_fb_pd_win goni_fb_win0 =3D {
> >>
> >> How about to use goni_fb_win[] array so that can be extended easil=
y...
> >
> > I've just followed the style used in the other mach-*.c files. No
problem to
> > change it.
> >
> >>
> >> > + =A0 .win_mode =3D {
> >> > + =A0 =A0 =A0 =A0 =A0 .pixclock =3D 1000000000000ULL /
> >> > ((16+16+2+480)*(28+3+2+800)*55),
>=20
> Marugu(?) send the patch remove pixclock at fb mailing list. So If

Yeah, I saw Maurus' patch, [PATCH v2] s3c-fb: Automatically calculate p=
ixel
clock when none is given.

> >> > + =A0 =A0 =A0 =A0 =A0 .left_margin =3D 16,
> >> > + =A0 =A0 =A0 =A0 =A0 .right_margin =3D 16,
> >> > + =A0 =A0 =A0 =A0 =A0 .upper_margin =3D 3,
> >> > + =A0 =A0 =A0 =A0 =A0 .lower_margin =3D 28,
> >> > + =A0 =A0 =A0 =A0 =A0 .hsync_len =3D 2,
> >> > + =A0 =A0 =A0 =A0 =A0 .vsync_len =3D 2,
> >> > + =A0 =A0 =A0 =A0 =A0 .xres =3D 480,
> >> > + =A0 =A0 =A0 =A0 =A0 .yres =3D 800,
> >> > + =A0 =A0 =A0 =A0 =A0 .refresh =3D 55,
> >> > + =A0 },
> >> > + =A0 .max_bpp =3D 32,
> >> > + =A0 .default_bpp =3D 16,
> >>
> >> If possible, please keep the align like below...for easily reading=
=2E..
> >> But...it depends on your taste...:-)
> >
> > Ok, no problem with this.
> >
> >>
> >> + =A0 =A0 .win_mode =3D {
> >> + =A0 =A0 =A0 =A0 =A0 =A0 .pixclock =A0 =A0 =A0 =3D 1000000000000U=
LL /
> >> ((16+16+2+480)*(28+3+2+800)*55),
>=20
> Maurus send the patch remove pixclock calculation so I hope his patch
> merge and we just remove it at here.

But as far as I know, not applied yet.
So I think, need .pixclock member now..and maybe can be removed later.

>=20
> Thank you,
> Kyungmin Park

(snip)

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
