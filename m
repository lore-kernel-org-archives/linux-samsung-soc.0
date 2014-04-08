From: Chander Kashyap <chander.kashyap@linaro.org>
Subject: Re: AFTR does not work on arndale 5250
Date: Tue, 8 Apr 2014 19:29:54 +0530
Message-ID: <CANuQgHFmD5v8z2RnOrEc+zE5RqSQfig8jjs67fOBk_MUgiAC-Q@mail.gmail.com>
References: <533EAE57.1080202@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f47.google.com ([209.85.219.47]:50928 "EHLO
	mail-oa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756351AbaDHN7z convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 Apr 2014 09:59:55 -0400
Received: by mail-oa0-f47.google.com with SMTP id i11so1032248oag.6
        for <linux-samsung-soc@vger.kernel.org>; Tue, 08 Apr 2014 06:59:54 -0700 (PDT)
In-Reply-To: <533EAE57.1080202@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

Hi Daniel,

I have tested on v3.14 Stable on arndale board.
I have tested wit cramfs.

Last commit on tree is:

01d5f3b598b18a5035426c30801adf65822dbd0c

Below are the logs from the console.
$ uname -a
Linux (none) 3.14.0-00604-g0c6d388 #28 SMP PREEMPT Tue Apr 8 19:19:09
IST 2014 armv7l unknown

$ mount -t sysfs sys sys
/ $ echo 0 > /sys/devices/system/cpu/cpu1/online
[  152.439901] IRQ153 no longer affine to CPU1
[  152.440120] CPU1: shutdown

$ cat /sys/devices/system/cpu/cpu0/cpuidle/state1/usage
39
/ $ cat /sys/devices/system/cpu/cpu0/cpuidle/state1/usage
44
/ $ cat /sys/devices/system/cpu/cpu0/cpuidle/state1/usage
46
/ $ cat /sys/devices/system/cpu/cpu0/cpuidle/state1/usage
51
/ $ cat /sys/devices/system/cpu/cpu0/cpuidle/state1/usage
56
/ $ cat /sys/devices/system/cpu/cpu0/cpuidle/state1/usage
61
/ $


It is working perfectly fine.

If still issue is there, please feel free to ask.

On 4 April 2014 18:36, Daniel Lezcano <daniel.lezcano@linaro.org> wrote=
:
>
> Hi,
>
> I tried to make the idle AFTR state working on arndale 5250 but that =
leads
> to a kernel reboot and crash.
>
> How to reproduce ?
>
> echo 0 > /sys/devices/system/cpu/cpu1/online
>
> Reproductible on v3.14 and samsung/for-next
>
> Any ideas ?
>
> Thanks
>
>   -- Daniel
>
> --
>  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software f=
or ARM SoCs
>
> Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
> <http://twitter.com/#!/linaroorg> Twitter |
> <http://www.linaro.org/linaro-blog/> Blog
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc"
> in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



--=20
with warm regards,
Chander Kashyap
