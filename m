From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 0/6] ARM: s3cxxxx: Use PWM lookup table
Date: Tue, 6 Oct 2015 21:27:40 +0900
Message-ID: <5613BE3C.60404@samsung.com>
References: <1444049237-29878-1-git-send-email-thierry.reding@gmail.com>
 <561315C2.9040506@samsung.com> <20151006084304.GA22087@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f50.google.com ([209.85.220.50]:36309 "EHLO
	mail-pa0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752006AbbJFM1q (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 6 Oct 2015 08:27:46 -0400
Received: by pablk4 with SMTP id lk4so208634165pab.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 06 Oct 2015 05:27:45 -0700 (PDT)
In-Reply-To: <20151006084304.GA22087@ulmo.nvidia.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Tomasz Figa <tomasz.figa@gmail.com>
Cc: k.kozlowski.k@gmail.com, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

W dniu 06.10.2015 o 17:43, Thierry Reding pisze:
> On Tue, Oct 06, 2015 at 09:28:50AM +0900, Krzysztof Kozlowski wrote:
>> On 05.10.2015 21:47, Thierry Reding wrote:
>>> Back when the PWM framework was introduced the concept of PWM lookup
>>> tables was added to allow board code to register a table of PWM devices
>>> and their association with consumers. The goal is to allow drivers to
>>> use a unified method to request PWM devices. At the same time, since no
>>> boards were exposing these tables, fallback code was kept in drivers to
>>> allow old code to remain functional. In order to get rid of the legacy
>>> fallback code, legacy users need to be updated to register PWM lookup
>>> tables.
>>>
>>> This series converts all s3c24xx and s3c64xx boards that hook up a pwm-
>>> backlight device to use the new PWM lookup tables. All patches have been
>>> compile-tested, but I don't have access to any of these boards, so I
>>> couldn't verify that they really work.
>>
>> Unfortunately I can't verify them neither. I don't have these boards. In
>> that case I would prefer approach "if it ain't broken, don't touch
>> it"... unless someone tests the patches of course.
> 
> Backlight on these boards is likely to be currently broken anyway. In
> fact this series is part of an effort to restore backlight support for
> these legacy boards (I sent out a similar series for PXA boards).
> 
> We're going to need to have this series merged so that we can remove the
> legacy code that's being a lot of trouble maintaining. If this series
> ends up breaking anything, I'd be happy to help fix things up.

So you suspect that it is already broken? Fair enough, I'll look at the
patches.

In the same time these are really old SoCs for mobile standard. I wonder
if anyone uses them... :)

Tomasz,
Do you have 6410 board? I remember you were quite involved in it.

Best regards,
Krzysztof
