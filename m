From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH] ARM: dts: Use define for s3c-rtc clock id
Date: Tue, 31 Mar 2015 13:05:59 +0900
Message-ID: <551A1D27.6000301@samsung.com>
References: <1427728889-29158-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1427728889-29158-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Markus Reichl <m.reichl@fivetechno.de>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

On 03/31/2015 12:21 AM, Krzysztof Kozlowski wrote:
> Use a define instead of raw number as a ID for "rtc_src" clock.
> 
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> 
> ---
> 
> Patch depends on new file "dt-bindings/clock/samsung,s2mps11.h" from:
> http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg43136.html
> ---
>  arch/arm/boot/dts/exynos3250-rinato.dts | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/exynos3250-rinato.dts b/arch/arm/boot/dts/exynos3250-rinato.dts
> index 3905824cac58..d2cbc95364de 100644
> --- a/arch/arm/boot/dts/exynos3250-rinato.dts
> +++ b/arch/arm/boot/dts/exynos3250-rinato.dts
> @@ -16,6 +16,7 @@
>  #include "exynos3250.dtsi"
>  #include <dt-bindings/input/input.h>
>  #include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/clock/samsung,s2mps11.h>
>  
>  / {
>  	model = "Samsung Rinato board";
> @@ -605,7 +606,7 @@
>  };
>  
>  &rtc {
> -	clocks = <&cmu CLK_RTC>, <&s2mps14_osc 0>;
> +	clocks = <&cmu CLK_RTC>, <&s2mps14_osc S2MPS11_CLK_AP>;
>  	clock-names = "rtc", "rtc_src";
>  	status = "okay";
>  };
> 

Looks good to me.

Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

Thanks,
Chanwoo Choi
