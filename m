From: Kevin Hilman <khilman@kernel.org>
Subject: Re: [PATCH] MAINTAINERS: ARM: EXYNOS: Add Krzysztof Kozlowski asco-maintainer
Date: Fri, 15 May 2015 07:15:53 -0700
Message-ID: <CAMAWPa-9QTX-_YGBD8WXT5eVT5AsxpnMqOMWhLNcxAdNwY_tsw@mail.gmail.com>
References: <1431605720-828-1-git-send-email-k.kozlowski@samsung.com>
	<55549C56.6050509@kernel.org>
	<CABxcv==2ouDFPE2sBdqCwpACYXCCGnJYQFtbOV2PuVNGnv2q=g@mail.gmail.com>
	<5554ABF4.80002@gmx.net>
	<7hfv6z17iw.fsf@deeprootsystems.com>
	<CAOesGMg6vETz1dCgHE1WYUJZ3XdHjdku9YCauYPS-a-avk89HQ@mail.gmail.com>
	<CAJKOXPcsAuv0XgTOYQMo1VVReH8U+g1g+VzcCKg+kN2vhBKWVA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:56093 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753698AbbEOOP6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 15 May 2015 10:15:58 -0400
Received: from mail.kernel.org (localhost [127.0.0.1])
	by mail.kernel.org (Postfix) with ESMTP id 1EDB820534
	for <linux-samsung-soc@vger.kernel.org>; Fri, 15 May 2015 14:15:57 +0000 (UTC)
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com [209.85.212.177])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 2BC1B20513
	for <linux-samsung-soc@vger.kernel.org>; Fri, 15 May 2015 14:15:55 +0000 (UTC)
Received: by wicnf17 with SMTP id nf17so138867729wic.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 15 May 2015 07:15:53 -0700 (PDT)
In-Reply-To: <CAJKOXPcsAuv0XgTOYQMo1VVReH8U+g1g+VzcCKg+kN2vhBKWVA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Linux Kernel <linux-kernel@vger.kernel.org>, Tobias Jakobi <liquid.acid@gmx.net>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier@dowhile0.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Thu, May 14, 2015 at 4:50 PM, Krzysztof Kozlowski
<k.kozlowski@samsung.com> wrote:
> 2015-05-15 1:45 GMT+09:00 Olof Johansson <olof@lixom.net>:
>> On Thu, May 14, 2015 at 8:52 AM, Kevin Hilman <khilman@kernel.org> wrote:
>>> Tobias Jakobi <liquid.acid@gmx.net> writes:
>>>
>>>> Javier Martinez Canillas wrote:
>>>>> Hello Kukjin,
>>>>>
>>>>> On Thu, May 14, 2015 at 3:00 PM, Kukjin Kim <kgene@kernel.org> wrote:
>>>>>> On 05/14/15 21:15, Krzysztof Kozlowski wrote:
>>>>>>> Add Krzysztof Kozlowski as a co-maintainer of Samsung Exynos ARM
>>>>>>> architecture to review the patches. Patches will go as usual - picked up
>>>>>>> by Kukjin Kim.
>>>>>>>
>>>>>> Hi Krzysztof,
>>>>>>
>>>>>> Sorry, I don't agree with this patch because you can review any exynos
>>>>>> patches without maintainer title. And I can focus on the maintainer'r
>>>>>> role more than now because of change of role ;-) Of course your review
>>>>>> would be helpful to me.
>>>>>>
>>>>>
>>>>> Sorry but I disagree. Krzysztof has been very active reviewing Exynos
>>>>> patches and even picking/queuing important fixes while it seems you
>>>>> were too busy and couldn't pay close attention.
>>>> I would even go further than that. We're in this situation because the
>>>> current maintainer didn't do his job properly.
>>>>
>>>> I want to point out what gregkh once said about this matter:
>>>> https://youtu.be/iiED1K98lnw?t=1745
>>>>
>>>>
>>>>
>>>>> It's really great that due a role change you will have more time to
>>>>> focus on the maintainership but I don't see why having more
>>>>> maintainers could be something negative. As long as you work in a
>>>>> coordinate manner, the more maintainers we have the better IMHO. It
>>>>> may be that in the future you change your role at your company again
>>>>> and then it will be good to have something else to take care of the
>>>>> posted patches ;-)
>>>> I very much agree with Javier here. Krzysztof promptly responds to
>>>> patches and usually provides detailed feedback when things need changes.
>>>> It would be stupid not to accept him as an additional maintainer.
>>>
>>> I'll take this as an Acked-by then.
>>>
>>> FWIW, I agree with Tobias and Javier, extra help for exynos has been
>>> sorely needed for a long time, and I am very happy to see someone
>>> stepping up to help.  Thank you Krzysztof!  (and I apologize in advance
>>> for the many times I'm likely to misspell your name ;)
>>>
>>> I'll be applying this to the arm-soc tree,
>>
>> I agree, I think it's a great improvement to get another official
>> maintainer of Samsung's platforms that can share the load and send us
>> code.
>>
>> While I often also use the argument that anyone can help review code
>> without being named a maintainer, in the particular case of Exynos
>> platforms there's a dire need for more close attention: They're
>> frequently broken for long periods of time and there's been high
>> latency for fixes, which has made bisecting hard or impossible for new
>> failures. Naming Krzysztof as co-maintainer makes it more clear that
>> we're happy to merge code from him directly as appropriate for latency
>> reasons and so on.
>>
>> So:
>>
>> Acked-by: Olof Johansson <olof@lixom.net>
>
> Thank you Javier, Tobias, Kevin and Olof for your support.
> Receiving patches directly to the mailbox should help in smooth review
> although my gmail filters work quite good to grab them from the lists.
>
> P.S. Kevin, the hardest part would be to pronounce my name,

Hopefully we get to meet in person some day and you can teach me. :)

Anyways, this patch has now been applied to arm-soc/fixes and merged
into arm-soc/for-next.  Thanks again for stepping up to help!

Kevin
