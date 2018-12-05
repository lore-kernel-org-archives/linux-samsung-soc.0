From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] ARM: dts: exynos: Add proper regulator states for
 suspend-to-mem for odroid-u3
Date: Wed, 5 Dec 2018 15:06:42 +0100
Message-ID: <CAJKOXPcT-x0JWVw2CaxHzSthxbp3sDRcsa4Nc5gHYqUy98b_yw@mail.gmail.com>
References: <20181204194025.2719-1-linux.amoon@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181204194025.2719-1-linux.amoon@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux.amoon@gmail.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-kernel@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, kgene@kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, 4 Dec 2018 at 20:40, Anand Moon <linux.amoon@gmail.com> wrote:
>
> Add suspend-to-mem node to regulator core to be enabled or disabled
> during system suspend and also support changing the regulator operating
> mode during runtime and when the system enter sleep mode.
>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
> Tested on Odroid U3+
> ---
>  .../boot/dts/exynos4412-odroid-common.dtsi    | 72 +++++++++++++++++++
>  1 file changed, 72 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
> index 2caa3132f34e..837713a2ec3b 100644
> --- a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
> +++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
> @@ -285,6 +285,9 @@
>                                 regulator-min-microvolt = <1800000>;
>                                 regulator-max-microvolt = <1800000>;
>                                 regulator-always-on;
> +                               regulator-state-mem {
> +                                       regulator-on-in-suspend;
> +                               };

Driver does not support suspend_enable so this will be noop. We could
add this for DT-correctness (and full description of HW) but then I
need explanation why this regulator has to stay on during suspend.

>                         };
>
>                         ldo3_reg: LDO3 {
> @@ -292,6 +295,9 @@
>                                 regulator-min-microvolt = <1800000>;
>                                 regulator-max-microvolt = <1800000>;
>                                 regulator-always-on;
> +                               regulator-state-mem {
> +                                       regulator-off-in-suspend;
> +                               };

The same but with suspend_disable.

I am not saying that these are wrong but I would be happy to see
explanations why you chosen these particular properties.

>                         };
>
>                         ldo4_reg: LDO4 {
> @@ -299,6 +305,9 @@
>                                 regulator-min-microvolt = <2800000>;
>                                 regulator-max-microvolt = <2800000>;
>                                 regulator-boot-on;
> +                               regulator-state-mem {
> +                                       regulator-on-in-suspend;
> +                               };
>                         };
>
>                         ldo5_reg: LDO5 {
> @@ -307,6 +316,9 @@
>                                 regulator-max-microvolt = <1800000>;
>                                 regulator-always-on;
>                                 regulator-boot-on;
> +                               regulator-state-mem {
> +                                       regulator-on-in-suspend;
> +                               };
>                         };
>
>                         ldo6_reg: LDO6 {
> @@ -314,6 +326,9 @@
>                                 regulator-min-microvolt = <1000000>;
>                                 regulator-max-microvolt = <1000000>;
>                                 regulator-always-on;
> +                               regulator-state-mem {
> +                                       regulator-on-in-suspend;
> +                               };
>                         };
>
>                         ldo7_reg: LDO7 {
> @@ -321,18 +336,27 @@
>                                 regulator-min-microvolt = <1000000>;
>                                 regulator-max-microvolt = <1000000>;
>                                 regulator-always-on;
> +                               regulator-state-mem {
> +                                       regulator-on-in-suspend;
> +                               };
>                         };
>
>                         ldo8_reg: LDO8 {
>                                 regulator-name = "VDD10_HDMI_1.0V";
>                                 regulator-min-microvolt = <1000000>;
>                                 regulator-max-microvolt = <1000000>;
> +                               regulator-state-mem {
> +                                       regulator-off-in-suspend;
> +                               };
>                         };
>
>                         ldo10_reg: LDO10 {
>                                 regulator-name = "VDDQ_MIPIHSI_1.8V";
>                                 regulator-min-microvolt = <1800000>;
>                                 regulator-max-microvolt = <1800000>;
> +                               regulator-state-mem {
> +                                       regulator-off-in-suspend;
> +                               };
>                         };
>
>                         ldo11_reg: LDO11 {
> @@ -340,6 +364,9 @@
>                                 regulator-min-microvolt = <1800000>;
>                                 regulator-max-microvolt = <1800000>;
>                                 regulator-always-on;
> +                               regulator-state-mem {
> +                                       regulator-off-in-suspend;
> +                               };
>                         };
>
>                         ldo12_reg: LDO12 {
> @@ -348,6 +375,9 @@
>                                 regulator-max-microvolt = <3300000>;
>                                 regulator-always-on;
>                                 regulator-boot-on;
> +                               regulator-state-mem {
> +                                       regulator-off-in-suspend;
> +                               };
>                         };
>
>                         ldo13_reg: LDO13 {
> @@ -356,6 +386,9 @@
>                                 regulator-max-microvolt = <1800000>;
>                                 regulator-always-on;
>                                 regulator-boot-on;
> +                               regulator-state-mem {
> +                                       regulator-off-in-suspend;
> +                               };
>                         };
>
>                         ldo14_reg: LDO14 {
> @@ -364,6 +397,9 @@
>                                 regulator-max-microvolt = <1800000>;
>                                 regulator-always-on;
>                                 regulator-boot-on;
> +                               regulator-state-mem {
> +                                       regulator-off-in-suspend;
> +                               };
>                         };
>
>                         ldo15_reg: LDO15 {
> @@ -372,6 +408,9 @@
>                                 regulator-max-microvolt = <1000000>;
>                                 regulator-always-on;
>                                 regulator-boot-on;
> +                               regulator-state-mem {
> +                                       regulator-off-in-suspend;
> +                               };
>                         };
>
>                         ldo16_reg: LDO16 {
> @@ -380,6 +419,9 @@
>                                 regulator-max-microvolt = <1800000>;
>                                 regulator-always-on;
>                                 regulator-boot-on;
> +                               regulator-state-mem {
> +                                       regulator-on-in-suspend;
> +                               };
>                         };
>
>                         ldo20_reg: LDO20 {
> @@ -387,6 +429,9 @@
>                                 regulator-min-microvolt = <1800000>;
>                                 regulator-max-microvolt = <1800000>;
>                                 regulator-boot-on;
> +                               regulator-state-mem {
> +                                       regulator-off-in-suspend;
> +                               };
>                         };
>
>                         ldo21_reg: LDO21 {
> @@ -394,6 +439,9 @@
>                                 regulator-min-microvolt = <2800000>;
>                                 regulator-max-microvolt = <2800000>;
>                                 regulator-boot-on;
> +                               regulator-state-mem {
> +                                       regulator-on-in-suspend;

That's unusual setting... enabled in suspend but not necessarily
during work (no always-on).

> +                               };
>                         };
>
>                         ldo22_reg: LDO22 {
> @@ -411,6 +459,9 @@
>                                 regulator-max-microvolt = <1800000>;
>                                 regulator-always-on;
>                                 regulator-boot-on;
> +                               regulator-state-mem {
> +                                       regulator-off-in-suspend;
> +                               };
>                         };
>
>                         buck1_reg: BUCK1 {
> @@ -419,6 +470,9 @@
>                                 regulator-max-microvolt = <1100000>;
>                                 regulator-always-on;
>                                 regulator-boot-on;
> +                               regulator-state-mem {
> +                                       regulator-off-in-suspend;
> +                               };

This is seriously wrong so I have doubts whether you tested the
changes or you know what is happening with them. If you turn off
memory bus regulator off, how the memory will work in
Suspend-to-Memory mode?

>                         };
>
>                         buck2_reg: BUCK2 {
> @@ -427,6 +481,9 @@
>                                 regulator-max-microvolt = <1350000>;
>                                 regulator-always-on;
>                                 regulator-boot-on;
> +                               regulator-state-mem {
> +                                       regulator-on-in-suspend;
> +                               };
>                         };
>
>                         buck3_reg: BUCK3 {
> @@ -435,6 +492,9 @@
>                                 regulator-max-microvolt = <1050000>;
>                                 regulator-always-on;
>                                 regulator-boot-on;
> +                               regulator-state-mem {
> +                                       regulator-off-in-suspend;

Looks suspicious as well.

Best regards,
Krzysztof

> +                               };
>                         };
>
>                         buck4_reg: BUCK4 {
> @@ -442,6 +502,9 @@
>                                 regulator-min-microvolt = <900000>;
>                                 regulator-max-microvolt = <1100000>;
>                                 regulator-microvolt-offset = <50000>;
> +                               regulator-state-mem {
> +                                       regulator-off-in-suspend;
> +                               };
>                         };
>
>                         buck5_reg: BUCK5 {
> @@ -450,6 +513,9 @@
>                                 regulator-max-microvolt = <1200000>;
>                                 regulator-always-on;
>                                 regulator-boot-on;
> +                               regulator-state-mem {
> +                                       regulator-off-in-suspend;
> +                               };
>                         };
>
>                         buck6_reg: BUCK6 {
> @@ -458,6 +524,9 @@
>                                 regulator-max-microvolt = <1350000>;
>                                 regulator-always-on;
>                                 regulator-boot-on;
> +                               regulator-state-mem {
> +                                       regulator-off-in-suspend;
> +                               };
>                         };
>
>                         buck7_reg: BUCK7 {
> @@ -465,6 +534,9 @@
>                                 regulator-min-microvolt = <2000000>;
>                                 regulator-max-microvolt = <2000000>;
>                                 regulator-always-on;
> +                               regulator-state-mem {
> +                                       regulator-off-in-suspend;
> +                               };
>                         };
>
>                         buck8_reg: BUCK8 {
> --
> 2.19.2
>
