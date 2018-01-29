From: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: exynos-artik5: add support for wlan
Date: Mon, 29 Jan 2018 16:16:38 +0100
Message-ID: <CAJKOXPfRWUN3t43SqwxFtda8T=3Hn4oUh0HBit3b97eFj+6T4g@mail.gmail.com>
References: <20180129031640.17939-1-mlyle@lyle.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180129031640.17939-1-mlyle-dTEscH1tG2Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Lyle <mlyle-dTEscH1tG2Q@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, CHANHO PARK <chanho61.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Jan 29, 2018 at 4:16 AM, Michael Lyle <mlyle-dTEscH1tG2Q@public.gmane.org> wrote:
> On the Artik520 module, there's a bcm4354 attached to mshc_1.  Enable
> it, and turn on the regulator used for it, so that both wifi & bluetooth
> work.
>
> Verified to work on the Artik 520 evaluation board.
>
> Signed-off-by: Michael Lyle <mlyle-dTEscH1tG2Q@public.gmane.org>

Hi,

Thanks for the patch. Few notes below.

> ---
>  arch/arm/boot/dts/exynos3250-artik5.dtsi | 36 ++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos3250-artik5.dtsi b/arch/arm/boot/dts/exynos3250-artik5.dtsi
> index 0aa577fe9f95..b2d441b1a7e3 100644
> --- a/arch/arm/boot/dts/exynos3250-artik5.dtsi
> +++ b/arch/arm/boot/dts/exynos3250-artik5.dtsi
> @@ -245,6 +245,7 @@
>                                 regulator-name = "VLDO23_1.8V";
>                                 regulator-min-microvolt = <1800000>;
>                                 regulator-max-microvolt = <1800000>;
> +                               regulator-always-on;
>                         };
>
>                         ldo24_reg: LDO24 {
> @@ -316,6 +317,41 @@
>         status = "okay";
>  };
>
> +&pinctrl_1 {

Please order the nodes alphabetically.

> +       wlanen: wlanen {
> +               samsung,pins = "gpx2-3";
> +               samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
> +               samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +               samsung,pin-drv = <EXYNOS4_PIN_DRV_LV3>;
> +               samsung,pin-val = <1>;
> +       };

Are you sure you do not need a power sequence? It works fine during
warm resets or after u-boot initialization?

> +};
> +
> +&mshc_1 {
> +       cap-sd-highspeed;
> +       cap-sdio-irq;
> +       disable-wp;
> +       broken-cd;

Is this really broken-cd or non-removable card?

> +       bypass-smu;
> +       keep-power-in-suspend;
> +       fifo-depth = <0x40>;
> +       vqmmc-supply = <&ldo11_reg>;
> +       /* Voltage negotiation is broken for the SDIO periph so we
> +        * can't actually set the voltage here.
> +        * vmmc-supply = <&ldo23_reg>;
> +        */

Did you try using properties for respective voltage? For example mmc-hs200-1_8v?

> +       card-detect-delay = <500>;
> +       clock-frequency = <100000000>;
> +       max-frequency = <100000000>;
> +       samsung,dw-mshc-ciu-div = <3>;
> +       samsung,dw-mshc-sdr-timing = <0 1>;
> +       samsung,dw-mshc-ddr-timing = <1 2>;
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&sd1_cmd &sd1_clk &sd1_bus1 &sd1_bus4 &wlanen>;
> +       bus-width = <4>;
> +       status = "okay";

There is no brcm/wifi node here?

Best regards,
Krzysztof

> +};
> +
>  &rtc {
>         clocks = <&cmu CLK_RTC>, <&s2mps14_osc S2MPS11_CLK_AP>;
>         clock-names = "rtc", "rtc_src";
> --
> 2.14.1
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
