From: Naveen Krishna Ch <naveenkrishna.ch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] iio: adc: exynos5_adc: fix compilation warnings
Date: Wed, 6 Mar 2013 22:15:02 +0900
Message-ID: <CAHfPSqBhAM7aSugC0nAmPnnBOycDOicTd81ZfgPg7YtRNuYkHA@mail.gmail.com>
References: <1362543092-6446-1-git-send-email-ch.naveen@samsung.com> <513701FF.3000805@metafoo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <513701FF.3000805-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Cc: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On 6 March 2013 17:44, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org> wrote:
> On 03/06/2013 05:11 AM, Naveen Krishna Chatradhi wrote:
>> From: Naveen Krishna Ch <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>>
>> Fixes the compilation warnings and potential NULL pointer
>> dereferencing pointed out by "Dan Carpenter".
>>
>
> I'd say that's a rather un-potential NULL pointer dereferencing, but if it
> makes the static checkers happy, why not. Since the same match table is used to
> match the device, probe won't be called unless there is a match, so
> of_match_node() will never return NULL in this case.
Right, i was thinking how it is such a potential error.
Anyway, Dan's suggestion of Kconfig change holds very good.
I will submit v2, with the appropriate changes.

>
>> Signed-off-by: Naveen Krishna Ch <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> ---
>>  drivers/iio/adc/exynos_adc.c |   24 +++++++++++++++++-------
>>  1 file changed, 17 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/iio/adc/exynos_adc.c b/drivers/iio/adc/exynos_adc.c
>> index ed6fdd7..67d07aa 100644
>> --- a/drivers/iio/adc/exynos_adc.c
>> +++ b/drivers/iio/adc/exynos_adc.c
>> @@ -92,7 +92,7 @@ struct exynos_adc {
>>       struct completion       completion;
>>
>>       u32                     value;
>> -     unsigned int            version;
>> +     unsigned int            version;
>>  };
>>
>>  static const struct of_device_id exynos_adc_match[] = {
>> @@ -102,12 +102,15 @@ static const struct of_device_id exynos_adc_match[] = {
>>  };
>>  MODULE_DEVICE_TABLE(of, exynos_adc_match);
>>
>> -static inline unsigned int exynos_adc_get_version(struct platform_device *pdev)
>> +static inline int exynos_adc_get_version(struct platform_device *pdev)
>>  {
>>       const struct of_device_id *match;
>>
>>       match = of_match_node(exynos_adc_match, pdev->dev.of_node);
>> -     return (unsigned int)match->data;
>> +     if (!match)
>> +             return -ENODEV;
>> +
>> +     return (int)match->data;
>>  }
>>
>>  static int exynos_read_raw(struct iio_dev *indio_dev,
>> @@ -117,7 +120,7 @@ static int exynos_read_raw(struct iio_dev *indio_dev,
>>                               long mask)
>>  {
>>       struct exynos_adc *info = iio_priv(indio_dev);
>> -     unsigned long timeout;
>> +     int timeout;
>>       u32 con1, con2;
>>
>>       if (mask != IIO_CHAN_INFO_RAW)
>> @@ -255,7 +258,7 @@ static int exynos_adc_probe(struct platform_device *pdev)
>>       struct iio_dev *indio_dev = NULL;
>>       struct resource *mem;
>>       int ret = -ENODEV;
>> -     int irq;
>> +     int irq, version;
>>
>>       if (!np)
>>               return ret;
>> @@ -268,6 +271,15 @@ static int exynos_adc_probe(struct platform_device *pdev)
>>
>>       info = iio_priv(indio_dev);
>>
>> +     version = exynos_adc_get_version(pdev);
>> +     if (version < 0) {
>> +             dev_err(&pdev->dev, "no matching of_node, err = %d\n", version);
>> +             ret = version;
>> +             goto err_iio;
>> +     }
>> +
>> +     info->version = version;
>> +
>>       mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>
>>       info->regs = devm_request_and_ioremap(&pdev->dev, mem);
>> @@ -311,8 +323,6 @@ static int exynos_adc_probe(struct platform_device *pdev)
>>               goto err_irq;
>>       }
>>
>> -     info->version = exynos_adc_get_version(pdev);
>> -
>>       platform_set_drvdata(pdev, indio_dev);
>>
>>       indio_dev->name = dev_name(&pdev->dev);
>



-- 
Shine bright,
(: Nav :)
