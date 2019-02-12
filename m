From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH 1/2] iio: adc: exynos-adc: Use proper number of channels
 for Exynos4x12
Date: Tue, 12 Feb 2019 20:57:01 +0000
Message-ID: <20190212205701.4cf66d68@archlinux>
References: <20190212174550.4383-1-krzk@kernel.org>
        <20190212174550.4383-2-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190212174550.4383-2-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, 12 Feb 2019 18:45:49 +0100
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> Exynos4212 and Exynos4412 have only four ADC channels so using
> "samsung,exynos-adc-v1" compatible (for eight channels ADCv1) on them is
> wrong.  Add a new compatible for Exynos4x12.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
I'll sneak this in as my last patch for this cycle (lucky timing ;).
It could have done with a fixes tag. I'll mark it for stable as sounds
and looks safe and simple.

Looks like it goes all the way back so I'll leave it without one.

Applied to the togreg branch of iio.git. This will be queued for the
next merge window given how late we are in the cycle.

Thanks,

Jonathan


> ---
>  .../bindings/iio/adc/samsung,exynos-adc.txt     |  4 +++-
>  drivers/iio/adc/exynos_adc.c                    | 17 +++++++++++++++++
>  2 files changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.txt b/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.txt
> index a10c1f89037d..e1fe02f3e3e9 100644
> --- a/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.txt
> +++ b/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.txt
> @@ -11,11 +11,13 @@ New driver handles the following
>  
>  Required properties:
>  - compatible:		Must be "samsung,exynos-adc-v1"
> -				for exynos4412/5250 controllers.
> +				for Exynos5250 controllers.
>  			Must be "samsung,exynos-adc-v2" for
>  				future controllers.
>  			Must be "samsung,exynos3250-adc" for
>  				controllers compatible with ADC of Exynos3250.
> +			Must be "samsung,exynos4212-adc" for
> +				controllers compatible with ADC of Exynos4212 and Exynos4412.
>  			Must be "samsung,exynos7-adc" for
>  				the ADC in Exynos7 and compatibles
>  			Must be "samsung,s3c2410-adc" for
> diff --git a/drivers/iio/adc/exynos_adc.c b/drivers/iio/adc/exynos_adc.c
> index fa2d2b5767f3..01f7c2570a1e 100644
> --- a/drivers/iio/adc/exynos_adc.c
> +++ b/drivers/iio/adc/exynos_adc.c
> @@ -115,6 +115,7 @@
>  #define MAX_ADC_V2_CHANNELS		10
>  #define MAX_ADC_V1_CHANNELS		8
>  #define MAX_EXYNOS3250_ADC_CHANNELS	2
> +#define MAX_EXYNOS4212_ADC_CHANNELS	4
>  #define MAX_S5PV210_ADC_CHANNELS	10
>  
>  /* Bit definitions common for ADC_V1 and ADC_V2 */
> @@ -271,6 +272,19 @@ static void exynos_adc_v1_start_conv(struct exynos_adc *info,
>  	writel(con1 | ADC_CON_EN_START, ADC_V1_CON(info->regs));
>  }
>  
> +/* Exynos4212 and 4412 is like ADCv1 but with four channels only */
> +static const struct exynos_adc_data exynos4212_adc_data = {
> +	.num_channels	= MAX_EXYNOS4212_ADC_CHANNELS,
> +	.mask		= ADC_DATX_MASK,	/* 12 bit ADC resolution */
> +	.needs_adc_phy	= true,
> +	.phy_offset	= EXYNOS_ADCV1_PHY_OFFSET,
> +
> +	.init_hw	= exynos_adc_v1_init_hw,
> +	.exit_hw	= exynos_adc_v1_exit_hw,
> +	.clear_irq	= exynos_adc_v1_clear_irq,
> +	.start_conv	= exynos_adc_v1_start_conv,
> +};
> +
>  static const struct exynos_adc_data exynos_adc_v1_data = {
>  	.num_channels	= MAX_ADC_V1_CHANNELS,
>  	.mask		= ADC_DATX_MASK,	/* 12 bit ADC resolution */
> @@ -492,6 +506,9 @@ static const struct of_device_id exynos_adc_match[] = {
>  	}, {
>  		.compatible = "samsung,s5pv210-adc",
>  		.data = &exynos_adc_s5pv210_data,
> +	}, {
> +		.compatible = "samsung,exynos4212-adc",
> +		.data = &exynos4212_adc_data,
>  	}, {
>  		.compatible = "samsung,exynos-adc-v1",
>  		.data = &exynos_adc_v1_data,
