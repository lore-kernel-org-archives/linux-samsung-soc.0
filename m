From: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Subject: Re: [RFC: PATCH 2/2] iio: adc: exynos_adc: Handle timeout and race
 conditions
Date: Fri, 15 Mar 2013 22:53:10 +0100
Message-ID: <51439846.9090201@metafoo.de>
References: <1363364801-23684-1-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1363364801-23684-1-git-send-email-ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, naveenkrishna.ch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On 03/15/2013 05:26 PM, Naveen Krishna Chatradhi wrote:
> This patch does the following
> 1. Handle the return values of wait_for_completion_interruptible_timeout
> 2. Add spin locks to avoid race conditions during ISR.
> 
> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Cc: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Cc: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
> ---
> Discussion thread for this patch can be found at
> http://www.gossamer-threads.com/lists/linux/kernel/1693284?page=last
> 
> I've not seen any reference to spin lock usage in IIO.
> Kindly, suggest me if there is a better way to avoid the race.
> 
> Thanks,
> Naveen
>  drivers/iio/adc/exynos_adc.c |   14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iio/adc/exynos_adc.c b/drivers/iio/adc/exynos_adc.c
> index ed6fdd7..4de28ae 100644
> --- a/drivers/iio/adc/exynos_adc.c
> +++ b/drivers/iio/adc/exynos_adc.c
> @@ -91,6 +91,7 @@ struct exynos_adc {
>  
>  	struct completion	completion;
>  
> +	spinlock_t		reg_lock;
>  	u32			value;
>  	unsigned int            version;
>  };
> @@ -117,7 +118,7 @@ static int exynos_read_raw(struct iio_dev *indio_dev,
>  				long mask)
>  {
>  	struct exynos_adc *info = iio_priv(indio_dev);
> -	unsigned long timeout;
> +	long timeout;
>  	u32 con1, con2;
>  
>  	if (mask != IIO_CHAN_INFO_RAW)
> @@ -143,15 +144,19 @@ static int exynos_read_raw(struct iio_dev *indio_dev,
>  				ADC_V1_CON(info->regs));
>  	}
>  
> +	INIT_COMPLETION(info->completion);
> +

This needs to happen before you start the transfer.


>  	timeout = wait_for_completion_interruptible_timeout
>  			(&info->completion, EXYNOS_ADC_TIMEOUT);
> +
>  	*val = info->value;
>  
>  	mutex_unlock(&indio_dev->mlock);
>  
>  	if (timeout == 0)
>  		return -ETIMEDOUT;
> -
> +	else if (timeout < 0)
> +		return timeout;
>  	return IIO_VAL_INT;
>  }
>  
> @@ -159,6 +164,8 @@ static irqreturn_t exynos_adc_isr(int irq, void *dev_id)
>  {
>  	struct exynos_adc *info = (struct exynos_adc *)dev_id;
>  
> +	spin_lock(&info->reg_lock);
> +
>  	/* Read value */
>  	info->value = readl(ADC_V1_DATX(info->regs)) &
>  						ADC_DATX_MASK;
> @@ -170,6 +177,8 @@ static irqreturn_t exynos_adc_isr(int irq, void *dev_id)
>  
>  	complete(&info->completion);
>  
> +	spin_unlock(&info->reg_lock);
> +

What exactly is the spinlock protecting against here? Concurrent runs of
exynos_adc_isr? This is probably not issue in the first place.

What you want to protect against is that completion is completed between the
call to INIT_COMPLETION() and the start of a new conversion. So the sections
that need to be under the spinlock are the complete call here and the point
from INIT_COMPLETION until the transfer is started in exynos_read_raw(). Make
sure to use spin_lock_irq there.

>  	return IRQ_HANDLED;
>  }
>  
> @@ -327,6 +336,7 @@ static int exynos_adc_probe(struct platform_device *pdev)
>  	else
>  		indio_dev->num_channels = MAX_ADC_V2_CHANNELS;
>  
> +	spin_lock_init(&info->reg_lock);
>  	ret = iio_device_register(indio_dev);
>  	if (ret)
>  		goto err_irq;
