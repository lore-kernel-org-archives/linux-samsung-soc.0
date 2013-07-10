From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH v2 0/6] Convert S3C2416 ad S3C2443 to common clock framework
Date: Wed, 10 Jul 2013 14:17:29 +0530
Message-ID: <CAJuYYwT73KnjFmX0+r+b1_-tggPft=Fko9oHaL3yVUdY7ov5=Q@mail.gmail.com>
References: <201307100057.06061.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f177.google.com ([209.85.223.177]:65363 "EHLO
	mail-ie0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751885Ab3GJIra convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 10 Jul 2013 04:47:30 -0400
Received: by mail-ie0-f177.google.com with SMTP id aq17so14090046iec.8
        for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Jul 2013 01:47:30 -0700 (PDT)
In-Reply-To: <201307100057.06061.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, mturquette@linaro.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, t.figa@samsung.com, Russell King <linux@arm.linux.org.uk>

On 10 July 2013 04:27, Heiko St=FCbner <heiko@sntech.de> wrote:
> This series provides a clock driver for s3c2416, s3c2443 and s3c2450,=
 which
> share a common clock tree, but differ fundamentally from earlier s3c2=
4xx
> SoCs, and converts the mentioned SoCs to use it.
>
> The clock driver itself follows the same scheme established by all ot=
her
> Samsung clock drivers.
>
> It depends on the pwm cleanup series from Tomasz Figa, which gets rid=
 of the
> declarations of the pwm-internal clocks.
>
> Test on both non-dt and dt s3c2416.
>
> Heiko Stuebner (6):
>   clk: samsung: move common plls registration into separate function
>   clk: samsung: fix error handling in pll register functions
>   clk: samsung: add plls used in s3c2416 and s3c2443
>   ARM: S3C24XX: enable legacy clock code only when SAMSUNG_CLOCK
>     selected
>   clk: samsung: add clock-driver for s3c2416, s3c2443 and s3c2450
>   ARM: S3C24XX: Convert s3c2416 and s3c2443 to common clock framework
>
>  .../bindings/clock/samsung,s3c2443-clock.txt       |   48 ++
>  arch/arm/boot/dts/s3c2416-smdk2416.dts             |    7 +
>  arch/arm/boot/dts/s3c2416.dtsi                     |   42 ++
>  arch/arm/mach-s3c24xx/Kconfig                      |   14 +-
>  arch/arm/mach-s3c24xx/Makefile                     |    5 +-
>  arch/arm/mach-s3c24xx/clock-s3c2416.c              |  171 -----
>  arch/arm/mach-s3c24xx/clock-s3c2443.c              |  212 ------
>  arch/arm/mach-s3c24xx/common-s3c2443.c             |  675 ----------=
----------
>  arch/arm/mach-s3c24xx/common.c                     |   20 +-
>  arch/arm/mach-s3c24xx/common.h                     |    8 +
>  arch/arm/mach-s3c24xx/mach-s3c2416-dt.c            |   45 +-
>  arch/arm/mach-s3c24xx/mach-smdk2416.c              |    9 +-
>  arch/arm/mach-s3c24xx/mach-smdk2443.c              |    9 +-
>  drivers/clk/Kconfig                                |    1 +
>  drivers/clk/samsung/Kconfig                        |    2 +
>  drivers/clk/samsung/Makefile                       |    1 +
>  drivers/clk/samsung/clk-pll.c                      |  374 +++++++++-=
-
>  drivers/clk/samsung/clk-pll.h                      |    8 +
>  drivers/clk/samsung/clk-s3c2443.c                  |  422 ++++++++++=
++
>  include/dt-bindings/clock/samsung,s3c2443-clock.h  |   96 +++
>  20 files changed, 998 insertions(+), 1171 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/samsung,s=
3c2443-clock.txt
>  delete mode 100644 arch/arm/mach-s3c24xx/clock-s3c2416.c
>  delete mode 100644 arch/arm/mach-s3c24xx/clock-s3c2443.c
>  delete mode 100644 arch/arm/mach-s3c24xx/common-s3c2443.c
>  create mode 100644 drivers/clk/samsung/Kconfig
>  create mode 100644 drivers/clk/samsung/clk-s3c2443.c
>  create mode 100644 include/dt-bindings/clock/samsung,s3c2443-clock.h
>
> --
> 1.7.10.4
>

Thanks for consolidating pll registrations.
=46or patches 1 to 3:
Reviewed-by: Thomas Abraham <thomas.abraham@linaro.org>
