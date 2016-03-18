From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [rtc-linux] Re: [PATCH v3] rtc: s3c: Don't print an error on
 probe deferral
Date: Fri, 18 Mar 2016 10:56:08 -0300
Message-ID: <56EC08F8.2080400@osg.samsung.com>
References: <1458005918-7893-1-git-send-email-javier@osg.samsung.com>
 <56E76A57.7070104@samsung.com> <56E76C6F.5020803@osg.samsung.com>
 <56E772F2.2030507@samsung.com> <56E77A6A.2090604@osg.samsung.com>
 <56EBED45.6070000@osg.samsung.com> <20160318120717.GD2531@piout.net>
 <CAJKOXPeam-rpnijB0OgGxbY2rdtVwqwdEyHb_LOyzZnXuY82vg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:54503 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754971AbcCRN4Q (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 18 Mar 2016 09:56:16 -0400
In-Reply-To: <CAJKOXPeam-rpnijB0OgGxbY2rdtVwqwdEyHb_LOyzZnXuY82vg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, rtc-linux@googlegroups.com
Cc: linux-kernel@vger.kernel.org, Joe Perches <joe@perches.com>, linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>

Hello Krzysztof,

On 03/18/2016 09:20 AM, Krzysztof Kozlowski wrote:
> On Fri, Mar 18, 2016 at 9:07 PM, Alexandre Belloni
>> On 18/03/2016 at 08:57:57 -0300, Javier Martinez Canillas wrote :

[snip]

>>>
>>> Just to make sure that I understood correctly, there's no action I
>>> should take in order for this patch to be picked right? IOW, the
>>> current version is OK?
>>>
>>
>> I was kind of waiting an answer on the question whether the core already
>> prints a message when probe dereferral happens because in that case,
>> there is no need for a debug message and we can indeed simplify the
>> whole block.
> 
> Although I did not test it, I think the core will print generic defer
> message. See really_probe() around line 400:
> http://lxr.free-electrons.com/source/drivers/base/dd.c?v=4.4#L347
> 
> However the cause of deferring will not be printed... so I find some
> use of debug message in driver... On the other hand, not many drivers
> are doing this. Ehh, I guess I am just really picky. :)
>

It's Ok, I also have doubts about which direction to take even when
writing trivial patches like $SUBJECT, so I understand the feeling :)

> BR,
> Krzysztof
> 

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
