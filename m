From: MyungJoo Ham <myungjoo.ham@gmail.com>
Subject: Re: PM / devfreq: exynos-bus: need for suspend OPP?
Date: Tue, 22 Nov 2016 01:21:18 +0900
Message-ID: <CAJ0PZbSpNFC+0GzNMS=Q2O3qn2=gdxYt=mK=DEMBSBCBXMz-RA@mail.gmail.com>
References: <5832F792.4010308@math.uni-bielefeld.de> <7d5d2c7c-6ebb-b4c1-5f3f-f794c249ca36@fivetechno.de>
 <CAJ0PZbT6FDC382Z7N8ky+MX2auekCGSOuES8O3L3FtnGc6XOWw@mail.gmail.com> <58331166.1010403@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-io0-f177.google.com ([209.85.223.177]:36058 "EHLO
        mail-io0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753120AbcKUQVk (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 21 Nov 2016 11:21:40 -0500
Received: by mail-io0-f177.google.com with SMTP id x94so44096098ioi.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 21 Nov 2016 08:21:34 -0800 (PST)
In-Reply-To: <58331166.1010403@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: Markus Reichl <m.reichl@fivetechno.de>, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>

On Tue, Nov 22, 2016 at 12:23 AM, Tobias Jakobi
<tjakobi@math.uni-bielefeld.de> wrote:
> Hi MyungJoo,
>
> MyungJoo Ham wrote:
>> On Mon, Nov 21, 2016 at 11:48 PM, Markus Reichl <m.reichl@fivetechno.de> wrote:
>>> Hi Tobias,
>>>
>>> Am 21.11.2016 um 14:33 schrieb Tobias Jakobi:
>>>> Hello everyone,
>>>>
>>>> I was thinking about the following. At the moment we have a suspend OPP
>>>> for cpufreq-dt in place for the Exynos4412 SoC (added in
>>>> 1605b60ad064c7019db8ade07f0b7bdc8c197b93). The rationale behind is that
>>>> the board using the SoC might not have some PMIC reset in place. In case
>>>> the board goes into reboot with a low OPP (i.e. low frequency, but also
>>>> low core voltage), this results in a hang when the first-stage
>>>> bootloaders sets its default core frequency.
>>>>
>>>> So this is properly handled in the kernel just fine, except for some
>>>> corner cases like emergency reboot.
>>>>
>>>> But some time ago devfreq support for the various busses in the
>>>> Exynos4412 was added. On the ODROID boards e.g. this adjust MIF and INT
>>>> voltage.
>>>>
>>>> Let us take the DMC bus. Operating frequency is 100~400MHz and voltage
>>>> is 900~1050mV.
>>>>
>>>> Now let's look at the corresponding board file
>>>> (http://git.denx.de/?p=u-boot.git;a=blob;f=board/samsung/odroid/odroid.c#l234)
>>>> in upstream u-boot. If I read this correctly DMC is set to 400MHz there.
>>>>
>>>> Here's the question. Could this, similar to the cpufreq/core frequency
>>>> issue, pose a problem when the kernel goes into reboot when DMC is on
>>>> the lowest OPP state?
>>>>
>>>> I'm not saying that it does. This just came to my mind during some
>>>> recent discussion.
>>>
>>> Made a test with
>>> # echo performance > /sys/class/devfreq/bus_leftbus/governor
>>> # echo performance > /sys/class/devfreq/bus_dmc/governor
>>> just before reboot.
>>>
>>> 20 out of 20 reboots worked.
>>>
>>> With devfreq simple_ondemand governor around 50% reboots hung.
>>>
>>> This could support your thoughts above.
>>>
>>> Servus,
>>> --
>>> Markus
>>
>> Either in each device driver (just implemented in the suspend/resume callback)
>> or in subsystem code, we may need to handle the inconsistency after resume.
> by device driver code you mean exynos-bus, i.e.
> drivers/devfreq/exynos-bus.c?

Yes, that's correct.

>
> In the subsystem code (I assume you mean drivers/devfreq/devfreq.c here)
> I see devfreq_{suspend,resume}_device(). I'm not sure though if these
> are called at the correct times. Need to check this.
>
>
>> This is normally because the BL0 bootloader of the CPU simply resets the values
>> at wake-up. I think recent Exynos series don't do that anymore, but
>> 4412 might be
>> the one before such improvement.
> So just to make sure. The BL0 resets the clocks to default values, but
> leaves the regulators / PMIC alone?

Yes, that's because PMIC is a physically separated component, connected
via an external (out of SoC) bus; I2C and IRQ lines, which is the root of the
inconsistency after resume with old BL0. (I think I remember that recent
BL0 do remember the status after resume)

Usually such instability is caused by setting the voltage of PMIC low
(because the freq was low) while the default frequency (freq at
boot-up) of SoC is higher.


Cheers,
MyungJoo

>
>
>> You may make it stable by first implementing suspend/resume callback
>> correctly for them.
>>
>> Adding such feature at devfreq subsystem isn't bad as long as it incurs
>> minimal changes (no new extern functions are required for that)
>> and does not affect those who do not need it or shouldn't do it.
>> (recent attempts were not satisfying those criteria)
> Well, I'm not sure if I'm up to the task. I guess I'll give it a try.
>
>
> Thanks for the info!
>
> - Tobias
>
>
>
>> Cheers,
>> MyungJoo
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>



-- 
MyungJoo Ham, Ph.D.
S/W R&D Center, Samsung Electronics
