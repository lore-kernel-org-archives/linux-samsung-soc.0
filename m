From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2] ARM: dts: exynos-artik5: add support for wlan
Date: Thu, 1 Feb 2018 08:47:47 +0100
Message-ID: <CAJKOXPex=joAvYZem9ROft4aYi8z5Mb4oDce=US182waHtuXew@mail.gmail.com>
References: <20180131074027.387-1-mlyle@lyle.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:34278 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751203AbeBAHru (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 1 Feb 2018 02:47:50 -0500
In-Reply-To: <20180131074027.387-1-mlyle@lyle.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Michael Lyle <mlyle@lyle.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, kgene@kernel.org, CHANHO PARK <chanho61.park@samsung.com>

On Wed, Jan 31, 2018 at 8:40 AM, Michael Lyle <mlyle@lyle.org> wrote:
>
> On the Artik520 module, there's a bcm4354 attached to mshc_1.  Enable
> it, and turn on the regulator used for it, so that both wifi & bluetooth
> work.
>
> Verified to work on the Artik 520 evaluation board.
>
> Signed-off-by: Michael Lyle <mlyle@lyle.org>
> ---

Changelog would be nice to check what you changed in v2.

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

Still not alphabetically sorted - this should go after &rtc. Sorting
alphabetically helps to reduce conflicts (e.g. when adding nodes not
everyone will be editing end of file at the same of time) and makes it
slightly easier to look for nodes.

> +       wlanen: wlanen {
> +               samsung,pins = "gpx2-3";
> +               samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
> +               samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +               samsung,pin-drv = <EXYNOS4_PIN_DRV_LV3>;
> +               samsung,pin-val = <1>;
> +       };
> +};
> +
> +&mshc_1 {
> +       cap-sd-highspeed;
> +       cap-sdio-irq;
> +       disable-wp;
> +       broken-cd;

This really should not be broken-cd but non-removable. I understand
that the SDIO wifi/br is not a card really - you cannot take it out.

> +       bypass-smu;

I think there is no such property.

> +       keep-power-in-suspend;
> +       fifo-depth = <0x40>;
> +       vqmmc-supply = <&ldo11_reg>;
> +       /* Voltage negotiation is broken for the SDIO periph so we

Please use opening /* (like in kernel code).

> +        * can't actually set the voltage here.
> +        * vmmc-supply = <&ldo23_reg>;

What did you find about the regulators?

Best regards,
Krzysztof

> +        */
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
> +};
> +
>  &rtc {
>         clocks = <&cmu CLK_RTC>, <&s2mps14_osc S2MPS11_CLK_AP>;
>         clock-names = "rtc", "rtc_src";
> --
> 2.14.1
>
