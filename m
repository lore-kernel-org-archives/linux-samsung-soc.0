From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/4 v2] iio: exyno-adc: use syscon for PMU register access
Date: Sun, 20 Jul 2014 14:59:57 +0100
Message-ID: <53CBCB5D.1050902@kernel.org>
References: <1405595993-16661-1-git-send-email-ch.naveen@samsung.com> <CAK5sBcFR0nwmL97CYxhHHhwHREdNOMYZnc2DF+O=WdQLBHQbLA@mail.gmail.com> <CAHfPSqDBfdmt2R4yB1AUG9U8UvsYtmVtL03-OMuozKGXYGdMgw@mail.gmail.com> <4202302.OdUuvHROuH@amdc1032>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4202302.OdUuvHROuH@amdc1032>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Naveen Krishna Ch <naveenkrishna.ch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Sachin Kamat <spk.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, cpgs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Grant Grundler <grundler-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 17/07/14 14:56, Bartlomiej Zolnierkiewicz wrote:
>
> Hi,
>
> On Thursday, July 17, 2014 05:41:16 PM Naveen Krishna Ch wrote:
>> Hello Sachin,
>>
>> On 17 July 2014 17:24, Sachin Kamat <spk.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>> Hi Naveen,
>>>
>>> On Thu, Jul 17, 2014 at 4:49 PM, Naveen Krishna Chatradhi
>>> <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
>>>> This patch updates the IIO based ADC driver to use syscon and regmap
>>>> APIs to access and use PMU registers instead of remapping the PMU
>>>> registers in the driver.
>>>>
>>>> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>>>> To: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>>>
>>> With only this patch applied, I believe the ADC functionality would be broken.
>>> Perhaps the DT changes should be merged along with this patch?
>>
>> Jonathan already mentioned that, he would wait for Ack from Kukjin.
>> With out the dts changes ADC driver will fail to probe but it wont
>> crash the system.
>> git bisect should still work.
>
> Unless someone bisects things related to ADC functionality..
>
> Also patch #1 seems to break device tree ABI (the old dtb will no longer
> work with the new kernel).
A very good point.  How to avoid this breakage?  Supporting the whole
old mechanism is going to be a little painful but without that phandle
is there any other way?
>
> Best regards,
> --
> Bartlomiej Zolnierkiewicz
> Samsung R&D Institute Poland
> Samsung Electronics
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-iio" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
