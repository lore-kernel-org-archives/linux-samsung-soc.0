From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: Re: PM / devfreq: exynos-bus: need for suspend OPP?
Date: Tue, 22 Nov 2016 00:06:03 +0900
Message-ID: <CAJ0PZbT6FDC382Z7N8ky+MX2auekCGSOuES8O3L3FtnGc6XOWw@mail.gmail.com>
References: <5832F792.4010308@math.uni-bielefeld.de> <7d5d2c7c-6ebb-b4c1-5f3f-f794c249ca36@fivetechno.de>
Reply-To: myungjoo.ham@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:35832 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753755AbcKUPGU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 21 Nov 2016 10:06:20 -0500
Received: by mail-it0-f67.google.com with SMTP id b123so15512091itb.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 21 Nov 2016 07:06:19 -0800 (PST)
In-Reply-To: <7d5d2c7c-6ebb-b4c1-5f3f-f794c249ca36@fivetechno.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Markus Reichl <m.reichl@fivetechno.de>
Cc: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>

On Mon, Nov 21, 2016 at 11:48 PM, Markus Reichl <m.reichl@fivetechno.de> wrote:
> Hi Tobias,
>
> Am 21.11.2016 um 14:33 schrieb Tobias Jakobi:
>> Hello everyone,
>>
>> I was thinking about the following. At the moment we have a suspend OPP
>> for cpufreq-dt in place for the Exynos4412 SoC (added in
>> 1605b60ad064c7019db8ade07f0b7bdc8c197b93). The rationale behind is that
>> the board using the SoC might not have some PMIC reset in place. In case
>> the board goes into reboot with a low OPP (i.e. low frequency, but also
>> low core voltage), this results in a hang when the first-stage
>> bootloaders sets its default core frequency.
>>
>> So this is properly handled in the kernel just fine, except for some
>> corner cases like emergency reboot.
>>
>> But some time ago devfreq support for the various busses in the
>> Exynos4412 was added. On the ODROID boards e.g. this adjust MIF and INT
>> voltage.
>>
>> Let us take the DMC bus. Operating frequency is 100~400MHz and voltage
>> is 900~1050mV.
>>
>> Now let's look at the corresponding board file
>> (http://git.denx.de/?p=u-boot.git;a=blob;f=board/samsung/odroid/odroid.c#l234)
>> in upstream u-boot. If I read this correctly DMC is set to 400MHz there.
>>
>> Here's the question. Could this, similar to the cpufreq/core frequency
>> issue, pose a problem when the kernel goes into reboot when DMC is on
>> the lowest OPP state?
>>
>> I'm not saying that it does. This just came to my mind during some
>> recent discussion.
>
> Made a test with
> # echo performance > /sys/class/devfreq/bus_leftbus/governor
> # echo performance > /sys/class/devfreq/bus_dmc/governor
> just before reboot.
>
> 20 out of 20 reboots worked.
>
> With devfreq simple_ondemand governor around 50% reboots hung.
>
> This could support your thoughts above.
>
> Servus,
> --
> Markus

Either in each device driver (just implemented in the suspend/resume callback)
or in subsystem code, we may need to handle the inconsistency after resume.

This is normally because the BL0 bootloader of the CPU simply resets the values
at wake-up. I think recent Exynos series don't do that anymore, but
4412 might be
the one before such improvement.

You may make it stable by first implementing suspend/resume callback
correctly for them.

Adding such feature at devfreq subsystem isn't bad as long as it incurs
minimal changes (no new extern functions are required for that)
and does not affect those who do not need it or shouldn't do it.
(recent attempts were not satisfying those criteria)



Cheers,
MyungJoo
