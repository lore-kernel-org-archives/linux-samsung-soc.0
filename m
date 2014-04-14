From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH RFC 0/2] drm/exynos: refactoring drm device init/deinit
Date: Mon, 14 Apr 2014 13:32:20 +0200
Message-ID: <534BC744.4090406@gmail.com>
References: <1397225488-6634-1-git-send-email-a.hajda@samsung.com> <CAAQKjZMz56YjHtjBrEwOkxbyvdp1t9o9rCU9cFiR7GZOXVsKCw@mail.gmail.com> <534BA252.7060208@samsung.com> <050a01cf57d1$4fee1c60$efca5520$%dae@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f53.google.com ([74.125.83.53]:58513 "EHLO
	mail-ee0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751852AbaDNLcZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Apr 2014 07:32:25 -0400
Received: by mail-ee0-f53.google.com with SMTP id b57so6498796eek.12
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Apr 2014 04:32:23 -0700 (PDT)
In-Reply-To: <050a01cf57d1$4fee1c60$efca5520$%dae@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>, 'Andrzej Hajda' <a.hajda@samsung.com>
Cc: 'Kyungmin Park' <kyungmin.park@samsung.com>, "'moderated list:ARM/S5P EXYNOS AR...'" <linux-samsung-soc@vger.kernel.org>, 'Russell King' <rmk@arm.linux.org.uk>, dri-devel@lists.freedesktop.org, 'Marek Szyprowski' <m.szyprowski@samsung.com>

Hi Inki,

On 14.04.2014 13:04, Inki Dae wrote:
>
>
>> -----Original Message-----
>> From: Andrzej Hajda [mailto:a.hajda@samsung.com]
>> Sent: Monday, April 14, 2014 5:55 PM
>> To: Inki Dae
>> Cc: dri-devel@lists.freedesktop.org; moderated list:ARM/S5P EXYNOS AR...;
>> Kyungmin Park; Marek Szyprowski
>> Subject: Re: [PATCH RFC 0/2] drm/exynos: refactoring drm device
>> init/deinit
>>
>> On 04/12/2014 04:18 PM, Inki Dae wrote:
>>> Hi Andrzej,
>>>
>>> Thanks for your contributions.
>>>
>>> 2014-04-11 23:11 GMT+09:00 Andrzej Hajda <a.hajda@samsung.com>:
>>>> Hi Inki,
>>>>
>>>> This patchset refactors drm device initialization. Details are
>>>> described in respective patches. It is an alternative to DT supernode
>> concept.
>>>>
>>>> The first patch uses linker sections to get rid of ifdef macros, it
>>>> is not
>>> That's a good idea. :) We could avoid ugly #ifdef ~ #endif with this
> way.
>>>
>>>> essential for 2nd patch but it makes code more readable. Similar
>>>> approach is used by irqchip, clks and clk_sources.
>>> But 2nd patch doesn't seem reasnoable to me. Your approach is same as
>>> existing one conceptually. I think we need to handle drm driver in a
>>> different way from irqchip, clks and clk_sources.
>>>
>>> DRM driver means one integrated graphics card but in most embedded
>>> systems, graphics and display relevant devices have separated hardware
>>> resources. So we would need abstractional integrated hardware,
>>> display-subsystem, super device. That is why I are trying to use super
>>> device approach, and conceptually it would be right solution. It
>>> wouldn't be not good to combine those separated hardware somehow using
>>> specific codes.
>>
>> Conceptually both approaches are the same: we have number of devices which
>> should be ready before we can start super-device and if any device is to
>> be removed super-device should be removed before.
>> The difference is in 'details':
>> - super-node approach have list of components provided explicitly in DT
>> special node,
>> - in this approach list of components is constructed from devices present
>> in the system.
>>
>> Creating special DT node with information which is available anyway seems
>> to be redundant and against DT rules.
>>
>
> CCing Russell King,
>
> What is the special DT node? You mean device node from ports property?
>
> It is supposed  to use super device and its properties in mainline so I
> don't see what it is against DT rules. If they are really against DT rules,
> why component framework is in mainline?

Component framework in mainline doesn't have anything in common with DT. 
All it does is providing tools for handling cases where a subsystem can 
be initialized only after all components are available. It doesn't 
define any means of getting the list of components, it's a task for the 
user of this framework to provide it.

>
> As you said above, conceptually both approaches may be the same but your
> approach has no any abstract hardware meaning one integrated hardware. And
> if conceptually both approaches are the same, it would be good to use
> existing infrastructure, component framework so there is no any reason to
> add and use specific codes.

What do you mean by "abstract hardware"? Physically, in the SoC, there 
is no single integrated hardware block, but multiple IPs and they need 
to be described this way in DT. There is nothing that prevents using 
them separately if a user doesn't want to use Exynos DRM. Exynos DRM is 
a Linux-specific thing and its details should not be leaked into DT, 
which is a _hardware_ description method.

>
> And component framework says,
> "Subsystems such as ALSA, DRM and others require a single card-level device
> structure to represent a subsystem. However, firmware tends to describe the
> individual devices and the connections between them. Therefore, we need a
> way to gather up the individual component devices together, and indicate
> when we have all the component devices."

Note following things:

- Nothing in the quote above says that an additional DT node must be 
added. The framework works on generic driver model level, above the 
description level (such as DT).

- Andrzej's method implements the same concept as component framework, 
except that:

   a) it does so in a much more simple way (compare amount of code 
needed for Andrzej's approach and inside component framework),

   b) doesn't require component initialization to be undone on every 
master bring-up failure,

   c) uses the list of drivers known at compilation time to the Exynos 
DRM subsystem to build the list of devices to wait for

   d) doesn't introduce any new DT bindings, for virtual, Linux-specific 
things,

   e) doesn't duplicate compatible strings in an array used only to 
support systems that didn't have nodes required by those new DT bindings 
(as done in your exynos_drm_bind_lagacy_dt()),

   f) doesn't require two-step initialization (probe() and bind()), as 
opposed to component subsystem.

As you can see, it's a pure list of benefits, without any obvious 
drawbacks, except that some generic code (more or less applicable here) 
is not used.

However, I wonder whether some of Andrzej's ideas couldn't be simply 
adopted by component framework (mostly b)) and Exynos DRM use of it (c), 
d), e)) to take best of both worlds and have both a good implementation 
and generic code reused.

Best regards,
Tomasz
