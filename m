From: Naveen Krishna Ch <naveenkrishna.ch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCHv4 3/4] iio: devicetree: Add DT binding documentation for
 Exynos3250 ADC
Date: Wed, 18 Jun 2014 11:42:51 +0530
Message-ID: <CAHfPSqBepO+73vLyJJox1fP=0-F5KSE3uyjh-HXYXkHRLpw0QA@mail.gmail.com>
References: <1403058061-24271-1-git-send-email-cw00.choi@samsung.com> <1403058061-24271-4-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1403058061-24271-4-git-send-email-cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, My self <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello Chanwoo,

On 18 June 2014 07:51, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> This patch add DT binding documentation for Exynos3250 ADC IP. Exynos3250 has
> special clock ('sclk_tsadc') for ADC which provide clock to internal ADC.
>
> Signed-off-by: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Acked-by: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

Changes look good to me.
Reviewed-by: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

> ---
>  .../devicetree/bindings/arm/samsung/exynos-adc.txt   | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/samsung/exynos-adc.txt b/Documentation/devicetree/bindings/arm/samsung/exynos-adc.txt
> index 5d49f2b..3a5af82 100644
> --- a/Documentation/devicetree/bindings/arm/samsung/exynos-adc.txt
> +++ b/Documentation/devicetree/bindings/arm/samsung/exynos-adc.txt
> @@ -14,6 +14,8 @@ Required properties:
>                                 for exynos4412/5250 controllers.
>                         Must be "samsung,exynos-adc-v2" for
>                                 future controllers.
> +                       Must be "samsung,exynos3250-adc-v2" for
> +                               for exynos3250 controllers.
>  - reg:                 Contains ADC register address range (base address and
>                         length) and the address of the phy enable register.
>  - interrupts:          Contains the interrupt information for the timer. The
> @@ -21,7 +23,11 @@ Required properties:
>                         the Samsung device uses.
>  - #io-channel-cells = <1>; As ADC has multiple outputs
>  - clocks               From common clock binding: handle to adc clock.
> +                       From common clock binding: handle to sclk_tsadc clock
> +                       if using Exynos3250.
>  - clock-names          From common clock binding: Shall be "adc".
> +                       From common clock binding: Shall be "sclk_tsadc"
> +                       if using Exynos3250.
>  - vdd-supply           VDD input supply.
>
>  Note: child nodes can be added for auto probing from device tree.
> @@ -41,6 +47,20 @@ adc: adc@12D10000 {
>         vdd-supply = <&buck5_reg>;
>  };
>
> +Example: adding device info in dtsi file for Exynos3250 with additional sclk
> +
> +adc: adc@126C0000 {
> +       compatible = "samsung,exynos3250-adc-v2";
> +       reg = <0x126C0000 0x100>, <0x10020718 0x4>;
> +       interrupts = <0 137 0>;
> +       #io-channel-cells = <1>;
> +       io-channel-ranges;
> +
> +       clocks = <&cmu CLK_TSADC>, <&cmu CLK_SCLK_TSADC>;
> +       clock-names = "adc", "sclk_adc";
> +
> +       vdd-supply = <&buck5_reg>;
> +};
>
>  Example: Adding child nodes in dts file
>
> --
> 1.8.0
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-iio" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Shine bright,
(: Nav :)
