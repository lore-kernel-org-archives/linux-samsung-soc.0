From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 4/7] ARM: dts: Add FIMD DT node to exynos5420 DTS files
Date: Mon, 29 Jul 2013 23:48:38 +0200
Message-ID: <2252729.V1lMZqU45k@thinkpad>
References: <1375105771-8106-1-git-send-email-vikas.sajjan@linaro.org> <1375105771-8106-5-git-send-email-vikas.sajjan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f53.google.com ([209.85.214.53]:34610 "EHLO
	mail-bk0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755625Ab3G2Vsd convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 29 Jul 2013 17:48:33 -0400
Received: by mail-bk0-f53.google.com with SMTP id d7so396438bkh.40
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jul 2013 14:48:31 -0700 (PDT)
In-Reply-To: <1375105771-8106-5-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vikas Sajjan <vikas.sajjan@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, t.figa@samsung.com, devicetree-discuss@lists.ozlabs.org, jg1.han@samsung.com, inki.dae@samsung.com, patches@linaro.org, linaro-kernel@lists.linaro.org

Hi Vikas,

Please see my comments inline.

On Monday 29 of July 2013 19:19:28 Vikas Sajjan wrote:
> Adds FIMD DT node to exynos5420 based SMDK. Also adds display-timimg
> information node.
>=20
> Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
> ---
>  arch/arm/boot/dts/exynos5420-smdk5420.dts |   18 ++++++++++++++++++
>  arch/arm/boot/dts/exynos5420.dtsi         |    8 ++++++++
>  2 files changed, 26 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/exynos5420-smdk5420.dts
> b/arch/arm/boot/dts/exynos5420-smdk5420.dts index 08607df..7c2f477 10=
0644
> --- a/arch/arm/boot/dts/exynos5420-smdk5420.dts
> +++ b/arch/arm/boot/dts/exynos5420-smdk5420.dts
> @@ -30,4 +30,22 @@
>  			clock-frequency =3D <24000000>;
>  		};
>  	};
> +
> +	fimd {
> +		display-timings {
> +			native-mode =3D <&timing0>;
> +			timing0: timing@0 {
> +				clock-frequency =3D <50000>;
> +				hactive =3D <2560>;
> +				vactive =3D <1600>;
> +				hfront-porch =3D <48>;
> +				hback-porch =3D <80>;
> +				hsync-len =3D <32>;
> +				vback-porch =3D <16>;
> +				vfront-porch =3D <8>;
> +				vsync-len =3D <6>;
> +			};
> +		};
> +	};
> +
>  };
> diff --git a/arch/arm/boot/dts/exynos5420.dtsi
> b/arch/arm/boot/dts/exynos5420.dtsi index bd6b310..1f659f4 100644
> --- a/arch/arm/boot/dts/exynos5420.dtsi
> +++ b/arch/arm/boot/dts/exynos5420.dtsi
> @@ -180,4 +180,12 @@
>  		clocks =3D <&clock 260>, <&clock 131>;
>  		clock-names =3D "uart", "clk_uart_baud0";
>  	};
> +
> +	fimd {
> +		samsung,power-domain =3D <&disp_pd>;
> +		clocks =3D <&clock 147>, <&clock 421>;
> +		clock-names =3D "sclk_fimd", "fimd";
> +		status =3D "okay";

=46IMD can't operate without display timings, so status =3D "okay" does=
n't=20
represent real device state here. Please move status override to board =
dts.

I know that dtsi files of Exynos 5 SoCs have "okay" status as default, =
but this=20
is broken and needs to be fixed, because it moves the responsibility of=
 knowing=20
about all SoC hardware to board dts.

Generally, the ePAPR document, chapter 2.3.4, specifies following defin=
ition of=20
status property:

	The status property indicates the operational status of a device. Vali=
d=20
	values are listed and defined in the following table.

The table specifies following values:

	=E2=80=9Cokay=E2=80=9D
	Indicates the device is operational

	=E2=80=9Cdisabled=E2=80=9D
	Indicates that the device is not presently operational, but it might b=
ecome=20
	operational in the future (for example, something is not plugged in, o=
r 	=09
	switched off). Refer to the device binding for details on what disable=
d=20
	means for a given device.

	=E2=80=9Cfail=E2=80=9D
	Indicates that the device is not operational. A serious error was dete=
cted=20
	in the device, and it is unlikely to become operational without repair=
=2E

	=E2=80=9Cfail-sss=E2=80=9D
	Indicates that the device is not operational. A serious error was dete=
cted =09
	in the device and it is unlikely to become operational without repair.=
 The=20
	sss portion of the value is specific to the device and indicates the e=
rror=20
	condition detected.

Without all required properties the device will not be operational, so =
its=20
status should be set to "disabled" and then overriden to "okay" when mi=
ssing=20
properties are provided (e.g. in board dts).

Best regards,
Tomasz

> +	};
> +
>  };
