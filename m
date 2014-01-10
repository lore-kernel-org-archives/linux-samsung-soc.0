From: kgene@kernel.org
Subject: RE: [PATCH v4 0/7] ARM: S3C24XX: Convert s3c2416 and s3c2443 to common
 clock framework
Date: Fri, 10 Jan 2014 17:30:26 +0900
Message-ID: <093901cf0dde$36601100$a3203300$@kernel.org>
References: <201312101614.29781.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:17042 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752277AbaAJIaf convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 10 Jan 2014 03:30:35 -0500
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MZ600B1UFMQHT00@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 10 Jan 2014 17:30:26 +0900 (KST)
In-reply-to: <201312101614.29781.heiko@sntech.de>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?Q?'Heiko_St=C3=BCbner'?= <heiko@sntech.de>
Cc: mturquette@linaro.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Thomas Abraham' <thomas.abraham@linaro.org>, t.figa@samsung.com

Heiko St=C3=BCbner wrote:
>=20
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
---------
> -
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
>  create mode 100644
> Documentation/devicetree/bindings/clock/samsung,s3c2443-clock.txt
>  delete mode 100644 arch/arm/mach-s3c24xx/clock-s3c2416.c
>  delete mode 100644 arch/arm/mach-s3c24xx/clock-s3c2443.c
>  delete mode 100644 arch/arm/mach-s3c24xx/common-s3c2443.c
>  create mode 100644 drivers/clk/samsung/clk-s3c2443.c
>  create mode 100644 include/dt-bindings/clock/samsung,s3c2443-clock.h
>=20
> --
> 1.7.10.4

Heiko,
Looks nice to me and I'm going to send this series to clk tree for v3.1=
4.

Mike,
This series got you and Tomasz's ack for 3.14. Since major change is fo=
r clk stuff and there is no dependency with samsung tree, I'd like to s=
end pull-request for this series to you for v3.14 tonight. If any probl=
ems, please kindly let me know.

Thanks,
Kukjin
