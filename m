From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH] hwmon: ntc_thermistor: Fix typo (pullup-uV -> pullup-uv)
Date: Wed, 23 Oct 2013 11:05:27 +0900
Message-ID: <002301cecf94$57cdaf10$07690d30$%han@samsung.com>
References: <1382492690-4056-1-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-reply-to: <1382492690-4056-1-git-send-email-cw00.choi@samsung.com>
Content-language: ko
Sender: linux-doc-owner@vger.kernel.org
To: 'Chanwoo Choi' <cw00.choi@samsung.com>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: 'Rob Herring' <rob.herring@calxeda.com>, 'Pawel Moll' <pawel.moll@arm.com>, 'Mark Rutland' <mark.rutland@arm.com>, swarren@wwwdotorg.org, ijc+devicetree@hellion.org.uk, 'Rob Landley' <rob@landley.net>, 'Kukjin Kim' <kgene.kim@samsung.com>, jic23@kernel.org, 'Kyungmin Park' <ch.naveen@samsung.com>, 'Douglas Anderson' <dianders@chromium.org>, lars@metafoo.de, sachin.kamat@linaro.org, kyungmin.park@samsung.com, 'Jingoo Han' <jg1.han@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Wednesday, October 23, 2013 10:45 AM, Chanwoo Choi wrote:
> 
> This patch fix typo of property name from 'pullup-uV' to 'pullup-uv'.
> The ntc_thermistor.c use 'pullup-uv' when parsing dt data.
> 
> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>

Reviewed-by: Jingoo Han <jg1.han@samsung.com>

Best regards,
Jingoo Han

> ---
>  Documentation/devicetree/bindings/arm/samsung/exynos-adc.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/samsung/exynos-adc.txt
> b/Documentation/devicetree/bindings/arm/samsung/exynos-adc.txt
> index 47ada1d..5d49f2b 100644
> --- a/Documentation/devicetree/bindings/arm/samsung/exynos-adc.txt
> +++ b/Documentation/devicetree/bindings/arm/samsung/exynos-adc.txt
> @@ -49,7 +49,7 @@ adc@12D10000 {
>  	/* NTC thermistor is a hwmon device */
>  	ncp15wb473@0 {
>  		compatible = "ntc,ncp15wb473";
> -		pullup-uV = <1800000>;
> +		pullup-uv = <1800000>;
>  		pullup-ohm = <47000>;
>  		pulldown-ohm = <0>;
>  		io-channels = <&adc 4>;
> --
> 1.8.0
> 
> --

