From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/5 v3] iio: exynos_adc: reduce timeout and use wait_for_completion_timeout
Date: Wed, 30 Apr 2014 21:44:48 +0100
Message-ID: <536160C0.6040004@kernel.org>
References: <1398850015-17761-1-git-send-email-ch.naveen@samsung.com> <1398850015-17761-4-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1398850015-17761-4-git-send-email-ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, naveenkrishna.ch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, cpgs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, grundler-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On 30/04/14 10:26, Naveen Krishna Chatradhi wrote:
> ADC module on Exynos5 SoCs runs at 600KSPS. At this conversion rate,
> waiting for 1000 msecs is wasteful (incase of h/w failure).
>
> Hence, reduce the time out to 100msecs and use
> wait_for_completion_timeout() instead of
> wait_for_completion_interruptible_timeout()
>
> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Reviewed-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Applied to the togreg branch of iio.git

Thanks
> ---
> Changes since v2:
> None
> Changes since v1:
> None
> v0:
> This change is a part of the patch reviewd at https://lkml.org/lkml/2013/11/5/92
>
>   drivers/iio/adc/exynos_adc.c |   18 +++++++++++-------
>   1 file changed, 11 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/iio/adc/exynos_adc.c b/drivers/iio/adc/exynos_adc.c
> index ff98c5d..939aaf7 100644
> --- a/drivers/iio/adc/exynos_adc.c
> +++ b/drivers/iio/adc/exynos_adc.c
> @@ -82,7 +82,7 @@ enum adc_version {
>   #define ADC_CON_EN_START	(1u << 0)
>   #define ADC_DATX_MASK		0xFFF
>
> -#define EXYNOS_ADC_TIMEOUT	(msecs_to_jiffies(1000))
> +#define EXYNOS_ADC_TIMEOUT	(msecs_to_jiffies(100))
>
>   struct exynos_adc {
>   	void __iomem		*regs;
> @@ -121,6 +121,7 @@ static int exynos_read_raw(struct iio_dev *indio_dev,
>   	struct exynos_adc *info = iio_priv(indio_dev);
>   	unsigned long timeout;
>   	u32 con1, con2;
> +	int ret;
>
>   	if (mask != IIO_CHAN_INFO_RAW)
>   		return -EINVAL;
> @@ -145,16 +146,19 @@ static int exynos_read_raw(struct iio_dev *indio_dev,
>   				ADC_V1_CON(info->regs));
>   	}
>
> -	timeout = wait_for_completion_interruptible_timeout
> +	timeout = wait_for_completion_timeout
>   			(&info->completion, EXYNOS_ADC_TIMEOUT);
> -	*val = info->value;
> +	if (timeout == 0) {
> +		ret = -ETIMEDOUT;
> +	} else {
> +		*val = info->value;
> +		*val2 = 0;
> +		ret = IIO_VAL_INT;
> +	}
>
>   	mutex_unlock(&indio_dev->mlock);
>
> -	if (timeout == 0)
> -		return -ETIMEDOUT;
> -
> -	return IIO_VAL_INT;
> +	return ret;
>   }
>
>   static irqreturn_t exynos_adc_isr(int irq, void *dev_id)
>
