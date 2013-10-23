From: Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
Subject: Re: [PATCH] hwmon: ntc_thermistor: Fix typo (pullup-uV -> pullup-uv)
Date: Wed, 23 Oct 2013 08:21:23 +0530
Message-ID: <CAHfPSqAEY+e9wF403xrJSR5Y7=PgJ1McnKMxd6HECXFPV7ZoeA@mail.gmail.com>
References: <1382492690-4056-1-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1382492690-4056-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-doc-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, rob.herring@calxeda.com, pawel.moll@arm.com, mark.rutland@arm.com, swarren@wwwdotorg.org, ijc+devicetree@hellion.org.uk, rob@landley.net, Kukjin Kim <kgene.kim@samsung.com>, jic23@kernel.org, My self <ch.naveen@samsung.com>, dianders@chromium.org, lars@metafoo.de, sachin.kamat@linaro.org, kyungmin.park@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On 23 October 2013 07:14, Chanwoo Choi <cw00.choi@samsung.com> wrote:
> This patch fix typo of property name from 'pullup-uV' to 'pullup-uv'.
> The ntc_thermistor.c use 'pullup-uv' when parsing dt data.
>
> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>

Thanks for the correction.

Acked-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
> ---
>  Documentation/devicetree/bindings/arm/samsung/exynos-adc.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/arm/samsung/exynos-adc.txt b/Documentation/devicetree/bindings/arm/samsung/exynos-adc.txt
> index 47ada1d..5d49f2b 100644
> --- a/Documentation/devicetree/bindings/arm/samsung/exynos-adc.txt
> +++ b/Documentation/devicetree/bindings/arm/samsung/exynos-adc.txt
> @@ -49,7 +49,7 @@ adc@12D10000 {
>         /* NTC thermistor is a hwmon device */
>         ncp15wb473@0 {
>                 compatible = "ntc,ncp15wb473";
> -               pullup-uV = <1800000>;
> +               pullup-uv = <1800000>;
>                 pullup-ohm = <47000>;
>                 pulldown-ohm = <0>;
>                 io-channels = <&adc 4>;
> --
> 1.8.0
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Shine bright,
(: Nav :)
