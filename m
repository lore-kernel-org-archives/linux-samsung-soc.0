From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 1/3] ARM: dts: add pinctrl support to Exynos5420
Date: Wed, 12 Jun 2013 14:20:39 -0700
Message-ID: <CAD=FV=VhmCVzy-ahhhE-5ZF-cvXktchnAuaiRAG8A-KUj+azbw@mail.gmail.com>
References: <1371048688-9089-1-git-send-email-l.krishna@samsung.com>
	<1371048688-9089-2-git-send-email-l.krishna@samsung.com>
	<1531737.EaJZJjF9GR@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f170.google.com ([209.85.217.170]:42149 "EHLO
	mail-lb0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757607Ab3FLVUl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Jun 2013 17:20:41 -0400
Received: by mail-lb0-f170.google.com with SMTP id t13so4126749lbd.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Jun 2013 14:20:39 -0700 (PDT)
In-Reply-To: <1531737.EaJZJjF9GR@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Leela Krishna Amudala <l.krishna@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Simon Glass <sjg@chromium.org>, Thomas P Abraham <thomas.ab@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, s.nawrocki@samsung.com

Tomasz,

On Wed, Jun 12, 2013 at 1:58 PM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
>> +     pinctrl@13400000 {
>> +             gpy7: gpy7 {
>> +                     gpio-controller;
>> +                     #gpio-cells = <2>;
>> +
>> +                     interrupt-controller;
>> +                     #interrupt-cells = <2>;
>
> According to patch 2/3, this bank doesn't support interrupts, as it's
> defined using EINTN macro. Which variant is correct?

As far as I know the GPY registers don't support interrupts, so this
should be removed.  Nice catch!

>> +             sd0_bus1: sd0-bus-width1 {
>> +                     samsung,pins = "gpc0-3";
>> +                     samsung,pin-function = <2>;
>> +                     samsung,pin-pud = <3>;
>> +                     samsung,pin-drv = <3>;
>> +             };
>> +
>> +             sd0_bus4: sd0-bus-width4 {
>> +                     samsung,pins = "gpc0-3", "gpc0-4", "gpc0-5",
> "gpc0-6";
>> +                     samsung,pin-function = <2>;
>> +                     samsung,pin-pud = <3>;
>> +                     samsung,pin-drv = <3>;
>> +             };
>> +
>> +             sd0_bus8: sd0-bus-width8 {
>> +                     samsung,pins = "gpc3-0", "gpc3-1", "gpc3-2",
> "gpc3-3";
>> +                     samsung,pin-function = <2>;
>> +                     samsung,pin-pud = <3>;
>> +                     samsung,pin-drv = <3>;
>> +             };
>
>
> It seems like there is some inconsequence here, because sd0_bus4 setting
> includes pins of sd0_bus1, while sd0_bus8 doesn't include pins of
> sd0_bus4.
>
> I think it should be defined either first or second way, not mixed, but I
> don't have any strong preference over any of them.
>
> CCing some people to hopefully get some more opinion on this.

Yeah, I brought this up on 5250, but somehow it looks like it landed
without getting changed.  I agree it should be one way or the other.


Feel free to add my Reviewed-by.  The differences between the code you
sent up and our ToT are:
* You properly set the i2c4 drive strength to 0 to match all others.
* You don't yet have the HDMI hot plug detect IRQ defined.  ...but
that looks slightly wrong in our tree anyway and can be added later.

Reviewed-by: Doug Anderson <dianders@chromium.org>

-Doug
