From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [PATCH v4 5/5] ARM: exynos: dts: Add FIMD DT binding Documentation
Date: Fri, 22 Feb 2013 22:37:55 +0100
Message-ID: <5127E533.4060702@gmail.com>
References: <1360912200-26377-1-git-send-email-vikas.sajjan@linaro.org> <1360912200-26377-6-git-send-email-vikas.sajjan@linaro.org> <511E1008.6010308@samsung.com> <CAD025yQokBbJwyFWeg8KwzTsE-4jgra5UhLuic5zJnQRt+GNTw@mail.gmail.com> <5122A119.7070501@gmail.com> <CAD025yRmvSpnM9RJJvN+FM00Rgz8Bt5msmEYcyFVxNTEKsM2xg@mail.gmail.com> <CAD025yTb5yfXWpzCnCg7KY9NsTw1wfsLFU6y32aD=WXe23xiwg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f41.google.com ([74.125.83.41]:49490 "EHLO
	mail-ee0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756321Ab3BVViA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 22 Feb 2013 16:38:00 -0500
Received: by mail-ee0-f41.google.com with SMTP id c13so561916eek.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 22 Feb 2013 13:37:59 -0800 (PST)
In-Reply-To: <CAD025yTb5yfXWpzCnCg7KY9NsTw1wfsLFU6y32aD=WXe23xiwg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vikas Sajjan <vikas.sajjan@linaro.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, devicetree-discuss@lists.ozlabs.org, sunil joshi <joshi@samsung.com>, Inki Dae <inki.dae@samsung.com>

Hi Vikas,

On 02/22/2013 08:06 AM, Vikas Sajjan wrote:
>>>>>> +++ b/Documentation/devicetree/bindings/drm/exynos/fimd.txt
[...]
>>>>>> @@ -0,0 +1,37 @@
>>>>>> +Device-Tree bindings for fimd driver

Perhaps something like:

Exynos SoC display controller (FIMD)

would do ? Even though bindings are to be used by some driver we should
be focusing on describing the actual hardware.

>>>>>> +FIMD stands for Fully Interactive Mobile Display, is the Display
>>>>>> Controller for
>>>>>> +the Exynos series of SoCs which transfers the image data from a video
>>>>>> buffer
>>>>>> +located in the system memory to an external LCD interface.
>>>>>> +
>>>>>> +Required properties:
>>>>>> +- compatible := value should be "samsung,exynos5-fimd" or
>>>>>> "samsung,exynos4-fimd"
>>>>>
>>>>>
>>>>> What about older SoCs like S5Pv210 ? There is the FIMD IP block in those
>>>>> SoCs
>>>>> as well. There are also differences in the FIMD IP block across various
>>>>> SoC
>>>>> version, so either you need to list the quirks in the bindings or use an
>>>>> appropriate compatible properties if there are significant differences
>>>>> across
>>>>> FIMDs that make them not really compatible.
>>>>>
>>>> as of now, I was working on Exynos4 and Exynos5 SoC. have to really
>>>> see the differences in the previous SoC and how to handle all those
>>>> FIMD IPs in the driver.
>>>> if you know the differences between these FIMD IPs, please let me know.
>>>
>>>
>>> Please have a look at drivers/video/s3c-fb.c and all driver_data structures
>>> defined for various SoCs.
>>>
>>> [...]
>>>
>> I went through the driver_data structures define for s5p64x0,s3c2443,
>> s5pv210, s5pc100 ad 64xx SoCs.
>> there are some differences w.r.t number of windows, osd_stride  length
>> and regsiter offsets.
>> but  I dont have access to all the above mentioned Boards and so that
>> I can modify and test on each one of them.

I don't ask you to add support for all existing FIMD variants. Please just
make sure the bindings you're documenting here, with focus on the Exynos
SoCs, are also usable for older SoC series.

> as far as i know this file exynos_drm_fimd.c is meant only for exynos4
> onwards SoCs,

Yes, but the bindings are for FIMD IP block and should possibly be 
consistent
across all SoC series. I think we should bear in mind that eventually all
these SoCs get device tree support. Actually I've seen already patches for
s3c24xx and s3c64xx SoC series.

> ( I think Mr. Inki Dae can throw more light on this )
> and also the previous  boards based on  s5p64x0,s3c2443,s5pv210,
> s5pc100 and 64xx, dont have DT support.

We can't tell for sure the SoC series listed above won't get device tree
support sooner or later, as this is an open source project.

> also in the function drm_fimd_get_driver_data(), there is provision to
> get the NON-DT "driver data" as well. So somebody who wants to use
> this driver for the above mentioned SoCs can add the driver-data.

I'm not concerned about this particular driver, only about the DT bindings
that are not supposed to change over time. So some care needs to be taken
when designing the bindings.

> so wanted to know how you want me to go about it.

My concern was that you use "samsung,exynos4-fimd" for FIMD IP found on all
Exynos4 SoC, whereas there could be some differences for Exynos4210 and
Exynos4212/4412. It looks like both are shipped with FIMD rev. 6.0 though.
Anyway, still there are some details that may need to be handled, e.g. 
maximum
VCLK frequency is 80 MHz for Exynos4210 FIMD0 and Exynos4412 FIMD (there is
only one there in Exynos4412 as opposed to two in Exynos4210), while for
Exynos4210 FIMD1 it is only 50 MHz. When there are differences we really
care about (and support for FIMD1 is added) I guess things like this could
be handled through optional properties.

I thought about something like:

compatible = "samsung,exynos4210-fimd"; for Exynos4210 and
compatible = "samsung,exynos4212-fimd", "samsung,exynos4210-fimd"; for
               Exynos4212 and Exynos412,

but "samsung,exynos4-fimd" seems good enough, since the FIMD IP block
appears nearly identical across Exynos4210...Exynos4412.

--

Thanks,
Sylwester
