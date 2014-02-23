From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v2 0/5] ARM: S3C24XX: convert s3c2412 to common clock framework
Date: Sun, 23 Feb 2014 01:29:20 +0100
Message-ID: <2112473.9LIChJWDSQ@phil>
References: <1835515.oOiOlPWUhB@phil> <530937A4.3010301@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:35159 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752028AbaBWAaG convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 22 Feb 2014 19:30:06 -0500
In-Reply-To: <530937A4.3010301@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, t.figa@samsung.com, linux-samsung-soc@vger.kernel.org, mturquette@linaro.org, linux-arm-kernel@lists.infradead.org

Hi Tomasz,

Am Sonntag, 23. Februar 2014, 00:49:56 schrieb Tomasz Figa:
> Hi,
>=20
> On 22.02.2014 23:45, Heiko St=FCbner wrote:
> > Second incarnation of the series converting s3c2412/s3c2413 to the =
common
> > clock framework. As before the conversion is done by a mix of datas=
heet
> > data and the pre-existing clock code and as this time I have no har=
dware
> > of this type, it is compile-tested only. So hopefully somebody with
> > s3c2412
> > hw will be able to test it for real.
> >=20
> > The conversion of s3c2412 now moved in front of the
> > s3c2410/s3c2440/s3c2442
> > one, as I'll need a bit more time for the clockout changes suggeste=
d by
> > Tomasz Figa.
> >=20
> > This series builds on top of the previous submitted s3c2443/s3c2416
> > series.
> >=20
> >=20
> > Changes since v1:
> > - move in front of s3c2410 conversion, therefore move 2 necessary p=
atches
> >=20
> >    that also got ACKs, from there into this series
> >=20
> > - adapt to Samsung clock pm rework from Tomasz Figa
> > - apply some changes suggested by Tomasz Figa in the s3c2410 clock =
driver
> >=20
> >    that also apply to this driver.
> >=20
> > Heiko Stuebner (5):
> >    ARM: S3C24XX: only store clock registers when old clock code is =
active
> >    clk: samsung: add plls used by the early s3c24xx cpus
> >    dt-bindings: add documentation for s3c2412 clock controller
> >    clk: samsung: add clock controller driver for s3c2412
> >    ARM: S3C24XX: convert s3c2412 to common clock framework
> >  =20
> >   .../bindings/clock/samsung,s3c2412-clock.txt       |  50 ++
> >   arch/arm/mach-s3c24xx/Kconfig                      |   8 +-
> >   arch/arm/mach-s3c24xx/Makefile                     |   2 +-
> >   arch/arm/mach-s3c24xx/clock-s3c2412.c              | 761
> >   --------------------- arch/arm/mach-s3c24xx/common.c             =
     =20
> >    |   9 +-
> >   arch/arm/mach-s3c24xx/common.h                     |   4 +
> >   arch/arm/mach-s3c24xx/mach-jive.c                  |   9 +-
> >   arch/arm/mach-s3c24xx/mach-smdk2413.c              |   9 +-
> >   arch/arm/mach-s3c24xx/mach-vstms.c                 |   9 +-
> >   arch/arm/mach-s3c24xx/pm.c                         |  13 +-
> >   arch/arm/mach-s3c24xx/s3c2412.c                    |  43 --
> >   drivers/clk/samsung/Makefile                       |   1 +
> >   drivers/clk/samsung/clk-pll.c                      | 182 +++++
> >   drivers/clk/samsung/clk-pll.h                      |   3 +
> >   drivers/clk/samsung/clk-s3c2412.c                  | 268 ++++++++
> >   include/dt-bindings/clock/s3c2412.h                |  73 ++
> >   16 files changed, 627 insertions(+), 817 deletions(-)
> >   create mode 100644
> >   Documentation/devicetree/bindings/clock/samsung,s3c2412-clock.txt
> >   delete mode 100644 arch/arm/mach-s3c24xx/clock-s3c2412.c
> >   create mode 100644 drivers/clk/samsung/clk-s3c2412.c
> >   create mode 100644 include/dt-bindings/clock/s3c2412.h
>=20
> For mach and DT patches:
>=20
> Reviewed-by: Tomasz Figa <t.figa@samsung.com>
>=20
> Kukjin, I'll take binding and clock patches to Samsung clock tree as
> soon as DT bindings get acked by one of DT maintainers. I will prepar=
e a
> branch for you to apply mach patches on top. Is it fine for you?

I think Kukjin already applied the s3c2416/s3c2443 series on top of you=
r=20
clock-pm-changes in the linux-samsung tree [1], so it might be best to =
just=20
pile this series on top of it.


Heiko



[1] https://git.kernel.org/cgit/linux/kernel/git/kgene/linux-samsung.gi=
t/?h=3Dv3.15-next/clk-s3c24xx
