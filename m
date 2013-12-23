From: Heiko =?utf-8?q?St=C3=BCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v4 0/7] ARM: S3C24XX: Convert s3c2416 and s3c2443 to common clock framework
Date: Mon, 23 Dec 2013 14:11:34 +0100
Message-ID: <201312231411.35417.heiko@sntech.de>
References: <201312101614.29781.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:60948 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757262Ab3LWNLj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 23 Dec 2013 08:11:39 -0500
In-Reply-To: <201312101614.29781.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: mturquette@linaro.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Thomas Abraham <thomas.abraham@linaro.org>, t.figa@samsung.com

Hi Kukjin,

it seems you didn't have the time for this series during your 2nd round=
=2E

I'm not sure what your plans/time constraint are, but according to the =
-rc5=20
release mail from Linus [0], 3.13 will at least reach -rc8 so it seems =
as if=20
there is still a bit of time to for 3.14 stuff.

This series would really be a nice base for not only the other ccf-conv=
ersions=20
(the already submitted s3c2410 and the s3c2412 which I'm currently work=
ing on)=20
but also for broadening the dt-support, with the auxdata gone from the =
dt-
board file.


Thanks
Heiko



[0] https://lkml.org/lkml/2013/12/22/70

Am Dienstag, 10. Dezember 2013, 16:14:29 schrieb Heiko St=C3=BCbner:
> Next try, this time with less time between submissions.
>=20
> Tested on both non-dt and dt s3c2416.
>=20
> Changes since v3:
> - address comments from Tomasz Figa (binding documentation, etc)
> - prevent conflicts with unconverted s3c24xx socs
> Changes since v2
> - address comments from Tomasz Figa
> - use new pll registration mechanism
> - use fixed-rate clocks for xti etc
>=20
> Heiko Stuebner (7):
>   clk: samsung: add pll_6552 variant for s3c2416
>   clk: samsung: add plls used by the s3c2443
>   dt-bindings: add binding for clock-controller of s3c2443 and follow=
ing
>   clk: samsung: add clock-driver for s3c2416, s3c2443 and s3c2450
>   ARM: S3C24XX: prevent conflicts between ccf and non-ccf s3c24xx-soc=
s
>   ARM: dt: add clock data for s3c2416
>   ARM: S3C24XX: Convert s3c2416 and s3c2443 to common clock framework
>=20
>  .../bindings/clock/samsung,s3c2443-clock.txt       |   56 ++
>  arch/arm/boot/dts/s3c2416-smdk2416.dts             |   13 +
>  arch/arm/boot/dts/s3c2416.dtsi                     |   42 ++
>  arch/arm/mach-s3c24xx/Kconfig                      |   18 +-
>  arch/arm/mach-s3c24xx/Makefile                     |    5 +-
>  arch/arm/mach-s3c24xx/clock-s3c2416.c              |  171 -----
>  arch/arm/mach-s3c24xx/clock-s3c2443.c              |  212 ------
>  arch/arm/mach-s3c24xx/common-s3c2443.c             |  675
> -------------------- arch/arm/mach-s3c24xx/common.c                  =
   |=20
>  18 +-
>  arch/arm/mach-s3c24xx/common.h                     |    6 +
>  arch/arm/mach-s3c24xx/mach-s3c2416-dt.c            |   39 +-
>  arch/arm/mach-s3c24xx/mach-smdk2416.c              |    9 +-
>  arch/arm/mach-s3c24xx/mach-smdk2443.c              |    9 +-
>  drivers/clk/samsung/Makefile                       |    1 +
>  drivers/clk/samsung/clk-pll.c                      |   84 ++-
>  drivers/clk/samsung/clk-pll.h                      |    3 +
>  drivers/clk/samsung/clk-s3c2443.c                  |  417 ++++++++++=
++
>  include/dt-bindings/clock/samsung,s3c2443-clock.h  |   92 +++
>  18 files changed, 756 insertions(+), 1114 deletions(-)
>  create mode 100644
> Documentation/devicetree/bindings/clock/samsung,s3c2443-clock.txt del=
ete
> mode 100644 arch/arm/mach-s3c24xx/clock-s3c2416.c
>  delete mode 100644 arch/arm/mach-s3c24xx/clock-s3c2443.c
>  delete mode 100644 arch/arm/mach-s3c24xx/common-s3c2443.c
>  create mode 100644 drivers/clk/samsung/clk-s3c2443.c
>  create mode 100644 include/dt-bindings/clock/samsung,s3c2443-clock.h
