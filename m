From: Abhilash Kesavan <kesavan.abhilash@gmail.com>
Subject: Re: [PATCH RFT 1/2] drivers: bus: check cci device tree node status
Date: Thu, 8 Jan 2015 20:57:34 +0530
Message-ID: <CAM4voamaqoje8Ccz3+UxvxaHN6GBd=QC5wRjVcz9Osfc=4aeiw@mail.gmail.com>
References: <1417186209-5256-1-git-send-email-a.kesavan@samsung.com>
	<CAM4voakjWgnEXoXT1LH2ZFBy=U4vfXFXS1Su8VB7Cd3s3wqmSA@mail.gmail.com>
	<5487C897.9050405@arm.com>
	<CAM4voa=TQeOMTHmM2iBquDRwoEFPAgUFeMwJ73H4qdcSmR1Lug@mail.gmail.com>
	<5487D726.6000603@arm.com>
	<54AE278F.4020003@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qa0-f44.google.com ([209.85.216.44]:63908 "EHLO
	mail-qa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754697AbbAHP1f (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 8 Jan 2015 10:27:35 -0500
Received: by mail-qa0-f44.google.com with SMTP id bm13so7670628qab.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 08 Jan 2015 07:27:34 -0800 (PST)
In-Reply-To: <54AE278F.4020003@arm.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Kevin Hilman <khilman@kernel.org>, "nicolas.pitre@linaro.org" <nicolas.pitre@linaro.org>, Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>, Punit Agrawal <Punit.Agrawal@arm.com>, Will Deacon <Will.Deacon@arm.com>, Mark Rutland <Mark.Rutland@arm.com>, =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Douglas Anderson <dianders@chromium.org>, Kukjin Kim <kgene@kernel.org>, Olof Johansson <olof@lixom.net>, Kukjin Kim <kgene.kim@samsung.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>

Hi Sudeep,

On Thu, Jan 8, 2015 at 12:15 PM, Sudeep Holla <sudeep.holla@arm.com> wrote:
> Hi Abhilash,
>
> On Wednesday 10 December 2014 10:46 AM, Sudeep Holla wrote:
>>
>>
>>
>> On Wednesday 10 December 2014 09:55 AM, Abhilash Kesavan wrote:
>>>
>>> Hi Sudeep,
>>>
>>> On Wed, Dec 10, 2014 at 9:44 AM, Sudeep Holla <sudeep.holla@arm.com>
>>> wrote:
>>>>
>>>> Hi Abhilash,
>>>>
>>>> On Wednesday 10 December 2014 09:31 AM, Abhilash Kesavan wrote:
>>>>>
>>>>>
>>>>> Hi,
>>>>>
>>>>> On Fri, Nov 28, 2014 at 8:20 PM, Abhilash Kesavan
>>>>> <a.kesavan@samsung.com>
>>>>> wrote:
>>>>>>
>>>>>>
>>>>>> The arm-cci driver completes the probe sequence even if the cci node
>>>>>> is
>>>>>> marked as disabled. Add a check in the driver to honour the cci status
>>>>>> in the device tree.
>>>>>>
>>>>>> Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
>>>>>
>>>>>
>>>>>
>>>>> This patch helps disable CCI on the Arndale Octa board thus resolving
>>>>> some imprecise aborts seen on that board. Kindly review.
>>>>>
>>>>> Regards,
>>>>> Abhilash
>>>>>>
>>>>>>
>>>>>> ---
>>>>>>     drivers/bus/arm-cci.c |    3 +++
>>>>>>     1 file changed, 3 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/bus/arm-cci.c b/drivers/bus/arm-cci.c
>>>>>> index 860da40..0ce5e2d 100644
>>>>>> --- a/drivers/bus/arm-cci.c
>>>>>> +++ b/drivers/bus/arm-cci.c
>>>>>> @@ -1312,6 +1312,9 @@ static int cci_probe(void)
>>>>>>            if (!np)
>>>>>>                    return -ENODEV;
>>>>>>
>>>>>> +       if (!of_device_is_available(np))
>>>>>> +               return -ENODEV;
>>>>>> +
>>>>
>>>>
>>>>
>>>> IIUC, by this change you are disabling the MCPM boot protocol here.
>>>> Is there any alternative boot protocol that works on this platform
>>>> to boot all 8 cores ? Sorry by quick grep couldn't find one, hence
>>>> so I am asking.
>>>
>>>
>>> Thanks for the reply.
>>> On disabling MCPM, we will default to platsmp.c/firmware.c which boots
>>> 4 cores as per Kevin's comment here[1]. This was the original behavior
>>> before MCPM was enabled for all 5420 based SoCs.
>>>
>>
>> Thanks for pointing that out. I assume the firmware can handle the
>> alternate boot protocol and no more workarounds are needed especially
>> when getting CPUIdle working in this mode.
>>
>> Anyways the patch makes sense irrespective how it works on exynos, so
>> you can add,
>>
>> Acked-by: Sudeep Holla <sudeep.holla@arm.com>
>>
>
> What's the status of this patch. It was useful for me on vexpress for some
> testing. Please feel free to add
>
> Tested-by: Sudeep Holla <sudeep.holla@arm.com>
>
> if this is not yet queued.

Thanks for the tested-by. This patch has not been merged yet; I am not
quite sure who is supposed to pick this up.

Regards,
Abhilash
>
> Regards,
> Sudeep
>
