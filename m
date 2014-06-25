From: Javier Martinez Canillas <javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 4/4 v2] ARM: DTS: Add NTC thermistor nodes to Exynos5420
 based Peach_PIT
Date: Wed, 25 Jun 2014 12:38:09 +0200
Message-ID: <CABxcv=nfKPiV92FOHqfzrM5hCv9ZUiDMiN3oGVyTPF+d6TimxA@mail.gmail.com>
References: <1403677773-21141-1-git-send-email-ch.naveen@samsung.com>
	<1403677773-21141-5-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1403677773-21141-5-git-send-email-ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-iio <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Naveen Krishna <naveenkrishna.ch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "cpgs ." <cpgs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hello Naveen,

On Wed, Jun 25, 2014 at 8:29 AM, Naveen Krishna Chatradhi
<ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> Exynos5420 based Peach PIT board has 4 NTC thermistors to measure
> temperatures at various points on the board.
>
> IIO based ADC becomes the parent and NTC thermistors are the childs,
> via the HWMON interface.
>
> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Cc: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
> Changes since v1:
> 1. Arranged the ADC node alphabetical
> 2. Added "status = "okay"" to the ADC node
>
> This patch needs
> 1. MAX77802 PMIC device tree nodes (for ldo9)
>    https://www.mail-archive.com/devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg31430.html
> 2. Uses the DT documentation for NTC thermistors updated with vendor-prefix
>
> This patch set is tested
> 1. On Peach PIT board via sysfs entry exposed by hwmon
> localhost ~ # cat /sys/class/hwmon/hwmon*/device/temp1_input
> 37436
> 36449
> 38560
> 38059
>
> 2. Backward compatibility is tested by replacing "murata" with "ntc"
>    in the dts nodes and running the above test.
>
>  arch/arm/boot/dts/exynos5420-peach-pit.dts |   34 ++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos5420-peach-pit.dts b/arch/arm/boot/dts/exynos5420-peach-pit.dts
> index b96a66a..19d733d 100644
> --- a/arch/arm/boot/dts/exynos5420-peach-pit.dts
> +++ b/arch/arm/boot/dts/exynos5420-peach-pit.dts
> @@ -101,6 +101,40 @@
>         };
>  };
>
> +&adc {
> +       status = "okay";
> +       vdd-supply = <&ldo9_reg>;
> +
> +       ncp15wb473@3 {
> +               compatible = "murata,ncp15wb473";
> +               pullup-uv = <1800000>;
> +               pullup-ohm = <47000>;
> +               pulldown-ohm = <0>;
> +               io-channels = <&adc 3>;
> +       };
> +       ncp15wb473@4 {
> +               compatible = "murata,ncp15wb473";
> +               pullup-uv = <1800000>;
> +               pullup-ohm = <47000>;
> +               pulldown-ohm = <0>;
> +               io-channels = <&adc 4>;
> +       };
> +       ncp15wb473@5 {
> +               compatible = "murata,ncp15wb473";
> +               pullup-uv = <1800000>;
> +               pullup-ohm = <47000>;
> +               pulldown-ohm = <0>;
> +               io-channels = <&adc 5>;
> +       };
> +       ncp15wb473@6 {
> +               compatible = "murata,ncp15wb473";
> +               pullup-uv = <1800000>;
> +               pullup-ohm = <47000>;
> +               pulldown-ohm = <0>;
> +               io-channels = <&adc 6>;
> +       };
> +};
> +
>  &dp {
>         status = "okay";
>         pinctrl-names = "default";
> --
> 1.7.9.5
>

Tested-by: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
