From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 3/7] ARM: dts: s5pv210: Add initial DTS for Samsung Galaxy
 S phone.
Date: Fri, 22 Jun 2018 09:49:42 +0200
Message-ID: <CAJKOXPf8cpJ-pivG9j1sCM3aB_-i2n73MoeQKOd4oXxz976EVw@mail.gmail.com>
References: <1529608199-5583-1-git-send-email-pawel.mikolaj.chmiel@gmail.com> <1529608199-5583-4-git-send-email-pawel.mikolaj.chmiel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1529608199-5583-4-git-send-email-pawel.mikolaj.chmiel@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Pawe=C5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Cc: kgene@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, xc-racer2@live.ca
List-Id: linux-samsung-soc@vger.kernel.org

On 21 June 2018 at 21:09, Pawe=C5=82 Chmiel <pawel.mikolaj.chmiel@gmail.com=
> wrote:
> Signed-off-by: Pawe=C5=82 Chmiel <pawel.mikolaj.chmiel@gmail.com>

Please add commit message. This can be something as simple as "Add
Samsung Galaxy S DTS which is a commercial phone based on Aries
family." or something more (e.g. describe what is working).

> ---
>  arch/arm/boot/dts/Makefile            |  1 +
>  arch/arm/boot/dts/s5pv210-galaxys.dts | 72 +++++++++++++++++++++++++++++=
++++++
>  2 files changed, 73 insertions(+)
>  create mode 100644 arch/arm/boot/dts/s5pv210-galaxys.dts
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 7e2424957809..522ebdca1d3d 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -846,6 +846,7 @@ dtb-$(CONFIG_ARCH_S3C64XX) +=3D \
>         s3c6410-smdk6410.dtb
>  dtb-$(CONFIG_ARCH_S5PV210) +=3D \
>         s5pv210-aquila.dtb \
> +       s5pv210-galaxys.dtb \
>         s5pv210-goni.dtb \
>         s5pv210-smdkc110.dtb \
>         s5pv210-smdkv210.dtb \
> diff --git a/arch/arm/boot/dts/s5pv210-galaxys.dts b/arch/arm/boot/dts/s5=
pv210-galaxys.dts
> new file mode 100644
> index 000000000000..d435032541a9
> --- /dev/null
> +++ b/arch/arm/boot/dts/s5pv210-galaxys.dts
> @@ -0,0 +1,72 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/dts-v1/;
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/interrupt-controller/irq.h>

Duplicated inclusion.

> +#include "s5pv210-aries.dtsi"
> +
> +/ {
> +       model =3D "Samsung Galaxy S1 (GT-I9000) based on S5PV210";
> +       compatible =3D "samsung,galaxys", "samsung,aries", "samsung,s5pv2=
10";
> +
> +       chosen {
> +               bootargs =3D "console=3DttySAC2,115200n8 root=3D/dev/mmcb=
lk2p1 rw rootwait ignore_loglevel earlyprintk";

stdout-path =3D "serial2:115200n8";

Rest of bootargs should not be here (they are not HW dependent) unless
you cannot configure them through bootloader?

> +       };
> +
> +       nand_pwrseq: nand-pwrseq {
> +               compatible =3D "mmc-pwrseq-simple";
> +               reset-gpios =3D <&gpj2 7 GPIO_ACTIVE_LOW>;
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&massmemory_en>;

massmemory_en is used only here, so please move it from aries.dtsi.
The same applies to all other possible properties if they are not used
in other DTSes including aries.

> +       };
> +
> +       gpio-keys {
> +               compatible =3D "gpio-keys";
> +
> +               power {
> +                       label =3D "power";
> +                       gpios =3D <&gph2 6 GPIO_ACTIVE_LOW>;
> +                       linux,code =3D <KEY_POWER>;
> +                       wakeup-source;
> +               };
> +
> +               vol-down {
> +                       label =3D "volume_down";
> +                       gpios =3D <&gph3 1 GPIO_ACTIVE_LOW>;
> +                       linux,code =3D <KEY_VOLUMEDOWN>;
> +               };
> +
> +               vol-up {
> +                       label =3D "volume_up";
> +                       gpios =3D <&gph3 2 GPIO_ACTIVE_LOW>;
> +                       linux,code =3D <KEY_VOLUMEUP>;
> +               };
> +
> +               home {
> +                       label =3D "home";
> +                       gpios =3D <&gph3 5 GPIO_ACTIVE_LOW>;
> +                       linux,code =3D <KEY_HOME>;
> +                       wakeup-source;
> +               };
> +       };
> +};
> +
> +&pinctrl0 {
> +       massmemory_en: massmemory-en {

Oh wait, I see massmemory_en here... so there is no need of such in aries.d=
tsi.

Best regards,
Krzysztof

> +               samsung,pins =3D "gpj2-7";
> +               samsung,pin-function =3D <EXYNOS_PIN_FUNC_OUTPUT>;
> +               samsung,pin-pud =3D <S3C64XX_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <EXYNOS4_PIN_DRV_LV1>;
> +       };
> +};
> +
> +&sdhci0 {
> +       bus-width =3D <4>;
> +       non-removable;
> +       mmc-pwrseq =3D <&nand_pwrseq>;
> +       pinctrl-0 =3D <&sd0_clk &sd0_cmd &sd0_bus4>;
> +       pinctrl-names =3D "default";
> +       status =3D "okay";
> +};
> --
> 2.7.4
>
