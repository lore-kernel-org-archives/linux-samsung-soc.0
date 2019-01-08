From: =?utf-8?B?UGF3ZcWC?= Chmiel <pawel.mikolaj.chmiel@gmail.com>
Subject: Re: [PATCH 5/6] ARM: dts: s5pv210: aries: Support for more devices present on Aries
Date: Tue, 08 Jan 2019 17:53:09 +0100
Message-ID: <2674227.8dsLnzbNuO@acerlaptop>
References: <20181228161819.18931-1-pawel.mikolaj.chmiel@gmail.com> <20181228161819.18931-6-pawel.mikolaj.chmiel@gmail.com> <CAJKOXPf3Z9=mjq_UWyD1oVEapvnNR71cDfyJP1Y_VLkXkFcyew@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJKOXPf3Z9=mjq_UWyD1oVEapvnNR71cDfyJP1Y_VLkXkFcyew@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: kgene@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, xc-racer2@live.ca, linux-arm-kernel@lists.infradead.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Dnia poniedzia=C5=82ek, 31 grudnia 2018 14:35:55 CET Krzysztof Kozlowski pi=
sze:
> On Fri, 28 Dec 2018 at 17:18, Pawe=C5=82 Chmiel
> <pawel.mikolaj.chmiel@gmail.com> wrote:
> >
> > From: Jonathan Bakker <xc-racer2@live.ca>
> >
> > This commit enables following devices present on Aries based phones:
> > - pwm-vibrator attached to PWM 1
> > - poweroff support
> > - Atmel maXTouch touchscreen. It's connected to i2c2
> > - Broadcom BCM4329 bluetooth over uart0
> >
> > Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>
> > Signed-off-by: Pawe=C5=82 Chmiel <pawel.mikolaj.chmiel@gmail.com>
> > ---
> >  arch/arm/boot/dts/s5pv210-aries.dtsi | 68 ++++++++++++++++++++++++++++
> >  1 file changed, 68 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/s5pv210-aries.dtsi b/arch/arm/boot/dts/s=
5pv210-aries.dtsi
> > index 35ba009a1a33..b7246f879648 100644
> > --- a/arch/arm/boot/dts/s5pv210-aries.dtsi
> > +++ b/arch/arm/boot/dts/s5pv210-aries.dtsi
> > @@ -41,6 +41,13 @@
> >                 };
> >         };
> >
> > +       vibrator_pwr: regulator-fixed-0 {
> > +               compatible =3D "regulator-fixed";
> > +               regulator-name =3D "vibrator-en";
> > +               enable-active-high;
> > +               gpio =3D <&gpj1 1 GPIO_ACTIVE_HIGH>;
> > +       };
> > +
> >         wifi_pwrseq: wifi-pwrseq {
> >                 compatible =3D "mmc-pwrseq-simple";
> >                 reset-gpios =3D <&gpg1 2 GPIO_ACTIVE_LOW>;
> > @@ -314,6 +321,22 @@
> >                         reg =3D <0x36>;
> >                 };
> >         };
> > +
> > +       vibrator: pwm-vibrator {
> > +               compatible =3D "pwm-vibrator";
> > +               pwms =3D <&pwm 1 44642 0>;
> > +               pwm-names =3D "enable";
> > +               vcc-supply =3D <&vibrator_pwr>;
> > +               pinctrl-names =3D "default";
> > +               pinctrl-0 =3D <&pwm1_out>;
> > +       };
> > +
> > +       poweroff: syscon-poweroff {
> > +               compatible =3D "syscon-poweroff";
> > +               regmap =3D <&pmu_syscon>;
> > +               offset =3D <0x681c>; /* PS_HOLD_CONTROL */
> > +               value =3D <0x5200>;
> > +       };
> >  };
> >
> >  &fimd {
> > @@ -347,6 +370,23 @@
> >         status =3D "okay";
> >  };
> >
> > +&i2c2 {
> > +       samsung,i2c-sda-delay =3D <100>;
> > +       samsung,i2c-max-bus-freq =3D <400000>;
> > +       samsung,i2c-slave-addr =3D <0x10>;
> > +       status =3D "okay";
> > +
> > +       touchscreen@4a {
> > +               compatible =3D "atmel,maxtouch";
> > +               reg =3D <0x4a>;
> > +               interrupt-parent =3D <&gpj0>;
> > +               interrupts =3D <5 IRQ_TYPE_LEVEL_LOW>;
> > +               pinctrl-names =3D "default";
> > +               pinctrl-0 =3D <&ts_irq>;
> > +               reset-gpios =3D <&gpj1 3 GPIO_ACTIVE_HIGH>;
> > +       };
> > +};
> > +
> >  &mfc {
> >         memory-region =3D <&mfc_left>, <&mfc_right>;
> >  };
> > @@ -372,6 +412,13 @@
> >                 samsung,pin-drv =3D <EXYNOS4_PIN_DRV_LV1>;
> >         };
> >
> > +       bt_host_wake: bt-host-wake {
> > +               samsung,pins =3D "gph2-5";
> > +               samsung,pin-function =3D <EXYNOS_PIN_FUNC_INPUT>;
> > +               samsung,pin-pud =3D <S3C64XX_PIN_PULL_DOWN>;
> > +               samsung,pin-drv =3D <EXYNOS4_PIN_DRV_LV1>;
> > +       };
> > +
> >         tf_detect: tf-detect {
> >                 samsung,pins =3D "gph3-4";
> >                 samsung,pin-function =3D <EXYNOS_PIN_FUNC_INPUT>;
> > @@ -384,6 +431,17 @@
> >                 samsung,pin-function =3D <EXYNOS_PIN_FUNC_OUTPUT>;
> >                 samsung,pin-pud =3D <S3C64XX_PIN_PULL_NONE>;
> >         };
> > +
> > +       ts_irq: ts-irq {
> > +               samsung,pins =3D "gpj0-5";
> > +               samsung,pin-function =3D <EXYNOS_PIN_FUNC_INPUT>;
> > +               samsung,pin-pud =3D <S3C64XX_PIN_PULL_UP>;
>=20
> It seems there is a difference here between Aries and Fascinate. At
> least in vendor kernel. One disables pull and second pulls down.
> Anyway neither of them pulls it up.
=46ixed with all other issues in v2.
Thanks

>=20
> Best regards,
> Krzysztof
