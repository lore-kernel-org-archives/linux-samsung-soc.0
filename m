From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v4 0/7] ARM: S3C24XX: Convert s3c2416 and s3c2443 to common
 clock framework
Date: Tue, 10 Dec 2013 16:27:04 +0100
Message-ID: <2199894.9J6a8matPx@amdc1227>
References: <201312101614.29781.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:15625 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753743Ab3LJP1S convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Dec 2013 10:27:18 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MXL0054QK9GA200@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 10 Dec 2013 15:27:16 +0000 (GMT)
In-reply-to: <201312101614.29781.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, mturquette@linaro.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Thomas Abraham <thomas.abraham@linaro.org>

Hi Heiko,

On Tuesday 10 of December 2013 16:14:29 Heiko St=FCbner wrote:
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
>  arch/arm/mach-s3c24xx/common-s3c2443.c             |  675 ----------=
----------
>  arch/arm/mach-s3c24xx/common.c                     |   18 +-
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
>  create mode 100644 Documentation/devicetree/bindings/clock/samsung,s=
3c2443-clock.txt
>  delete mode 100644 arch/arm/mach-s3c24xx/clock-s3c2416.c
>  delete mode 100644 arch/arm/mach-s3c24xx/clock-s3c2443.c
>  delete mode 100644 arch/arm/mach-s3c24xx/common-s3c2443.c
>  create mode 100644 drivers/clk/samsung/clk-s3c2443.c
>  create mode 100644 include/dt-bindings/clock/samsung,s3c2443-clock.h

I have already acked clock patches, so for remaining ones:

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz
