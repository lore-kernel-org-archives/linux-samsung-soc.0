From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: SAMSUNG: Introduce Kconfig variable for Samsung
 custom clk API
Date: Thu, 12 Jul 2012 18:12:41 +0900
Message-ID: <0fb101cd600e$7d42c970$77c85c50$%kim@samsung.com>
References: <1341418044-24572-1-git-send-email-broonie@opensource.wolfsonmicro.com>
 <201207050924.43932.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:53849 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753406Ab2GLJMm convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Jul 2012 05:12:42 -0400
Received: from epcpsbgm1.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M7100JZ0IVWNJ20@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 12 Jul 2012 18:12:41 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M71002CNIX5B160@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 12 Jul 2012 18:12:41 +0900 (KST)
In-reply-to: <201207050924.43932.heiko@sntech.de>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?Q?'Heiko_St=C3=BCbner'?= <heiko@sntech.de>, 'Mark Brown' <broonie@opensource.wolfsonmicro.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Heiko St=C3=BCbner wrote:
>=20
> Am Mittwoch, 4. Juli 2012, 18:07:24 schrieb Mark Brown:
> > Make it easier to switch to the common clock API by making the exis=
ting
> > clock API implementation depend on a Kconfig symbol which is enable=
d
> when
> > the common clock API is disabled. This means that we can have some =
SoCs
> > using the common clock API and some using the existing API rather t=
han
> > needing a flag day to convert the entire family of devices over.
> nice idea.
>=20
Yes, I think so.

> > Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
> Acked-by: Heiko Stuebner <heiko@sntech.de>
>=20
Applied.

And, I think, need to sort out the SAMSUNG_CLKSRC next time :)

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.


>=20
> > ---
> >  arch/arm/plat-samsung/Kconfig  |    4 ++++
> >  arch/arm/plat-samsung/Makefile |    4 ++--
> >  2 files changed, 6 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm/plat-samsung/Kconfig b/arch/arm/plat-
> samsung/Kconfig
> > index ffc84ac..7aca31c 100644
> > --- a/arch/arm/plat-samsung/Kconfig
> > +++ b/arch/arm/plat-samsung/Kconfig
> > @@ -78,6 +78,10 @@ config S5P_HRT
> >
> >  # clock options
> >
> > +config SAMSUNG_CLOCK
> > +	bool
> > +	default y if !COMMON_CLK
> > +
> >  config SAMSUNG_CLKSRC
> >  	bool
> >  	help
> > diff --git a/arch/arm/plat-samsung/Makefile
> > b/arch/arm/plat-samsung/Makefile index 856f4ee..9e40e8d 100644
> > --- a/arch/arm/plat-samsung/Makefile
> > +++ b/arch/arm/plat-samsung/Makefile
> > @@ -15,8 +15,8 @@ obj-y				+=3D init.o cpu.o
> >  obj-$(CONFIG_ARCH_USES_GETTIMEOFFSET)   +=3D time.o
> >  obj-$(CONFIG_S5P_HRT) 		+=3D s5p-time.o
> >
> > -obj-y				+=3D clock.o
> > -obj-y				+=3D pwm-clock.o
> > +obj-$(CONFIG_SAMSUNG_CLOCK)	+=3D clock.o
> > +obj-$(CONFIG_SAMSUNG_CLOCK)	+=3D pwm-clock.o
> >
> >  obj-$(CONFIG_SAMSUNG_CLKSRC)	+=3D clock-clksrc.o
> >  obj-$(CONFIG_S5P_CLOCK)		+=3D s5p-clock.o
