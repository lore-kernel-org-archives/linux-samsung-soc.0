From: =?utf-8?B?UGF3ZcWC?= Chmiel <pawel.mikolaj.chmiel@gmail.com>
Subject: Re: [PATCH 3/7] ARM: dts: s5pv210: Add initial DTS for Samsung Galaxy S phone.
Date: Fri, 22 Jun 2018 10:42:22 +0200
Message-ID: <1851346.itd6mG8ZId@acerlaptop>
References: <1529608199-5583-1-git-send-email-pawel.mikolaj.chmiel@gmail.com> <1529608199-5583-4-git-send-email-pawel.mikolaj.chmiel@gmail.com> <CAJKOXPf8cpJ-pivG9j1sCM3aB_-i2n73MoeQKOd4oXxz976EVw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJKOXPf8cpJ-pivG9j1sCM3aB_-i2n73MoeQKOd4oXxz976EVw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: kgene@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, xc-racer2@live.ca
List-Id: linux-samsung-soc@vger.kernel.org

On Friday, June 22, 2018 9:49:42 AM CEST Krzysztof Kozlowski wrote:
> On 21 June 2018 at 21:09, Pawe=C5=82 Chmiel <pawel.mikolaj.chmiel@gmail.c=
om> wrote:
> > Signed-off-by: Pawe=C5=82 Chmiel <pawel.mikolaj.chmiel@gmail.com>
>=20
> Please add commit message. This can be something as simple as "Add
> Samsung Galaxy S DTS which is a commercial phone based on Aries
> family." or something more (e.g. describe what is working).
>=20
> > ---
> >  arch/arm/boot/dts/Makefile            |  1 +
> >  arch/arm/boot/dts/s5pv210-galaxys.dts | 72 +++++++++++++++++++++++++++=
++++++++
> >  2 files changed, 73 insertions(+)
> >  create mode 100644 arch/arm/boot/dts/s5pv210-galaxys.dts
> >
> > diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> > index 7e2424957809..522ebdca1d3d 100644
> > --- a/arch/arm/boot/dts/Makefile
> > +++ b/arch/arm/boot/dts/Makefile
> > @@ -846,6 +846,7 @@ dtb-$(CONFIG_ARCH_S3C64XX) +=3D \
> >         s3c6410-smdk6410.dtb
> >  dtb-$(CONFIG_ARCH_S5PV210) +=3D \
> >         s5pv210-aquila.dtb \
> > +       s5pv210-galaxys.dtb \
> >         s5pv210-goni.dtb \
> >         s5pv210-smdkc110.dtb \
> >         s5pv210-smdkv210.dtb \
> > diff --git a/arch/arm/boot/dts/s5pv210-galaxys.dts b/arch/arm/boot/dts/=
s5pv210-galaxys.dts
> > new file mode 100644
> > index 000000000000..d435032541a9
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/s5pv210-galaxys.dts
> > @@ -0,0 +1,72 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +/dts-v1/;
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/interrupt-controller/irq.h>
> > +#include <dt-bindings/input/input.h>
> > +#include <dt-bindings/interrupt-controller/irq.h>
>=20
> Duplicated inclusion.
>=20
> > +#include "s5pv210-aries.dtsi"
> > +
> > +/ {
> > +       model =3D "Samsung Galaxy S1 (GT-I9000) based on S5PV210";
> > +       compatible =3D "samsung,galaxys", "samsung,aries", "samsung,s5p=
v210";
> > +
> > +       chosen {
> > +               bootargs =3D "console=3DttySAC2,115200n8 root=3D/dev/mm=
cblk2p1 rw rootwait ignore_loglevel earlyprintk";
>=20
> stdout-path =3D "serial2:115200n8";
>=20
> Rest of bootargs should not be here (they are not HW dependent) unless
> you cannot configure them through bootloader?
>=20
Stock (proprietary) bootloader is little problematic for me:
=2D to access it, You need to build special cable.
=2D i wasn't able to boot any kernel newer than 2.6.35/3.0 on it, without f=
ollowing hack/patch
https://github.com/tom3q/linux/commit/af96ebcba03b607ab93bd5778301890feb038=
479.patch

I would like to leave those bootargs for now, so anyone can easly test this=
 kernel (just with that one patch),
without breaking booting existing software, so they could easly go back to =
stock software by just flashing old kernel.
Later it'll be removed because there is initial port of mainline u-boot sta=
rted for both devices
=2D currently it can be flashed to device, instead of kernel and boot kerne=
ls from onenand/sdcard.
In this way migration from old kernel to new one will be much easier to use=
rs (and won't require special tools/cables/etc).


> > +       };
> > +
> > +       nand_pwrseq: nand-pwrseq {
> > +               compatible =3D "mmc-pwrseq-simple";
> > +               reset-gpios =3D <&gpj2 7 GPIO_ACTIVE_LOW>;
> > +               pinctrl-names =3D "default";
> > +               pinctrl-0 =3D <&massmemory_en>;
>=20
> massmemory_en is used only here, so please move it from aries.dtsi.
> The same applies to all other possible properties if they are not used
> in other DTSes including aries.
>=20
> > +       };
> > +
> > +       gpio-keys {
> > +               compatible =3D "gpio-keys";
> > +
> > +               power {
> > +                       label =3D "power";
> > +                       gpios =3D <&gph2 6 GPIO_ACTIVE_LOW>;
> > +                       linux,code =3D <KEY_POWER>;
> > +                       wakeup-source;
> > +               };
> > +
> > +               vol-down {
> > +                       label =3D "volume_down";
> > +                       gpios =3D <&gph3 1 GPIO_ACTIVE_LOW>;
> > +                       linux,code =3D <KEY_VOLUMEDOWN>;
> > +               };
> > +
> > +               vol-up {
> > +                       label =3D "volume_up";
> > +                       gpios =3D <&gph3 2 GPIO_ACTIVE_LOW>;
> > +                       linux,code =3D <KEY_VOLUMEUP>;
> > +               };
> > +
> > +               home {
> > +                       label =3D "home";
> > +                       gpios =3D <&gph3 5 GPIO_ACTIVE_LOW>;
> > +                       linux,code =3D <KEY_HOME>;
> > +                       wakeup-source;
> > +               };
> > +       };
> > +};
> > +
> > +&pinctrl0 {
> > +       massmemory_en: massmemory-en {
>=20
> Oh wait, I see massmemory_en here... so there is no need of such in aries=
=2Edtsi.
>=20
> Best regards,
> Krzysztof
>=20
> > +               samsung,pins =3D "gpj2-7";
> > +               samsung,pin-function =3D <EXYNOS_PIN_FUNC_OUTPUT>;
> > +               samsung,pin-pud =3D <S3C64XX_PIN_PULL_NONE>;
> > +               samsung,pin-drv =3D <EXYNOS4_PIN_DRV_LV1>;
> > +       };
> > +};
> > +
> > +&sdhci0 {
> > +       bus-width =3D <4>;
> > +       non-removable;
> > +       mmc-pwrseq =3D <&nand_pwrseq>;
> > +       pinctrl-0 =3D <&sd0_clk &sd0_cmd &sd0_bus4>;
> > +       pinctrl-names =3D "default";
> > +       status =3D "okay";
> > +};
> > --
> > 2.7.4
> >
>=20
