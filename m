From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v3 0/5] ARM: S3C24XX: Convert s3c2416 and s3c2443 to common
 clock framework
Date: Mon, 09 Dec 2013 18:20:55 +0100
Message-ID: <4578558.zGLnaeVPQ1@amdc1227>
References: <201312031619.58062.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:31260 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751225Ab3LIRVI convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Dec 2013 12:21:08 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MXJ007PCUV6YH50@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 09 Dec 2013 17:21:06 +0000 (GMT)
In-reply-to: <201312031619.58062.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, mturquette@linaro.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Thomas Abraham <thomas.abraham@linaro.org>

Hi Heiko,

On Tuesday 03 of December 2013 16:19:57 Heiko St=FCbner wrote:
> Resurrecting this series again after to much time.
>=20
> Changed is the pll registration to follow the new system and getting =
the
> external clocks from dt fixed-rate clocks.
>=20
> Hopefully I did address all comments received for v2 in july.
>=20
> Tested on both non-dt and dt s3c2416. As s3c2443 is working the same =
way it
> should work, but is only compile tested.
>=20
> Heiko Stuebner (5):
>   clk: samsung: add pll_6552 variant for s3c2416
>   clk: samsung: add plls used by the s3c2443
>   dt-bindings: add binding for clock-controller of s3c2443 and follow=
ing
>   clk: samsung: add clock-driver for s3c2416, s3c2443 and s3c2450
>   ARM: S3C24XX: Convert s3c2416 and s3c2443 to common clock framework
>=20
>  .../bindings/clock/samsung,s3c2443-clock.txt       |   46 ++
>  arch/arm/boot/dts/s3c2416-smdk2416.dts             |    9 +
>  arch/arm/boot/dts/s3c2416.dtsi                     |   48 ++
>  arch/arm/mach-s3c24xx/Kconfig                      |   14 +-
>  arch/arm/mach-s3c24xx/Makefile                     |    5 +-
>  arch/arm/mach-s3c24xx/clock-s3c2416.c              |  171 -----
>  arch/arm/mach-s3c24xx/clock-s3c2443.c              |  212 ------
>  arch/arm/mach-s3c24xx/common-s3c2443.c             |  675 ----------=
----------
>  arch/arm/mach-s3c24xx/common.c                     |   16 +-
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
>  18 files changed, 742 insertions(+), 1114 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/samsung,s=
3c2443-clock.txt
>  delete mode 100644 arch/arm/mach-s3c24xx/clock-s3c2416.c
>  delete mode 100644 arch/arm/mach-s3c24xx/clock-s3c2443.c
>  delete mode 100644 arch/arm/mach-s3c24xx/common-s3c2443.c
>  create mode 100644 drivers/clk/samsung/clk-s3c2443.c
>  create mode 100644 include/dt-bindings/clock/samsung,s3c2443-clock.h

Thanks for you great work on S3C24xx.

Except for my (minor) comments on patches 3 and 5:

Acked-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz
