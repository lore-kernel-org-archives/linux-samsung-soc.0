From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 5/5 v3] iio: exynos_adc: do a reinit_completion before the conversion
Date: Thu, 01 May 2014 06:48:19 +0100
Message-ID: <dbdb414d-81d9-453b-871e-d5d0359f7efe@email.android.com>
References: <1398850015-17761-1-git-send-email-ch.naveen@samsung.com> <1398850015-17761-6-git-send-email-ch.naveen@samsung.com> <536161F5.7090508@kernel.org> <CAD=FV=U-_0FWNHrqWp+rfmucKO5GQibCr8N09M8NVSb180ieBQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAD=FV=U-_0FWNHrqWp+rfmucKO5GQibCr8N09M8NVSb180ieBQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-iio <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Naveen Krishna <naveenkrishna.ch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, "cpgs ." <cpgs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Grant Grundler <grundler-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org



On May 1, 2014 12:23:27 AM GMT+01:00, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
>Jonathan,
>
>On Wed, Apr 30, 2014 at 1:49 PM, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>wrote:
>> On 30/04/14 10:26, Naveen Krishna Chatradhi wrote:
>>>
>>> Add reinit_completion() before the wait_for_completion_timeout in
>>> raw_read() call.
>>>
>>> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>>> Reviewed-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>>
>> Applied to the togreg branch of iio.git
>> I wasn't sure if this one was technically a fix, but as it isn't
>> marked clearly as such it can go in during the next merge window.
>> I won't have pushed this out to a non rebasing branch until tomorrow
>> so if this fixes an observed issue then let me know and it might move
>> to the fixes-togreg branch.
>
>As far as I know this doesn't fix an observed issue.  I believe it was
>requested as part of a previous review and is finally reposted.  I
>believe it's just extra precautions to make sure that some old IRQ
>didn't accidentally complete us between the last transaction and this
>one.
>
>Old discussion is somewhere around here
><https://patchwork.kernel.org/patch/2279591/>
Thanks for clarifying this.

J
>
>Thanks!
>
>-Doug

-- 
Sent from my Android phone with K-9 Mail. Please excuse my brevity.
