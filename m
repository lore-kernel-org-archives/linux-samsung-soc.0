From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v5 0/4] mfd: sec: add S2MPS15 PMIC support
Date: Fri, 20 Nov 2015 09:05:28 +0000
Message-ID: <20151120090528.GC3098@x1>
References: <1446186334-16510-1-git-send-email-alim.akhtar@samsung.com>
 <CAGOxZ51aPo3rdB6R6x-Y4SUD4nsAcUo3X5XoEUSg0gfxuJpdyQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f53.google.com ([74.125.82.53]:38477 "EHLO
	mail-wm0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1162294AbbKTJFd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 20 Nov 2015 04:05:33 -0500
Received: by wmec201 with SMTP id c201so12268136wme.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Nov 2015 01:05:31 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <CAGOxZ51aPo3rdB6R6x-Y4SUD4nsAcUo3X5XoEUSg0gfxuJpdyQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alim Akhtar <alim.akhtar@gmail.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, broonie@kernel.org, Krzysztof =?utf-8?Q?Koz=C5=82owski?= <k.kozlowski@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, rtc-linux@googlegroups.com, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, 19 Nov 2015, Alim Akhtar wrote:

> Hi Lee,
> Do I need to resend this series? This series still apply cleanly on
> top of v4.4-rc1.
> I can see 1/4 is already applied.

Yes, rebase and resend please.

> On Fri, Oct 30, 2015 at 11:55 AM, Alim Akhtar <alim.akhtar@samsung.co=
m> wrote:
> > Samsung's S2MPS15 PMIC is targetted to be used with Samsung's Exyno=
s7 SoC.
> > The S2MPS15 PMIC is similar in functionality to S2MPS11/14 PMIC. It=
 contains
> > 27 LDO and 10 Buck regulators, RTC, three 32.768 KHz clock outputs =
and allows
> > programming these blocks via a I2C interface. This patch series add=
s initial
> > support for LDO/Buck regulators of S2MPS15 PMIC.
> >
> > Changes since v4:
> > * Dorpped Krzysztof reviewed-by and Lee Acked-by tags from patch 1/=
4,
> >   because of the new changes to DT bindings. Seeking a fresh review=
/ack tags.
> > * Removed samsung,s2mps15-clk compatible as we can reuse exsisting =
compatible of s2mps13.
> > * Added acked-by on patch 2/4
> > * Modified rtc driver as s2mps15 differs from s2mps14/13 etc, addre=
ssed Krzysztof
> >   concerns on rtc patch.
> >   There are some other improvement suggestion from Krzystof for the=
 rtc, I feel that can be done
> >   as a sperate patch later.
> >
> > Changes since v3:
> > * Changes regulator driver name from s2mps15-pmic -> s2mps15-regula=
tor as disscussed here [2]
> > * Re-use the exsisting compatible/names for s2mps15 clock block.
> >
> > Changes since v2:
> > * Addressed Lee Jones review comments.
> >
> > Changes since v1:
> > * Added suggestion from Krzysztof [1].
> > * Added s2mps15's 32.768 clocks support.
> > * Added s2mps15's rtc support.
> >
> > V1 of these patches (with a lesser features) were posted a year bac=
k,
> > since then there is not much progress on this, this is my attempt t=
o
> > move things forward.
> >
> > [1]-> https://lkml.org/lkml/2014/10/14/67
> > [2]-> https://lkml.org/lkml/2015/10/28/417
> >
> > This series is based on linux-next-20151022.
> > This is tested on exynos7-espresso board.
> >
> > Alim Akhtar (1):
> >   drivers/rtc/rtc-s5m.c: add support for S2MPS15 RTC
> >
> > Thomas Abraham (3):
> >   dt-bindings: mfd: s2mps11: add documentation for s2mps15 PMIC
> >   mfd: sec: Add support for S2MPS15 PMIC
> >   regulator: s2mps11: add support for S2MPS15 regulators
> >
> >  Documentation/devicetree/bindings/mfd/s2mps11.txt |   21 ++-
> >  drivers/mfd/sec-core.c                            |   31 ++++
> >  drivers/mfd/sec-irq.c                             |    8 ++
> >  drivers/regulator/Kconfig                         |    4 +-
> >  drivers/regulator/s2mps11.c                       |  135 +++++++++=
++++++++-
> >  drivers/rtc/rtc-s5m.c                             |   37 ++++-
> >  include/linux/mfd/samsung/core.h                  |    1 +
> >  include/linux/mfd/samsung/rtc.h                   |    2 +
> >  include/linux/mfd/samsung/s2mps15.h               |  158 +++++++++=
++++++++++++
> >  9 files changed, 383 insertions(+), 14 deletions(-)
> >  create mode 100644 include/linux/mfd/samsung/s2mps15.h
> >
> >
>=20
>=20
>=20

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
