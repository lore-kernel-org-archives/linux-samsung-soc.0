From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/4] mach-s5pv210: Add platform definitions for mipi-csis
Date: Fri, 03 Dec 2010 17:19:43 +0900
Message-ID: <014901cb92c2$d9c9e8b0$8d5dba10$%kim@samsung.com>
References: <1291307862-8125-1-git-send-email-s.nawrocki@samsung.com>
 <1291307862-8125-2-git-send-email-s.nawrocki@samsung.com>
 <012301cb92a1$a7020af0$f50620d0$%kim@samsung.com>
 <AANLkTi=bARGdX2Y4Ea-YP8qQRcjAXme8NW9Mp-0dTxgZ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:52231 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758228Ab0LCIWr convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 3 Dec 2010 03:22:47 -0500
Received: from epmmp1 (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LCU001KMF509O00@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 03 Dec 2010 17:19:48 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LCU00JV7F50NL@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 03 Dec 2010 17:19:48 +0900 (KST)
In-reply-to: <AANLkTi=bARGdX2Y4Ea-YP8qQRcjAXme8NW9Mp-0dTxgZ@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kyungmin Park' <kyungmin.park@samsung.com>
Cc: 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, m.szyprowski@samsung.com

Kyungmin Park wrote:
>=20
> On Fri, Dec 3, 2010 at 1:22 PM, Kukjin Kim <kgene.kim@samsung.com> wr=
ote:
> > Sylwester Nawrocki wrote:
> >>
> >> Added resource definitions for mipi-csis interface, naming
> >> changed for consistency with s5pv310 where there are two
> >> instances of the device.
> >>
> >> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> >> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> >> ---
> >> =A0arch/arm/mach-s5pv210/include/mach/irqs.h =A0 =A0 =A0 | =A0 =A0=
2 +-
> >> =A0arch/arm/mach-s5pv210/include/mach/map.h =A0 =A0 =A0 =A0| =A0 =A0=
4 ++++
> >> =A0arch/arm/mach-s5pv210/include/mach/regs-clock.h | =A0 =A05 +---=
-
> >> =A03 files changed, 6 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/arch/arm/mach-s5pv210/include/mach/irqs.h b/arch/arm/=
mach-
> >> s5pv210/include/mach/irqs.h
> >> index 119b95f..8b5994c 100644
> >> --- a/arch/arm/mach-s5pv210/include/mach/irqs.h
> >> +++ b/arch/arm/mach-s5pv210/include/mach/irqs.h
> >> @@ -65,7 +65,7 @@
> >> =A0#define IRQ_HSMMC0 =A0 =A0 =A0 =A0 =A0 S5P_IRQ_VIC1(26)
> >> =A0#define IRQ_HSMMC1 =A0 =A0 =A0 =A0 =A0 S5P_IRQ_VIC1(27)
> >> =A0#define IRQ_HSMMC2 =A0 =A0 =A0 =A0 =A0 S5P_IRQ_VIC1(28)
> >> -#define IRQ_MIPICSI =A0 =A0 =A0 =A0 =A0S5P_IRQ_VIC1(29)
> >> +#define IRQ_MIPICSI0 =A0 =A0 =A0 =A0 S5P_IRQ_VIC1(29)
> >
> > Firstly don't use directly IRQ_MIPICSI0 which is used in platform
device.
> > Because it can be confused that there would be another MIPICSI such=
 as
> > MIPICSI1.
> > In that case, just use like following. For example,
> Hi,
>=20
> First respect others work.
> my impression is that you forced the developers to work as you want.
>=20
> okay who summit this code? If you think name is odd, then you check i=
t
> before you submitted.
> When you commit the code is okay, but other should be considered as y=
ours.
>=20

I can't get you :-(

Maybe your talking is to change the name? Why?...
When submitted it, used written name, IRQ_MIPICSI in datasheet.

But now, according to Sylwester's patch, used various name for it like
MIPICSI, MIPICSIS and so on.
So I suggested just one name in previous my comment.

> >
> > ---
> > @@ -132,5 +132,6 @@
> > =A0#define IRQ_LCD_FIFO =A0 =A0 =A0 =A0 =A0 IRQ_LCD0
> > =A0#define IRQ_LCD_VSYNC =A0 =A0 =A0 =A0 =A0IRQ_LCD1
> > =A0#define IRQ_LCD_SYSTEM =A0 =A0 =A0 =A0 IRQ_LCD2
> > +#define IRQ_MIPI_CSIS0 =A0 =A0 =A0 =A0 IRQ_MIPICSI
> >
> > =A0#endif /* ASM_ARCH_IRQS_H */
> > ---
> >
> > And I'm confused about the name of MIPI-CSI...
> > Hmm...used MIPICSI or MIPI_CSI, sometimes MIPICSIS or MIPI_CSIS.
> >
> > Maybe the meaning is Camera Serial Interface Slave...
> > So...how about to use just one such as "IRQ_MIPI_CSIS" and
> > "S5PV210_PA_MIPI_CSIS".
>=20
> I think it's better use the common word, CSI. I can't find CSIS word
> at googling.
>=20
But used it in datasheet. How about FIMC, I think, it depends on usage =
of
datasheet.

> >
> > ---
> > @@ -65,7 +65,7 @@
> > =A0#define IRQ_HSMMC0 =A0 =A0 =A0 =A0 =A0 =A0 S5P_IRQ_VIC1(26)
> > =A0#define IRQ_HSMMC1 =A0 =A0 =A0 =A0 =A0 =A0 S5P_IRQ_VIC1(27)
> > =A0#define IRQ_HSMMC2 =A0 =A0 =A0 =A0 =A0 =A0 S5P_IRQ_VIC1(28)
> > -#define IRQ_MIPICSI =A0 =A0 =A0 =A0 =A0 =A0S5P_IRQ_VIC1(29)
> > +#define IRQ_MIPI_CSIS =A0 =A0 =A0 =A0 =A0S5P_IRQ_VIC1(29)
> > =A0#define IRQ_MIPIDSI =A0 =A0 =A0 =A0 =A0 =A0S5P_IRQ_VIC1(30)
> > =A0#define IRQ_ONENAND_AUDI =A0 =A0 =A0 S5P_IRQ_VIC1(31)
> >
> > @@ -132,5 +132,6 @@
> > =A0#define IRQ_LCD_FIFO =A0 =A0 =A0 =A0 =A0 IRQ_LCD0
> > =A0#define IRQ_LCD_VSYNC =A0 =A0 =A0 =A0 =A0IRQ_LCD1
> > =A0#define IRQ_LCD_SYSTEM =A0 =A0 =A0 =A0 IRQ_LCD2
> > +#define IRQ_MIPI_CSIS0 =A0 =A0 =A0 =A0 IRQ_MIPI_CSIS
>=20
> In this case, I can't find any good reason since it's first used.
> as s3c series used the different names compare to s5p series. it's
> okay make these wrapper.
> but it's new one and not used previous time.
>=20
I already commented about that.
Shortly, IRQ_MIPI_CSIS0 is used as common name for S5PV210 and S5PV310 =
in
plat-s5p.
And IRQ_MIPI_CSI is used as specific name on S5PV210. So needed it.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
