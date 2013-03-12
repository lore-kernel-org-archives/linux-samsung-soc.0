From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2] iio: adc: exynos5_adc: fix compilation warnings
Date: Tue, 12 Mar 2013 09:14:34 -0700
Message-ID: <CAD=FV=W4yYZYBT5=PY2VUsdz-zNAm=jnnw_SZzwjWzm_FuViLQ@mail.gmail.com>
References: <1362625743-10401-1-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1362625743-10401-1-git-send-email-ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-iio <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, Naveen Krishna <naveenkrishna.ch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Naveen,

On Wed, Mar 6, 2013 at 7:09 PM, Naveen Krishna Chatradhi
<ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> -       unsigned int            version;
> +       unsigned int            version;

Given that you've changed exynos_adc_get_version() to return an int,
shouldn't this be an int too (not unsigned)?


> -static inline unsigned int exynos_adc_get_version(struct platform_device *pdev)
> +static inline int exynos_adc_get_version(struct platform_device *pdev)
>  {
>         const struct of_device_id *match;
>
>         match = of_match_node(exynos_adc_match, pdev->dev.of_node);
> -       return (unsigned int)match->data;
> +       return (int)match->data;

Given that you're now checking for an error code below it seems like
you ought to generate one here.  ;)
...AKA: return an error if match is NULL--don't dereference NULL.


>  static int exynos_read_raw(struct iio_dev *indio_dev,
> @@ -117,7 +117,7 @@ static int exynos_read_raw(struct iio_dev *indio_dev,
>                                 long mask)
>  {
>         struct exynos_adc *info = iio_priv(indio_dev);
> -       unsigned long timeout;
> +       int timeout;

Why change this to an "int" when
wait_for_completion_interruptible_timeout() returns a long?  I agree
with the removal of the "unsigned", though.


> +       version = exynos_adc_get_version(pdev);
> +       if (version < 0) {
> +               dev_err(&pdev->dev, "no matching of_node, err = %d\n", version);
> +               ret = version;
> +               goto err_iio;
> +       }
> +
> +       info->version = version;

Optional (and perhaps a matter of preference): I'd eliminate the
"version" variable here and just re-use "ret" for storing the result
of exynos_adc_get_version().


-Doug
