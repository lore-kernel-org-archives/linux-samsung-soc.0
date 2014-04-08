From: Vikas Sajjan <sajjan.linux@gmail.com>
Subject: Re: AFTR does not work on arndale 5250
Date: Tue, 8 Apr 2014 19:02:42 +0530
Message-ID: <CAGm_ybjL-oA_C=VH4MMt_X45hrdKt8GMkwQtq5EJ94TvA4iqYw@mail.gmail.com>
References: <533EAE57.1080202@linaro.org>
	<5343D709.10708@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f47.google.com ([209.85.219.47]:48628 "EHLO
	mail-oa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756695AbaDHNcn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 Apr 2014 09:32:43 -0400
Received: by mail-oa0-f47.google.com with SMTP id i11so987649oag.6
        for <linux-samsung-soc@vger.kernel.org>; Tue, 08 Apr 2014 06:32:42 -0700 (PDT)
In-Reply-To: <5343D709.10708@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Tomasz Figa <t.figa@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Tushar Behera <tushar.behera@linaro.org>, sunil joshi <joshi@samsung.com>

 Hi Daniel,

 I checked AFTR on v3.14 (
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/log/?id=refs/tags/v3.14)
 on exynos5250 based chromebook (exynos5250-snow.dtb)

I am able to hotplug CPU1  (echo 0 > /sys/devices/system/cpu/cpu1/online).
I can see, it enters exynos4_enter_core0_aftr() when I hotplug CPU1.



On Tue, Apr 8, 2014 at 4:31 PM, Tomasz Figa <t.figa@samsung.com> wrote:
> Hi Daniel,
>
>
> On 04.04.2014 15:06, Daniel Lezcano wrote:
>>
>>
>> Hi,
>>
>> I tried to make the idle AFTR state working on arndale 5250 but that
>> leads to a kernel reboot and crash.
>>
>> How to reproduce ?
>>
>> echo 0 > /sys/devices/system/cpu/cpu1/online
>>
>> Reproductible on v3.14 and samsung/for-next
>>
>> Any ideas ?
>
>
> Added some people that I know that have been working with Arndale.
>
> Best regards,
> Tomasz
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc"
> in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
