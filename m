From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH V4 10/20] ARM: exynos: cpuidle: Move clock setup to pm.c
Date: Fri, 11 Apr 2014 10:30:14 +0200
Message-ID: <5347A816.4020609@linaro.org>
References: <1397123751-1957-1-git-send-email-daniel.lezcano@linaro.org> <1397123751-1957-11-git-send-email-daniel.lezcano@linaro.org> <5346A367.2070107@samsung.com> <5346A958.1030302@linaro.org> <5346BA09.9020708@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f177.google.com ([209.85.212.177]:49685 "EHLO
	mail-wi0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751586AbaDKI3z (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 11 Apr 2014 04:29:55 -0400
Received: by mail-wi0-f177.google.com with SMTP id cc10so603536wib.4
        for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Apr 2014 01:29:54 -0700 (PDT)
In-Reply-To: <5346BA09.9020708@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>, kgene.kim@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linaro-kernel@lists.linaro.org, b.zolnierkie@samsung.com, sachin.kamat@linaro.org, viresh.kumar@linaro.org, rjw@rjwysocki.net

On 04/10/2014 05:34 PM, Tomasz Figa wrote:
> On 10.04.2014 16:23, Daniel Lezcano wrote:
>> On 04/10/2014 03:57 PM, Tomasz Figa wrote:
>>> Hi Daniel,
>>>
>>> On 10.04.2014 11:55, Daniel Lezcano wrote:
>>>> One more step is moving the clock ratio setting at idle time in pm=
=2Ec
>>>>
>>>> The macro names have been changed to be consistent with the other
>>>> macros
>>>> name in the file.
>>>>
>>>> Note, the clock divider was working only when cpuidle was enabled
>>>> because it
>>>> was in its init routine. With this change, the clock divider is se=
t in
>>>> the pm's
>>>> init routine, so it will also operate when the cpuidle driver is n=
ot
>>>> set, which
>>>> is good.
>>>>
>>>> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
>>>> Reviewed-by: Viresh Kumar <viresh.kumar@linaro.org>
>>>> Reviewed-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
>>>> Reviewed-by: Tomasz Figa <t.figa@samsung.com>
>>>> ---
>>>>   arch/arm/mach-exynos/cpuidle.c  |   54
>>>> ---------------------------------------
>>>>   arch/arm/mach-exynos/pm.c       |   35 +++++++++++++++++++++++++
>>>>   arch/arm/mach-exynos/regs-pmu.h |   19 ++++++++++++++
>>>>   3 files changed, 54 insertions(+), 54 deletions(-)
>>>
>>> Sorry that I didn't mention that before, but now I recall that ther=
e was
>>> already a similar patch moving this code to Exynos5250 clock driver=
,
>>> which is the best place for setup of any CMU registers and a step
>>> towards removing one more static IO mapping.
>>
>> Yes, Bartlomiej mentioned it.
>>
>> Is it possible to merge this mentioned patch or to give a pointer to=
 it
>> so I can integrate it into the patchset ?
>
> http://marc.info/?l=3Dlinux-arm-kernel&m=3D138147021207626&w=3D2
>
> I wonder if it still applies cleanly, though...

Ok, if I refer to the date, this patch has been lost in the limbus. So =
I=20
can integrate it with my patchset without conflicting with any tree. Ri=
ght ?

--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
