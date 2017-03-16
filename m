From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/4] pinctrl: samsung: Register pinctrl before GPIO
Date: Thu, 16 Mar 2017 16:28:45 +0100
Message-ID: <CACRpkda=ZmeftaTdqP3m2=NrSgr6=_HcrkTYcrH3AA7nNvhHiA@mail.gmail.com>
References: <1487251636-2480-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1487251636-2480-2-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <CACRpkdbq4RMH_2rfaxDbEZaqrQWO9bq8BS8AqnaV6SH=0s6jRQ@mail.gmail.com>
 <20170223172313.GF2742@localhost.localdomain> <CACRpkdZ+EQ=p_vGrBFYu6p-MnC0OvcY7P1-OWzebKgQRhGWQJQ@mail.gmail.com>
 <CAJKOXPf09Y7ojLP4reZpCy9D509fRSs08otnN4mHmZJjYO6EDw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yw0-f177.google.com ([209.85.161.177]:34188 "EHLO
        mail-yw0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752187AbdCPP3Q (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 16 Mar 2017 11:29:16 -0400
Received: by mail-yw0-f177.google.com with SMTP id p77so34683338ywg.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Mar 2017 08:28:47 -0700 (PDT)
In-Reply-To: <CAJKOXPf09Y7ojLP4reZpCy9D509fRSs08otnN4mHmZJjYO6EDw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:WOLFSON MICROELECTRONICS DRIVERS" <patches@opensource.wolfsonmicro.com>

On Tue, Mar 14, 2017 at 2:58 PM, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Tue, Mar 14, 2017 at 3:44 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
>> On Thu, Feb 23, 2017 at 6:23 PM, Charles Keepax
>> <ckeepax@opensource.wolfsonmicro.com> wrote:
>>> On Wed, Feb 22, 2017 at 03:37:37PM +0100, Linus Walleij wrote:
>>>> On Thu, Feb 16, 2017 at 2:27 PM, Charles Keepax
>>>> <ckeepax@opensource.wolfsonmicro.com> wrote:
>>>>
>>>> > If we request a GPIO hog, then gpiochip_add_data will attempt to request
>>>> > some of its own GPIOs. The driver also uses gpiochip_generic_request
>>>> > which means that for any GPIO request to succeed the pinctrl needs to be
>>>> > registered. Currently however the driver registers the GPIO and then the
>>>> > pinctrl meaning all GPIO hog requests will fail, which then in turn causes
>>>> > the whole driver to fail probe. Fix this up by ensuring we register the
>>>> > pinctrl first. Although currently there are no users of GPIO hogs in
>>>> > mainline there are plenty of Samsung based boards that are widely used
>>>> > for development purposes of other hardware. Indeed we hit this issue
>>>> > whilst attaching some additional hardware to an Arndale system.
>>>> >
>>>> > Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
>>>> > Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
>>>> > ---
>>>> >
>>>> > Changes since v1:
>>>> >  - Updated commit message
>>>>
>>>> Patch applied. Will not be visible in -next until after the merge window
>>>> though.
>>>>
>>>
>>> Apologies but I think you might be best to drop this patch for
>>> now, it seems this causes the ranges passed to
>>> pinctrl_add_gpio_range to have the wrong .base, whilst I can
>>> actually see no ill effects from this on Arndale. I suspect this
>>> patch may be only part of the solution and may potentially cause
>>> issues for others even though it seems fine for me.
>>
>> OK I dropped it.
>>
>> Resend it if you figure it out.
>>
>> The Samsung driver traffic is increasing, and there are now
>> a bunch of developers starting to step on each others' toes.
>>
>> Would you Samsung developers start considering someone who
>> can collect Samsung pin control patches and send them as
>> pull requests to me?
>
> For some reason, some days ago I had impression that Sylwester is
> doing this already... but I was corrected that you are taking them
> directly. If Tomasz and Sylwester are willing to do this, they got my
> Ack.
>
> If not, I can take it and set a separate repo on my kernel.org account.

That would be great, if there will be a lot of Samsung pin control work
for this kernel cycle.

Yours,
Linus Walleij
