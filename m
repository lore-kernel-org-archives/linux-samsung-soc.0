From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/5] iio: exynos_adc: use indio_dev->dev structure to
 handle child nodes
Date: Sat, 26 Apr 2014 13:53:14 +0100
Message-ID: <535BAC3A.1010202@kernel.org>
References: <1398420888-5506-1-git-send-email-ch.naveen@samsung.com>	<1398420888-5506-2-git-send-email-ch.naveen@samsung.com> <CAD=FV=V28_iDiNWeX6bXLzMW5kWygJz-YAExJkETJKgTDicHQg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAD=FV=V28_iDiNWeX6bXLzMW5kWygJz-YAExJkETJKgTDicHQg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-iio <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Naveen Krishna <naveenkrishna.ch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, "cpgs ." <cpgs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Grant Grundler <grundler-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 25/04/14 16:46, Doug Anderson wrote:
> Naveen,
>
> Thanks for sending this.  Given that Jonathan Cameron was involved in
> the previous discussion, it probably would have been wise to include
> him on the CC list.
In my case, don't worry too much as I have linux-iio coming into exactly
the same place in my inbox. Doug is correct that it is generally a good
idea unless someone has asked you not to.
>
> On Fri, Apr 25, 2014 at 3:14 AM, Naveen Krishna Chatradhi
> <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
>> From: Naveen Krishna Ch <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>>
>> Using pdev->dev with device_for_each_child() would iterate over all
>> of the children of the platform device and delete them.
>> Thus, causing crashes during module unload.
>>
>> We should be using the indio_dev->dev structure for
>> registering/unregistering child nodes.
>>
>> Signed-off-by: Naveen Krishna Ch <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> ---
>> This change was tested on top of
>>     https://lkml.org/lkml/2014/4/21/481 from Doug.
>>
>>   drivers/iio/adc/exynos_adc.c |    6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> Reported-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Reviewed-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Tested-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Applied to the fixes-togreg branch of iio.git

Thanks,
> --
> To unsubscribe from this list: send the line "unsubscribe linux-iio" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
