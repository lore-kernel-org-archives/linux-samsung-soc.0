From: Abhilash Kesavan <kesavan.abhilash@gmail.com>
Subject: Re: [PATCH v6 0/5] MCPM backend for Exynos5420
Date: Wed, 14 May 2014 09:45:44 +0530
Message-ID: <CAM4voanvVwj+FuWazTGMHMnM64Cw_qK03D3o=raS43f_zWFfog@mail.gmail.com>
References: <1399982324-27879-1-git-send-email-a.kesavan@samsung.com>
	<alpine.LFD.2.11.1405131325060.980@knanqh.ubzr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qg0-f53.google.com ([209.85.192.53]:45679 "EHLO
	mail-qg0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750718AbaENEPo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 May 2014 00:15:44 -0400
Received: by mail-qg0-f53.google.com with SMTP id f51so1894405qge.26
        for <linux-samsung-soc@vger.kernel.org>; Tue, 13 May 2014 21:15:44 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.11.1405131325060.980@knanqh.ubzr>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Andrew Bresticker <abrestic@chromium.org>, Thomas P Abraham <thomas.ab@samsung.com>, "inderpal.s@samsung.com" <inderpal.s@samsung.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Dave Martin <Dave.Martin@arm.com>, Tomasz Figa <t.figa@samsung.com>

Hi Nicolas,

On Tue, May 13, 2014 at 11:25 PM, Nicolas Pitre
<nicolas.pitre@linaro.org> wrote:
> On Tue, 13 May 2014, Abhilash Kesavan wrote:
>
>> This is v6 of the series adding MCPM backend support for SMP secondary boot
>> and core switching on Samsung's Exynos5420. The patches are based on the mcpm
>> support added for Exynos5420 in the Chromium kernel repository here:
>> https://chromium.googlesource.com/chromiumos/third_party/kernel-next/+/chromeos-3.8
>>
>> The patches have been prepared on Kukjin Kim's for-next branch and tested on
>> SMDK5420 EVT1 as well as an exynos5420 based chromebook (peach-pit) using the
>> "/dev/b.L_switcher" user interface. Secondary core boot-up has also been tested
>> on both the boards.
>
> OK... Now it is time for real testing.  :-)
>
> The /dev/b.L_switcher interface tests the switcher.  Here you really
> want to hammer the MCPM functionalities and especially your backend code
> as hard as possible.  I therefore recommend the following test script:
>
> ---------- >8
> #!/bin/bash
>
> echo 0 >/sys/kernel/bL_switcher/active
> sleep 1
>
> pids=
> for cpu in /sys/devices/system/cpu/cpu?/online; do
>   { cpu_nr=${cpu:27:1}
>     while true; do
>       echo 1 > $cpu 2> /dev/null
>       sleep .00$RANDOM
>       val1=$(cat $cpu)
>       echo 0 > $cpu 2> /dev/null
>       sleep .00$RANDOM
>       val0=$(cat $cpu)
>       [ "$val1" = "1" -a "$val0" = "0" ] && echo -n $cpu_nr
>     done
>   } &
>   pids="$pids $!"
> done
>
> trap "kill $pids; echo" 0 15
> wait $pids
> ---------- >8
>
> Leave this running for a couple hours making sure you see all CPU
> numbers being printed.  The printing order will be random, but each CPU
> number should continuously appear.
I tried this script and I get two errors:

1) can't create /sys/devices/system/cpu/cpu//online: nonexistent directory
2) sleep: invalid number '.0026736'


For 1) the cpu number is not being appended. if I give a particular
cpu in the script then hotplug in/out works fine.
For 2) a constant msleep 10 works.

Is it OK for me to modify the script to hotplug in/off a randomly chosed core ?

Regards,
Abhilash
>
>
> Nicolas
