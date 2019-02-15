From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [RFC 1/2] ARM: dts: exynos: Add proper regulator states for
 suspend-to-mem for odroid-u3
Date: Fri, 15 Feb 2019 08:30:58 +0100
Message-ID: <CAJKOXPcrkVEgsaTFrQbCvn=gx3h6av7zvaXcfroNMYk6qgs8mQ@mail.gmail.com>
References: <20190213214052.2427-1-linux.amoon@gmail.com> <20190213214052.2427-2-linux.amoon@gmail.com>
 <CAJKOXPeyFmKUGwqS1sgf_k2WSx9i0AETjpOLXtsmLFupTpgqnw@mail.gmail.com> <CANAwSgQB-=iwX1L0m6N=dbe6jbfUMYyjgna_QMmJyggj6rxzwQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CANAwSgQB-=iwX1L0m6N=dbe6jbfUMYyjgna_QMmJyggj6rxzwQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anand Moon <linux.amoon@gmail.com>
Cc: devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>, Pankaj Dubey <pankaj.dubey@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, 14 Feb 2019 at 19:35, Anand Moon <linux.amoon@gmail.com> wrote:
>
> hi Krzysztof,
>
> Thanks fro your review comments.
>
> On Thu, 14 Feb 2019 at 18:11, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > Hi Anand,
> >
> > Thanks for the patch. See comments below.
> >
> > On Wed, 13 Feb 2019 at 22:41, Anand Moon <linux.amoon@gmail.com> wrote:
> > >
> > > Add suspend-to-mem node to regulator core to be enabled or disabled
> > > during system suspend and also support changing the regulator operating
> > > mode during runtime and when the system enter sleep mode.
> > >
> > > Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> > > Cc: Krzysztof Kozlowski <krzk@kernel.org>
> > > Cc: Chanwoo Choi <cw00.choi@samsung.com>
> > > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > > ---
> > >
> > > Changes from previos patch
> > > [0] https://patchwork.kernel.org/patch/10712549/
> > >
> > > Set all the WAKEUP source regulator in suspend-on state.
> > > LD04, LD012, LD015, LD020, LD022
> > > Set all the non used regulator in suspend-odd state
> > > LD02, LD03, LD05, LD06, LD07, LD011, LD013, LDO14, LD016
> > >
> > > BUCK5, BUCK6, BUCK7 and not confirable as per driver max77686-regulator
> > >
> > > Tested on microSD card and it resumes correcly after suspend.
> > > eMMC is not able to resume after entering into suspend state,
> > > which need to be investigated and how to debug more.
> > > ---
> > >  .../boot/dts/exynos4412-odroid-common.dtsi    | 63 +++++++++++++++++++
> > >  arch/arm/boot/dts/exynos4412-odroidu3.dts     |  3 +
> > >  2 files changed, 66 insertions(+)
> > >
> > > diff --git a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
> > > index 08d3a0a7b4eb..e984461c37d9 100644
> > > --- a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
> > > +++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
> > > @@ -288,6 +288,9 @@
> > >                                 regulator-min-microvolt = <1800000>;
> > >                                 regulator-max-microvolt = <1800000>;
> > >                                 regulator-always-on;
> > > +                               regulator-state-mem {
> > > +                                       regulator-off-in-suspend;
> > > +                               };
> >
> > I see my comment from previous patch was not addressed.
>
> I left this unchanged since this regulator is not active linked and used.
> Ok I will change this to regulator-on-in-suspend,

Why?

Previous patch was setting this to "on". I said that this is noop and
if you want to add it, I need explanation why this regulator has to
stay on during suspend.

So you changed to "off"... which is still noop... and you did not
provide explanation. Now you replied that you will change to "on"...
so this will be circle. Still without explanation.

>
> From documentation device tree binding regulator.txt
> "- regulator-always-on: boolean, regulator should never be disabled"
>
> But some regulator switches to a low power mode under light current loads
> and the device automatically switches back to a fast response mode as the
> output load increases.
>
> >
> > >                         };
> > >
> > >                         ldo3_reg: LDO3 {
> > > @@ -295,6 +298,9 @@
> > >                                 regulator-min-microvolt = <1800000>;
> > >                                 regulator-max-microvolt = <1800000>;
> > >                                 regulator-always-on;
> > > +                               regulator-state-mem {
> > > +                                       regulator-off-in-suspend;
> > > +                               };
> >
> > The same...
>
> Ok I will change this to regulator-on-in-suspend,

The same - why changing this to on or off? I need explanation why this
should be in first place.

> >
> > >                         };
> > >
> > >                         ldo4_reg: LDO4 {
> > > @@ -302,6 +308,9 @@
> > >                                 regulator-min-microvolt = <2800000>;
> > >                                 regulator-max-microvolt = <2800000>;
> > >                                 regulator-boot-on;
> > > +                               regulator-state-mem {
> > > +                                       regulator-on-in-suspend;
> > > +                               };
> > >                         };
> > >
> > >                         ldo5_reg: LDO5 {
> > > @@ -310,6 +319,9 @@
> > >                                 regulator-max-microvolt = <1800000>;
> > >                                 regulator-always-on;
> > >                                 regulator-boot-on;
> > > +                               regulator-state-mem {
> > > +                                       regulator-off-in-suspend;
> > > +                               };
> > >                         };
> > >
> > >                         ldo6_reg: LDO6 {
> > > @@ -317,6 +329,9 @@
> > >                                 regulator-min-microvolt = <1000000>;
> > >                                 regulator-max-microvolt = <1000000>;
> > >                                 regulator-always-on;
> > > +                               regulator-state-mem {
> > > +                                       regulator-off-in-suspend;
> > > +                               };
> > >                         };
> > >
> > >                         ldo7_reg: LDO7 {
> > > @@ -324,18 +339,27 @@
> > >                                 regulator-min-microvolt = <1000000>;
> > >                                 regulator-max-microvolt = <1000000>;
> > >                                 regulator-always-on;
> > > +                               regulator-state-mem {
> > > +                                       regulator-off-in-suspend;
> > > +                               };
> > >                         };
> > >
> > >                         ldo8_reg: LDO8 {
> > >                                 regulator-name = "VDD10_HDMI_1.0V";
> > >                                 regulator-min-microvolt = <1000000>;
> > >                                 regulator-max-microvolt = <1000000>;
> > > +                               regulator-state-mem {
> > > +                                       regulator-on-in-suspend;
> > > +                               };
> > >                         };
> > >
> > >                         ldo10_reg: LDO10 {
> > >                                 regulator-name = "VDDQ_MIPIHSI_1.8V";
> > >                                 regulator-min-microvolt = <1800000>;
> > >                                 regulator-max-microvolt = <1800000>;
> > > +                               regulator-state-mem {
> > > +                                       regulator-on-in-suspend;
> > > +                               };
> > >                         };
> > >
> > >                         ldo11_reg: LDO11 {
> > > @@ -343,6 +367,9 @@
> > >                                 regulator-min-microvolt = <1800000>;
> > >                                 regulator-max-microvolt = <1800000>;
> > >                                 regulator-always-on;
> > > +                               regulator-state-mem {
> > > +                                       regulator-off-in-suspend;
> > > +                               };
> > >                         };
> > >
> > >                         ldo12_reg: LDO12 {
> > > @@ -351,6 +378,9 @@
> > >                                 regulator-max-microvolt = <3300000>;
> > >                                 regulator-always-on;
> > >                                 regulator-boot-on;
> > > +                               regulator-state-mem {
> > > +                                       regulator-off-in-suspend;
> > > +                               };
> > >                         };
> > >
> > >                         ldo13_reg: LDO13 {
> > > @@ -359,6 +389,9 @@
> > >                                 regulator-max-microvolt = <1800000>;
> > >                                 regulator-always-on;
> > >                                 regulator-boot-on;
> > > +                               regulator-state-mem {
> > > +                                       regulator-off-in-suspend;
> > > +                               };
> > >                         };
> > >
> > >                         ldo14_reg: LDO14 {
> > > @@ -367,6 +400,9 @@
> > >                                 regulator-max-microvolt = <1800000>;
> > >                                 regulator-always-on;
> > >                                 regulator-boot-on;
> > > +                               regulator-state-mem {
> > > +                                       regulator-off-in-suspend;
> > > +                               };
> > >                         };
> > >
> > >                         ldo15_reg: LDO15 {
> > > @@ -375,6 +411,9 @@
> > >                                 regulator-max-microvolt = <1000000>;
> > >                                 regulator-always-on;
> > >                                 regulator-boot-on;
> > > +                               regulator-state-mem {
> > > +                                       regulator-off-in-suspend;
> > > +                               };
> > >                         };
> > >
> > >                         ldo16_reg: LDO16 {
> > > @@ -383,6 +422,9 @@
> > >                                 regulator-max-microvolt = <1800000>;
> > >                                 regulator-always-on;
> > >                                 regulator-boot-on;
> > > +                               regulator-state-mem {
> > > +                                       regulator-off-in-suspend;
> > > +                               };
> > >                         };
> > >
> > >                         ldo20_reg: LDO20 {
> > > @@ -396,6 +438,9 @@
> > >                                 regulator-min-microvolt = <2800000>;
> > >                                 regulator-max-microvolt = <2800000>;
> > >                                 regulator-boot-on;
> > > +                               regulator-state-mem {
> > > +                                       regulator-on-in-suspend;
> > > +                               };
> >
> >
> > The same... any comments?
>
> I left this on for mshc_0 (emmc) regulator,
> since I could not get suspend resume working on eMMc

In general eMMC can be turned off during suspend. However eMMC layer
may be handling this (manually turning off/on). So after checking and
confirming it, please document it.

> >
> > >                         };
> > >
> > >                         ldo22_reg: LDO22 {
> > > @@ -405,6 +450,9 @@
> > >                                  */
> > >                                 regulator-name = "LDO22";
> > >                                 regulator-boot-on;
> > > +                               regulator-state-mem {
> > > +                                       regulator-on-in-suspend;
> > > +                               };
> > >                         };
> > >
> > >                         ldo25_reg: LDO25 {
> > > @@ -413,6 +461,9 @@
> > >                                 regulator-max-microvolt = <1800000>;
> > >                                 regulator-always-on;
> > >                                 regulator-boot-on;
> > > +                               regulator-state-mem {
> > > +                                       regulator-off-in-suspend;
> > > +                               };
> > >                         };
> > >
> > >                         buck1_reg: BUCK1 {
> > > @@ -421,6 +472,9 @@
> > >                                 regulator-max-microvolt = <1100000>;
> > >                                 regulator-always-on;
> > >                                 regulator-boot-on;
> > > +                               regulator-state-mem {
> > > +                                       regulator-off-in-suspend;
> >
> > Again, you did not address my comments.
> >
>
> Buck1 support entering into LPM setting,
> But I will set this to regulator-on-in-suspend; in next patch.

Why?

> > > +                               };
> > >                         };
> > >
> > >                         buck2_reg: BUCK2 {
> > > @@ -429,6 +483,9 @@
> > >                                 regulator-max-microvolt = <1350000>;
> > >                                 regulator-always-on;
> > >                                 regulator-boot-on;
> > > +                               regulator-state-mem {
> > > +                                       regulator-on-in-suspend;
> > > +                               };
> > >                         };
> > >
> > >                         buck3_reg: BUCK3 {
> > > @@ -437,6 +494,9 @@
> > >                                 regulator-max-microvolt = <1050000>;
> > >                                 regulator-always-on;
> > >                                 regulator-boot-on;
> > > +                               regulator-state-mem {
> > > +                                       regulator-off-in-suspend;
> > > +                               };
> >
> > The same...
>
> Buck3 support entering into LPM setting,
> But I will set this to regulator-on-in-suspend; in next patch.

Again - why this should be on or off?

> >
> > >                         };
> > >
> > >                         buck4_reg: BUCK4 {
> > > @@ -444,6 +504,9 @@
> > >                                 regulator-min-microvolt = <900000>;
> > >                                 regulator-max-microvolt = <1100000>;
> > >                                 regulator-microvolt-offset = <50000>;
> > > +                               regulator-state-mem {
> > > +                                       regulator-off-in-suspend;
> > > +                               };
> > >                         };
> > >
> > >                         buck5_reg: BUCK5 {
> > > diff --git a/arch/arm/boot/dts/exynos4412-odroidu3.dts b/arch/arm/boot/dts/exynos4412-odroidu3.dts
> > > index 2bdf899df436..4ebde09fc51d 100644
> > > --- a/arch/arm/boot/dts/exynos4412-odroidu3.dts
> > > +++ b/arch/arm/boot/dts/exynos4412-odroidu3.dts
> > > @@ -82,6 +82,9 @@
> > >         regulator-name = "LDO22_VDDQ_MMC4_2.8V";
> > >         regulator-min-microvolt = <2800000>;
> > >         regulator-max-microvolt = <2800000>;
> > > +       regulator-state-mem {
> > > +               regulator-on-in-suspend;
> >
> > Why?
> >
>
> I chose not to disable mshc_0 (emmc) regulator,
> since I could not get suspend resume working on eMMC.

Having "regulator-on-in-suspend" is not the same as not disabling
regulator during suspend. This property means you will explicitly
enable it during suspend. To me it looks wrong so I would be happy to
see explanations.

Best regards,
Krzysztof
