From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v4 0/7] ARM: S3C24XX: Convert s3c2416 and s3c2443 to common
 clock framework
Date: Tue, 24 Dec 2013 10:37:23 +0900
Message-ID: <1af701cf0048$b175b3c0$14611b40$@samsung.com>
References: <201312101614.29781.heiko@sntech.de>
 <201312231411.35417.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:45410 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758087Ab3LXBh0 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 23 Dec 2013 20:37:26 -0500
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MYA00AHTF6CK100@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 24 Dec 2013 10:37:24 +0900 (KST)
In-reply-to: <201312231411.35417.heiko@sntech.de>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?Q?'Heiko_St=C3=BCbner'?= <heiko@sntech.de>
Cc: mturquette@linaro.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Thomas Abraham' <thomas.abraham@linaro.org>, t.figa@samsung.com

Heiko St=C3=BCbner wrote:
>=20
> Hi Kukjin,
>=20
Hi,

> it seems you didn't have the time for this series during your 2nd rou=
nd.
>=20
> I'm not sure what your plans/time constraint are, but according to th=
e -
> rc5
> release mail from Linus [0], 3.13 will at least reach -rc8 so it seem=
s as
> if
> there is still a bit of time to for 3.14 stuff.
>=20
Good news to us :-)

> This series would really be a nice base for not only the other ccf-
> conversions
> (the already submitted s3c2410 and the s3c2412 which I'm currently wo=
rking
> on)
> but also for broadening the dt-support, with the auxdata gone from th=
e dt-
> board file.
>=20
I agreed, let me try to send one more pull-request for 3.14 after finis=
hing review of your patches.

Thanks and Merry Christmas,
Kukjin

>=20
> Thanks
> Heiko
>=20
>=20
>=20
> [0] https://lkml.org/lkml/2013/12/22/70
>=20
> Am Dienstag, 10. Dezember 2013, 16:14:29 schrieb Heiko St=C3=BCbner:
> > Next try, this time with less time between submissions.
> >
> > Tested on both non-dt and dt s3c2416.
> >
> > Changes since v3:
> > - address comments from Tomasz Figa (binding documentation, etc)
> > - prevent conflicts with unconverted s3c24xx socs
> > Changes since v2
> > - address comments from Tomasz Figa
> > - use new pll registration mechanism
> > - use fixed-rate clocks for xti etc
> >
> > Heiko Stuebner (7):
> >   clk: samsung: add pll_6552 variant for s3c2416
> >   clk: samsung: add plls used by the s3c2443
> >   dt-bindings: add binding for clock-controller of s3c2443 and foll=
owing
> >   clk: samsung: add clock-driver for s3c2416, s3c2443 and s3c2450
> >   ARM: S3C24XX: prevent conflicts between ccf and non-ccf s3c24xx-s=
ocs
> >   ARM: dt: add clock data for s3c2416
> >   ARM: S3C24XX: Convert s3c2416 and s3c2443 to common clock framewo=
rk
> >
> >  .../bindings/clock/samsung,s3c2443-clock.txt       |   56 ++
> >  arch/arm/boot/dts/s3c2416-smdk2416.dts             |   13 +
> >  arch/arm/boot/dts/s3c2416.dtsi                     |   42 ++
> >  arch/arm/mach-s3c24xx/Kconfig                      |   18 +-
> >  arch/arm/mach-s3c24xx/Makefile                     |    5 +-
> >  arch/arm/mach-s3c24xx/clock-s3c2416.c              |  171 -----
> >  arch/arm/mach-s3c24xx/clock-s3c2443.c              |  212 ------
> >  arch/arm/mach-s3c24xx/common-s3c2443.c             |  675
> > -------------------- arch/arm/mach-s3c24xx/common.c                =
     |
> >  18 +-
> >  arch/arm/mach-s3c24xx/common.h                     |    6 +
> >  arch/arm/mach-s3c24xx/mach-s3c2416-dt.c            |   39 +-
> >  arch/arm/mach-s3c24xx/mach-smdk2416.c              |    9 +-
> >  arch/arm/mach-s3c24xx/mach-smdk2443.c              |    9 +-
> >  drivers/clk/samsung/Makefile                       |    1 +
> >  drivers/clk/samsung/clk-pll.c                      |   84 ++-
> >  drivers/clk/samsung/clk-pll.h                      |    3 +
> >  drivers/clk/samsung/clk-s3c2443.c                  |  417 ++++++++=
++++
> >  include/dt-bindings/clock/samsung,s3c2443-clock.h  |   92 +++
> >  18 files changed, 756 insertions(+), 1114 deletions(-)
> >  create mode 100644
> > Documentation/devicetree/bindings/clock/samsung,s3c2443-clock.txt d=
elete
> > mode 100644 arch/arm/mach-s3c24xx/clock-s3c2416.c
> >  delete mode 100644 arch/arm/mach-s3c24xx/clock-s3c2443.c
> >  delete mode 100644 arch/arm/mach-s3c24xx/common-s3c2443.c
> >  create mode 100644 drivers/clk/samsung/clk-s3c2443.c
> >  create mode 100644 include/dt-bindings/clock/samsung,s3c2443-clock=
=2Eh
