From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 1/5] iio: exynos_adc: use indio_dev->dev structure to
 handle child nodes
Date: Fri, 25 Apr 2014 08:46:31 -0700
Message-ID: <CAD=FV=V28_iDiNWeX6bXLzMW5kWygJz-YAExJkETJKgTDicHQg@mail.gmail.com>
References: <1398420888-5506-1-git-send-email-ch.naveen@samsung.com>
	<1398420888-5506-2-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1398420888-5506-2-git-send-email-ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-iio <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Naveen Krishna <naveenkrishna.ch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, "cpgs ." <cpgs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Grant Grundler <grundler-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Naveen,

Thanks for sending this.  Given that Jonathan Cameron was involved in
the previous discussion, it probably would have been wise to include
him on the CC list.

On Fri, Apr 25, 2014 at 3:14 AM, Naveen Krishna Chatradhi
<ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> From: Naveen Krishna Ch <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>
> Using pdev->dev with device_for_each_child() would iterate over all
> of the children of the platform device and delete them.
> Thus, causing crashes during module unload.
>
> We should be using the indio_dev->dev structure for
> registering/unregistering child nodes.
>
> Signed-off-by: Naveen Krishna Ch <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
> This change was tested on top of
>    https://lkml.org/lkml/2014/4/21/481 from Doug.
>
>  drivers/iio/adc/exynos_adc.c |    6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reported-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Reviewed-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Tested-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
