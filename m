From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2 5/8] ARM: S5PV310: Add Timer support
Date: Tue, 20 Jul 2010 21:34:03 +0900
Message-ID: <003b01cb2807$df794560$9e6bd020$%kim@samsung.com>
References: <1279270714-15146-1-git-send-email-kgene.kim@samsung.com>
 <1279270714-15146-6-git-send-email-kgene.kim@samsung.com>
 <AANLkTimirpioNZmzLoWeAD9hN0gAmWodddeMyxsdY7A6@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:64116 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758310Ab0GTMeL convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Jul 2010 08:34:11 -0400
Received: from epmmp1 (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L5U00GCAW8W0150@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 20 Jul 2010 21:34:08 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L5U00786W8VEI@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 20 Jul 2010 21:34:08 +0900 (KST)
In-reply-to: <AANLkTimirpioNZmzLoWeAD9hN0gAmWodddeMyxsdY7A6@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kyungmin Park' <kmpark@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, 'Changhwan Youn' <chaos.youn@samsung.com>, 'Hyuk Lee' <hyuk1.lee@samsung.com>

Kyungmin Park wrote:
>=20
> On Fri, Jul 16, 2010 at 5:58 PM, Kukjin Kim <kgene.kim@samsung.com> w=
rote:
> > From: Changhwan Youn <chaos.youn@samsung.com>
> >
> > This patch adds timer support for S5PV310.
> > Until now, all S5P SoCs use CONFIG_ARCH_USES_GETTIMEOFFSET macro as
> a default
> > configuration. Instead, S5PV310 implements clocksource and
> clock_event_device
> > to support the high resolution timer and tickless system.
> >
> > Signed-off-by: Changhwan Youn <chaos.youn@samsung.com>
> > Signed-off-by: Hyuk Lee <hyuk1.lee@samsung.com>
> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> > ---

(snip)

> > diff --git a/arch/arm/mach-s5pv310/time.c b/arch/arm/mach-s5pv310/t=
ime.c
> > new file mode 100644
> > index 0000000..64accf8
> > --- /dev/null
> > +++ b/arch/arm/mach-s5pv310/time.c
> > @@ -0,0 +1,287 @@
> > +/* linux/arch/arm/mach-s5pv310/time.c
> > + *
> > + * Copyright (c) 2010 Samsung Electronics Co., Ltd.
> > + * =A0 =A0 =A0 =A0 =A0 =A0 http://www.samsung.com
> > + *
> > + * S5PV310 (and compatible) HRT support
> > + * PWM 2/4 is used for this feature
>=20
> Please make it configurable, now PWM 2 is used for I2C pin in mobile
hardware.
> It seems to smdk specific file.
>=20
> Why don't use the systimer?
>=20
Your suggestion looks reasonable, so will support HRT with System Timer=
=2E

(snip)

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
