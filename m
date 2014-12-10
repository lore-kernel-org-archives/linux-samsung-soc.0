From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH RFT 1/2] drivers: bus: check cci device tree node status
Date: Wed, 10 Dec 2014 10:46:22 +0530
Message-ID: <5487D726.6000603@arm.com>
References: <1417186209-5256-1-git-send-email-a.kesavan@samsung.com>	<CAM4voakjWgnEXoXT1LH2ZFBy=U4vfXFXS1Su8VB7Cd3s3wqmSA@mail.gmail.com>	<5487C897.9050405@arm.com> <CAM4voa=TQeOMTHmM2iBquDRwoEFPAgUFeMwJ73H4qdcSmR1Lug@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from service87.mimecast.com ([91.220.42.44]:34596 "EHLO
	service87.mimecast.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750708AbaLJFQa convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 10 Dec 2014 00:16:30 -0500
In-Reply-To: <CAM4voa=TQeOMTHmM2iBquDRwoEFPAgUFeMwJ73H4qdcSmR1Lug@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Abhilash Kesavan <kesavan.abhilash@gmail.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Kevin Hilman <khilman@kernel.org>, "nicolas.pitre@linaro.org" <nicolas.pitre@linaro.org>, Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>, Punit Agrawal <Punit.Agrawal@arm.com>, Will Deacon <Will.Deacon@arm.com>, Mark Rutland <Mark.Rutland@arm.com>, =?UTF-8?B?S3J6eXN6dG9mIEtvesWCb3dza2k=?= <k.kozlowski@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Douglas Anderson <dianders@chromium.org>, Kukjin Kim <kgene@kernel.org>, Olof Johansson <olof@lixom.net>, Kukjin Kim <kgene.kim@samsung.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>



On Wednesday 10 December 2014 09:55 AM, Abhilash Kesavan wrote:
> Hi Sudeep,
>
> On Wed, Dec 10, 2014 at 9:44 AM, Sudeep Holla <sudeep.holla@arm.com> wrote:
>> Hi Abhilash,
>>
>> On Wednesday 10 December 2014 09:31 AM, Abhilash Kesavan wrote:
>>>
>>> Hi,
>>>
>>> On Fri, Nov 28, 2014 at 8:20 PM, Abhilash Kesavan <a.kesavan@samsung.com>
>>> wrote:
>>>>
>>>> The arm-cci driver completes the probe sequence even if the cci node is
>>>> marked as disabled. Add a check in the driver to honour the cci status
>>>> in the device tree.
>>>>
>>>> Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
>>>
>>>
>>> This patch helps disable CCI on the Arndale Octa board thus resolving
>>> some imprecise aborts seen on that board. Kindly review.
>>>
>>> Regards,
>>> Abhilash
>>>>
>>>> ---
>>>>    drivers/bus/arm-cci.c |    3 +++
>>>>    1 file changed, 3 insertions(+)
>>>>
>>>> diff --git a/drivers/bus/arm-cci.c b/drivers/bus/arm-cci.c
>>>> index 860da40..0ce5e2d 100644
>>>> --- a/drivers/bus/arm-cci.c
>>>> +++ b/drivers/bus/arm-cci.c
>>>> @@ -1312,6 +1312,9 @@ static int cci_probe(void)
>>>>           if (!np)
>>>>                   return -ENODEV;
>>>>
>>>> +       if (!of_device_is_available(np))
>>>> +               return -ENODEV;
>>>> +
>>
>>
>> IIUC, by this change you are disabling the MCPM boot protocol here.
>> Is there any alternative boot protocol that works on this platform
>> to boot all 8 cores ? Sorry by quick grep couldn't find one, hence
>> so I am asking.
>
> Thanks for the reply.
> On disabling MCPM, we will default to platsmp.c/firmware.c which boots
> 4 cores as per Kevin's comment here[1]. This was the original behavior
> before MCPM was enabled for all 5420 based SoCs.
>

Thanks for pointing that out. I assume the firmware can handle the
alternate boot protocol and no more workarounds are needed especially
when getting CPUIdle working in this mode.

Anyways the patch makes sense irrespective how it works on exynos, so
you can add,

Acked-by: Sudeep Holla <sudeep.holla@arm.com>

Regards,
Sudeep
