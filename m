From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v2 00/12] Samsung PM consolidation part 2 (multiplatform)
Date: Sat, 08 Feb 2014 03:42:53 +0100
Message-ID: <52F599AD.5070200@gmail.com>
References: <1391713977-22300-1-git-send-email-t.figa@samsung.com>	<20140207221537.GA12714@quad.lixom.net>	<52F57372.7010507@gmail.com> <CAD=FV=UPH4vf2-5GuOypkkbMsDPmM7dPZJtFpHs+wBsN0wy8=Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f45.google.com ([74.125.83.45]:56003 "EHLO
	mail-ee0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751246AbaBHCm7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 7 Feb 2014 21:42:59 -0500
Received: by mail-ee0-f45.google.com with SMTP id b15so1856602eek.32
        for <linux-samsung-soc@vger.kernel.org>; Fri, 07 Feb 2014 18:42:58 -0800 (PST)
In-Reply-To: <CAD=FV=UPH4vf2-5GuOypkkbMsDPmM7dPZJtFpHs+wBsN0wy8=Q@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Olof Johansson <olof@lixom.net>, Tomasz Figa <t.figa@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>

Hi Doug,

On 08.02.2014 01:51, Doug Anderson wrote:
> Tomasz,
>
> On Fri, Feb 7, 2014 at 3:59 PM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
>>
>>
>> On 07.02.2014 23:15, Olof Johansson wrote:
>>>
>>> On Thu, Feb 06, 2014 at 08:12:45PM +0100, Tomasz Figa wrote:
>>>
>>>> On Exynos4210-based Trats, Exynos4412-based Trats2 and Exynos5250-based
>>>> Arndale boards (except suspend/resume, which is broken because of
>>>> unrelated reasons):
>>>
>>>
>>> Has this been reported, and is it being worked on by anyone?
>>
>>
>> Yes, reported quite a long time ago by Vikas Sajjan of Samsung/Linaro, but
>> I'm not sure if anybody is working to fix it.
>>
>> I've been looking into this for a while, but couldn't really find anything
>> except that it hangs when PMU starts power state transtion after CPU
>> executing WFI instruction.
>
> It's likely it's something else, but just in case I'll point you to a
> bug that we fixed that had the same symptom.  There's some details
> (and a lot of noise) in <http://crbug.com/218132>.  ...or maybe just
> look at the root cause at <http://crosreview.com/42067>.

OK. Thanks for pointing me to this. Will do some more tests back at the 
office after the weekend.

Best regards,
Tomasz
