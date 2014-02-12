From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 05/14] mfd: sec: Use consistent S2MPS11 RTC alarm
 interrupt indexes
Date: Wed, 12 Feb 2014 15:48:15 +0000
Message-ID: <20140212154815.GB20026@lee--X1>
References: <1392123837-5517-1-git-send-email-k.kozlowski@samsung.com>
 <1392123837-5517-6-git-send-email-k.kozlowski@samsung.com>
 <20140212090746.GR15081@lee--X1>
 <1392197497.22265.8.camel@AMDC1943>
 <20140212100219.GX15081@lee--X1>
 <1392206769.22265.25.camel@AMDC1943>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f179.google.com ([209.85.212.179]:47555 "EHLO
	mail-wi0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752366AbaBLPsj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Feb 2014 10:48:39 -0500
Received: by mail-wi0-f179.google.com with SMTP id hn9so7114734wib.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Feb 2014 07:48:38 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1392206769.22265.25.camel@AMDC1943>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

> > > > > The S2MPS11 RTC has two alarms: alarm0 and alarm1 (correspond=
ing
> > > > > interrupts are named similarly). Use consistent names for int=
errupts to
> > > > > limit possible errors.
> > > > >=20
> > > > > Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> > > > > ---
> > > > >  drivers/mfd/sec-irq.c           |    8 ++++----
> > > > >  include/linux/mfd/samsung/irq.h |    4 ++--
> > > > >  2 files changed, 6 insertions(+), 6 deletions(-)
> > > >=20
> > > > <snip>
> > > >=20
> > > > >  #define S2MPS11_IRQ_RTC60S_MASK		(1 << 0)
> > > > >  #define S2MPS11_IRQ_RTCA1_MASK		(1 << 1)
> > > > > -#define S2MPS11_IRQ_RTCA2_MASK		(1 << 2)
> > > > > +#define S2MPS11_IRQ_RTCA0_MASK		(1 << 2)
> > > >=20
> > > > This doesn't look correct to me.
> > >=20
> > > It is just renaming RTCA2 to RTCA0 because there is no "alarm 2"
> > > registers. Actually the behavior of driver does not change (espec=
ially
> > > that there is no RTC driver for S2MPS11) but now it looks properl=
y:
> > >  - set ALARM0 registers for RTCA0 interrupt,
> > >  - set ALARM1 registers for RTCA1 interrupt,
> > >=20
> > > This patch is not essential.
> >=20
> > I mean the logic.
> >=20
> > If these masks are used for registers then I assume RTCA0 would be
> > BIT(1) amd RTCA1 would be BIT(2), but this patch swaps them round.
>=20
>=20
> Yes, one could assume that and in case of S5M8767 this is right (the
> order is proper)... but on S2MPS11/S2MPS14 this is reverted:
>  - BIT(0): RTC periodic 60s
>  - BIT(1): RTC Alarm 1
>  - BIT(2): RTC Alarm 0
>=20
> The original code (BIT(1) for RTCA1 and BIT(2) for RTCA2) was wrong h=
ere
> and may lead to errors. I think that this was changed during mainstre=
am
> process to match S5M8767. However some old internal driver sources fo=
r
> S2MPS11 have:
> #define S2MPS11_IRQ_RTCA2_MASK          (1 << 1)
> #define S2MPS11_IRQ_RTCA1_MASK          (1 << 2)

Okay, if you're happy that this is correct:
  Acked-by: Lee Jones <lee.jones@linaro.org>

> > > > >  #define S2MPS11_IRQ_SMPL_MASK		(1 << 3)
> > > > >  #define S2MPS11_IRQ_RTC1S_MASK		(1 << 4)
> > > > >  #define S2MPS11_IRQ_WTSR_MASK		(1 << 5)
> > > >=20
> > >=20
> >=20
>=20

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
