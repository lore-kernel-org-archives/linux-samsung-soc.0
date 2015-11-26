From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH 1/2] drivers: amba: properly handle devices with power domains
Date: Thu, 26 Nov 2015 08:04:35 -0700
Message-ID: <CANLsYkynahvfiiEqgbQ34iRBf+_ZCXH2WjkugmZaAc4ExDFH6g@mail.gmail.com>
References: <1448456127-31842-1-git-send-email-m.szyprowski@samsung.com>
	<1448456289-31960-1-git-send-email-m.szyprowski@samsung.com>
	<20151125132458.GL8644@n2100.arm.linux.org.uk>
	<5655B8F6.1070104@samsung.com>
	<CAPDyKFqTqPijF+Lbq0+a-Gv8CyaAr13JvZPjUN1-GNL5i3-mAw@mail.gmail.com>
	<20151125180953.GN8644@n2100.arm.linux.org.uk>
	<5656C527.8040804@samsung.com>
	<CAPDyKFqQ_BuvtVnrsEdZCpXVKcDW9rAxteK1DOvHNqN7TN4sLw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f182.google.com ([209.85.214.182]:34740 "EHLO
	mail-ob0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751441AbbKZPEf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 26 Nov 2015 10:04:35 -0500
Received: by obbbj7 with SMTP id bj7so64393592obb.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Nov 2015 07:04:35 -0800 (PST)
In-Reply-To: <CAPDyKFqQ_BuvtVnrsEdZCpXVKcDW9rAxteK1DOvHNqN7TN4sLw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On 26 November 2015 at 03:24, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> On 26 November 2015 at 09:39, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>> Hello,
>>
>> On 2015-11-25 19:09, Russell King - ARM Linux wrote:
>>>
>>> On Wed, Nov 25, 2015 at 02:56:10PM +0100, Ulf Hansson wrote:
>>>>
>>>> On 25 November 2015 at 14:34, Marek Szyprowski <m.szyprowski@samsung.com>
>>>> wrote:
>>>>>
>>>>> Is ignoring dev_pm_domain_attach() return value a solution for you?
>>>>
>>>> That's probably better than nothing, but I wonder if it in practice
>>>> will have any effect?
>>>
>>> If the PM domain is down, then trying to tread the ID is likely to oops
>>> the kernel.
>>
>>
>> In my case kernel simply hangs (no single message, even when earlyprintk is
>> enabled)
>> instead of oopsing, that's why I've submitted this patch.
>>
>
> Okay.
>
> I suggest we go ahead and try that approach (ignoring the return
> value). It's "quick fix", but the easiest way forward to solve the
> problem.
>
> My only concern is if such change impacts the boot time. We should do
> some tests to see if the change is negligible, if not we should
> probably think of something else (like keeping the PM domain powered
> until late_init).
>
> Russell, what do you think?

That's the approach I took for coresight on Juno - simply initialise
the power domain very early on and keep it on for things like amba
probing to be successful.  When the boot process is done unused genPDs
are switched off automatically.  That way we don't need to add extra
code to amba.

>
> Kind regards
> Uffe
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
