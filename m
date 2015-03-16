From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH v4 2/5] ARM: dts: Prepare exynos5410-odroidxu device tree
Date: Mon, 16 Mar 2015 08:56:43 +0100
Message-ID: <CABxcv==cnFQ75qaykfkOcFo8FNqkzVswu8iYOB3riZJT9=4U_Q@mail.gmail.com>
References: <1426456834-6308-1-git-send-email-afaerber@suse.de>
	<1426456834-6308-3-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f172.google.com ([209.85.212.172]:33514 "EHLO
	mail-wi0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750938AbbCPH4p convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 16 Mar 2015 03:56:45 -0400
Received: by wixw10 with SMTP id w10so25546376wix.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Mar 2015 00:56:43 -0700 (PDT)
In-Reply-To: <1426456834-6308-3-git-send-email-afaerber@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene@kernel.org>, =?UTF-8?B?6rmA7ZWZ7KO8?= <ruppi.kim@hardkernel.com>, Tomasz Figa <tomasz.figa@gmail.com>, Humberto Naves <hsnaves@gmail.com>, Jan Kiszka <jan.kiszka@siemens.com>, Johann Pfefferl <johann.pfefferl@siemens.com>, Ben Gamari <bgamari.foss@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Linux Kernel <linux-kernel@vger.kernel.org>

Hello Andreas,

On Sun, Mar 15, 2015 at 11:00 PM, Andreas F=C3=A4rber <afaerber@suse.de=
> wrote:
> Derived from exynos5410-smdk5410.dts.
>
> Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
> ---
>  v1 -> v2 -> v3: Unchanged
>
>  arch/arm/boot/dts/Makefile                |  1 +
>  arch/arm/boot/dts/exynos5410-odroidxu.dts | 78 +++++++++++++++++++++=
++++++++++
>  2 files changed, 79 insertions(+)
>  create mode 100644 arch/arm/boot/dts/exynos5410-odroidxu.dts
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index a1c776b8dcec..b040737edcbc 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -103,6 +103,7 @@ dtb-$(CONFIG_ARCH_EXYNOS5) +=3D \
>         exynos5250-snow.dtb \
>         exynos5250-spring.dtb \
>         exynos5260-xyref5260.dtb \
> +       exynos5410-odroidxu.dtb \
>         exynos5410-smdk5410.dtb \
>         exynos5420-arndale-octa.dtb \
>         exynos5420-peach-pit.dtb \
> diff --git a/arch/arm/boot/dts/exynos5410-odroidxu.dts b/arch/arm/boo=
t/dts/exynos5410-odroidxu.dts
> new file mode 100644
> index 000000000000..97310bb727e2
> --- /dev/null
> +++ b/arch/arm/boot/dts/exynos5410-odroidxu.dts
> @@ -0,0 +1,78 @@
> +/*
> + * Hardkernel ODROID-XU device tree source
> + *
> + * Copyright (c) 2014 SUSE LINUX Products GmbH
> + *
> + * Based on exynos5410-smdk5410.dts:
> + *
> + * Copyright (c) 2013 Samsung Electronics Co., Ltd.
> + *             http://www.samsung.com
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +/dts-v1/;
> +#include "exynos5410.dtsi"
> +/ {
> +       model =3D "ODROID-XU based on EXYNOS5410";
> +       compatible =3D "hardkernel,odroid-xu", "samsung,exynos5410", =
"samsung,exynos5";
> +
> +       memory {
> +               reg =3D <0x40000000 0x80000000>;
> +       };
> +
> +       chosen {
> +               bootargs =3D "console=3DttySAC2,115200";
> +       };
> +

After commit a208ffd251d0 ("of: Enable console on serial ports
specified by /chosen/stdout-path") the kernel is able to know what
serial console to use if the DT defined an stdout-path property so
should be preferred instead of using a console=3D parameter.

I'll post today a series to change that on all exynos5 boards so you
can base on that.

> +       fin_pll: xxti {
> +               compatible =3D "fixed-clock";
> +               clock-frequency =3D <24000000>;
> +               clock-output-names =3D "fin_pll";
> +               #clock-cells =3D <0>;
> +       };
> +

I think this should be defined in exynos5410.dtsi instead since is an
IP block in the SoC and referenced in the .dts using a label to change
the clock-frequency in the board.

> +       firmware@02037000 {
> +               compatible =3D "samsung,secure-firmware";
> +               reg =3D <0x02037000 0x1000>;
> +       };
> +
> +};
> +
> +&mmc_0 {
> +       status =3D "okay";
> +       num-slots =3D <1>;
> +       cap-mmc-highspeed;
> +       broken-cd;
> +       card-detect-delay =3D <200>;
> +       samsung,dw-mshc-ciu-div =3D <3>;
> +       samsung,dw-mshc-sdr-timing =3D <2 3>;
> +       samsung,dw-mshc-ddr-timing =3D <1 2>;
> +       bus-width =3D <8>;
> +};
> +
> +&mmc_2 {
> +       status =3D "okay";
> +       num-slots =3D <1>;
> +       cap-sd-highspeed;
> +       card-detect-delay =3D <200>;
> +       samsung,dw-mshc-ciu-div =3D <3>;
> +       samsung,dw-mshc-sdr-timing =3D <2 3>;
> +       samsung,dw-mshc-ddr-timing =3D <1 2>;
> +       bus-width =3D <4>;
> +       disable-wp;
> +};
> +
> +&uart0 {
> +       status =3D "okay";
> +};
> +
> +&uart1 {
> +       status =3D "okay";
> +};
> +
> +&uart2 {
> +       status =3D "okay";
> +};
> --

With those two changes:

Reviewed-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>

Best regards,
Javier
