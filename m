From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] iio: exynos_adc: fix wrong structure extration in suspend
 and resume
Date: Wed, 22 May 2013 22:16:04 +0100
Message-ID: <519D3594.4070305@kernel.org>
References: <1369031689-23189-1-git-send-email-ch.naveen@samsung.com> <CAD=FV=Xppyb+Y0atygnwA8oBHmGHDx7Bit2fN12GX5Tt-Y9H1A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAD=FV=Xppyb+Y0atygnwA8oBHmGHDx7Bit2fN12GX5Tt-Y9H1A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-iio <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Naveen Krishna <naveenkrishna.ch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 05/20/2013 06:09 PM, Doug Anderson wrote:
> Naveen,
> 
> On Sun, May 19, 2013 at 11:34 PM, Naveen Krishna Chatradhi
> <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
>> The exynos_adc device structure was wrongly extracted from the dev*
>> correcting the same.
>>
>> Using the regular conversion of
>> struct device* -> struct platform_device* -> struct exynos_adc* seems wrong.
>> Instead we should be doing
>> struct device* -> struct iio_dev* -> struct exynos_adc*
>>
>> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> ---
>>  drivers/iio/adc/exynos_adc.c | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> Reviewed-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Applied to the fixes-togreg branch of iio.git
I'll hopefully send these on to Greg before the weekend.
> --
> To unsubscribe from this list: send the line "unsubscribe linux-iio" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
