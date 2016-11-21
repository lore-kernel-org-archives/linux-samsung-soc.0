From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: PM / devfreq: exynos-bus: need for suspend OPP?
Date: Mon, 21 Nov 2016 16:16:24 +0100
Message-ID: <58330FC8.5090606@math.uni-bielefeld.de>
References: <5832F792.4010308@math.uni-bielefeld.de>
 <7d5d2c7c-6ebb-b4c1-5f3f-f794c249ca36@fivetechno.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:54139 "EHLO
        smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752814AbcKUPQ2 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 21 Nov 2016 10:16:28 -0500
In-Reply-To: <7d5d2c7c-6ebb-b4c1-5f3f-f794c249ca36@fivetechno.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Markus Reichl <m.reichl@fivetechno.de>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>

Hello Markus,


Markus Reichl wrote:
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
thanks for the tests. I assume by 'reboots hung' you mean that the boot
process doesn't even reach u-boot?

- Tobias


> This could support your thoughts above.
> 
> Servus,
> --
> Markus
>>
>>
>> With best wishes,
>> Tobias
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
