From: MyungJoo Ham <myungjoo.ham@gmail.com>
Subject: Re: [PATCH 3/4] ARM Exynos4210-Nuri: remove compiler errors
Date: Mon, 5 Dec 2011 13:55:28 +0900
Message-ID: <CAJ0PZbS2iarzcS1LZq9TK0GbKWgCXKPba00sSLkYe8YY_3EA9w@mail.gmail.com>
References: <1322730317-8171-1-git-send-email-myungjoo.ham@samsung.com>
	<1322730317-8171-4-git-send-email-myungjoo.ham@samsung.com>
	<04f901ccb0d0$b94191b0$2bc4b510$%kim@samsung.com>
	<CAJ0PZbTKgqgg3SZN3KyVFzGDuSU8qjM5NjwNcM28mtmzfbS0Xw@mail.gmail.com>
	<000201ccb19d$9ab31070$d0193150$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:53924 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755134Ab1LEEza (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 4 Dec 2011 23:55:30 -0500
In-Reply-To: <000201ccb19d$9ab31070$d0193150$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>, Kevin Hilman <khilman@ti.com>, Russell King <linux@arm.linux.org.uk>, Kyungmin Park <kyungmin.park@samsung.com>

On Sat, Dec 3, 2011 at 6:26 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> MyungJoo Ham wrote:
>>
>> On Fri, Dec 2, 2011 at 5:59 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:
>> > MyungJoo Hamm wrote:
>> >>
>> > What's the 'compiler errors'?
>> >
>> > And I don't know why this patch included in this series, maybe this
>> should
>> > be separated from this series?
>>
>> The error is:
>> arch/arm/mach-exynos/mach-nuri.c: In function 'nuri_power_init':
>> arch/arm/mach-exynos/mach-nuri.c:1080:2: error: implicit declaration
>> of function 'irq_alloc_descs'
>
> Well, I couldn't find the 'irq_alloc_descs' at the
> arch/arm/mach-exynos/mach-nuri.c file in my tree and linux-next. Maybe you
> missed submitting some patches?
>
> And I don't know why inclusion of <linux/export.h> is needed for
> 'irq_alloc_descs'...
>
>> It is due to the recent changes in some of the header files (they
>> removed some header inclusion from header fiiles).
>>
> I think, if this is required, this fix should be separated because the build
> error what you said will be happened without this series...
>
>> In this patchset, we are providing a test case (Exynos4210-Nuri) for
>> the device driver and we had to resolve the compiler error first.
>>
> If so, yes, firstly that should be fixed...but now don't we need this?
>
> Thanks.
>
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
>

Ah.. as you've mentioned, the compiler error is found to be related
with other unmerged patches (sparse IRQ). Please never mind this
patch. This (patch 3/4) should be dropped from this patchset.

Thank you.



Cheers!
MyungJoo

-- 
MyungJoo Ham, Ph.D.
Mobile Software Platform Lab, DMC Business, Samsung Electronics
