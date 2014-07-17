From: Naveen Krishna Ch <naveenkrishna.ch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/4 v2] iio: exyno-adc: use syscon for PMU register access
Date: Thu, 17 Jul 2014 17:41:16 +0530
Message-ID: <CAHfPSqDBfdmt2R4yB1AUG9U8UvsYtmVtL03-OMuozKGXYGdMgw@mail.gmail.com>
References: <1405595993-16661-1-git-send-email-ch.naveen@samsung.com>
 <1405595993-16661-2-git-send-email-ch.naveen@samsung.com> <CAK5sBcFR0nwmL97CYxhHHhwHREdNOMYZnc2DF+O=WdQLBHQbLA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAK5sBcFR0nwmL97CYxhHHhwHREdNOMYZnc2DF+O=WdQLBHQbLA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sachin Kamat <spk.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, cpgs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Grant Grundler <grundler-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello Sachin,

On 17 July 2014 17:24, Sachin Kamat <spk.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi Naveen,
>
> On Thu, Jul 17, 2014 at 4:49 PM, Naveen Krishna Chatradhi
> <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
>> This patch updates the IIO based ADC driver to use syscon and regmap
>> APIs to access and use PMU registers instead of remapping the PMU
>> registers in the driver.
>>
>> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> To: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>
> With only this patch applied, I believe the ADC functionality would be broken.
> Perhaps the DT changes should be merged along with this patch?

Jonathan already mentioned that, he would wait for Ack from Kukjin.
With out the dts changes ADC driver will fail to probe but it wont
crash the system.
git bisect should still work.

>
> --
> Regards,
> Sachin.



-- 
Shine bright,
(: Nav :)
