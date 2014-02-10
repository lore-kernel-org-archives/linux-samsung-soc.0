From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 1/1] ARM: EXYNOS: Consolidate Kconfig entries
Date: Mon, 10 Feb 2014 10:20:23 +0530
Message-ID: <CAK9yfHxi7EPTdeMoLYHrnomC3w5OpEux6vOHPeOEKhZg9Jw8+g@mail.gmail.com>
References: <1391687996-26011-1-git-send-email-sachin.kamat@linaro.org>
	<5101685.tPb8PWOH5Q@amdc1032>
	<CAOesGMi8SUXzxJSW4yoywLQn0C7HmPL81iCQqxg9uZp_jN7yPQ@mail.gmail.com>
	<7214831.iPsDTEq8CU@amdc1032>
	<CAOesGMhGTVQex7vu49QnHv2HsdE7S8jz7oKY04FsT4Hg1VR7sA@mail.gmail.com>
	<52F50ACC.3020105@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f182.google.com ([209.85.214.182]:41407 "EHLO
	mail-ob0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751678AbaBJEuY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 9 Feb 2014 23:50:24 -0500
Received: by mail-ob0-f182.google.com with SMTP id wm4so6688081obc.41
        for <linux-samsung-soc@vger.kernel.org>; Sun, 09 Feb 2014 20:50:23 -0800 (PST)
In-Reply-To: <52F50ACC.3020105@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: Olof Johansson <olof@lixom.net>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>

On 7 February 2014 22:03, Tomasz Figa <t.figa@samsung.com> wrote:
> On 06.02.2014 19:59, Olof Johansson wrote:
>>
>> On Thu, Feb 6, 2014 at 10:43 AM, Bartlomiej Zolnierkiewicz
>> <b.zolnierkie@samsung.com> wrote:
>>
>>>>> Well, once again, seeing some numbers would be good. :)
>>>>
>>>>
>>>> What numbers do you want? Size comparisons with all SoC options on vs
>>>> only one?
>>>
>>>
>>> Yes, size comparisions with all SoCs (for given family) turned on vs
>>> only one turned on (done on kernel without this patch applied).
>>>
>>> Also size comparisons for ARCH_EXYNOS4 and ARCH_EXYNOS5 both turned
>>> on vs only ARCH_EXYNOS4 or ARCH_EXYNOS5 turned on (with this patch
>>> applied).
>>
>>
>> exynos_defconfig-based build data below.
>>
>>     text    data     bss     dec     hex filename
>> 5109986  319952  270196 5700134  56fa26 obj-tmp/vmlinux   # all 4+5 SoCs
>> enabled
>> 5088312  296912  270196 5655420  564b7c obj-tmp/vmlinux  # EXYNOS5
>> off, all EXYNOS4 SoCs enabled
>> 5088032  296896  270196 5655124  564a54 obj-tmp/vmlinux  # Only 4210
>> enabled
>> 5079205  299928  270068 5649201  563331 obj-tmp/vmlinux  # EXYNOS4
>> off, all EXYNOS5 SoCs enabled
>> 5063355  286792  270068 5620215  55c1f7 obj-tmp/vmlinux   # Only 5250
>> enabled
>> 5067815  298152  270068 5636035  55ffc3 obj-tmp/vmlinux    # Only
>> 5250+5420 enabled
>> 5053357  278480  269364 5601201  5577b1 obj-tmp/vmlinux  # Only 5440
>> enabled
>>
>> The main difference of disabling 5440 is that it removed the PCI
>> support, which explains that reduction in size.
>>
>> So, I would argue that theere might be some value in disabling whole
>> families (since it saves about 20k of text and the same of data), but
>> that there's less gain per SoC member. 5440 is an oddball in this
>> setup so it might make sense to treat it differently due to the PCI
>> aspect.
>
>
> Well, the numbers basically represent what I expected. Thanks for checking
> this.

Thanks to Olof for coming out with these numbers.

>So I second this patch even more now,

Thanks Tomasz :)

> but maybe let's change it a bit
> and introduce third entry for Exynos5440, since it doesn't really belong to
> either of ARCHs. Candidates that come to my mind are ARCH_EXYNOS5440 (seems
> to specific) or ARCH_EXYNOS5_SERVER. Feel free to suggest anything better,
> though.

Though Exynos5440 belongs to the Exynos5 family, it is different in a
few ways and hence
I preferred to keep it as a separate entry for now. I agree with your
suggestion to have a third
ARCH category but I would prefer to wait for a while until we have one
more candidate for this
category so that we have a bit more data for naming and grouping.

-- 
With warm regards,
Sachin
