From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH v4 5/5] ARM: dts: Add LEDs to exynos5410-odroidxu
Date: Mon, 16 Mar 2015 09:02:05 +0100
Message-ID: <CABxcv=mxrvs4a=WqHLB6V4tBPfnNAaFP_wWJg7GUrTnW-njMFQ@mail.gmail.com>
References: <1426456834-6308-1-git-send-email-afaerber@suse.de>
	<1426456834-6308-6-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f169.google.com ([74.125.82.169]:36737 "EHLO
	mail-we0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750736AbbCPICH convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 16 Mar 2015 04:02:07 -0400
Received: by wetk59 with SMTP id k59so32021716wet.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Mar 2015 01:02:05 -0700 (PDT)
In-Reply-To: <1426456834-6308-6-git-send-email-afaerber@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene@kernel.org>, =?UTF-8?B?6rmA7ZWZ7KO8?= <ruppi.kim@hardkernel.com>, Tomasz Figa <tomasz.figa@gmail.com>, Humberto Naves <hsnaves@gmail.com>, Jan Kiszka <jan.kiszka@siemens.com>, Johann Pfefferl <johann.pfefferl@siemens.com>, Ben Gamari <bgamari.foss@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Linux Kernel <linux-kernel@vger.kernel.org>

Hello Andreas,

On Sun, Mar 15, 2015 at 11:00 PM, Andreas F=C3=A4rber <afaerber@suse.de=
> wrote:
> Signed-off-by: Hakjoo Kim <ruppi.kim@hardkernel.com>
> Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
> ---
>  v2 -> v3: Unchanged
>
>  v1 -> v2:
>  * Filled in Sob from Hakjoo Kim
>
>  arch/arm/boot/dts/exynos5410-odroidxu.dts | 25 +++++++++++++++++++++=
++++
>  1 file changed, 25 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos5410-odroidxu.dts b/arch/arm/boo=
t/dts/exynos5410-odroidxu.dts
> index 97310bb727e2..b02cd3ab7b38 100644
> --- a/arch/arm/boot/dts/exynos5410-odroidxu.dts
> +++ b/arch/arm/boot/dts/exynos5410-odroidxu.dts
> @@ -15,6 +15,7 @@
>
>  /dts-v1/;
>  #include "exynos5410.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
>  / {
>         model =3D "ODROID-XU based on EXYNOS5410";
>         compatible =3D "hardkernel,odroid-xu", "samsung,exynos5410", =
"samsung,exynos5";
> @@ -39,6 +40,30 @@
>                 reg =3D <0x02037000 0x1000>;
>         };
>
> +       leds {
> +               compatible =3D "gpio-leds";
> +
> +               blue {
> +                       label =3D "blue:heartbeat";
> +                       gpios =3D <&gpb2 2 GPIO_ACTIVE_HIGH>;
> +                       default-state =3D "off";
> +                       linux,default-trigger =3D "heartbeat";
> +               };
> +
> +               green {
> +                       label =3D "green:activity";
> +                       gpios =3D <&gpb2 1 GPIO_ACTIVE_HIGH>;
> +                       default-state =3D "off";
> +                       linux,default-trigger =3D "mmc0";
> +               };
> +
> +               red {
> +                       label =3D "red:activity";
> +                       gpios =3D <&gpx2 3 GPIO_ACTIVE_HIGH>;
> +                       default-state =3D "off";
> +                       linux,default-trigger =3D "mmc1";
> +               };

I see that you are sorting alphabetically using the node name but for
example in pinctrl lines we were sorting using the GPIO bank and
offset so if we want to use the same policy here, this should be
green, blue and red.

Either way is good to me though so is up to you.

Reviewed-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>

Best regards,
Javier
