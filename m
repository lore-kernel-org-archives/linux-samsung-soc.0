From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 4/5 v3] iio: exynos_adc: do a soft reset in case of timeout
Date: Wed, 30 Apr 2014 21:47:36 +0100
Message-ID: <53616168.7010007@kernel.org>
References: <1398850015-17761-1-git-send-email-ch.naveen@samsung.com> <1398850015-17761-5-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1398850015-17761-5-git-send-email-ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, naveenkrishna.ch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, cpgs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, grundler-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On 30/04/14 10:26, Naveen Krishna Chatradhi wrote:
> Do a soft reset software if a timeout happens.
> This is applicable only for ADC_V2.
>
> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Reviewed-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Applied to the togreg branch of iio.git

Thanks,
> ---
> Changes since v2:
> None
> Changes since v1:
> None
> v0:
> This change is a part of the patch reviewed at https://lkml.org/lkml/2013/11/5/92
>
>   drivers/iio/adc/exynos_adc.c |   50 ++++++++++++++++++++++--------------------
>   1 file changed, 26 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/iio/adc/exynos_adc.c b/drivers/iio/adc/exynos_adc.c
> index 939aaf7..eddc58e 100644
> --- a/drivers/iio/adc/exynos_adc.c
> +++ b/drivers/iio/adc/exynos_adc.c
> @@ -112,6 +112,30 @@ static inline unsigned int exynos_adc_get_version(struct platform_device *pdev)
>   	return (unsigned int)match->data;
>   }
>
> +static void exynos_adc_hw_init(struct exynos_adc *info)
> +{
> +	u32 con1, con2;
> +
> +	if (info->version == ADC_V2) {
> +		con1 = ADC_V2_CON1_SOFT_RESET;
> +		writel(con1, ADC_V2_CON1(info->regs));
> +
> +		con2 = ADC_V2_CON2_OSEL | ADC_V2_CON2_ESEL |
> +			ADC_V2_CON2_HIGHF | ADC_V2_CON2_C_TIME(0);
> +		writel(con2, ADC_V2_CON2(info->regs));
> +
> +		/* Enable interrupts */
> +		writel(1, ADC_V2_INT_EN(info->regs));
> +	} else {
> +		/* set default prescaler values and Enable prescaler */
> +		con1 =  ADC_V1_CON_PRSCLV(49) | ADC_V1_CON_PRSCEN;
> +
> +		/* Enable 12-bit ADC resolution */
> +		con1 |= ADC_V1_CON_RES;
> +		writel(con1, ADC_V1_CON(info->regs));
> +	}
> +}
> +
>   static int exynos_read_raw(struct iio_dev *indio_dev,
>   				struct iio_chan_spec const *chan,
>   				int *val,
> @@ -149,6 +173,8 @@ static int exynos_read_raw(struct iio_dev *indio_dev,
>   	timeout = wait_for_completion_timeout
>   			(&info->completion, EXYNOS_ADC_TIMEOUT);
>   	if (timeout == 0) {
> +		dev_warn(&indio_dev->dev, "Conversion timed out! Resetting\n");
> +		exynos_adc_hw_init(info);
>   		ret = -ETIMEDOUT;
>   	} else {
>   		*val = info->value;
> @@ -230,30 +256,6 @@ static int exynos_adc_remove_devices(struct device *dev, void *c)
>   	return 0;
>   }
>
> -static void exynos_adc_hw_init(struct exynos_adc *info)
> -{
> -	u32 con1, con2;
> -
> -	if (info->version == ADC_V2) {
> -		con1 = ADC_V2_CON1_SOFT_RESET;
> -		writel(con1, ADC_V2_CON1(info->regs));
> -
> -		con2 = ADC_V2_CON2_OSEL | ADC_V2_CON2_ESEL |
> -			ADC_V2_CON2_HIGHF | ADC_V2_CON2_C_TIME(0);
> -		writel(con2, ADC_V2_CON2(info->regs));
> -
> -		/* Enable interrupts */
> -		writel(1, ADC_V2_INT_EN(info->regs));
> -	} else {
> -		/* set default prescaler values and Enable prescaler */
> -		con1 =  ADC_V1_CON_PRSCLV(49) | ADC_V1_CON_PRSCEN;
> -
> -		/* Enable 12-bit ADC resolution */
> -		con1 |= ADC_V1_CON_RES;
> -		writel(con1, ADC_V1_CON(info->regs));
> -	}
> -}
> -
>   static int exynos_adc_probe(struct platform_device *pdev)
>   {
>   	struct exynos_adc *info = NULL;
>
