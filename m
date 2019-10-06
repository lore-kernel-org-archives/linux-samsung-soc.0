From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH 4/4] dt-bindings: iio: adc: exynos: Use defines instead
 of clock numbers
Date: Sun, 6 Oct 2019 11:02:12 +0100
Message-ID: <20191006110212.4e6fe30e@archlinux>
References: <20191002160744.11307-1-krzk@kernel.org>
        <20191002160744.11307-4-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191002160744.11307-4-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Sebastian Reichel <sre@kernel.org>, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Wed,  2 Oct 2019 18:07:44 +0200
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> Make the examples in Exynos ADC bindings more readable and bring them
> closer to real DTS by using defines for clocks.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  .../devicetree/bindings/iio/adc/samsung,exynos-adc.yaml     | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml b/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
> index a0a9b909ac40..a3010e7ea051 100644
> --- a/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
> @@ -135,6 +135,8 @@ examples:
>      };
>  
>    - |
> +    #include <dt-bindings/clock/exynos3250.h>
> +
>      adc@126c0000 {
>          compatible = "samsung,exynos3250-adc";
>          reg = <0x126C0000 0x100>;
> @@ -142,8 +144,8 @@ examples:
>          #io-channel-cells = <1>;
>          io-channel-ranges;
>  
> -        clocks = <&cmu 0>, // CLK_TSADC
> -                 <&cmu 1>; // CLK_SCLK_TSADC
> +        clocks = <&cmu CLK_TSADC>,
> +                 <&cmu CLK_SCLK_TSADC>;
>          clock-names = "adc", "sclk";
>  
>          vdd-supply = <&buck5_reg>;
