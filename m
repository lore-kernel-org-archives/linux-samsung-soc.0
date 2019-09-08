From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v2 11/11] dt-bindings: iio: adc: exynos: Remove old
 requirement of two register address ranges
Date: Sun, 8 Sep 2019 13:31:22 +0100
Message-ID: <20190908133122.7080a124@archlinux>
References: <20190907092007.9946-1-krzk@kernel.org>
        <20190907092007.9946-11-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190907092007.9946-11-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Sebastian Reichel <sre@kernel.org>, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, =?UTF-8?B?UGF3ZcWC?= Chmiel <pawel.mikolaj.chmiel@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Sat,  7 Sep 2019 11:20:07 +0200
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> Commit fafb37cfae6d ("iio: exyno-adc: use syscon for PMU
> register access") changed the Exynos ADC driver so the PMU syscon
> phandle is required instead of second register address space.  The
> bindings were not updated so fix them now.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Seems sensible. Thanks for cleaning this up.

As before I'll wait on review from Rob or similar. If they
are going via another path (fine by me as well).

Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com> for
both IIO related binding patches.

Thanks,

Jonathan

> 
> ---
> 
> Changes since v1:
> 1. New patch.
> ---
>  .../bindings/iio/adc/samsung,exynos-adc.yaml     | 16 ++--------------
>  1 file changed, 2 insertions(+), 14 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml b/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
> index dd58121f25b1..b4c6c26681d9 100644
> --- a/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
> @@ -25,8 +25,7 @@ properties:
>        - samsung,s5pv210-adc
>  
>    reg:
> -    minItems: 1
> -    maxItems: 2
> +    maxItems: 1
>  
>    clocks:
>      description:
> @@ -55,7 +54,7 @@ properties:
>      $ref: '/schemas/types.yaml#/definitions/phandle'
>      description:
>        Phandle to the PMU system controller node (to access the ADC_PHY
> -      register on Exynos5250/5420/5800/3250).
> +      register on Exynos3250/4x12/5250/5420/5800).
>  
>    has-touchscreen:
>      description:
> @@ -83,19 +82,8 @@ allOf:
>                - samsung,exynos4212-adc
>                - samsung,s5pv210-adc
>      then:
> -      properties:
> -        reg:
> -          items:
> -            # For S5P and Exynos
> -            - description: base registers
> -            - description: phy registers
>        required:
>          - samsung,syscon-phandle
> -    else:
> -      properties:
> -        reg:
> -          items:
> -            - description: base registers
>  
>    - if:
>        properties:
