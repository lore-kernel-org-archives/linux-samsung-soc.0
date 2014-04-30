From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 5/5 v3] iio: exynos_adc: do a reinit_completion before
 the conversion
Date: Wed, 30 Apr 2014 21:49:57 +0100
Message-ID: <536161F5.7090508@kernel.org>
References: <1398850015-17761-1-git-send-email-ch.naveen@samsung.com> <1398850015-17761-6-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1398850015-17761-6-git-send-email-ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, naveenkrishna.ch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, cpgs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, grundler-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On 30/04/14 10:26, Naveen Krishna Chatradhi wrote:
> Add reinit_completion() before the wait_for_completion_timeout in
> raw_read() call.
>
> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Reviewed-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Applied to the togreg branch of iio.git
I wasn't sure if this one was technically a fix, but as it isn't
marked clearly as such it can go in during the next merge window.
I won't have pushed this out to a non rebasing branch until tomorrow
so if this fixes an observed issue then let me know and it might move
to the fixes-togreg branch.

Thanks,

Jonathan
> ---
> Changes since v2:
> None
> Changes since v1:
> None
> v0:
> This change is a part of the patch reviewed at https://lkml.org/lkml/2013/11/5/92
>
>   drivers/iio/adc/exynos_adc.c |    1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/iio/adc/exynos_adc.c b/drivers/iio/adc/exynos_adc.c
> index eddc58e..010578f 100644
> --- a/drivers/iio/adc/exynos_adc.c
> +++ b/drivers/iio/adc/exynos_adc.c
> @@ -151,6 +151,7 @@ static int exynos_read_raw(struct iio_dev *indio_dev,
>   		return -EINVAL;
>
>   	mutex_lock(&indio_dev->mlock);
> +	reinit_completion(&info->completion);
>
>   	/* Select the channel to be used and Trigger conversion */
>   	if (info->version == ADC_V2) {
>
